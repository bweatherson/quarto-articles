"""Check each .bib entry with a DOI against Crossref (by DOI), and search Crossref for entries without one.
Polite: mailto=research@example.org, ~1 request/second. Reports differences; never rewrites the .bib."""
import re, json, time, sys, urllib.request, urllib.parse, unicodedata
BIB = sys.argv[1]
txt = open(BIB, encoding='utf-8').read()
entries = re.findall(r'@(\w+)\{([^,]+),(.*?)\n\}', txt, re.S)
def field(body, name):
    m = re.search(r'\b' + name + r'\s*=\s*\{(.*?)\}\s*,?\s*\n', body + '\n', re.S)
    return m.group(1).strip() if m else None
def norm(s):
    s = re.sub(r'\\[\'`^"~=.uvHtcdbk]\{?(\w)\}?', r'\1', s or '')
    s = unicodedata.normalize('NFKD', s).encode('ascii', 'ignore').decode()
    return re.sub(r'[^a-z0-9 ]', '', s.lower().replace('{', '').replace('}', '').replace('--', '-'))
def get(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'bibcheck/1.0 (mailto:research@example.org)'})
    with urllib.request.urlopen(req, timeout=30) as r: return json.load(r)
out = []
for typ, key, body in entries:
    doi = field(body, 'doi'); title = field(body, 'title'); year = field(body, 'year')
    vol = field(body, 'volume'); pages = field(body, 'pages'); num = field(body, 'number')
    try:
        if doi:
            m = get('https://api.crossref.org/works/' + urllib.parse.quote(doi) + '?mailto=research@example.org')['message']
        elif typ in ('article',):
            q = urllib.parse.quote(f"{title} {field(body,'author') or ''}")
            items = get(f'https://api.crossref.org/works?query.bibliographic={q}&rows=1&mailto=research@example.org')['message']['items']
            m = items[0] if items else None
        else:
            out.append(f"{key}: SKIPPED ({typ}, no DOI)"); continue
    except Exception as e:
        out.append(f"{key}: API-ERROR {e}"); time.sleep(2); continue
    time.sleep(1.1)
    if not m: out.append(f"{key}: NOT_FOUND"); continue
    ct = (m.get('title') or [''])[0]; cy = str((m.get('published-print') or m.get('issued') or {}).get('date-parts', [[None]])[0][0])
    cv = m.get('volume'); cp = m.get('page'); ci = m.get('issue'); cdoi = m.get('DOI')
    diffs = []
    if norm(ct)[:40] != norm(title)[:40]: diffs.append(f"title: bib '{title}' | CR '{ct}'")
    if year and cy != year: diffs.append(f"year: bib {year} | CR {cy} (online {((m.get('published-online') or {}).get('date-parts',[[None]])[0][0])})")
    if vol and cv and vol != cv: diffs.append(f"volume: bib {vol} | CR {cv}")
    if num and ci and num != ci: diffs.append(f"issue: bib {num} | CR {ci}")
    if pages and cp and pages.replace('--', '-') != cp: diffs.append(f"pages: bib {pages} | CR {cp}")
    if not doi: diffs.append(f"DOI recovered: {cdoi}")
    out.append(f"{key}: {'VERIFIED' if not diffs else 'CHECK'}" + ''.join('\n    ' + d for d in diffs))
print('\n'.join(out))
