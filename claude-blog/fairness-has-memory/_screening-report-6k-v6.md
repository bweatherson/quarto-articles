# Screening report v6: "Fairness Has Memory" (6k version)

Fresh-context screening of `fairness-has-memory-6k.qmd` (dated 7 October 2026, file of 21 October 2026). Earlier screening reports were not read.

- **Paper title:** Fairness Has Memory
- **Word count:** 5,956 (author's count). My own rough count of the abstract, text, footnotes and table, excluding the bibliography, is 5,939. That leaves about 45 to 60 words of headroom under the 6,000 cap, so every addition below has to be paid for with a cut.
- **Thesis summary:** When an indivisible good recurs among the same claimants, the sequence of units is divisible, so Broome's own principle that a divisible good must be divided requires lotteries whose chances track each claimant's shortfall from her share. The paper says memory may press only as hard as leaves no claimant's expected share, over whatever stay she has, below proportionality. In recurrence this permits a shortfall rule with weight κ ≤ N/(N−1). In bottlenecks where some claimants leave unserved for reasons nobody can foresee, it forbids memory altogether, so the visa lotteries are right to forget.
- **Verdict: NOT READY**

## Deal-breakers

**Criterion 4: the paper's own table refutes the third thesis as stated, and the author could have seen it.** The abstract, §1 and §8 state the weight constraint as a floor with no exceptions: memory may press "only as hard as leaves no claimant's expected share, over whatever stay she has, below what her claim warrants". §5.2 says the floor "is not a consideration to be weighed against the dispersion that memory reduces". Yet the rule §5.2 recommends (κ about 1, and in any case at most N/(N−1)) gives a newcomer 0.993 of her share (Table 1, first column). In my reruns, every tenure class from one to six periods gets between 0.993 and 0.998 of its share.

The paper tries to absorb this with a distinction between transfers a rule is designed to make and transfers forced by the non-negativity of chances. The paper's own claim (ii) undoes that distinction. Claim (ii) says that absent clipping the rule meets the floor exactly *for every κ*. So at every κ the whole transfer comes from clipping, which means it is "forced by non-negativity". That includes κ = 10, where the newcomer loses 48 per cent of her chance. If "forced" means "arising only from non-negativity", it licenses κ = 10, which the paper rejects.

What actually fixes the line at N/(N−1) is whether a single win from the pool's mean clips. That is a fact about how often clipping happens, not about what the rule is designed to do, and nothing changes at the line. In my reruns the newcomer's chance is 0.993 at κ = 1, 0.992 at 1.05, 0.990 at 1.11, 0.988 at 1.2 and 0.974 at 1.5. At κ = 1, 3.7 per cent of claimant-periods are clipped (recorded output, `clip 0.0366`). That is part of the rule's normal operation, not a rare "residue of luck".

Nor is this transfer "of the kind the standard theory tolerates wherever it tolerates a lottery". The standard theory tolerates unequal outcomes from equal chances. This is a shortfall in the newcomer's *chance*, which §5.2 itself puts in the category of what is owed, and setting κ = 0 avoids it. The sentence after the table ("costs the newcomer nothing at κ = 1/2, under one per cent at κ = 1 … against reductions in dispersion of a quarter, two-fifths …") is exactly the weighing the paper says is forbidden. The designed/forced distinction relabels that weighing; it does not replace it.

The flaw is decisive because it leaves the paper's two headline verdicts in a dilemma:

- **If the floor is lexical**, no κ > 0 in the paper's family is permitted. Every κ > 0 clips with positive probability, so the newcomer always gets strictly less than 1/N. "The forgetting rule is dominated" (§5.2) is then false by Table 1's first column, and "memory is required" under churn has no support, because no memory rule that meets the floor exactly is offered.
- **If the floor is a tolerance**, §5.3's prohibition loses its ground. A small weight on waiting in a bottleneck is also a small transfer from newcomers, and it buys a large reduction in the dispersion of waiting. The paper gives no exchange rate under which the recurrence trade passes and the bottleneck trade fails.

Either way, one of "memory is required" (recurrence with churn) and "memory is forbidden" (bottlenecks) does not follow as written.

## Key strengths

- **There is a contribution that can be stated in one sentence.** Broome's own principles, including his conscription passage (Broome 1984, 47), make a sequence of indivisible units a divisible good, so the theory that recommends lotteries condemns raffling the sequence. The cake reductio and the non-separability paragraph (§3) are clean, and a philosopher outside the subfield can assess them.
- **The reply to Broome's extinction thesis draws the right distinction.** It separates a re-run, an interrupted allocation and recurrence, and it is accurately sourced (Broome 1984b, 629).
- **The recurrence/bottleneck asymmetry is surprising and has practical consequences** (visa lotteries, once-in-a-lifetime tags).
- **The formal work is correct as an idealisation.** The fixed-pool variance (N−1)/2κN is exact absent clipping. The churn formula follows from the same recursion once tenure is geometric. Claim (i) is a sound conservation argument. Every number in Table 1 and in the prose matches the recorded output, and the code implements the rule as the paper defines it (Appendix B, C).
- **The paper locates itself honestly against its nearest antecedents.** Its placement relative to Hersch & Rowe 2025 (p. 3) and Lackner 2020 is accurate and candid.

## Key weaknesses

1. **The designed/forced distinction is a relabelling of a weighing** (see Deal-breakers).

2. **The ex ante reply in §7 is aimed at the wrong version of the view.** §7 says the surrogate constraint is "indexed to her entry". But claim (i) implies that, when exit is independent of history, an entrant's unconditional expected total share is E[tenure]/N under *every* rule: queue, squared points and forgetting alike. In a bottleneck, an arrival's chance of ever being served is about 1/(1+Nq), again under every rule.
   - An ex ante theorist who dates the choice at the claimant's entry therefore finds all rules equally fair. That gives no support to the weight bound or to the bottleneck verdict.
   - The constraint does its work only because it conditions on tenure, which is an ex post fact relative to entry, while not conditioning on the draws. §5.2 defends this in one sentence ("If the allocator knew who would leave …"). §7 never addresses the version of the ex ante view that the paper's own phrasing invites.
   - Both the third thesis and §5.3 rest on this step.

3. **Vong is characterised in a way he may not accept.** In his thesis (I could not check Utilitas), the new lottery is held among "remaining claimants … that previously received a fair chance of benefiting but did not actually benefit". Past beneficiaries are excluded, and benefit claims survive only for those who lost.
   - In a bottleneck that amounts to forgetting. Carried over to recurrence, it is if anything maximal memory.
   - So "On either form the persistent loser is owed nothing but a fresh lottery among all who remain, which is the forgetting rule" overstates, and so does "I find no discussion … of the option that losing leaves more of the claim outstanding".
   - The quoted wording "cannot be lost due to the results of a procedurally fair lottery" is not the thesis wording, which reads "cannot be lost due to results of a lottery". It must be checked against Utilitas.

4. **The location of the paper has gaps.**
   - The lead example of its nearest antecedent (Hersch & Rowe 2024; 2025, p. 1) is the Grand Canyon river-permit lottery. That lottery weights applicants by years since their last trip or win, capped at five, and people who have never won sit at the cap. It is a lottery with memory of a third design, and it is missing from the paper's survey of rules in use.
   - That example also sits uneasily with the claim that the theory, "where it does [touch the disagreement], sides with New Mexico", until Hersch & Rowe 2024 has been checked.
   - For §5.3, Arnosti & Shi (2020), which is in the .bib but not cited, show that per-item lotteries and waitlists produce the same equilibrium outcomes when claimants can refuse offers. The bottleneck verdict needs to say why its non-strategic model is the right one.

5. **There are smaller inaccuracies (Appendix A, item 5).**
   - "Two-fifths" is the closed-form reduction; the simulation gives 37 per cent.
   - "No single win clips a chance" should be "no win from the pool's mean clips a chance". At κ = 1, 1.5 per cent of clipped claimant-periods belong to claimants with at most one win.
   - The reason given in claim (ii), that exits "leave the pool's expected standing where it was", is not the fact the conclusion depends on.
   - Arizona's 20 per cent bonus pass is not mentioned.
   - Two cross-references to §5.3 print as §5.1: one in §3, one in §5.2.

---

## Appendix A. Revision items

The screening format omits revision items for NOT READY. They are given here because the brief asks for them. Each says what to fix and which cut pays for it.

**1. Thesis 3, §5.2, and the abstract, §1 and §8.**

Quoted: "That transfer is not designed but forced by the unit's indivisibility, of the kind the standard theory tolerates wherever it tolerates a lottery; the constraint forbids the first and sets $\kappa$ where the second remains the residue of luck rather than of the rule's normal operation". Also: "Memory is required: up to $N/(N-1)$ every tenure class keeps its share, up to the residue of luck, and dispersion falls, so the forgetting rule is dominated."

What is wrong: see Deal-breakers.

Fix, choosing one of:
- **(a) Keep the floor lexical** and exhibit a memory rule that meets it exactly under churn. One candidate: a tenure-dependent adjustment o(a) to standing, chosen so that E[p | age a] = 1/N at every age, which offsets the expected clipping charge. I have not shown such a rule exists; a fixed-point search in `simulations-6k.py` would settle it. The bound on κ then comes from whether that adjustment exists, not from whether a first win clips.
- **(b) Restate the constraint as a strong priority with an explicit exchange rate,** in the same words in the abstract, §1, §5.2 and §8. Then rebuild §5.3 on an asymmetry of order:
  - In a bottleneck, the transfer is first order in the weight.
  - In recurrence, the transfer from clipping is of higher order: the probability that standing falls below −1/κ vanishes faster than any power of κ as κ → 0, as κ = 1/2 already shows.
  - That justifies "some memory" in recurrence and "at most very little" in a bottleneck, but not "forbidden".

Either way, delete "dominated".

Cost: about +120 words for (a), about +150 for (b). Cuts:
- the envy sentence in §5.1, "And when every unit is worth the same to everyone … which is where Fungibility fails." (≈70 words)
- §6's *Transition* passage, reduced to one clause (≈40 saved)
- the apportionment footnote in §3, reduced to its citations (≈35 saved)

**2. §7, the ex ante objection.**

Quoted: "which is why the surrogate constraint is indexed to her entry."

What is wrong: the constraint is indexed to her *tenure*. Dated at entry, every rule gives the same prospects, by claim (i).

Fix: say "indexed to her tenure". Add three or four sentences arguing why the allocator owes the surrogate conditional on exit but not on the draws. For example: exit settles whether division is available to her, which is what the Division Principle makes relevant, whereas a draw is the surrogate itself. Then state that this is where the paper parts company with the ex ante view, and that §5.3 depends on it.

Cost: ≈100 words. Cuts:
- compress the first ex ante reply ("If it is the beginning of the practice … which the cake refutes.") to one sentence (≈60 saved)
- trim *Equality, not fairness* (≈40 saved)

**3. §4 on Vong.**

Quoted: "On either form the persistent loser is owed nothing but a fresh lottery among all who remain, which is the forgetting rule". Also: "I find no discussion in his paper of the option that losing leaves more of the claim outstanding for *later* units".

Fix:
- Restrict the first sentence to interrupted allocation and bottlenecks.
- Acknowledge that Vong's lottery is held among those who did not benefit. Extended to recurrence, his view that benefit claims survive a loss is an ally of the paper. The real disagreement is whether winning reduces a claim to *later* units.
- Verify "cannot be lost due to the results of a procedurally fair lottery" verbatim against Utilitas 27, 479–480, and "a new case of scarce benefit distribution" against p. 483.

Cost: neutral, since this is rewording in place.

**4. Location.**

Fix:
- In §1, after "Others forget", add one sentence on the Grand Canyon weighted lottery: points are years since the last trip or win, capped at five, and those who have never won sit at the cap (source: NPS, grcariverpermits.nps.gov/faq.cfm).
- In §5.2's paragraph on rules in use, say how that lottery fares. By claim (i), giving newcomers more than 1/N means some longer tenure class gets less, so it breaches the constraint in the opposite direction.
- Check what Hersch & Rowe 2024 say about that weighting before keeping "where it does, sides with New Mexico".
- In §5.3, add one sentence citing Arnosti & Shi 2020 (and Leshno 2022), saying why their equivalence result does not carry over.

Cost: ≈90 words. Cuts:
- the Wasserman sentence at the end of §4 (≈40)
- the H-1B wage sentence in §5.3, "What is wrong with the rule in force since 2026 … rather than a claim." (≈30)
- the luck-egalitarian contrast in §6, reduced to a clause (≈25 saved)

**5. Cost-neutral corrections.**

- "$\kappa = 1$ removes two-fifths of the dispersion" and "Such a rule removes some two-fifths": the closed form gives 40 per cent but the simulation gives 37 per cent (0.597 against 0.950). Say "over a third", or say "in the closed form".
- "Clipping costs the newcomer nothing at $\kappa = 1/2$": change to "almost nothing". Under a lexical floor, even the 0.29 per cent clip rate matters.
- "While $\kappa \leq N/(N-1)$ no single win clips a chance": change to "no win from the pool's mean clips a chance".
- Claim (ii)'s reason: replace "since exits independent of history leave the pool's expected standing where it was" with: "given that she stays, the pool's mean moves toward her by an amount proportional to her distance from it, so her expected distance, starting at zero, stays zero".
- Table 1: either add tenure 3 (where the κ = 1 deficit sits) or say that only the first column resolves deviations below ±.02.
- Arizona: change to "adds one random number per bonus point and reserves a fifth of its tags for the highest point-holders". Then state that the table models only the random phase.
- Give the §5 subsections IDs so that the two `@sec-bottleneck` references (in §3 and §5.2) render as §5.3 rather than §5.1.

## Appendix B. Formal checks (derived independently)

- **(i) Conservation forces equality. Correct.**
  - Σᵢ pᵢ = 1 in every period. With history-independent exit and a stationary pool, the average chance per claimant-period is 1/N.
  - Tenure classes partition claimant-periods. So if every class gets at least its proportional share, every class gets exactly its share.
  - Corollary, used in Weakness 2: an entrant's unconditional expected total share equals E[tenure]/N under every rule.

- **(ii) The rule meets the constraint exactly absent clipping. Correct, in expectation over states (not state by state after the first period).**
  - Absent clipping, Σᵢ(pᵢ − 1/N) = 0, and the draw leaves the pool's mean standing x̄ unchanged.
  - From the draw, E[Δyᵢ] = −(κ/N)yᵢ.
  - Given that i stays, the expected shift in the stayers' mean is (N/(N−1))·E[1/(1+S) − 1/N]·yᵢ⁺, where S is the number of other stayers. This is linear in yᵢ⁺ with no constant term.
  - A newcomer enters at y = 0. Hence E[yᵢ(a)] = 0 at every age, and E[p | age a] = 1/N.
  - Her first-period chance is 1/N in every state, absent clipping anywhere in the pool. The code confirms this: newcomer state-sd is 0.000 at κ = 0, rising to 0.014 at κ = 1 only through clipping.
  - The paper's stated reason, "exits … leave the pool's expected standing where it was", is true unconditionally but is not the operative fact. Conditional on her staying, the mean moves toward her.

- **(iii) The closed forms. Correct (the fixed-pool form is exact absent clipping; the churn form is approximate).**
  - Let V be the variance of standing. The κ² terms cancel, giving V′ = (1 − 2κ/N)V + (N−1)/N² exactly absent clipping. So the stationary fixed-pool variance is (N−1)/(2κN). The paper's "variance … (N−1)/2κN" is exact, not approximate.
  - With tenure L ~ Geometric(q), E[V_L] = ((N−1)/N²)/(1 − (1−q)(1 − 2κ/N)) = (N−1)/(N(Nq + 2κ(1−q))). This matches the paper; the approximation lies in treating raw shortfall as relative standing, and in ignoring clipping.
  - The ratio to forgetting is 1/(1 + 2κ(1−q)u), where u = 1/(Nq) is the expected number of units per stay. So the "expected units per stay" reading is correct.
  - At u = 1 and κ = 1, the SD falls by 40.2 per cent in the closed form. At N = 100, q = 0.1, κ = 1, the SD falls by 7.9 per cent (variance by 15.3 per cent), so "under a tenth" holds of SD.
  - Closed form against simulation, for the SD at exit:

    | κ | closed form | simulation |
    |---|---|---|
    | 0.5 | 0.688 | 0.708 |
    | 1 | 0.567 | 0.597 |
    | 2 | 0.442 | 0.506 |

    The gap grows with clipping, as expected.

- **Clipping and the bound.**
  - A first win from level takes y to −(N−1)/N. This clips iff κ > N/(N−1). Correct.
  - For any κ > 0, a claimant just above −1/κ still has a positive chance, and winning from there clips her. So clipping has positive probability at every κ > 0, and the floor is strictly breached at every κ > 0.
  - My runs (seed 1, 400,000 periods, N = 10, q = 0.1) of the newcomer's share as a multiple of 1/N:

    | κ | newcomer's share |
    |---|---|
    | 1 | 0.993 |
    | 1.05 | 0.992 |
    | 1.11 | 0.990 |
    | 1.2 | 0.988 |
    | 1.5 | 0.974 |
    | 2 | 0.943 |

    The share moves smoothly through N/(N−1) = 1.111.
  - Tenure-class shares at κ = 1, for tenures 1 to 7: 0.993, 0.993, 0.994, 0.995, 0.996, 0.998, 1.000.
  - Share of clipped claimant-periods whose claimant had at most one win: 1.45 per cent at κ = 1, 7.6 per cent at κ = 1.11, 21.8 per cent at κ = 1.2.
  - Script: `/tmp/claude-0/-home-claude/eedd0722-8ea0-5b70-929e-ce4563e26069/scratchpad/screen6/age.py`. Output: `age1.out` and `age2.out` in the same directory.

- **The code against the rule's definition. Matches.**
  - Weights are max(0, 1/N + (κ/N)(x − x̄)), normalised. A clipped claimant's unpaid share is spread proportionally over everyone, newcomers included.
  - A newcomer's offset is set to the stayers' mean standing, so she enters level with the pool. Leavers take their standing with them.
  - "Dispersion" is the SD of raw shortfall at exit.
  - Nevada and Arizona are modelled as weights 1 + losses² and 1 + losses, reset on a win. In a single-unit draw this is exactly "lowest of k random numbers".
  - Colorado is modelled as max-losses-only.

- **Bottleneck. Correct.**
  - P(W ≥ 40) = 0.9⁴⁰ = 0.0148, i.e. 1 in 68 ("about one in seventy"). E[W] = 9. A queue gives a wait of 9.
  - "Only the forgetting rule" holds in the sense that P(served) is the same under every rule, so a rule that leaves no attrition class worse off must have a constant hazard of 1/N at every age.

## Appendix C. Numbers checked against `simulations-6k.out`

Table 1, every cell. Recorded output → paper.

| Rule | Newcomer's chance | Expected share, tenure 10 | Tenure 30 | Dispersion |
|---|---|---|---|---|
| M (forgetting) | 1.000 → 1.000 | .992 → .99 | .971 → .97 | .950 → .95 |
| S0.5 | 1.000 → 1.000 | .989 → .99 | 1.020 → 1.02 | .708 → .71 |
| S1 | .993 → .993 | 1.002 → 1.00 | 1.001 → 1.00 | .597 → .60 |
| S2 | .943 → .943 | .998 → 1.00 | 1.007 → 1.01 | .506 → .51 |
| S10 | .523 → .523 | .972 → .97 | .987 → .99 | .417 → .42 |
| A (Arizona) | .263 → .263 | .960 → .96 | 1.149 → 1.15 | .694 → .69 |
| V (Nevada) | .082 → .082 | .990 → .99 | 1.207 → 1.21 | .580 → .58 |
| Q (Colorado) | .000 → .000 | 1.006 → 1.01 | 1.261 → 1.26 | .466 → .47 |

All match.

- **Caption.** The standard errors stated are within the limits claimed: at most .000 in the first column, and at most .018 elsewhere. The caption correctly states "200 runs of 1,500 periods". The 200-period burn-in is not mentioned.
- **Prose.** Every figure below matches:
  - §3: "three and a half" (3.487, and footnote N(1−1/N)^T is correct).
  - §5.1: 3.5, 2.1, 1.4 and 0 (3.488, 2.126, 1.353, 0.000).
  - §5.2: "a quarter … a twelfth … 15 per cent" (.263, .082, 1.149).
  - "under one per cent … six per cent … nearly half" (0.7, 5.7 and 47.7 per cent).
  - Dispersion reductions "a quarter, two-fifths, a half, over a half" against simulated 25.5, 37.2, 46.7 and 56.1 per cent. "Two-fifths" is loose: the closed form gives 40.2 per cent, the simulation 37.2.
  - "some by more than the moderate shortfall rules": Nevada reduces dispersion by 38.9 per cent and Colorado by 50.9 per cent, against 37.2 per cent for S1.
- **Envy claim.** Under the forgetting rule the difference in units between two claimants is a lazy random walk with SD √(2T/N), which is order √(T/N). Correct.

## Appendix D. Quotations and attributions

| Item | Source checked | Result |
|---|---|---|
| Broome 1991a, 91–93, claims as duties owed to the candidate | broome-fairness.txt p. 92 | Correct |
| "equal claims require equal satisfaction", "stronger claims require more satisfaction than weaker ones", "weaker claims must not simply be overridden by stronger ones" (95) | p. 95 | Verbatim; the capital W of "Weaker" is lowercased, which is acceptable |
| "should be divided" (95) | p. 95 ("horizontal equity says it should be divided") | Correct; strictly, horizontal equity's verdict, which Broome endorses |
| "a sort of partial equality in satisfaction" and the long surrogate-satisfaction quotation (97–98) | pp. 97–98 | Verbatim |
| Chance as surrogate satisfaction "plausible" (98) | p. 98 | Correct |
| Declines to say which reasons are claims (93) | p. 93 | Correct |
| Broome 1984, 47, block quotation on military service | broome-spr.txt p. 47 | Verbatim |
| Broome 1984b, 628–629, "once Michael has won …" | broome-uf.txt p. 629 | Verbatim; "same year" correct |
| Hersch & Rowe 2025, 3: "many goods can be divided temporally as well as spatially", "over time through a rotation", chore quotation, credit to Elster 1989 | hersch.txt p. 3 | Verbatim; the Elster credit is theirs, as the paper says. The wording "which they credit to Elster" is suitably cautious |
| Hersch & Rowe's narrower use of "bottleneck" | 2025, p. 1 ("eventually all will be able to") | Consistent |
| Hersch & Rowe 2024, pp. 188, 199 (Diversity Visa endorsement; "arrives into the lottery pool early and is continuously unlucky") | not local | **Unverifiable by me** |
| Vong 2015, 479–480, "cannot be lost due to the results of a procedurally fair lottery" | thesis only: "cannot be lost due to results of a lottery" | **Unverified; wording differs from the thesis. Check Utilitas** |
| Vong 2015, 483, "a new case of scarce benefit distribution" | thesis | Phrase present in the thesis; page unverified |
| Vong rejects weakening and strengthening views (477–479) | thesis discusses "diachronic weakening/strengthening" | Consistent; pages unverified |
| Characterisation of Vong's lottery as the forgetting rule | thesis p. 100 | **Contestable**: his lottery is among those who did not benefit (Weakness 3) |
| Feldblyum Le Blevennec 2023: memory protects the winner when new claimants arrive | fllb.txt pp. 197–199 | Correct |
| Elster 1988, 123 n. 46, NBA worst-first order replaced by a lottery because of incentives to lose | elster88.txt p. 123 n. 46 | Correct |
| Lackner 2020, 2104, "only due to this dependency we can achieve fairness over time" | p. 2104 | Verbatim |
| Lackner 2020, Perpetual Quota weight max(0, quota − satisfaction) (2106) | p. 2106 | Correct. In the paper's setting each claimant's support is 1/N, so the weight is max(0, shortfall) |
| Perpetual Quota "is" rotation in tie-breaking order | derived | Correct: ties in round 1, winners at weight 0, then ties broken in the fixed order |
| RSD only a benchmark (2109) | p. 2109 | Correct |
| Lackner leaves fluctuating voters open (2109) | p. 2109: "we have not yet addressed the issue of fluctuating voters … fairness guarantees also hold for newcomers" | Correct. Lackner explicitly flags fairness to newcomers, which the paper could note |
| Lackner 2020, Prop. 1 | Perpetual Reset and Unit-Cost fail simple proportionality | Correct |
| Lackner & Maly 2023, Thm. 2 ("no loss-based WAM satisfies simple proportionality") | lm2023.txt | Correct |
| Benade et al. 2018, Thm. 2.1 (random allocation, Õ(√(T/n))) and Thm. 2.13 (lower bound via an adaptive adversary whose values differ across agents) | benade2018.txt | Correct. Lemma 2.3, with the argument after it (the optimal adversary against random allocation sets all values to 1), supports the "every unit worth the same" contrast |
| Aleksandrov et al. 2015, Balanced Like | not local | Consistent with my knowledge of the paper; not checked by me |
| Freeman, Zahedi & Conitzer 2017 | cited in a list only | No claim to check. "History-dependence is an axiom" is loose: in Lackner it is a design feature, and the axioms are proportionality and dry spells |
| Elster 1989 | cited only as Hersch & Rowe's attribution | Suitably cautious |
| John & Millum 2020, 181, 205–206; Wasserman 1996, 47, 49 | not local | Unverified |

## Appendix E. Institutional facts

| Claim | Checked against | Result |
|---|---|---|
| Nevada: points squared plus one random numbers, lowest number used, 10 points gives 101 numbers | ndow.org bonus-point page | **Confirmed**. Points reset on success |
| Nevada has no bar on re-entry for mule deer | eRegulations "Eligibility Waiting Periods" (Nevada) | **Confirmed** as far as that page goes: it lists waiting periods for sheep, elk, antelope, moose, goat and bear but none for mule deer |
| New Mexico: "New Mexico does NOT grant preference to applicants who were unsuccessful in previous drawings." | NMDGF "How the New Mexico Draw Works" | **Verbatim, confirmed** |
| New Mexico has no bar on re-entry for deer | NMDGF pages consulted | No restriction found, but **no positive official statement located** |
| 19.31.17.9 NMAC: Rocky Mountain and desert bighorn ram licences are once in a lifetime; part effective 1 April 2025 | srca.nm.gov | **Confirmed**; "(2025)" correct |
| Arizona: one random number per bonus point | hunter-ed.com study guide | **Confirmed**. Omitted by the paper: the bonus pass awards 20% of tags to the highest point-holders, and there are also education and loyalty points |
| Colorado: preference points, with chance breaking ties | not checked | Not checked; "most licences" is suitably hedged |
| H-1B weighted-selection rule, 90 Fed. Reg. 60864 | AILA summary | **Confirmed**: published 29 December 2025, effective 27 February 2026, so "in force since February 2026" is correct |
| No preference for prior unselected registrants under the H-1B rule | AILA summary | Not stated in the source consulted; no evidence of any such preference |
| About 85,000 H-1B places, up to 55,000 Diversity Visas | standard figures | Correct |
| Grand Canyon non-commercial river permits: weighted lottery, points equal to years since last trip or lottery win, capped at five, never-boaters at five | NPS, grcariverpermits.nps.gov/faq.cfm | **Confirmed**. Not mentioned in the paper (Weakness 4) |
