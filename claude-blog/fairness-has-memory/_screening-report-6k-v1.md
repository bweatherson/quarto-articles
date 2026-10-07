# Screening report v1: "Fairness Has Memory" (6k cut)

**Paper:** Fairness Has Memory
**Word count:** c. 5,900 (my count of title, abstract, body, footnotes and table; author's figure 5,870). Under the 6,000 ceiling with roughly 100 words of headroom.
**Thesis:** Broome's theory of fairness, which requires a divisible good to be divided in proportion to claims and treats a lottery as a second-best surrogate for division, entails that a recurring allocation of indivisible units among overlapping claimants must give later-round chances that track each claimant's shortfall from her proportional share, because the sequence of units is a divisible good even though each unit is not. Memory tracks shortfall in units (recurrence) or in waiting (bottlenecks), and may be pressed only as hard as a "surrogate constraint" allows: no claimant's expected share over her actual tenure may fall below proportionality. Forgetting rules (New Mexico, the visa lotteries) and lexical rules (preference-point queues, squared bonus points) are unfair in opposite directions; a moderate shortfall-weighted lottery is what fairness requires.

**Verdict: PASS, FORMAL**

The central argument is in words and uses only Broome's premises, but the paper's third and most distinctive claim (the bound on how hard memory may press) rests on a simulated allocation model and a table whose set-up and reading an expert has to check directly. That, plus the fair-allocation/social-choice subject matter, puts it in the formal referral category rather than plain PASS.

## Deal-breakers

None. The faults below are concrete and the author could have seen them, but each is local to the paper's third claim or to a single paragraph, and the main thesis (non-separability and memory) survives all of them. The paper would come back from referees with a revise-and-resubmit, not a rejection.

## Key strengths

- **The argument for the main thesis is genuinely from the opponent's premises.** The move "the units are indivisible and the sequence is not" uses nothing beyond the Division Principle and the surrogate account, and the cake-raffled-slice-by-slice reductio ("Nobody thinks this is a fair way to allocate a cake") is the right size of example. The observation that Broome's own illustration of division (conscripting everyone briefly) is already a rotation is a real find.
- **The extinction objection is met, not evaded.** Separating re-run, interrupted allocation and recurrence, and conceding the extinction thesis for the first two while showing it is "true and irrelevant" for the third, is the correct shape of reply; the diagnosis that Broome's objection needs a stronger thesis ("that losing a fair lottery for one unit extinguishes any bearing the loss might have on later units") is exactly right.
- **The two-sided result is the contribution.** That the rules actually in use (Nevada, Colorado) breach the constraint from the other side, by "transferring expected share from claimants whose tenure turns out short to those whose tenure turns out long," is a conclusion a specialist would not have predicted from the headline thesis, and the shortfall-versus-points-for-losses distinction ("they count a loss among two hundred applicants as a loss among two") is sharp and practically consequential.
- **The reach section does the boundary work a hostile reader wants.** Transition, absence and regress each get a one-line determinate answer, and "shortfall is a state, not a stack of debts" closes the regress cleanly.

## Key weaknesses

- **The account of where claims come from undercuts the thesis as written.** Section 2: "a body that announces it will allocate a resource among eligible applicants by a fair procedure undertakes to each that her application will be treated as the procedure promises." If the claim's content is fixed by what the procedure promises, New Mexico, which announces that it "does NOT grant preference to applicants who were unsuccessful in previous drawings," has promised a forgetting rule and kept its promise; the hunter has no Broomean claim the paper can appeal to. The paper also leans on this promissory grounding while rejecting Vong's procedural claim, which is a near relative of it. The paragraph needs to say that the undertaking is to allocate *fairly* and that fairness's content is not the agency's to stipulate, or it needs a different source (eligibility under a public scheme).
- **The lexical priority of the surrogate constraint over the Division Principle is asserted in one sentence.** "It is prior to the Division Principle's demand for the same reason the surrogate is owed at all: fairness may reduce the unfairness of the sequence's outcome only by means that do not deny anyone the chance her claim warrants." That is a restatement, not a reason. In the single case the surrogate is *subordinate* to division (it is what one does when one cannot divide); the paper inverts the order over sequences without saying why. Worse, the Broomean maxim the paper invokes two paragraphs later, "weaker claims must not simply be overridden by stronger ones," is a principle of *weighing*, and supports a trade-off between dispersion and newcomers' shares rather than a lexical floor. Since the third claim is what makes the paper more than "rotation is fairer than a raffle," this is the weakest joint.
- **The table does not support the fine distinction the text draws from it.** The caption says "standard errors across runs are at most .04"; the text says "At κ = 2 the newcomer's chance is 97 per cent of what her claim warrants, a small but real breach." A deviation of .03 within a stated error of .04 is not a real breach. The κ = 1 row gives a first-period chance of 1.01 and an expected share at tenure 1 of 0.96; with history-independent exit these are the same expectation, so either the columns measure different things that are not explained or the noise is of the order of the effect. The robust numbers (κ = 10 at 0.56, Arizona 0.26, Nevada 0.08, Colorado 0.00) carry the practical conclusion; the "region around κ = 1" versus κ = 2 line does not stand on this evidence.
- **The reply to the nearest predecessor's contrary verdict is one sentence.** Hersch and Rowe classify the visa lotteries as scarcity, not bottleneck, because most applicants will never be served; the paper answers "That is true whether or not everyone will eventually be served." But their point is presumably that where the good will never arrive for most, there is no waiting being divided, only probability mass being moved among people most of whom lose anyway, and memory then converts the lottery into a queue of the kind the paper condemns in Colorado. The paper has the resources to answer (the surrogate constraint applies in scarcity too, so the result is a waiting-weighted lottery, not a queue), but does not say so.
- **The bound is stated two incompatible ways.** Abstract and introduction: memory may press "only as hard as is consistent with every claimant's still receiving, *in each period*, the surrogate she is owed." Section 5: "that no claimant's expected share, *over whatever tenure she turns out to have*, fall short of proportionality." These differ, and the per-period version would forbid any memory in a given pool state. Pick the tenure version and change the abstract.

## Critical issues for revision

1. Rewrite the source-of-claims paragraph so the content of the claim is not fixed by the agency's announced procedure (see first weakness). Two sentences will do, but they must be the right two.
2. Give the surrogate constraint's priority an argument of its own: why a floor on expected share rather than a weighing against dispersion, given that the paper's own Broomean maxim supports weighing. One option: the floor is itself what "weaker claims must not simply be overridden" means when the weaker claim is a newcomer's and the stronger an incumbent's accumulated one.
3. Either re-run the simulation with enough draws that the κ = 1 / κ = 2 distinction clears the stated error, or drop the "small but real breach" sentence and state the robust conclusion only (moderate κ satisfies the constraint to within error; κ = 10 and the rules in use breach it by a wide margin). Explain or reconcile the 1.01 / 0.96 pair.
4. Expand the reply to Hersch and Rowe on scarcity by two sentences, making explicit that the surrogate constraint, not a queue, is what memory yields when demand permanently exceeds supply.
5. Align the abstract's statement of the bound with Section 5's.

## Cut-specific: gaps

Places where the text reads as if an explanation was removed:

- "the region around κ = 1 has this property" (Section 5.2), where "this property" is "a rate that corrects [shortfall] over roughly the period in which the practice would ordinarily deliver a share." Nothing earlier characterises κ this way; the reader has been given κ only as a multiplier on shortfall. One sentence is needed (at κ = 1 a claimant one full unit behind has double weight, and a full unit of shortfall takes about N periods to accrue, so the correction horizon is the share horizon).
- The priority sentence for the surrogate constraint (quoted above). It reads like the topic sentence of a paragraph whose body is gone.
- The source-of-claims paragraph (Section 2). Ninety words that raise the hardest foundational question and answer it in a way that hands the opponent the case; this looks like a compression of a longer treatment.
- "In general the currency is units discounted by delay, and the pure cases are its endpoints" (Section 3). The general currency is announced and never used; either develop it in a sentence or cut the sentence.
- The ex ante objection says "the forgetting rule's defect, as @tbl-churn showed, is entirely ex post." The table shows churn results; the ex post defect of the forgetting rule was shown in Section 3 (3.5 of 10 left with nothing). The cross-reference points at the wrong place, which suggests the surrounding text was moved.
- Two different unfairness metrics are used without comment: "expected number left with nothing" in Sections 3 and 5.1, "dispersion of realized shortfall" in the table. A clause saying why dispersion is the right summary of the sequence's residual unfairness is missing.

## Cut-specific: still cuttable

Roughly 250–300 words can come out without loss, enough to repair the gaps above:

- "Memory is bound to the claimant" (Section 6, c. 110 words): the household-pooling and ancestors points answer a question the paper raised only rhetorically ("Her mother's?"). Two sentences suffice; save c. 60.
- The second reply to the ex ante objection (c. 70 words) largely restates the first ("the view cannot prefer the forgetting rule to rotation"). Save c. 40.
- Section 2, "These features are common ground even among the theory's critics" (c. 60 words). The Stone clause is a stretch (Stone's view is about when lotteries are *just*, not about division), and the Wasserman footnote citation can be absorbed elsewhere. Save c. 50.
- Section 5.3, "Several real systems are of this kind: Arizona's extra numbers, and the Grand Canyon's river-permit lottery…" (c. 45 words). Citing Arizona approvingly here, after the table condemned Arizona's rule as a breach of the constraint, is confusing. Cut.
- Section 1, second paragraph: the Wimbledon / school-admission inventory can be reduced to the visa lotteries, which are the ones the paper returns to. Save c. 25.
- "Losing on purpose": the NBA history and its footnote can be halved. Save c. 30.

## Competition-mode items

**One-sentence contribution.** Broome's own Division Principle, applied to a sequence of indivisible units allocated among overlapping claimants, entails that fairness requires later-round chances to track each claimant's shortfall from her proportional share, bounded above by the requirement that no claimant's expected share over her actual tenure fall below proportionality, so that forgetting rules and lexical preference rules are both unfair, in opposite directions.

**Rating: interesting.** The headline alone ("fairness has memory"; rotation beats a repeated raffle) is close to *expected*: most specialists would agree on reflection, and Hersch and Rowe have the thought in two remarks. What lifts it is (i) that the result is derived from the standard theory's own premises rather than against them, (ii) the extinction reply, and (iii) the two-sided bound, which condemns the rules institutions have actually adopted when they tried to add memory. Item (iii) approaches *surprising*; it is also the item whose support is weakest (see weaknesses 2 and 3), so the rating is contingent on those repairs.

**Source representation (internal evidence only; sources not checked).**

- The Broome 1984 quotation ("…That is the only way to treat them with perfect equality," p. 48) carries the Division Principle and the conclusion's closing image. If it is not verbatim, or if the surrounding context qualifies "divided" in a way the paper does not report, the paper's rhetorical frame fails. Verify to the word.
- "Vong rejects views on which losing weakens a claim and on which winning strengthens it (pp. 477–479); the option he does not consider is that losing strengthens the claim to later units." Claims about what a cited author did not consider are the kind most often wrong. Confirm by rereading the whole of Vong 2015, not pp. 477–483.
- "Colorado and Wyoming give licences to whoever has the most preference points, chance only breaking ties." Wyoming's preference-point draws for most species reserve a share of licences (around a quarter) for a pure random draw; the sentence is inaccurate for Wyoming as written. Drop Wyoming or qualify.
- The Federal Register citation (90 FR 60864) is given for a rule "in force since February 2026." Check that 60864 is the final rule and not the September 2025 notice of proposed rulemaking.
- Hersch and Rowe 2024 is cited by section number throughout and 2025 by page; both quotations ("we lose something that matters for fairness"; "who completed the chore last time matters…") are short enough to be verbatim but are load-bearing for the priority claim. Verify.
- Elster 1988 for the NBA draft: Taming Chance is usually dated 1989 (Tanner Lectures delivered 1987). Check the bibliographic year.
- "agreement is one of Broome's sources of claims" (Section 2): Broome 1990 discusses need and desert at length; confirm that agreement or promise is named there and not only in Broome 1991.

Nothing reads as a misattribution of position; the risks are quotation fidelity and the two institutional descriptions.
