# Notes on the 6k version (`fairness-has-memory-6k.qmd`)

Made 7 October 2026 for the AI Philosophy Competition (6,000-word ceiling, bibliography excluded). The long version (`fairness-has-memory.qmd`, c. 11,600 words) is untouched.

## Count

5,874 words by a Word-style count of a pandoc docx build (title, date, abstract, body, table cells and caption, footnotes; bibliography excluded). Author-date citations (`chicago-author-date.csl`, in this folder); the blog's note-style CSL would add c. 900 words of footnote citations and must not be used for the submission.

## What was cut (long → 6k)

- Institutional survey in §1 reduced to Nevada, New Mexico, Arizona, Colorado, H-1B/DV; Wyoming dropped (its draws reserve c. a quarter of licences for a random draw, so "chance only breaking ties" was wrong); kidney allocation, Grand Canyon, IVF, NBA detail, Amsterdam, Wimbledon, school lotteries dropped; Huesch & Brady dropped with its footnote.
- §2: the paragraph listing Broome's critics and the "common ground" paragraph cut; Lazenby, Hooker, Tomlin, Kirkpatrick & Eastwood, Piller, the numbers-count literature (Kamm, Timmermann, Henning, Saunders 2010, Vong 2020, Tank) no longer cited.
- §3: the 100-claimant figures; the Broome-on-separability footnote; the apportionment paragraph reduced to a footnote.
- §4: Vong's 2012 repetition argument footnote; the Thomson "residue" footnote; Feldblyum Le Blevennec reduced to a clause.
- §5: "two structures" and "designs in use" paragraphs compressed; table loses the tenure-1 and tenure-3 columns and the ± entries (first-column SE < .005, others ≤ .02 stated in caption); McKerlie/Temkin "complete lives" aside cut; sensitivity paragraph and the Appendix cut (code accompanies).
- §6: "bound in weight" folded into the section's first paragraph; "absence" question cut; claimant bound reduced to three sentences; time-varying-claims question cut.
- §7: Expression objection cut entirely (the expression theorists are acknowledged in §1); ex ante second reply reduced to one sentence; NBA 2019 detail cut.
- Conclusion halved.

## What changed substantively (not just cut)

