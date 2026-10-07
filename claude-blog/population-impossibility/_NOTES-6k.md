# Notes on the 6k version (`population-impossibility-6k.qmd`)

Made 7 October 2026 for the AI Philosophy Competition. The long version (`population-impossibility.qmd`, c. 9,100 words + abstract) is untouched.

## Count

5,870 by a Word-style count of a pandoc docx build (title, date, abstract, body, footnotes; bibliography excluded) **not counting text inside equations**. The paper has c. 330 inline formulas; if the organisers' counter counts each formula as a word the total is c. 6,200, and a count of rendered PDF text (every symbol a token) is c. 6,900. Word's own count is believed to skip equation (OMML) text; **check the Word count on the rendered docx before submitting**, and if equations are counted, c. 350 words must come out (candidates listed in `_screening-report-6k-v2.md`, "Length").

Citations are author-date (`chicago-author-date.csl` in this folder); the blog's note-style CSL would add c. 1,000 words of footnoted references.

## What was cut (long → 6k)

- §1: first paragraph compressed; Carlson's view described in one clause; "Thornley states it as a result" removed (he states the repaired theorem); methodological paragraph folded into the thesis paragraph.
- §2: framework compressed; the "informal content" paragraph kept but shortened; the citation chain shortened.
- §3: definition compressed; features paragraph shortened; Thomas toy-model paragraph halved (the "found by search, resemblance noticed afterwards" disclaimer moved to §5); proofs tightened but complete; mechanism and Lemma 1.3 paragraphs kept.
- §4: VRA/VRA*/WQA* statements kept verbatim; the "equivalently … for a complete ordering" parenthetical cut; Compensation-violating-views paragraph merged with the "shape of the gap" paragraph; the graded-view paragraph folded into the first quick answer; scope remarks compressed.
- §5: cut by about half; the limits paragraph folded in.
- §6: cut to one paragraph; the `T6star_exact` proof-difference details and the SAT/Arrow context compressed.
- §7: second paragraph halved.

## What changed substantively

1. **Thesis stated in words in paragraph 1** ("This paper shows that it is false, and that the repair which makes it true adds exactly one stipulation: that the quantity of misery which lives barely worth living can never make up for must be the same whatever population it is added to"), per the competition note on formal papers. Title unchanged; alternatives suggested by the screeners: "What Arrhenius's Sixth Impossibility Theorem Does Not Show"; "Misery, Capacity, and Arrhenius's Sixth Theorem".
2. **Converse of Proposition 2 added** as a footnote: given QA and WNS with a positive number of lives, WQA and WQA* follow (WNS applied with one added life at level 1 and background B + X; B + 1·1 ⊂ R(1,y) since y ≥ 3). Not machine-checked. "Equivalent"/"collapses into" changed to "entails" throughout.
3. **False sentence removed.** The long version says (§4) that the c ≥ 1 view is "the first axiology satisfying the conditions" without uncompensable misery at the empty background. False: for m|z| > c the view still ranks m·z + K·3 below the empty population for all K. The 6k version says what the baseline removes (uncompensability of a *small quantity* of misery) and what it does not. **The long version has this error.**
4. **Mild misery.** Every member of the family as defined makes c+1 lives at −1 plus any number at 3 worse than nothing, because T⁻ is welfare-weighted from −1 down; Lexical Totalism does not have this. The 6k version says so and notes a variant that counts only lives below a very negative level V with weight ℓ − V, which satisfies the five conditions (my numerical check: 20,000 random instances per condition at A = 4, V = −3, c ∈ {0, 2}, zero failures; the v2 screener's independent brute force agrees) and makes any number of lives at −1 compensable. Not machine-checked.
5. **Theorem-neutral gloss separated from the capacity view's gloss.** The four conditions force VRA* (for each quantity of misery, some background); "backgrounds that have redeemed their misery" is the capacity view's description of which. Fixed in §4 summary, abstract and conclusion; the conclusion no longer says "it is not a new result about misery".
6. **§5 inequalities** restated with their variables defined and the WNS inequality the right way round (the long version's "m w_x ≥ D w_Z" is reversed; the LP script encodes it correctly).
7. **Range definition sourced**: Arrhenius 2011, p. 7 n. 8 ("allows us to simplify the exact statements"). §6 no longer lists y ≥ 3 as a "fidelity choice".
8. Thomas 2016 quotation marked "[on]" where the source omits the word; ABS 2021 "intuitively more compelling" framed as "as he and his coauthors later put it"; Repugnant Addition stated and said to *entail* the denial of QA; "on no view do the four conditions force anything stronger" replaced by "do not force VRA".

## Screenings

Two, by fresh contexts: `_screening-report-6k-v1.md` (PASS, FORMAL; rating *surprising*; found the false sentence in item 3, the "equivalent" overclaim, the §5 symbol problems, the unsourced range definition, the Thornley misdescription; all fixed) and `_screening-report-6k-v2.md` (PASS, FORMAL; *surprising*; found the n > 0 gap in the converse footnote, the conclusion's re-collapse, the mild-misery point, the length-with-equations question; all addressed except the title). Both screeners checked the mathematics by hand and found every formal claim in the text correct. The v2 screener verified against the scratchpad texts: Arrhenius 2011 exact conditions and range definition, Thomas 2018 n. 4 and sec. 4, Thomas 2016 p. 11, Thornley 2021 n. 7 and the "(r, s) with r < 0" passage. The final text (after v2 fixes) has not had a third cold read.

## TO DO BEFORE SUBMISSION

- [ ] Word count in Word on the rendered docx (see Count above).
- [ ] Decide on the title.
- [ ] Verify Arrhenius 2026: the quoted WQA opening in §1 and n. 10 (exact versions "logically slightly weaker"), against the published chapter (read via Chrome on 3 Oct; quotations were transcribed then).
- [ ] Verify Carlson 2022 sec. 1 quotation and that "A-discrete" means what the paper's gloss ("integer-indexed levels that Carlson concedes") needs; sec. 5 for non-Archimedean totalism; secs. 4–5 for the (r, s) structure.
- [ ] Oxford Handbook (ArrheniusEtAl2022): add a chapter or page for "takes it as a point of departure", or soften.
- [ ] Thomas 2016: the bib entry has a URL; confirm it still resolves, since the VRA/VRA* notation, the p. 11 quotation and the corrected theorem's proof come from it.
- [ ] Arrhenius 2011 p. 18–19 (Lemma 1.3 step (12)) description; p. 1 "logically weaker and intuitively more compelling" is Arrhenius's own phrase, which could replace the ABS 2021 citation.
- [ ] Lean: confirm `sixth_theorem_countermodel`, `T1`–`T5`, `T6star`, `T6star_exact`, `prop2`, `cor3` are the names in the shipped source and that "about twelve hundred lines" and "three standard axioms" are still right; the development was not changed for the 6k version. Decide whether the Lean source and `potential_search.py` are submitted (OpenReview supplementary) or linked.
- [ ] The converse footnote and the V-threshold variant are not machine-checked; the text says so for the variant but not for the footnote. Add "(not machine-checked)" or prove it in Lean (both are short).
- [ ] `categories: claude` in the YAML; remove if any output exposes it.

## Long version corrections to carry over

Items 3, 6 above; the Thornley "states it as a result" sentence; "equivalent to" in the long conclusion; the Repugnant Addition / denial-of-QA wording; "the first axiology … that does not have it".
