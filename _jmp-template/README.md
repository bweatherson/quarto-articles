# `jmp-pdf`: a Quarto format for the *Journal of Mathematical Philosophy*

This wraps the journal's own class, `jmp.cls`, which comes from
<https://github.com/Journal-of-Mathematical-Philosophy/jmp-latex-template>
(class v2.0, 2026/08/06, repo commit `440561e`). The class is copied into
`_extensions/jmp/` unchanged. The output `.tex` compiles with LuaLaTeX and
Biber. The two test documents compiled with no warnings in either mode.

## Where things are

The extension is in `quarto-articles/_extensions/jmp/`, so any `.qmd` in the
project can use it. This folder starts with `_`, so the website build skips
it. `_extensions` here is a symlink to the project's copy, which lets you
render the example from this folder with `quarto render jmp-example.qmd`.
Your `.gitignore` excludes `_extensions/`, so the extension isn't tracked
unless you change that.

## Use

```yaml
format:
  jmp-pdf: default
```

In a folder whose `_metadata.yml` also lists `html`/`pdf`/`docx` (e.g. `posts/`),
render just this format:

```
quarto render paper.qmd --to jmp-pdf
```

Otherwise the ordinary `pdf` format writes `paper.tex` too, and whichever runs
last overwrites the other. Options you set under `format: pdf:` do **not**
carry over to `jmp-pdf`, which is what you want.

## Submission vs. production

`anonymous` defaults to **true**. In that mode:

- no names, affiliations, emails or ORCID iDs; the author slot reads
  "Anonymous submission" (`jmp: anon-label:` changes it)
- the verso running head says the same
- no copyright/DOI colophon, and `pdfauthor` is empty
- `.acknowledgements`, `.funding`, `.conflicts` and `.backmatter` blocks are
  dropped, with a warning for each
- `thanks:` is dropped

It can't catch first-person self-citation or identifying text.

For the accepted version, set `anonymous: false` (or render with
`-M anonymous:false`). You can leave the author list in the YAML the whole
time.

```yaml
author:
  - name: Brian Weatherson
    orcid: 0000-0002-0830-141X        # orcid_id: also works
    email: weath@umich.edu
    affiliations:
      - department: Department of Philosophy
        name: University of Michigan
shorttitle: "Short Title"             # recto running head; defaults to title
lang: en-GB                           # en-GB/AU/NZ/IE -> \documentclass[british]{jmp}
anonymous: false
jmp:
  issue: "Vol. 2, No. 1"              # production editor supplies these
  year: 2027                          # defaults to the current year
  doi: 10.xxxxx/jmp.xxxx
  # Built from `author` unless given:
  # copyright-holders: "A, B, and C"  # or "The Authors"
  # short-authors: "A, B \\& C"
```

Missing affiliations or emails are printed as `[affiliation]` / `[email]` and
reported, since the class needs both.

## Writing

| You write | You get |
|---|---|
| `[@key, 34]`, `@key [34]`, `[see @a; @b]` | `\autocite` / `\textcite` (biblatex-chicago author–date) |
| `::: {#thm-x}` … `:::` (also `lem`, `prp`, `cor`, `cnj`, `def`, `exm`, `exr`) | amsthm environments on **one shared counter**: Theorem 1, Lemma 2, … |
| `::: {.proof}` | `proof` |
| `@thm-x`, `@lem-x` | "Theorem 1" (capitalised, as the guide asks) |
| `@sec-x`, `@fig-x`, `@tbl-x` | "section 2", "figure 1", "table 1" (lowercase mid-sentence) |
| `@Sec-x`, `@Fig-x`, `@Tbl-x` | Capitalised, for the start of a sentence |
| `@eq-x` | `\eqref`, i.e. "(3)" |
| `# Proofs {#sec-proofs .appendix}` | `\appendix` before it. References to it say "appendix A" |
| `::: {.restate ref="thm-x"}` + `:::` | Theorem *x* repeated with its original number (put it before the proof in the appendix) |
| `::: {#tbl-x}` table + caption `:::` | `table` float, `tabular` + booktabs, caption below |
| `![Caption](f.pdf){#fig-x width=70%}` | `figure` float `[t]`, caption below |
| `::: {.acknowledgements}`, `{.funding}`, `{.conflicts}` | the class's back-matter environments (put them after the conclusion, before the appendix) |
| `::: {.backmatter title="Data availability"}` | `jmpbackmatter` with that heading |
| `hyphenation: [Kerne-berg]` | `\hyphenation{…}` |
| `keywords: [...]` | PDF keywords only; the class doesn't print them |

