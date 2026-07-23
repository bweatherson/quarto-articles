#!/usr/bin/env python3
"""Audit the links in cv.qmd (or any other .qmd given on the command line).

Three checks, cheapest first:

  1. internal  -- brian.weatherson.org/quarto/... links resolve to a local .qmd
                  (offline, instant)
  2. doi       -- every doi.org link resolves in Crossref AND its registered
                  title matches the title in the CV (one batched API call per
                  50 DOIs, no key needed)
  3. external  -- everything else gets an HTTP HEAD (only ~15 links)

The doi check is the important one: a wrong-but-real DOI returns HTTP 200, so
link-checkers miss it. Comparing titles is what catches a copy-paste slip.

cv.qmd and cv-typst.qmd carry the same bibliography in parallel, so audit both:
a fix applied to one is easy to forget in the other.

Usage:  python3 audit-cv-links.py [--skip-net] [file.qmd ...]
"""

import json
import re
import subprocess
import sys
import urllib.parse
from difflib import SequenceMatcher
from pathlib import Path

ROOT = Path(__file__).parent
DEFAULT_FILES = ["cv.qmd", "cv-typst.qmd"]
INTERNAL_PREFIX = "https://brian.weatherson.org/quarto/"

# [text](url) -- url may be absolute or site-root-relative -- and bare <url>.
# The destination may contain balanced parens: Elsevier DOIs look like
# 10.1016/S0039-3681(99)00020-5, and stopping at the first ')' truncates them.
_DEST = r"(?:[^()\s]|\([^()\s]*\))+"
MD_LINK = re.compile(
    rf"\[([^\]]*)\]\(((?:/|https?://){_DEST})\)|<(https?://{_DEST})>"
)


def links(lines):
    """Yield (lineno, text, url) for every link in the file."""
    for n, line in enumerate(lines, 1):
        for m in MD_LINK.finditer(line):
            text, url, bare = m.groups()
            yield n, (text or "").strip(), (url or bare).rstrip(".,")


def entry_title(lineno, line_cache):
    """The human title of the CV entry a link sits in: the first [text](...)
    on that line. That is what a DOI on the same line should point at."""
    for m in MD_LINK.finditer(line_cache[lineno - 1]):
        text = (m.group(1) or "").strip()
        if text and not text.lower().startswith("doi:"):
            return text
    return ""


def norm(s):
    s = re.sub(r"<[^>]+>", "", s)  # crossref titles carry <i>...</i>
    return re.sub(r"\s+", " ", re.sub(r"[^a-z0-9 ]", " ", s.lower())).strip()


def title_matches(cv_title, registered):
    """Crossref titles often carry an acknowledgements footnote or a symposium
    wrapper, so containment counts as a match, not just overall similarity."""
    a, b = norm(cv_title), norm(registered)
    if not a or not b:
        return True
    if a in b or b in a:
        return True
    return SequenceMatcher(None, a, b).ratio() >= 0.75


def is_internal(url):
    return url.startswith(INTERNAL_PREFIX) or url.startswith("/")


def local_source(url):
    """The .qmd behind a site link, or None if the link resolves to nothing."""
    if not is_internal(url):
        return None
    rel = url[len(INTERNAL_PREFIX):] if url.startswith(INTERNAL_PREFIX) else url[1:]
    rel = urllib.parse.unquote(rel.split("#")[0].split("?")[0])
    if not rel:
        return None
    candidates = []
    if rel.endswith(".html"):
        candidates += [ROOT / (rel[:-5] + ".qmd"), ROOT / (rel[:-5] + ".md")]
    candidates += [ROOT / rel, ROOT / "_site" / rel]
    for c in candidates:
        if c.exists():
            return c
    return None


def check_internal(all_links):
    """Map each site link -- absolute or site-root-relative -- to a local file."""
    problems = []
    for lineno, text, url in all_links:
        if is_internal(url) and local_source(url) is None:
            problems.append((lineno, "internal", text, url, "no local source file"))
    return problems


