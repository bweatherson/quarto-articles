# Screening report v4 (fresh context, 15 October 2026)

**Paper:** Fairness Has Memory (`fairness-has-memory-6k.qmd`, 6k competition version)

**Word count:** c. 6,010 as rendered. Counted from the Quarto `.docx` (`_test-build-6k.docx`): 5,859 whitespace tokens in the main document (title, date, "Abstract" label, abstract, body, section headings, table and caption, "References" heading) plus 154 in the footnotes = 6,013; dropping the date line and the two labels gives c. 6,008. The source file with every `@cite` counted as one token gives 5,951; the notes' own counter gives 5,987. Whichever counter the competition uses, the paper sits on the 6,000 line with no headroom. Every addition below is paired with a cut.

**Thesis:** Broome's own Division Principle, applied to a sequence of indivisible units of one good allocated among claimants who stay in the pool after being served, requires that later chances rise with a claimant's shortfall from her proportional share, because the sequence is divisible although the unit is not; a sequence of locally fair lotteries is therefore an unfair allocation. Memory may press shortfall only as hard as a "surrogate constraint" allows (no claimant's expected share over her realised tenure may fall below proportionality), which condemns both forgetting and lexical rules in recurrence. In bottlenecks with unforeseeable attrition the same constraint selects the forgetting lottery, so the visa lotteries are right to forget and wrong only to weight by wage.

**Verdict: PASS, FORMAL**

## Deal-breakers

None. I looked for the decisive flaw in the places the standard names and did not find one that survives: the central argument (§§3–4) is derived from the opponent's premises and holds; the simulation reproduces exactly (seed 2026, all 28 table cells and every derived figure in the prose match); the closed-form claims check (N(1−1/N)^T = 3.49; the κ = 1 shrinkage is exact while no weight is clipped; 0.9^40 = 1/67.7 for "one in seventy"; expected wait 9); the four sentences v3 found stating the pre-reversal verdict are gone; and the location against Lackner 2020, Lackner & Maly 2023, Freeman et al. 2017, Benade et al. 2018 and Frege is accurate in every particular I could check (appendix). What remains is one under-argued step whose reason is stated but mis-aimed, a load-bearing assumption stated as a stipulation, and a set of source checks the author's own checklist still lists as open. Those are critical issues, not grounds to stop expert review.

## Key strengths

- **A real derivation, not an axiom.** Computational social choice assumes that fairness over time needs history (Lackner's "only due to this dependency we can achieve fairness over time", verified at 2104). The paper gets the same requirement out of two premises Broome states and his critics accept, and the derivation does work the axiom cannot: it fixes the currency (units where Fungibility holds, waiting where it fails) and the weight (the floor). That is a one-sentence contribution a generalist can state.
- **The extinction reply is clean.** Re-run / interrupted allocation / recurrence is the right trichotomy; the cake reductio shows that "each slice's losers were fairly extinguished" is compatible with the cake not having been divided; and the paper now concedes Vong's verdict for his own (bottleneck) cases rather than rejecting it wholesale.
- **The recurrence verdict is robust to the paper's weakest step.** Even a reader who rejects the lexical floor must grant the table: κ = 1 matches Nevada on dispersion (0.59 v. 0.58) and gives the newcomer 1.01 instead of 0.08; κ = 2 matches Colorado (0.49 v. 0.47) and gives 0.97 instead of 0.00. Both rules in use are dominated on any weighing.
- **Priority is handled honestly.** Perpetual Quota's weight is acknowledged as the paper's shortfall; the paper's claim that in its setting Perpetual Quota *is* rotation in the tie-breaking order is correct (I checked by hand: round 1 all weights 1/N, a winner's weight 0 until the others catch up, all equal again after a full cycle); the Benade lower bound is placed exactly where Fungibility fails, which is right (Theorem 2.13's adversary needs agents who value items differently; Lemma 2.3 makes the paper's all-values-equal case the worst case for the forgetting rule).

## Key weaknesses

- **The floor's priority is argued with the wrong reason.** §5.2: dispersion among stayers "is unfairness that fairness tolerates because the units cannot be divided within a period." But §3's whole point is that the stayers' dispersion is cross-period and that cross-period division is *required* where available; and in §5.3 the stayers' grievance is unequal waiting, which the paper itself calls divisible ("Time, unlike a flat, is divisible … equalize it"). So the stated ground for treating the leaver's shortfall as a harm in kind and the stayer's as a harm in degree does not reach either case. The correct ground is available and nearly on the page: the dispersion that remains under the floor-respecting rule is the residue of the within-period indivisibility that made a lottery necessary at all, and Broome's theory already treats a lottery's residue as tolerated unfairness ("meets the requirement of fairness to some extent", verified at 97–98). The sentence needs to say that, not "within a period". Since the floor alone carries the bottleneck reversal and the visa verdict, this is the paper's soft spot and a referee will go straight to it.
- **History-independent exit is load-bearing and is only stipulated.** "1.00 by construction" for the forgetting rule, the measurability of the floor as "expected share over whatever tenure she turns out to have", and the bottleneck verdict ("exits … uncorrelated with waiting") all assume exit is independent of the rule's draws. Real exit is not: discouraged losers quit and satisfied winners stop applying. With discouraged-loser exit, every rule's short-tenure classes fall below proportionality by selection, the floor as worded becomes unsatisfiable, and the forgetting rule's "1.00 by construction" fails too. The paper needs one sentence defining the floor over the chances the rule assigns, holding exit fixed, and saying so.
- **The newcomer objection is stated in the vocabulary the paper abandoned.** §3 says that from §4 on claims carry history. §5.2 then opens: a newcomer "has a claim exactly as strong as anyone else's … unequal chances for equal claims." In the history-carrying vocabulary that is false (a past loser has more of her claim outstanding), so the objection as worded misfires; the real objection, which the reply answers, is that the newcomer may be a leaver for whom division is unavailable. Compression has dropped the step.
- **Source checks still open on the paper's two main living interlocutors.** The Vong 2015 quotations and the negative claim "I find no discussion in his paper" were checked against the DPhil thesis and Feldblyum Le Blevennec's quotation of Vong, not against the Utilitas text (the thesis wording differs: "results of a lottery", no "procedurally fair"). Hersch & Rowe 2024's pp. 188, 199, 205 and both quotations, John & Millum's 181 and 205–206, and Wasserman's 47 and 49 are not verifiable from anything in the folder; the notes list them as open in one place and as fixed by a report that is not in the directory in another. Elster 1989 is cited among works that "take the single lottery as its unit" without having been read, while Hersch & Rowe 2025 cite that very book for rotation as temporal division of an indivisible good. One attribution is confirmed wrong (Feldblyum Le Blevennec; appendix).

## Critical issues for revision

1. **Re-ground the floor (≈ +25 words).** Replace "because the units cannot be divided within a period" with: "because it is the residue of the indivisibility that made a lottery necessary, and a lottery's residue is what the standard theory already tolerates; the leaver's shortfall is not a residue but a claim partly overridden." Then §5.3's "The surrogate constraint carries over" is earned without further words. Pay for it by cutting §5.2's parenthesis "(Dispersion of shortfall is the right summary, since shortfall is what the Division Principle measures.)" (−15) and §6's "Nor is there an obligation to correct one's ancestors' shortfalls; the lottery did no wrong." (−16; it repeats "Memory is not compensation, since the lottery did no wrong").
2. **State the exit assumption as part of the floor (≈ +20 words).** After "Call this the *surrogate constraint*" add: "measured over the chances the rule assigns, with exit taken as given; a claimant who leaves because she lost has a complaint against her luck, not against the rule." Cut §2's last sentence "Nor does the undertaking turn every reason for allocating a visa into a claim: the wage of an H-1B job is a reason of usefulness, not a claim." (−27); §5.3 makes the point where it is used.
3. **Fix the newcomer objection (0 net).** "In the year she first applies, a newcomer has as much of her claim outstanding as any past loser had on her own first application, and may be gone before the division reaches her; under any rule with memory she is given a smaller chance than that loser now has." Same length as the current two sentences.
4. **Correct the Feldblyum Le Blevennec sentence and finish the source checks (−24 words).** Her exclusion is of losers "with respect to *that specific benefit*" (199) in an interrupted allocation of one unit, exactly the structure §4 grants to the extinction thesis; "would exclude previous losers from later draws; the cake answers her too" overstates her and the cake does not answer a one-unit case. Cut the sentence. Before submission: read Vong 2015 itself and confirm 477–480 and 483 and the negative claim; confirm Hersch & Rowe 2024 at 188, 199, 205 (and note that *their* "bottleneck" means everyone is eventually served, so the paper's "bottleneck with attrition" is their "scarcity"; one clause saying the paper redefines the term would prevent a misreading); confirm John & Millum and Wasserman pages; read Elster 1989 ch. 2 and either move it out of the "single lottery as its unit" list or cite it with Hersch & Rowe 2025 as the prior statement of rotation as temporal division, and soften "more often than its defenders have noticed" accordingly.
5. **Numbers and the code footnote (0 net).** "1.3 at κ = 2" should be 1.4 (I get 1.353 ± 0.002; 2.128 and 3.49 are right). "shrinks by a factor of 1 − 1/N" is exact only while no weight is clipped; "roughly" or "while no weight is clipped" fixes it. Footnote 4 says "The simulation code behind every figure in this paper accompanies it", but `simulations-6k.py` produces only the churn table; add the fixed-population and bottleneck computations (fifteen lines) so the sentence is true. Add Aleksandrov et al. 2015's Balanced Like, a lottery among those who have received fewest, as the κ → ∞ relative in the "near relatives" paragraph (≈ 12 words; the cuts above leave room).

Net of the cuts and additions above: about −25 words, which brings the rendered count just under 6,000 on my counter.

---

## Appendix: quotations and attributions checked

Sources: plain-text extractions in the scratchpad. "OK" = verbatim and page confirmed. Page numbers were read from running heads in the extractions.

**Broome 1991a, "Fairness" (`broome-fairness.txt`)**
- "equal claims require equal satisfaction", "stronger claims require more satisfaction than weaker ones", "weaker claims must not simply be overridden by stronger ones" (95): OK (Broome's intervening clause "weaker claims require some satisfaction" is omitted; the paper's splicing is marked by separate quotation marks, acceptable).
- Claim = "duties owed to the candidate herself" (cited 91–93): OK; the definition is on 92, the talent/usefulness contrast on 92.
- Declines to say which reasons are claims, grants that some are (93): OK.
- "should be divided" even when giving all to one does more good (95): OK; note Broome's sentence is "horizontal equity says it should be divided", which he then extends to fairness. The paper's paraphrase is fair.
- "a sort of partial equality in satisfaction" (97) and "[E]ach person can be given a sort of surrogate satisfaction. By holding a lottery, each can be given an equal chance of getting the good. This is not a perfect fairness, but it meets the requirement of fairness to some extent" (97–98): OK.
- "only if a chance counts as surrogate satisfaction, which he finds plausible (98)": OK ("This seems plausible to me", 98).

**Broome 1984, "Selecting People Randomly" (`broome-spr.txt`)**
- Conscription passage, three sentences (47): OK verbatim; the text runs on p. 47 immediately before the p. 48 head.

**Broome 1984b, "Uncertainty and Fairness" (`broome-uf.txt`)**
- "once Michael has won the first lottery he has a perfect claim to the treatment, and Maggie has none. Consequently it is not at all fair to hold a second lottery" (628–629): OK verbatim, spanning the page break.

**Vong 2015 (`vong.html` is a Cloudflare block page; checked against `vongthesis.txt` ch. 2 and Feldblyum Le Blevennec's quotations of the article)**
- "cannot be lost due to the results of a procedurally fair lottery" (479–480): wording and pages match FLLB's quotation of Vong (fllb.txt n. 6); the thesis reads "cannot be lost due to results of a lottery". Not checked against the Utilitas text.
- Rejects losing-weakens and winning-strengthens (477–479): consistent with thesis (diachronic weakening/strengthening) and with FLLB n. 5 citing 477–79. Not checked against the article.
- "a new case of scarce benefit distribution" (483): verbatim in the thesis (thesis p. 100); page 483 not checked.
- "I find no discussion in his paper of the option that losing leaves more of the claim outstanding for later units": true of the thesis chapter; not checked against the article.
- Corneas as his case where recipients leave the pool: OK (thesis §III).

**Feldblyum Le Blevennec 2023 (`fllb.txt`)**
- Protects the winner's standing when new claimants arrive (199–200): OK (winner "is given the chances that the losers of the previous round would have had").
- "would exclude previous losers from later draws": **mismatch in scope.** Her rule excludes "those who have already had a procedural claim satisfied with respect to that specific benefit by losing a previous lottery" (199); the exclusion is for the same unit, not later units.

**Hersch & Rowe 2025 (`hersch.txt`, Philosophy Compass)**
- "who completed the chore last time matters to who has a claim to avoid it this time" (3): OK verbatim, p. 3 of 9. Note the preceding sentences state temporal division by rotation and cite Elster 1989 for it.

**Hersch & Rowe 2024 (not in the folder; `hersch.txt` is the 2025 article, `hersch.html` a block page)**
- "we lose something that matters for fairness" (205); Diversity Visa endorsement (188); "arrives into the lottery pool early and is continuously unlucky" (199); scarcity/bottleneck distinction: **unverified here.** The distinction and the terms are confirmed second-hand by the 2025 article (which defines a bottleneck good as one where "eventually all will be able to" be served). Earlier builds cited these by section number; the page numbers appeared on 15 October citing a `_source-check-report.md` that is not in the directory.

**Wasserman 1996 (`wass.html` is the Cambridge Core landing page)**
- "claimants cannot eat chances" (47, 49), "pressed against calling a chance a partial satisfaction": **unverified**; only the title is confirmed.

**John & Millum 2020 (no local text)**
- Queue can be as fair as a lottery (181, 205–206): **unverified.**

**Elster 1988 (`fhm-src/elster88.txt`)**
- NBA moved from worst-first to a lottery because of the incentive to lose, 123 n. 46: OK ("Because of the incentives to lose created by this practice, the order is now determined by a lottery among the bottom eight teams"; the note begins under the p. 123 head).
- Elster 1989 listed among works that take "the single lottery as its unit": **not checked** (book not in hand; notes say not read). Risk noted above.

**Lackner 2020 (`fhm-src/lackner2020-flow.txt`)**
- "only due to this dependency we can achieve fairness over time" (2104): OK verbatim.
- Perpetual Quota weight max(0, quota − satisfaction) (2106): OK (α_{k+1}(v) = max(0, qu_{k+1}(v) − sat_k(v, w̄))).
- Rules deterministic with an arbitrary fixed tie-breaking order (2105): OK.
- In the paper's setting Perpetual Quota is rotation in the tie-breaking order: OK, verified by hand.
- RSD "converges to proportional outcomes" but "not a suitable alternative" for short sequences (2109): OK verbatim.
- Prop. 1 covers loss-counting rules: OK (Perpetual Reset and Perpetual Unit-Cost fail simple proportionality; Reset is the Arizona-style points-with-reset rule).
- Fluctuating voters/newcomers left open (2109): OK.

**Lackner & Maly 2023 (`fhm-src/lm2023.txt`)**
- Thm 2: "There is no loss-based WAM that satisfies simple proportionality": OK.

**Freeman, Zahedi & Conitzer 2017 (`fhm-src/freeman2017.txt`)**
- Cited only in the §1 list; the inverse-accrued-reward weighting is at 4582 as the notes say. Nothing to check in the text.

**Benade et al. 2018 (`fhm-src/benade2018.txt`)**
- Thm 2.1 (random allocation E[Envy_T] ∈ O(√(T log T / n)), interpreted as a random walk with ~2T/n non-stationary steps): OK; the paper's "grows as √(T/N)" drops the log factor and the constant, acceptable as an order statement.
- Lemma 2.3 (optimal adversary against random allocation sets all values to 1): OK.
- Thm 2.13 lower bound needs heterogeneous values: OK; the construction uses agents L and R with state-dependent values and n − 2 agents who value nothing. The paper's use ("needs an adversary who values a unit differently for different claimants") is correct.

**Harrenstein, Lackner & Lackner 2022 (publisher page, not the PDF)**
- Carry-over of votes for unelected candidates, cost of winning, long-run proportionality with a fixed electorate (Thm 1), failure with a growing one (Example 3): OK against the abstract and results summary. The sentence is cautious enough to stand.

**Agency pages**
- Nevada: one point per unsuccessful year, points squared to fix the number of random numbers, one extra number, lowest is the entry (so ten points → 101 draws): OK against the NDOW page.
- New Mexico: "New Mexico does NOT grant preference to applicants who were unsuccessful in previous drawings": OK verbatim, capitalisation included.
- Arizona and Colorado descriptions: uncited and not checked.

**Numbers**
- Table: all 28 cells match `simulations-6k.py` rerun (seed 2026); prose figures (1.006, 0.97, 0.555, 0.262, 1.169, 0.083, 0.00, clip 4.7 % ≈ "one in twenty", dispersion fall 38 % ≈ "two-fifths") all match.
- Fixed population N = T = 10: 3.49 / 2.13 / **1.35** / 0.00 (paper: 3.5 / 2.1 / **1.3** / 0; the third should round to 1.4).
- "one in seventy waits forty periods or more": 0.9^40 = 1/67.7, OK; "expected wait is nine": OK; "a queue serves everyone at nine": OK.
- κ = 1 shrinkage factor 1 − 1/N: exact when no weight is clipped and shortfalls sum to zero (fixed pool); approximate otherwise.