Other behaviour:

- A trailing `## References {-}` heading is removed, because biblatex prints
  its own.
- Abstracts over 250 words get a warning.
- Unicode symbols typed in running text (≠, ⊨, →) that STIX Two Text lacks
  are taken from STIX Two Math. Set `text-fallback: false` to see what's
  missing; for the final version it's better to put them in math mode.
- Extra LaTeX packages go in `include-in-header` under `jmp-pdf`, as usual.
  Don't load `amssymb`, `natbib`, `inputenc` or a second `biblatex`. Any
  `\newtheorem` you add is also put on the shared counter.

## The bibliography

Citations go through biblatex rather than CSL, so the `.bib` must be valid
BibTeX/biblatex. Some errors that citeproc tolerates will stop the build:

- `&` must be `\&`. Three `publisher = {John Wiley & Sons}` entries in
  `brian-quarto.bib` break the build (lines 2310, 3441, 6975).
- `\textquotedblright Thesis` swallows the space (Nissan-Rozen2015-NISATR).
- Titles should be in title case in the `.bib` (JMP rule). biblatex-chicago
  doesn't recase them.
- `@dataset` / `@software` have no Chicago driver, so citing one is a hard
  error. Use `@misc` with `type = {dataset}`.
- JMP wants `doi` *or* `url`, not both. The class drops `url` when a `doi` is
  present anyway.

## TeX requirements

LuaLaTeX, Biber, and these (all in TeX Live):

```
tlmgr install biblatex biblatex-chicago biber stix2-otf lete-sans-math roboto \
  gofonts orcidlink titlesec footmisc fancyhdr xurl parskip etoolbox csquotes \
  caption microtype unicode-math fontspec thmtools booktabs pgf lua-ul luacolor
```

The STIX Two fonts from `stix2-otf` are enough; LuaLaTeX finds them in the
TeX tree, so they don't need to be installed as system fonts.

## Updating the class

The journal's template repo is under active development: the thmtools
workaround landed the day this was written. To update, copy the new `jmp.cls`
over `_extensions/jmp/jmp.cls`. The only patch the wrapper applies
(`jmp-template.tex`, "Fix for jmp.cls") is a no-op if it no longer matches.

## What the production editor gets

The `.tex` that Quarto keeps next to the `.qmd`, plus `jmp.cls`, the `.bib`
and the figure files. The preamble has some Quarto/Pandoc boilerplate
(caption and float setup, `\pandocbounded`, etc.), and the class's own
preamble conventions are otherwise followed. It isn't as tidy as a
hand-written file started from `jmp-article.tex`, which the JMP editors might
reasonably ask about.

## Files

- `_extensions/jmp/_extension.yml`: format definition
- `_extensions/jmp/jmp-template.tex`: Pandoc template around `jmp.cls`
- `_extensions/jmp/jmp.lua`: pre-AST filter (back matter, appendix, restate,
  trailing References heading, abstract length)
- `_extensions/jmp/jmp-post.lua`: post-render filter (title-block metadata,
  `\eqref`, "appendix" references, float tables)
- `_extensions/jmp/jmp.cls`, `LICENSE.txt`: the journal's class (GPL-3.0)
- `jmp-example.qmd`, `references.bib`, `credence.pdf`: worked example
  (fictitious references from the journal's template)