FRONTMATTER_DOI = re.compile(r'^doi:\s*["\']?([^"\'\s]+)["\']?\s*$', re.M)
FRONTMATTER_CITE_URL = re.compile(r'^citation_url:\s*["\']?(\S+?)["\']?\s*$', re.M)


def frontmatter(path):
    """The yaml block at the head of a post, or '' if it has none."""
    if path.suffix not in (".qmd", ".md"):
        return ""
    text = path.read_text(errors="replace")
    if not text.startswith("---"):
        return ""
    end = text.find("\n---", 3)
    return text[: end if end > 0 else 4000]


def post_doi(path):
    """The doi: field from a post's yaml frontmatter, if it has one."""
    m = FRONTMATTER_DOI.search(frontmatter(path))
    return m.group(1) if m else None


def check_frontmatter(all_links):
    """The strongest check available, and it costs nothing: when a CV entry
    links to one of the posts AND carries a DOI, the post's own frontmatter
    says what that DOI should be. Disagreement means one of the two is stale."""
    problems = []
    by_line = {}
    for lineno, text, url in all_links:
        by_line.setdefault(lineno, []).append(url)
    for lineno, urls in sorted(by_line.items()):
        srcs = [s for s in (local_source(u) for u in urls) if s is not None]
        cited = [m.group(1) for m in
                 (re.match(r"https?://(?:dx\.)?doi\.org/(.+)", u) for u in urls) if m]
        if not srcs or not cited:
            continue
        declared = post_doi(srcs[0])
        if declared and declared.lower() not in [c.lower() for c in cited]:
            problems.append(
                (lineno, "doi-vs-post", srcs[0].stem, cited[0],
                 f"{srcs[0].relative_to(ROOT)} declares {declared}")
            )
    return problems


BARE_URL = re.compile(rf"(?<![(<\w])(https?://{_DEST})")


def body_links(path):
    """(lineno, url) for every link below the frontmatter. Post bodies cite the
    open web -- blogs, agency PDFs, personal pages -- which rots much faster
    than anything with a DOI, so these are worth their own pass."""
    text = path.read_text(errors="replace")
    body = text[text.find("\n---", 3) + 4:] if text.startswith("---") else text
    offset = text[: len(text) - len(body)].count("\n") + 1
    for n, line in enumerate(body.splitlines(), offset):
        found, covered = [], []
        for m in MD_LINK.finditer(line):
            group = 2 if m.group(2) else 3
            found.append(m.group(group))
            covered.append(m.span(group))
        for m in BARE_URL.finditer(line):
            # A Wayback URL embeds the URL it archived, so a naive scan finds
            # that inner URL a second time and reports the very rot we just
            # repaired. Skip anything already inside a link we captured.
            if any(a <= m.start() < b for a, b in covered):
                continue
            found.append(m.group(1))
            covered.append(m.span(1))
        for url in found:
            if url and url.startswith("http"):
                yield n, url.rstrip(".,;:")


def check_bodies(skip_net):
    """HTTP-check every distinct URL cited in a post body."""
    if skip_net:
        return []
    where = {}
    for path in sorted(ROOT.glob("posts/*/*.qmd")):
        for lineno, url in body_links(path):
            where.setdefault(url, []).append(f"{path.relative_to(ROOT)}:{lineno}")

    problems = []
    for url, sites in sorted(where.items()):
        code = http_status(url)
        if not code.startswith(("2", "3")):
            code = http_status(url, head=False)
        # 403 means something answered; treat as inconclusive, as for citation_url
        if code.startswith(("2", "3")) or code == "403":
            continue
        problems.append(
            (0, "body-link-dead", sites[0], url,
             f"HTTP {code or 'no response'}"
             + (f" (also cited at {', '.join(sites[1:])})" if len(sites) > 1 else ""))
        )

    print(f"{len(where)} distinct URLs checked in post bodies\n")
    for _, kind, text, target, why in problems:
        print(f"  {text}  [{kind}]\n      {target}\n      {why}")
    print(f"{len(problems)} problem(s) in post bodies\n")
    return problems


