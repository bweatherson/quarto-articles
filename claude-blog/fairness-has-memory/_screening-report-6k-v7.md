# Screening report v7: "Fairness Has Memory" (6k version)

**Paper:** Fairness Has Memory (`fairness-has-memory-6k.qmd`, typeset `_test-build-6k.pdf`)
**Word count:** ~5,940 by my count (title, abstract, body, footnotes, table caption; bibliography excluded). Author's figure 5,923. Under the 6,000 limit with roughly 60 words of headroom; every addition below is paired with a cut.
**Thesis summary:** A sequence of individually fair lotteries over a recurring indivisible good can be an unfair allocation, because over the sequence the good is divisible and Broome's own Division Principle then requires rotation or its nearest feasible approximation; so fairness requires that a claimant's later chances track her shortfall from her share. Memory may press that shortfall only by smoothing each claimant's share within her own stay, never by making a transfer of expected share between tenure classes its means; this condemns the points and queue rules in use where the good recurs, and forbids memory altogether in bottlenecks where some will leave unserved.
**Verdict:** NOT READY

## Deal-breakers

**1. The weight half of the third thesis is carried by a test that cannot deliver it (Criterion 4; "could the author have seen it").** §5.2 concedes that the surrogate constraint, as stated ("that no claimant's expected share, over whatever tenure she turns out to have, fall short of proportionality"), is met by no memory rule under churn, and replaces it with: "What the newcomer is owed is that her chance not be the *means* by which the stayers' shares are smoothed." The test is then given two incompatible contents in consecutive sentences. (a) Structural: "the smoothing is done within each claimant's own stay ... the leak to other classes is a by-product of her not being taxable." I checked this and it is true: the leak is exactly the mass clipped at zero and renormalised, and it vanishes in the unclipped rule at every κ (the martingale argument holds for every κ). But it therefore holds at κ = 10 as much as at κ = 1; the mechanism at κ = 10 is identical, only larger. On this reading the test licenses the whole family up to the Balanced-Like limit, where the newcomer's chance goes to zero, so it fixes no weight at all. (b) Magnitude: "shrinks faster than any power of κ as κ falls, while the smoothing shrinks only in proportion. A transfer that can be made arbitrarily small relative to the gain it accompanies is not the gain's means." The asymptotic facts are correct (my runs: leak 0.024% at κ = ½, 0.7% at 1, 5.7% at 2, 47.7% at 10; smoothing linear in κ near zero). But "can be made arbitrarily small" is a property of the family parametrised by κ, true of κ = 10 too, since one can always move to a smaller κ; to bite on a particular rule it must mean "*is* small relative to the gain at this κ", which is a ratio threshold, i.e. a weighing. The paper says so itself: "it fixes the weight up to a region rather than a point", and then "Up to κ = 1 it is a by-product; by κ = 10 ... it has become the means", with κ = 2 (6% leak, 46% dispersion reduction) sitting unclassified in its own table and no criterion for the boundary anywhere. This is the lexical-floor-stated, tolerance-applied problem under a new name, and its visibility in the paper's own sentences ("a region rather than a point" followed by "the third claim is established") makes it a flaw the author could see. The one structural marker offered, "where a first win sets a chance to zero for most of a cycle", is not developed into a criterion, and it conflicts with "a region rather than a point", since it names a point (κ = N/(N−1), the weight above which a single win from the mean excludes).

**2. The constraint is applied in different readings in different sections.** §5.3: "In recurrence the newcomer's floor could be met because past winners hold a surplus and can be pushed below her" contradicts §5.2's "no weight escapes it ... admits no memory under churn, only forgetting." And §5.3 derives the bottleneck verdict from the floor reading, "the only rule under which no tenure class's expected treatment falls below the equal chance is the forgetting rule", which is precisely the reading §5.2 rejected as mistaking "what the floor protects". The asymmetry can in fact be had from the structural reading (in a bottleneck any wait-weighting transfers from short to long tenures intrinsically, with no boundary to blame; and a shortfall-relative-to-pool rule transplanted to a bottleneck collapses to forgetting, since nobody present has received anything), and the clause "any smoothing of waiting is transfer between claimants and nothing else" gestures at this. But as written the paper uses the strict reading where it yields the wanted verdict and the relaxed one where the strict reading would forbid its own rule. The conclusion's "only so far as the smoothing stays within each claimant's own stay" compounds this: the smoothing stays within the stay at every κ; it is the leak that does not.