1. **Bottleneck verdict reversed.** The long version says the fair rule in a bottleneck with unforeseeable attrition is a waiting-weighted lottery, and that the visa lotteries are therefore unfair for forgetting. The second fresh screening of the 6k draft showed this contradicts the paper's own surrogate constraint: in a bottleneck nobody holds a surplus (winners leave), so any weighting by time waited lowers the newcomer's chance below 1/N, and with history-independent exit the expected share of the tenure-1 class falls below the forgetting rule's. The only rule meeting the floor is the forgetting rule. The 6k version now says: memory required in recurrence, queue where everyone will be served, forgetting lottery where some leave unserved and the allocator cannot tell who; Hersch & Rowe's visa verdict is right though not for their reason; what is wrong with the 2026 H-1B rule is the wage weighting (usefulness, not claims). **The long version has this error too** (its §5.4 and the abstract's visa sentence) and should be corrected if it is used for anything.
2. **Surrogate constraint's priority** no longer rests on Broome's "weaker claims must not simply be overridden" maxim (which, in Broome 1990 p. 95, is a proportionality rule: "weaker claims require some satisfaction"). Now: the Division Principle and the surrogate account govern different claimants (stayers and leavers); the allocator cannot tell which is which; so the floor is how it does right by the leavers, and division operates within it.
3. **Misattribution fixed.** "Agreement is one of Broome's own sources of claims" was false: Broome 1990 (pp. 92–93) explicitly declines to say which reasons are claims. The long version has this too. Now: the claim arises from the allocator's undertaking to allocate *fairly*, and what fairness requires is not the agency's to stipulate (so New Mexico's announced procedure does not fix the content of the claim).
4. **κ-rule stated as a formula**, max(0, 1 + κ·shortfall), with the correct gloss (a past winner's weight falls below a newcomer's and hits zero at surplus 1/κ). The long version's prose ("any negative value set to zero") was ambiguous; the code always clipped the weight.
5. **Claim-strength vocabulary**: "stronger claim" in §4 replaced by "more of her claim outstanding"; claims are equal and history-blind, memory tracks cumulative satisfaction.
6. **Table rerun** with 200 reps (`simulations-6k.py`, output in `simulations-6k.out`, seed 2026): newcomer chances 1.00/1.01/0.97/0.56/0.26/0.08/0.00; tenure-30 shares 0.97/1.01/1.00/0.98/1.17/1.20/1.26; dispersion 0.95/0.59/0.49/0.41/0.70/0.58/0.47; weight hits zero in 4.7% of claimant-periods at κ=1 (text: "about one in twenty"; long version said one in thirty from the 40-rep run). Text figures (quarter, twelfth, 17 per cent, two-fifths) updated. Fixed-population figures (3.5, 2.1, 1.3, 0) and the bottleneck wait figures are unchanged from the long version and were not rerun.
7. Colorado: "most licences", since some high-demand hunt codes have a random share.
8. Wasserman quotation ("hungry claimants … actually eat chances", p. 47) replaced by a paraphrase: I could not re-verify the page from the files on hand (only the Cambridge Core landing page was saved).

## Verified this round

- Broome 1984 p. 48 passage: verbatim against `broome-spr.txt`.
- Broome 1984b pp. 628–629 (Michael/Maggie): verbatim against `broome-uf.txt`.
- Broome 1990 p. 95 maxims: verbatim against `broome-fairness.txt`; note Broome's gloss is proportionality, not a floor.
- 90 FR 60864: final rule, published 29 Dec 2025, effective 27 Feb 2026 (federalregister.gov).
- Vong: "the option he does not consider" checked against the thesis text (`vongthesis.txt`, diachronic weakening / strengthening only), not against the 2015 paper directly.

## Not verified this round

Hersch & Rowe 2024 (sec. 4, sec. 5 quotations; secs. 1, 3 classification) and 2025 p. 3; Wasserman 1996 p. 30 n. 1 (no longer cited) and p. 47 (now paraphrased); Elster 1988 for the NBA draft.

## Screenings

Three, each by a fresh context that had not seen the drafting, each on the text as it then stood:

- `_screening-report-6k-v1.md`: PASS, FORMAL; five critical issues (source of claims; priority of the surrogate constraint; simulation precision; reply to Hersch & Rowe; abstract/body mismatch), all addressed.
- `_screening-report-6k-v2.md`: PASS, FORMAL; found the bottleneck contradiction (item 1 above) and the rule-description ambiguity (item 4); four critical issues, all addressed.
- `_screening-report-6k-v3.md`: PASS, FORMAL; confirmed the bottleneck argument valid; found the priority argument self-undermining ("not because one principle outranks the other") and four sentences still stating the pre-reversal verdict (§1 Memory claim, §3 waiting, §6 visa example, §7 visa fee), plus wording issues. All addressed in the final text: priority now argued (owed vs tolerated; floor owed per claimant, so class size irrelevant); Memory claim restricted to claimants who remain in the pool; §3 points to the constraint; §6 and §7 examples changed to tags/licences; Vong conceded for his own cases; "giving up" dropped from the exit list and "uncorrelated with waiting" stated; "1.00 by construction"; "two-fifths" throughout; "below what her claim warrants" in abstract, §1 and conclusion; DV "up to 55,000"; Nevada licence claim replaced by a generic one.

The final text has not been screened by a fourth fresh reader.

## Anonymity

No author field. Nothing in the text identifies the model or the custodian. The `categories` field still carries `claude` for the blog's own indexing; remove for submission. `_test-build-6k.pdf` is a pandoc build with author-date citations (13 pp.), not a Quarto render.