def check_posts(skip_net):
    """The posts are the source of truth the CVs are checked against, so audit
    them too. Two offline checks catch the errors that actually occurred here:
    a doi: reused by two posts, and a citation_url disagreeing with its own
    post's doi:. Then, if we are online, confirm each citation_url loads."""
    problems = []
    posts = sorted(ROOT.glob("posts/*/*.qmd"))
    seen = {}

    for path in posts:
        fm = frontmatter(path)
        rel = path.relative_to(ROOT)
        doi = post_doi(path)
        m = FRONTMATTER_CITE_URL.search(fm)
        cite_url = m.group(1) if m else None

        if doi:
            seen.setdefault(doi.lower(), []).append(rel)

        if cite_url:
            cm = re.match(r"https?://(?:dx\.)?doi\.org/(.+)$", cite_url)
            if cm and doi and cm.group(1).lower() != doi.lower():
                problems.append(
                    (0, "cite-url-vs-doi", str(rel), cm.group(1),
                     f"post declares doi: {doi}")
                )
            elif not skip_net:
                code = http_status(cite_url)
                if not code.startswith(("2", "3")):
                    code = http_status(cite_url, head=False)
                # A doi.org citation_url redirects to the publisher, and many
                # publishers 403 anything that is not a real browser. A 403
                # still means the resource routed somewhere, so it is
                # inconclusive; genuine rot shows up as 404 or as no response.
                if not code.startswith(("2", "3")) and code != "403":
                    problems.append(
                        (0, "cite-url-dead", str(rel), cite_url,
                         f"HTTP {code or 'no response'}")
                    )

    for doi, where in seen.items():
        if len(where) > 1:
            problems.append(
                (0, "doi-shared", "", doi,
                 "declared by " + ", ".join(str(w) for w in where))
            )

    print(f"{len(posts)} posts checked\n")
    for _, kind, text, target, why in sorted(problems, key=lambda p: (p[1], p[2])):
        label = f"{text} " if text else ""
        print(f"  [{kind}]  {label}-> {target}\n      {why}")
    print(f"{len(problems)} problem(s) in posts\n")
    return problems


UA = "cv-link-audit (mailto:brianweatherson@gmail.com)"


def fetch(url):
    """GET via curl -- python's ssl store isn't configured on this machine.
    Returns parsed json, or None if the request failed."""
    r = subprocess.run(
        ["curl", "-sS", "--max-time", "60", "-A", UA, url],
        capture_output=True, text=True,
    )
    if r.returncode != 0:
        print(f"  ! curl failed for {url}: {r.stderr.strip()}", file=sys.stderr)
        return None
    try:
        return json.loads(r.stdout)
    except json.JSONDecodeError:
        print(f"  ! non-json reply from {url}", file=sys.stderr)
        return None


def crossref(dois):
    """Registered titles for a list of DOIs.  Returns {doi: title}; a DOI that
    Crossref does not know is simply absent from the result, and a DOI whose
    lookup errored is absent too -- callers must not read absence as '404'."""
    out = {}
    dois = list(dois)
    for i in range(0, len(dois), 40):
        batch = dois[i:i + 40]
        filt = ",".join("doi:" + urllib.parse.quote(d, safe="") for d in batch)
        data = fetch(f"https://api.crossref.org/works?filter={filt}&rows=100&select=DOI,title")
        if data is None:
            # network trouble: report nothing rather than 40 false 404s
            return {d: "" for d in dois}
        for item in data["message"]["items"]:
            titles = item.get("title") or []
            out[item["DOI"].lower()] = titles[0] if titles else ""
    return {d: out.get(d.lower(), None) for d in dois}