**3. The means/by-product distinction is not a premise the standard theory accepts (Criterion 7, characterisation of the source).** Broome's fairness is a matter of relative satisfaction of claims; it has no place for the agent's means. §5.2 para 2 itself frames the wrong as an *overriding* of the newcomer's claim, which is a fact about how much of it is met, and a 0.7% shortfall met as by-product is, in Broome's terms, exactly as much unmet claim as 0.7% taken as means. The paper concedes "That ranking is mine, not Broome's" for the owed/tolerated ranking, but the abstract advertises that "The argument uses only premises the standard theory accepts," and the third thesis is listed in §1 alongside the other two without the qualification.

## Key strengths

- The divisibility argument is clean, generalist, and genuinely derived from inside Broome: the military-service passage (Broome 1984, 47, verified verbatim) already divides across time, and the cake-raffled-slice-by-slice reductio makes non-separability vivid without machinery. This is a positive contribution one can state in a sentence.
- The reply to the extinction thesis (re-run / interrupted allocation / recurrence) is the right distinction, and the surrogate-character argument in §4's last paragraph (if an equal chance of a slice were a kind of slice, the raffle would be a division) is a good answer to the "satisfied twice" worry.
- The formal core is correct where it is checkable. I derived (i) conservation (pathwise Σ units = Σ L/N), (ii) the martingale property (newcomer at the pool mean has chance 1/N state-wise; E[d'] = (1 − κ/N)d, so expected distance from the mean stays zero and every tenure class is proportional absent clipping), and (iii) both closed-form variances ((N−1)/(2κN) and (N−1)/(N(Nq + 2κ(1−q))), from the AR(1) coefficient 1 − κ/N observed at a geometric exit time) and the "units per stay" reading 1/(1 + 2κ(1−q)/(Nq)). The recorded simulation output reproduces exactly from seed 2026 and every table entry and prose figure is confirmed by an independent long-run check.
- The recurrence/bottleneck asymmetry has a principled core that survives even when the weight bound does not: in a bottleneck no claimant holds a surplus to be smoothed within her stay, so there is no transfer that could be a boundary artefact.
- Location against Hersch and Rowe 2025 is honest and verbatim; the Lackner comparison concedes that Perpetual Quota's weight is shortfall.

## Key weaknesses

- The weight bound (deal-breaker 1): §5.2's closing "fairness requires a rule that raises chances with shortfall at a rate that corrects it over roughly the period in which the practice delivers a share" is asserted; nothing in the paper derives that rate.
- "thereafter, given that she stays, the pool's mean moves toward her by an amount proportional to her distance from it" misdescribes the dynamics. The draw leaves the pool mean unchanged (Σ standing changes by N·(1/N) − 1 = 0); it is her standing that moves toward the mean, by −(κ/N)d in expectation. The conclusion drawn is right; the step is wrong.
- The institutional rows are stylised beyond their labels. "(Arizona)" omits the bonus pass the paper itself mentions in §1 (one fifth of tags to the highest point-holders), so the row understates Arizona's transfer. The Grand Canyon model gives a winner zero weight in the year after her trip; the NPS FAQ gives her one point. With that change the newcomer's surplus is 1.17, not 1.27, so "a quarter more than her share" is model-dependent (the direction, "errs the other way", is robust).
- Small numerical overstatements: at κ = 2 the dispersion reduction is 46% (0.506/0.950), called "a half"; the fixed-pool closed form at κ = 2 gives 0.47 against a simulated 0.53 because clipping is 20% there (the paper's "absent clipping" caveat covers it, but the κ = 2 and κ = 10 rows lie outside the regime where the closed forms are even approximately right).
- Literature: Goodwin 2005 is in the .bib but not the paper, and her Total Social Lottery is the clearest statement of the opposing view that *repeating* a memoryless lottery is what makes it fair; the paper should name that opponent in §1. Huesch and Brady 2010 (repeat winners judged unfair) is direct empirical support, also dropped. Page references to Hersch and Rowe 2024 (188, 199) could not be checked against the published pagination; the preprint places the quoted sentence on its p. 17 and the Diversity Visa endorsement on p. 4.

## Revision items (required by the brief; the standard's format omits this section for NOT READY)

1. **Reframe the weight claim so that what the test can deliver is what the thesis claims.** The test does separate rule *families*: shortfall rules, whose transfer vanishes in the unclipped rule, from points-for-losses, queues and years-since-last-win, whose transfer is intrinsic (zero boundary, non-vanishing leak as the weight falls; the table's Arizona/Nevada/Colorado/Grand Canyon rows). State the third thesis that way in the abstract, §1 and §5.2: fairness fixes the kind of rule and forbids the rules in use; it does not by itself fix κ. Then either (a) say openly that the weight within the family is left open by the theory and κ ≈ 1 is a recommendation on the numbers, or (b) give the one principled point available: κ ≤ N/(N−1), the largest weight at which no claimant is excluded until she is a whole unit ahead of the pool, i.e. until she holds a unit the Division Principle says is someone else's; above it the rule excludes for fractions of the indivisible unit, which is where a first win excludes and the leak becomes systematic. Either way delete "A transfer that can be made arbitrarily small relative to the gain it accompanies is not the gain's means. That is the test; it fixes the weight up to a region rather than a point, and" (≈40 words) and "Up to κ = 1 it is a by-product; by κ = 10, where a first win sets a chance to zero for most of a cycle, it has become the means." (≈28 words). Change §7's "the bound in weight from @sec-proportion" to "the bound in kind", and the conclusion's "only so far as the smoothing stays within each claimant's own stay" to "only by a rule whose transfer between classes is a by-product of non-taxability, not its mechanism". Net cost ≈ 0 after the two deletions.

2. **Make §5.3 run on the same reading as §5.2.** Replace "In recurrence the newcomer's floor could be met because past winners hold a surplus and can be pushed below her; in a bottleneck nobody holds a surplus, since winners leave, so any smoothing of waiting is done by taking chance from a claim still wholly outstanding: the transfer is its means." with: "In recurrence the transfer was a by-product of a boundary: absent clipping, the shortfall rule gives every tenure class its share. In a bottleneck there is no boundary to blame: nobody present has received a unit, so a rule that weights by waiting takes from the newcomer by design, and the same rule that forgets in recurrence (standing relative to the pool, newcomer at the mean) reduces here to the forgetting rule." Delete "With exits unforeseeable and uncorrelated with waiting, the only rule under which no tenure class's expected treatment falls below the equal chance is the forgetting rule." (≈30 words). Roughly word-neutral.

3. **Fix the dynamics sentence (0 words).** "the pool's mean moves toward her by an amount proportional to her distance from it" → "her standing moves toward the pool's mean by an amount proportional to her distance from it".

4. **Qualify the abstract's premise claim and the Broomean credentials of the third thesis (+8 words).** "The argument uses only premises the standard theory accepts" → "The first two claims use only premises the standard theory accepts". Pay for it by cutting "which is the extinction thesis built in" from §5.1 (7 words; the point is made in §4).

5. **Label the stylised rows honestly (+15 words).** Table: "(Arizona, random pass)" and a caption clause "Grand Canyon modelled with zero weight in the year after a trip; with the NPS's one point the newcomer's surplus is a sixth." Change "a quarter more than her share" to "more than her share". Pay with the §5.1 Benade sentence ("Benade et al.'s ... fails.", 27 words), which does no argumentative work here.

6. **Name the repeated-lottery opponent (+12 words).** In §1's "The wider literature takes the single lottery as its unit" add "or, in Goodwin's [-@Goodwin2005] periodic social lottery, trusts repetition without memory to even things out". Pay with the clause "and the memoryless lottery enters only as a benchmark (2109)" in §5.1 (11 words).

7. **Minor.** "a half" → "nearly a half" for κ = 2; note in the caption that the closed forms are quoted for κ ≤ 1 only; check the Hersch and Rowe 2024 page numbers against the published chapter.

## Appendix: quotations, attributions and numbers checked

Sources: local extractions in the scratchpad; NDOW, NMDGF, NPS FAQ, Justia (NMAC), gohunt (Arizona), PhilArchive preprint of Hersch & Rowe 2024, by WebFetch.

**Quotations and attributions**

| Item | Result |
|---|---|
| Broome 1991a, 95: "equal claims require equal satisfaction", "stronger claims require more satisfaction than weaker ones", "weaker claims must not simply be overridden by stronger ones" | Verbatim, p. 95 |
| Broome 1991a, 95: "should be divided" (horizontal equity, even when giving all to one does more good) | Verbatim and fair, p. 95 |
| Broome 1991a, 91–93: claims as duties owed to the candidate herself; declines to say which reasons are claims (93) | Confirmed, pp. 92–93 |
| Broome 1991a, 97–98: "a sort of partial equality in satisfaction"; "Each person can be given a sort of surrogate satisfaction ... to some extent"; "plausible" (98) | Verbatim, pp. 97–98 |
| Broome 1984, 47: military-service passage (three sentences) | Verbatim, p. 47 |
| Broome 1984b, 628–629: "once Michael has won the first lottery ... not at all fair to hold a second lottery" | Verbatim; top of p. 629 (context is the re-run case, as the paper says) |
| Vong 2015, 479–480: benefit claim "cannot be lost due to the results of a procedurally fair lottery"; 483: "a new case of scarce benefit distribution"; 477–479 rejects losing-weakens / winning-strengthens views | Thesis version checked: "cannot be lost due to results of a lottery" and "a new case of scarce benefit distribution" present; Utilitas wording and pages not local, unverified |
| Feldblyum Le Blevennec 2023: winner's standing protected when new claimants arrive | Confirmed from abstract |
| Hersch & Rowe 2025, 3: "many goods can be divided temporally as well as spatially"; "over time through a rotation"; "who completed the chore last time matters to who has a claim to avoid it this time"; credited to Elster 1989 | Verbatim, p. 3 of 9; Elster 1989 credited |
| Hersch & Rowe "bottleneck" = queues everyone eventually clears | Fair: 2025 "eventually all will be able to"; 2024 preprint "like abundance at tn" |
| Hersch & Rowe 2024, 188: endorse DV lottery as scarcity; 199: "arrives into the lottery pool early and is continuously unlucky" | Content confirmed in preprint (pp. 4 and 17); published page numbers unverified |
| Elster 1988, 123 n. 46: NBA moved from worst-first to lottery because of incentive to lose | Verbatim content, n. 46, p. 123 |
| Lackner 2020, 2104: "only due to this dependency we can achieve fairness over time"; 2106: Perpetual Quota weight max(0, quota − satisfaction); 2109: memoryless lottery (RSD) only a benchmark; Prop. 1 | All confirmed (RSD is described on 2108 and recalled on 2109) |
| Lackner & Maly 2023, Thm. 2: no loss-based WAM satisfies simple proportionality | Verbatim |
| Benade et al. 2018, Thm. 2.13: Ω((T/n)^{r/2}) lower bound needs adversarial (heterogeneous) values | Confirmed; gloss fair |
| Freeman et al. 2017 as history-dependent dynamic social choice | Confirmed (loose list citation) |
| Aleksandrov et al. 2015 Balanced Like = unit to agent with fewest items | Not local; consistent with my knowledge of the paper |
| John & Millum 2020, 181, 205–206; Balinski & Young 2001, 100, Prop. 3.3; Wintein & Heilmann 2018; Igarashi 2024 | Not local; glosses plausible, unverified |
| Nevada: point per loss, squared, lowest of random numbers, 10 points → 101 draws, reset on success | Confirmed, NDOW page |
| New Mexico: "New Mexico does NOT grant preference to applicants who were unsuccessful in previous drawings." | Verbatim, NMDGF page |
| Arizona: one random number per point; 20% of tags to highest point-holders | 20% bonus pass confirmed; "one random number per point" not confirmed from an official page |
| Colorado: most licences to most preference points, ties random | Not checked; consistent with the published system |
| Grand Canyon: weight = years since last trip, cap 5, newcomer at cap | Confirmed, NPS FAQ (post-trip value is one point, not zero as modelled) |
| 19.31.17.9 NMAC: bighorn ram once-in-a-lifetime | Confirmed (Justia, current through June 2025) |
| H-1B ≈ 85,000; DV up to 55,000; no carry-over | Consistent with statute; not fetched |

**Numbers**

| Claim | Result |
|---|---|
| N(1−1/N)^T = 3.5 for N = T = 10 | 3.487 |
| Fixed pool, N = T = 10, expected with nothing: 3.5 / 2.1 / 1.4 / 0 at κ = 0, 1, 2, 10 | 3.489 / 2.127 / 1.354 / 0.000 (reproduced; κ = 10 is exactly rotation, derived) |
| Fixed-pool variance (N−1)/(2κN) | Derived as AR(1) stationary variance to first order; exact form (N−1)/(2κN − κ²); simulated sd 0.95 / 0.69 / 0.53 at κ = ½, 1, 2 vs formula 0.95 / 0.67 / 0.47 |
| Distance from mean shrinks by 1 − κ/N per period; chance zero at 1/κ units ahead | Derived |
| Conservation: no tenure class above proportionality unless another below | Derived (pathwise identity) |
| Newcomer at pool mean has chance 1/N state-wise; expected distance stays zero thereafter | Derived (absent clipping) |
| Churn variance (N−1)/(N(Nq + 2κ(1−q))); ratio depends on κ and 1/(Nq) | Derived; formula 0.949 / 0.688 / 0.567 / 0.442 at κ = 0, ½, 1, 2 vs simulated 0.950 / 0.708 / 0.597 / 0.506 |
| κ = 1 removes over a third of dispersion at one unit per stay; under a tenth at N = 100, q = 0.1 | 37% (table) / 40% (formula); 8% (formula, sd) |
| Table 1, all 45 entries | Reproduced exactly from seed 2026; independent run agrees to reported precision |
| Leak 0.03% / <1% / 6% / nearly half | 0.024% / 0.7% / 5.7% / 47.7% |
| Dispersion reductions a quarter / over a third / a half / over a half | 25% / 37% / 46% / 56% |
| Leak super-polynomial in κ, smoothing linear | Confirmed numerically (leak ratio per halving of κ grows: ×8 from 2→1, ×29 from 1→½) and analytically (tail of a geometric number of wins) |
| Arizona newcomer a quarter; tenure 30 +15%; Nevada a twelfth; queue 0 | 0.263; 1.149; 0.082 (1/12.2); 0.000 |
| Grand Canyon newcomer a quarter more; longer tenures pay | 1.270 (model); 1.17 with one post-trip point; tenure 30 = 0.965 |
| "within one per cent" at κ = 1 | 0.993 / 1.002 / 1.001 |
| Bottleneck: 1 in 70 wait ≥ 40; expected wait 9; queue 9 | 0.9^40 = 1/67.7; 9; 9 |
| Standard errors ≤ .003 / ≤ .02 | Max observed 0.000 / 0.013 |
