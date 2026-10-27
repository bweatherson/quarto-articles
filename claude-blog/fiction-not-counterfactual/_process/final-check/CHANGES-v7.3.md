# v7.2 → v7.3 (26 October 2026): final read-over, bibliography check, word count

Inputs: my own read and bibliography check (final-check/crossref-report.txt), and an independent error check by a fresh
Opus agent (final-check/_mistake-hunt.md: 4 must-fix, 10 should-fix, 15 minor). Pre-check text kept as
final-check/v7.2-before-final-check.qmd.

## Word count (the main finding)
- Earlier counts were taken on the Quarto source, where citations and cross-references are short keys.
- Counted on rendered text, v7.2 was about 6,190 words excluding the bibliography (6,300 by a raw PDF token count).
  The limit is 6,000 words, all-in except the bibliography.
- v7.3 comes to:
  - 5,840 words on the rendered plain text (body 5,345, notes 314, abstract 181);
  - 5,714 alphanumeric tokens in the PDF;
  - 5,989 raw PDF tokens, which counts every math symbol and bullet as a word.
- Cuts, none of which touches the argument:
  - abstract and introduction restatements;
  - the Khoo paragraph, compressed;
  - the JAG/NCIS footnote, shortened, which dropped the Mitovich citation (it supported only an irrelevant detail);
  - the vagueness paragraph, trimmed;
  - one example sentence each from the trivalence and objections passages;
  - the "Nor do the facts earn their keep..." restatement;
  - the conclusion, tightened;
  - the "PRP has no such freedom" coda;
  - a duplicate Lewis mention;
  - the duplicate "oracle" quotation in §2;
  - the MacFarlane thin-red-line sentence. MacFarlane is now credited with a "cf." at the assessment clause.

## Error fixes
- **A2.** Removed the "claude" category from the YAML; the HTML showed it under the title.
- **A3.** *doubt* is acceptable for "landed tails" with the biased coin (B&H 163, (14)). Fixed in §2 and §3.3.
- **A4.** Defaults: deleted the fixed-exogenous-assignment option, which is the §4.1 tie-breaker and fails the test. The ranked-defaults option remains.
- **B1.** Woodward: the option he leaves open is classical semantics, not specifically epistemicism (789; B&H 187–188 are neutral).
- **B2.** "If Flippy had been flipped once" (B&H 176).
- **B3.** The bridge principles now "make precise what their view needs", in the abstract and §1.
- **B4.** Absorption footnote: *know* is handled via B&H's unknowability claim (184).
- **B5.** Standard-analysis objection: the story state keeps the standard analysis's truths, treats unsettled claims as gaps, and adds credence.
- **B6.** Ledger: the views predict the same "verdicts in @tbl-test", not all strengthening judgements, because anchoring differs on "still a gust".
- **B7.** J⁺ is the content of the series with the special: a non-empty subset of J.
- **B8.** The anchoring example now uses B&H's unflipped coin Flippy.
- **B9.** Notation:
  - information state s → σ;
  - content sets A/B → J/J⁺, so they no longer clash with the sentence labels;
  - P_f(w) glossed as B&H's P-Fic_{f,w}.
- **B10.** Added the clause for negation outside the story.
- **C items:**
  - "(hereafter B&H)";
  - the 188 framing ("invite those who resist");
  - principal truths cited as 156–158, with "or believed";
  - times map to sets of truths;
  - Lewis's italic world*s*;
  - *The Breakfast Club* italicised;
  - the supervaluation sentence split;
  - "world in P-Fic_f", to avoid a line break;
  - section locators as "sec.";
  - small caps for named principles;
  - Table 1 referred to in the text;
  - web-source dates now print in the bibliography (magazine-article type).
- **Bibliography:**
  - TVLine title corrected to the live headline, "The NCIS: LA Finale's JAG Reunion Was Probably Not What You Were Expecting", but the entry was then dropped along with its citation;
  - CinemaBlend title and date confirmed on the live page;
  - Country Living site blocked, so the entry is kept as B&H give it;
  - all 20 DOIs re-verified against Crossref.
- **Not changed:**
  - C10, the page-range style mix (citeproc abbreviates, hand-typed ranges are written in full);
  - C14, B&H's alternative years for Khoo and Woodward; ours are the issue-of-record years.
- **Blumberg & Strohminger (11a):** confirmed 23 Oct on the OUP page (infelicitous; "significant evidence against Compatibility").

## Final screenings
Two fresh Opus screenings (E, F) of the exact final text, with a brief identical to v7.1's apart from the file path.