# DOIs that look wrong to the checker but have been confirmed by hand.
# Keep the reason -- it is the only record of why the exception exists.
KNOWN_OK = {
    "10.1080/17511321.2021.1974531":
        "The Sporting Attitude: T&F registered a DOI for the whole Borge "
        "symposium only, so the symposium title is the correct target.",
    # No entry for 10.1093/ajp/jag209 (Epistemicism, Parasites and Vague Names):
    # that OUP-era AJP DOI never reached the resolver, so the CV links straight
    # to tandfonline.com instead. A doi.org link there would be broken, and
    # should flag.
    "10.1016/s0039-3681(99)00020-5":
        "Begging the Question and Bayesians: Elsevier registered the title as "
        "the section header 'Discussion'. Journal and pages 687-697 match.",
}


def check_dois(all_links, lines):
    problems = []
    doi_links = []
    for lineno, text, url in all_links:
        m = re.match(r"https?://(?:dx\.)?doi\.org/(.+)", url)
        if m:
            doi_links.append((lineno, m.group(1)))

    # a DOI used on more than one entry is nearly always a paste error
    seen = {}
    for lineno, doi in doi_links:
        seen.setdefault(doi, []).append(lineno)
    for doi, where in seen.items():
        if len(where) > 1:
            problems.append(
                (where[0], "doi-dup", "", doi,
                 "same DOI on lines " + ", ".join(map(str, where)))
            )

    registered = crossref(sorted(seen))
    for lineno, doi in doi_links:
        if doi.lower() in KNOWN_OK:
            continue
        title = registered.get(doi)
        if title is None:
            problems.append((lineno, "doi-404", "", doi, "not registered in Crossref"))
            continue
        if not title:
            continue  # lookup failed; not evidence of a problem
        cv_title = entry_title(lineno, lines)
        if cv_title and not title_matches(cv_title, title):
            problems.append(
                (lineno, "doi-mismatch", cv_title, doi, f"DOI is registered to {title!r}")
            )
    return problems


BROWSER_UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120 Safari/537.36"

# hosts that 403 every non-browser request; a 403 from these says nothing
BOT_WALLED = ("jstor.org", "sciencedirect.com", "link.springer.com", "tandfonline.com")


def http_status(url, head=True):
    cmd = ["curl", "-sSL", "-o", "/dev/null", "-w", "%{http_code}",
           "--max-time", "30", "-A", BROWSER_UA]
    if head:
        cmd.append("-I")
    return subprocess.run(cmd + [url], capture_output=True, text=True).stdout.strip()


def check_external(all_links):
    problems = []
    for lineno, text, url in all_links:
        if is_internal(url) or "doi.org/" in url:
            continue
        code = http_status(url)
        if code.startswith(("2", "3")):
            continue
        # plenty of servers refuse HEAD but serve GET fine
        code = http_status(url, head=False)
        if code.startswith(("2", "3")):
            continue
        if code == "403" and any(h in url for h in BOT_WALLED):
            continue
        problems.append((lineno, "external", text, url, f"HTTP {code or 'no response'}"))
    return problems


def audit(path, skip_net):
    lines = path.read_text().splitlines()
    all_links = list(links(lines))

    problems = check_internal(all_links) + check_frontmatter(all_links)
    if not skip_net:
        problems += check_dois(all_links, lines)
        problems += check_external(all_links)

    print(f"{len(all_links)} links checked in {path.name}\n")
    for lineno, kind, text, target, why in sorted(problems):
        label = f"{text[:45]!r} " if text else ""
        print(f"{path.name}:{lineno}  [{kind}]  {label}-> {target}\n      {why}")
    print(f"{len(problems)} problem(s) in {path.name}\n")
    return problems


def main():
    skip_net = "--skip-net" in sys.argv
    named = [a for a in sys.argv[1:] if not a.startswith("--")]
    files = [Path(a) if Path(a).is_absolute() else ROOT / a
             for a in (named or DEFAULT_FILES)]

    total = 0
    for path in files:
        if not path.exists():
            print(f"{path}: no such file", file=sys.stderr)
            return 2
        total += len(audit(path, skip_net))
    if not named:
        total += len(check_posts(skip_net))
        total += len(check_bodies(skip_net))
    return 1 if total else 0


if __name__ == "__main__":
    sys.exit(main())
