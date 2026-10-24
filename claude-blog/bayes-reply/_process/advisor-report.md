# Advisor report: reply to Meehan & Zhang, "Bayes Is Back"

Written 2026-10-23. I read the screening standard (`fiction-paper/screening/CLAUDE.md`), all of M&Z's published text (pp. 285–350), idea-memo-v2, the pretest report, the canon check, and the relevant parts of Easwaran & Nielsen 2025, Salow 2018, Williamson 2014, Ahmed & Salow 2019, Das 2022, Das 2023, Grünwald & Halpern 2003, Gill & Grünwald 2008, Dorst's dissertation chapter 2, and Pettigrew's post with its comments. I re-ran the project's checks and added one script, `code/advisor_checks.py`. It covers the scope of N4, the new dominance result (N5 below), the interior-rule numbers and the knife-edge point. M&Z page numbers below were checked with `code/findq.py`.

---

## Verdict: (B) promising, but needs restructuring

The idea is sound and worth a paper. Neither thesis in memo v2 should be drafted as it stands, for three reasons.

1. **N4 overclaims, and T-broad leans on it.** The claim that the anomalies of externalist evidence have "one source" is only half true. The claim that "the models in which they vanish are exactly the edge-allowing CAR models" is false, and a formally competent screener would catch it. Williamson's own symmetric clock is a counterexample (details under Soundness).
2. **T-narrow is a reply.** As framed, it sharpens a point M&Z already conceded: the "incredulous stare" at "how likely it is for one to learn p at s" (p. 337). As a reply to one paper it would probably be NOT READY on Criteria 1–3.
3. **The memo has missed its strongest formal point.** The margin argument does not need weightings, CAR or the extensionality "bedrock" at all. It yields a **pointwise accuracy-dominance result** (N5 below).
   - Suppose every way an agent might learn about a magnitude has a two-sided margin for error. Then conditionalization is weakly accuracy-dominated by a globally evidentially constant (GEC) rule: at least as accurate at every state of every such learning situation, and strictly more accurate whenever what is learned has an edge.
   - Because the result holds for every weighting, it makes the "importance vs likelihood" question idle.
   - It turns M&Z's bedrock into a question about the *domain* of evaluation, and it inverts the Briggs–Pettigrew dominance argument for conditionalization.
   - It is elementary: one paragraph, via Predd et al. 2009. But elementary dominance results are the stock in trade of accuracy-first epistemology. As far as the canon check and my searches reach, this one is not in the literature in this form.

**Restructure the paper around N5.** Use CAR to explain how M&Z's measure escapes N5, and drop "one source". Details follow.

---

## Soundness

I checked each claim by hand and by script: the project's `run_checks.py`, `margins_general.py` and `margin_vs_prior.py`, plus `advisor_checks.py`.

### N1 (margins rule out CAR): correct; v2 states the scope correctly, with one wording fix

**The proof.** Let λ_p(s) be the total weight of situations that deliver p at s. Suppose every positively weighted situation delivers, at each state, a proposition that contains that state's neighbours. Take any proper nonempty p on a connected scale or circle. Then p has a boundary state t with a neighbour outside p. No weighted situation delivers p at t, so λ_p(t) = 0. CAR (equivalently, M&Z's extensionality) then forces λ_p ≡ 0 on p. So only S is ever learned.

**Scope.**
- The premise is right as v2 states it: widths and shapes may vary by method and by state, provided each method is two-sided at every state.
- **Do not** state it as "no weighting that gives positive weight to the agent's own situation is CAR." The pretest's mixture contradicts that reading: Dana's situation plus one-sided gauges, weights 2/7, 1/7, 1/7, 1/7, 2/7. I re-verified that this mixture is CAR.
- The correct reading: *no weighting all of whose methods are two-sided*.
- Add the knife-edge fact. On any support that contains a two-sided method delivering a proper p, the CAR weightings lie in a proper linear subspace. 10,000 random weightings on the pretest's own CAR-capable support gave **0** CAR cases.

**Credit.** N1 is a one-line corollary of GH Thm 3.1(d) (= Gill, van der Laan & Robins 1997) and of M&Z's Lemma 2 (p. 345). Its single-situation case is M&Z's Fact 12 (p. 338).
- GH §4.3–4.4 ("sometimes CAR is nothing") already show that CAR is degenerate for many families of overlapping observations. Cite that, so that N1 is not presented as a surprise to a statistician.
- The conceptual core is Williamson 2014 p. 980 ("R(w) is known only at w") and Salow 2018's contrast between truth-centred and guess-centred evidence.
- **Wording fix.** Replace "safe evidence" with "truth-centred, two-sided margins." Guess-centred theorists (Stalnaker 2009; Cohen & Comesaña 2013; Salow 2018) hold that their evidence is safe too. In their models it is CAR when error is uniform.

### N2 (the equal-weight measure): correct, but partly rhetorical

- **Correct.** Permutation-invariant weightings are CAR (transposition argument; verified on 4 states with 218 orbits). M&Z's counting measure is CAR. The fractions are right: on a 6-point scale with margin 1, 1/3 of (state, evidence) pairs respect the margin, and the interior share is 4^(-m).
- **Labelling.** These are unweighted *pair* shares. The share of *learning situations* that respect the margin at every state is 1/1024 on that scale. Say which number you mean.
- **Rhetoric.** "Factivity is the margin principle with R = identity" is a relabelling, not a result. Use it once at most.
- **Credit.** The "uniformly random true proposition" reading is Easwaran's (Substack comment, 20 Dec 2025). Gill & Grünwald 2008 (uniform multicovers) and GH's CARgen are the statistics counterparts.

### N3 (the interior rule): correct, with caveats

- **Verified.** For λ supported on situations that respect a fixed R, λ_p vanishes on rim(p), so the λ-optimal GEC rule (M&Z Lemma 1) gives zero credence to the rim. Under the uniform R-respecting weighting the posterior is ∝ π(s)/N(s) on int(p). The examples check out:
  - Dana: {15,16} → δ15; {16,17} → δ17; S → (1/8, 3/4, 1/8).
  - Olivia: [16,18] → δ17.
  - Conservative mixtures beat conditionalization, by the Fact 4 concavity technique.
  - Under M&Z's full measure the interior rule scores −1.597 against −0.680 for conditionalization (Brier), and −∞ under log.
- **Caveat 1.** The 1/N(s) weights are an artefact of one particular weighting. The rule is unconstrained on propositions with empty interior, which are never learned under that weighting.
- **Caveat 2.** A&S's Cr* = (0.1, 0.8, 0.1) is granted by them only "for argument". They argue that Good's theorem still fails for flatter Cr*. Do not cite them as endorsing centre-weighting.
- **Recommendation.** Demote N3. N5 below supplies a rule that beats conditionalization under *every* such weighting at once, so N3's weighting-specific optimum is no longer needed in the main text. Keep the Dana numbers for a footnote.

### N4 (the "one source" diagnosis): partly true, overclaimed as stated

**What is true.** CAR is *sufficient* for all three good properties.
- Under CAR, naive conditioning equals sophisticated conditioning on the signal "p was learned" (GH Thm 3.1).
- That gives Greaves–Wallace optimality, the martingale property, non-negative value of information (Good/Blackwell on the auxiliary partition) and no predictable misleadingness.
- So every anomaly requires the failure of CAR.
- Non-optimality is *equivalent* to that failure (M&Z Lemma 2).

**What is false.** The failure of CAR is not sufficient for bias or for negative value. "The models in which they vanish are exactly the edge-allowing CAR models" is false.
- **Williamson's own symmetric clock** (circle, E(s) = {s−1, s, s+1}, uniform prior) is not CAR. Yet E[posterior] = prior exactly, and conditionalizing beats the prior: +1.07 / +2.67 / +13.3 (Brier) and +0.51 / +0.69 / +0.98 (log) for n = 5 / 6 / 8 (`advisor_checks.py` part 1). The A&S parity anomaly (misleadingness about odd/even; negative pragmatic value for particular bets) does occur there. Salow-style bias and M&Z-style negative epistemic value (Fact 3) do not.
- **The project's own `margin_vs_prior.py`.** Under the uniform margin-respecting weighting on a line with a uniform prior, conditionalizing beats the prior for every n and m tested. Fact 3's negative value comes from Dana's prior, not from margins as such.
- **The deterministic case.** Here "not CAR" just means "not partitional". That is the received diagnosis: A&S 2019 p. 8 (Good assumes partitional observation); Geanakoplos 1989; M&Z fn 13; Das 2022, 2023. So the "one source" claim adds nothing in the deterministic case. In the stochastic case the addition is immediate from GH.

**Fix.** State it as follows. *CAR is the stochastic generalization of partitionality. It suffices for the good properties, and each anomaly requires its failure. Margins guarantee that failure. Whether a given anomaly then appears depends on the prior and on the scale's boundaries.* This is one paragraph in the paper, not a thesis.

### N5 (new; recommended centrepiece): accuracy dominance under two-sided margins

**Setup.** Let G be the neighbour graph on S (adjacent values on a scale, or on a circle). Let int(p) = {s ∈ p : every G-neighbour of s is in p} and rim(p) = p ∖ int(p). Let 𝒟 be the set of factive learning situations E with N_G(s) ∪ {s} ⊆ E(s) for every s. These are the "two-sided" situations; widths may vary.

**Proposition.** Let A be strictly proper, additive and continuous, or the simple log score. For every regular prior π there is a GEC rule f* such that, for every E ∈ 𝒟 and every s:

> A(f*(E(s)), s) ≥ A(π(·|E(s)), s),

with strict inequality whenever rim(E(s)) ≠ ∅. On a connected G that means whenever anything nontrivial is learned.

- **Log score:** f*(p) = π(·|int p).
- **Brier** (all-subsets or state-wise, which are proportional on probability functions): f*(p) is the Euclidean projection of π(·|p) onto the face Δ(int p). Note that π(·|int p) is *not* Brier-dominant: there is a 6-point counterexample in `advisor_checks.py` part 2.
- If A is also concave, every mixture (1−ε)f* + ε·conditionalization with 0 < ε < 1 also dominates, and is conservative in M&Z's sense (p. 300).

**Proof.**
1. If E ∈ 𝒟, then E(s) = p implies s ∈ int(p).
2. Regularity puts mass on rim(p), so π(·|p) lies outside the convex hull of the omniscient credences for int(p).
3. By the dominance theorem (Predd et al. 2009, which M&Z cite), some credence in that hull strictly dominates π(·|p) on int(p).
4. Let f* map p to that credence, and keep conditionalization where the rim is empty or int(p) = ∅.
5. f* depends only on p, so it is GEC.

**Checks.** Exhaustive over all (evidence, state) pairs possible on lines of 3, 4 and 5 points, with 300 random priors each: minimum gain 0 up to floating-point error under state Brier, all-subsets Brier and log, and strict whenever the rim is nonempty.

**Why it matters.**
- **It is weighting-free.** Every λ supported on 𝒟, under any interpretation (importance, likelihood or credence), ranks f* above conditionalization. N1 and N3's negative part fall out without CAR.
- **It survives both of M&Z's moves.**
  - f* is GEC, so global evidential constancy does not exclude it.
  - The dominance holds in every situation in 𝒟 at once, so the agent's uncertainty about which situation she is in cannot rescue conditionalization.
  - M&Z say "There is no rule that rules them all" (p. 327). On 𝒟 there is a single rule that beats conditionalization in every problem, though it is not the optimum in each.
- **It locates the escape exactly.**
  - Fact 7 (p. 324) is proved through the transparent problems "learn whether p". In those problems p is learned at its rim.
  - The pretest's decomposition makes the same point: for GEC rules, TEA ∝ ½ Σ_p EA(f; {p, ¬p}) + EA(f; trivial). This decomposition is not unique; uniform weighting over opaque situations alone is also CAR. The invariant is that every vindicating weighting puts weight on learning p at its edge.

**Antecedents to check before claiming novelty.**
- **Das 2022.** Conditionalizing plans in a known non-partitional inquiry are exploitable. This is the pragmatic analogue for a single inquiry with a non-GEC dominating plan.
- **Dorst 2020** (diss. ch. 2, p. 58). Effacing Evidence: in natural clock models a constant credence in *one* proposition dominates the rational credence in it.
- **Schoenfield 2017.**
- **Nielsen 2021**, "Accuracy-dominance and conditionalization" (Phil Studies); not read.
- **Bronfman 2014**; not read.

The new elements are that the dominating rule is GEC and that the dominance is uniform over every two-sided learning situation.

---

## The best thesis and framing

**Choose neither T-narrow nor T-broad as written.**
- **T-narrow** is right about the dilemma, but its first horn depends on weightings, which is ground M&Z call bedrock, and the paper reads as a reply.
- **T-broad** has the right ambition (a problem paper), but rests on two overclaims: "safe evidence is never random" and "one source".

**Proposal: a problem paper built on N5.**

> **Problem.** Accuracy-first epistemology's flagship arguments are dominance arguments: Joyce for probabilism, Briggs & Pettigrew for conditionalization. Williamson's inexact knowers learn with margins for error. Can accuracy vindicate conditionalizing on what they know?
>
> **Answer.** No, and the failure is a dominance failure. For such agents, conditionalization is beaten everywhere by an evidence-only rule that discounts the edges of what is learned. Every accuracy vindication on offer gets conditionalization back only by counting learning in which the truth sits at the edge of what is learned. This covers M&Z's total expected accuracy, Carr 2021's uniform ⟨world, evidence⟩ prior, and the uniform-error clocks of Isaacs & Russell and Easwaran & Nielsen. Such learning is what truth-centred margins forbid, and it is what guess-centred models allow. So the externalist must give up one of three things: the accuracy explanation, truth-centred margins, or conditionalization.

**One-sentence contribution a screener should be able to state:**

> *If every way an agent has of learning about a magnitude carries a two-sided margin for error, then conditionalizing on what she learns is accuracy-dominated by a rule that responds only to what she learns, so Meehan and Zhang's "Bayes is back" holds only for evaluations that count learning which is exact at the edge of what is learned, not for the inexact knowers whose opacity motivated it.*

Plain-language version for the introduction: *knowing that you cannot tell neighbouring cases apart is information about where in what you know the truth lies; conditionalization throws that information away, and it pays for this at every possibility you leave open.*

**Generalist hook.** Use Monty Hall. M&Z quote Pearl: "we must also consider what information could have been reported" (fn 21, p. 311). Gill & Grünwald 2008 (p. 2410) say CAR "precisely characterizes when one can ignore the distinction between the fact that an event has been observed, and the fact that an event has happened". The paper's claim is that inexact knowledge is never such a case.

**Position relative to the nearest work (say this in §1):**
- The likelihood/CAR reading of M&Z is Easwaran's comment, and E&N p. 1120 state it in all but name.
- The truth-centred vs guess-centred contrast is Salow 2018, made there for exploitability.
- The single-inquiry dominance analogue is Das 2022 (pragmatic) and Schoenfield 2017 (expected accuracy).
- **New:** the GEC-respecting dominance uniform over all two-sided learning; the diagnosis that every vindicating evaluation, M&Z's included, must weight learning at the edge; and the resulting trilemma.

**Suggested title:** "Bayes at the Edge" or "Conditionalization at the Margin". Avoid "Safe Evidence Is Never Random".

---

## Meehan & Zhang's strongest response, and whether it can be answered

**Their best reply, in their voice:**

> "Grant the dominance result; it is a special case of our Fact 8 and the 'mimic' remark (p. 327), uniformized over a restricted domain. Rules are shared by all agents with a prior space (S, π). Hi-TEA is 'part of an objective measure of how accurate the updating rule is in general for any agent, irrespective of their uncertainties about their evidential situations' (fn 35, p. 330).
>
> Your f* is GEC, but it is tuned to one discrimination structure. It is catastrophic for agents whose methods are exact at an edge, like our Dana's left hand, which 'can tell … whether or not it weighs 17 oz.' (p. 320). There f*({15,16}) = δ15 at 16 oz, which scores −∞ under log. Under impartial weighting the edge-discounting rule loses badly (−1.60 vs −0.68 Brier). Conditionalization is the unique rule that sacrifices no class of learners to another (Facts 7 and 10).
>
> Knowledge of one's own margins is knowledge about E, not about S. Noncontrastiveness says it should not matter (fn 22, p. 312). And our two-level picture already allows 'low-level' rationality, sensitive to 'individual psychological dispositions', to diverge (p. 338). Bayes is the high-level rule; the externalist Bayesian 'has a leg to stand on' (p. 334)."

**Can the paper answer it in about 1,400 words?** Mostly yes. The answer should concede the population-level reading rather than try to refute it.

1. **Importance vs likelihood is now moot.** Dominance holds for every weighting on 𝒟. The live question is the domain of evaluation. In every dominance argument the domain is the agent's epistemic possibilities (Joyce; Pettigrew 2016; Das 2022 fn 20 says this explicitly for evidence-relative dominance). An agent who knows that she cannot discriminate neighbouring values leaves no edge-exact learning open.
2. **Grant GEC entirely.** f* satisfies evidential constancy and noncontrastiveness, and therefore idempotence, so M&Z's §4 arguments do not touch it. What does the work is M&Z's choice to evaluate GEC rules over a domain that ignores what the agent knows about her own discrimination. Fine-graining S does not help, because Hi-TEA still sums over all factive E on the finer space.
3. **The "impartiality" reading concedes the thesis.**
   - On it, conditionalization is the best *compromise* among learners with different capacities. For any learner who knows that her margins are two-sided, the compromise costs her accuracy at every possibility she leaves open: a sure cost, not an expected one.
   - M&Z's own analogy is rule consequentialism (jaywalking, fn 37). That analogy needs a reason for the individual to bear sure costs for the sake of others: coordination, publicity or followability. M&Z have disowned followability (§4.3, fn 24), and the others have no grip on a single idealized planner.
   - The −∞ point is symmetric. f* is a disaster for edge-exact learners; conditionalization is surely worse for two-sided ones.
4. **The two-level reply is the conclusion, not an objection to it.** High-level Bayesianism is then the rationality of learners whose knowledge lacks truth-centred margins, which is to say not of Olivia, Dana's right hand or the clock. Those are the cases M&Z use (p. 294) to motivate externalism. M&Z say "one does not have to be an internalist to subscribe to extensionality; the principle is compatible with evidence externalism as well" (p. 338). That is true for externalism in general, but not for the margin-based externalism M&Z invoke.
5. **The "absurdity" objection.** f* says to be certain you are not at the edge of what you know. A&S call the exact version implausible (p. 6). The paper should *agree that this is a reason to doubt truth-centred models* (Salow's route). That is one horn of the trilemma, not a rescue of conditionalization for truth-centred knowers.
6. **Uncertain margins.**
   - If the agent knows only that her margin is at least one step, f* uses the immediate-neighbour interior, which gives a milder rule.
   - If she gives some credence to edge-exact methods, dominance fails. Expected superiority of a conservative mixture then survives unless her weights are exactly CAR, which is a knife-edge.
   - Say this in the main text, not in a footnote.

**What remains.** M&Z can bite the bullet and say that Bayes is a population-level norm. The paper cannot dislodge that; it should present it as what "Bayes is back" amounts to. A hostile screener could call this "M&Z's bedrock again". The defence is that the dispute has been moved from an unmotivated choice of weights to a principled question about the domain of evaluation. That principle, evaluation over the agent's epistemic possibilities, is one accuracy-firsters already accept.

---

## Structure

Total ≤ 5,800 words including notes; references excluded.

| § | Content | Words |
|---|---|---|
| 1. Introduction | The problem (accuracy-first's dominance arguments vs Williamson's inexact knowledge; Schoenfield); M&Z's rescue in two sentences; thesis; trilemma; one paragraph locating the paper (Easwaran/E&N, Salow 2018, Das 2022, Dorst 2020) | 600 |
| 2. Inexact knowledge and its edges | M&Z's framework in brief (prior space, factive E, GEC rules as functions of p, Fact 5); the margin principle (Williamson 2000 ch. 5; 2014 pp. 979–80); rim and interior; "known only in its interior"; truth-centred vs guess-centred (Stalnaker 2009, Cohen & Comesaña 2013, Salow 2018, Goodman & Salow 2023, Weatherson 2013); Olivia and Dana | 700 |
| 3. Conditionalization is dominated | The proposition and its proof; log and Brier forms (with the counterexample showing π(·\|int p) is not Brier-dominant); conservative mixtures; Dana, Olivia and the clock; corollary for every weighting on 𝒟; contrast with Briggs–Pettigrew 2020, Das 2022, Dorst 2020 | 950 |
| 4. How Bayes comes back: learning at the edge | Lemma 1 as likelihood reweighting; extensionality = CAR (Heitjan & Rubin; GH Thm 3.1; E&N p. 1120; Easwaran); the counting measure is CAR by symmetry; the TEA decomposition into "learn whether p" problems; CAR at a rim state needs edge-exact learning, illustrated by the one-sided-gauge mixture, plus the knife-edge; Carr 2021, I&R and E&N's uniform clocks are all edge-allowing; one correctly scoped paragraph on CAR and the anomalies (with the symmetric-clock point) | 900 |
| 5. Whose accuracy? | M&Z's best reply (above) and answers 1–6; Dana's left hand treated head-on | 1,450 |
| 6. Conclusion: the trilemma | (i) keep conditionalization and margins, give up the accuracy explanation (Williamson 2000; Das 2022); (ii) keep accuracy and conditionalization, give up truth-centred margins (guess-centred models, on which the opacity M&Z address largely disappears); (iii) keep accuracy and margins, give up conditionalization for edge-discounting updates (Gallow 2021; Isaacs & Russell 2023; E&N 2025) | 400 |
| Notes | Permutation lemma; the 1/4 and 4^(−m) shares; the fallibility knife-edge (uniform non-factive weighting → dogmatism; Pettigrew's post); maximin (one sentence); the clash over "extensional" (Gallow's accuracy measures vs M&Z's weightings); Medina 2023; the λ-optimal interior rule (N3) numbers | 600 |
| **Total** | | **5,600** |

**Leave out:** the 1/3 statistic in the main text; "safe" language; "one source"; any claim that a weighting including Dana's own situation must fail CAR.

---

## Must read / must cite

### Not yet read, or read only in draft: read before drafting

- **Bronfman 2014**, *Erkenntnis* 79: 871–92.
  - Priority on rules that use one's knowledge of one's own limits.
  - The opaque Monty Hall case (M&Z fn 21).
  - Whether he proposes a replacement for conditionalization.
- **Salow, "Gnosticism and inexact knowledge"** (*PPR*, forthcoming; DOI 10.1111/phpr.70171). On margin models; may already discuss M&Z.
- **Dorst 2020**, "Evidence: a guide for the uncertain", *PPR* 100(3). Published version of Effacing Evidence and its dominance claim; the dissertation chapter is the only text read so far. It is the closest dominance antecedent.
- **Nielsen 2021**, "Accuracy-dominance and conditionalization" (*Phil Studies*). Check that it does not already cover the non-partitional case.
- **Predd et al. 2009** (*IEEE Trans. Inf. Theory* 55: 4786–92). The dominance theorem N5 relies on. Check the exact hypotheses (additivity, continuity) and state N5 to match. Alternatively give a minimax proof for concave scores.
- **Briggs & Pettigrew 2020** (*Noûs* 54: 162–81). The dominance argument for conditionalization that N5 inverts; the paper must state precisely what changes.
- **Published versions of Gallow 2021, Isaacs & Russell 2023 and Carr 2021.** For page numbers and exact statements (only drafts or WebFetch extracts have been seen): Gallow's Prop. 1 and rule name; I&R Thms 3–4 and the uniform clock; Carr §6.1.
- **Konek 2023** (*OSE* 7). Likelihood-weighted updating from accuracy, as E&N report.
- **Stalnaker 2009** (*Mind* 118: 399–409); **Cohen & Comesaña 2013** and **Williamson 2013** with his "Response" (*Inquiry* 56: 1–14, 15–29, 77–96). For the guess-centred horn, stated fairly.
- **Pettigrew's forthcoming book** on the value of information. He says it will discuss M&Z and E&N. It is a scoop risk for the CAR reading only, not for N5.

### Already read: cite, with these purposes

- **M&Z 2025:**
  - Facts 5, 7, 8, 9, 10, 11, 12 and Lemmas 1–2 (pp. 316, 324–5, 329–30, 337–8, 344–5);
  - p. 294 (Olivia, the margin motivation); fn 4 (evidence = knowledge); fn 21 (Pearl);
  - pp. 320–3 (left-hand Dana; idempotence); fn 22;
  - p. 327 ("no rule that rules them all"); fn 35; fn 37; pp. 337–8 (bedrock, two levels, p. 338's compatibility claim).
- **Schoenfield 2017; Greaves & Wallace 2006; Good 1967.** Background results.
- **Williamson 2000 (ch. 5), 2014 (pp. 979–80).** The margin principle; "R(w) is known only at w".
- **Salow 2018 (draft pp. 20–24).** Truth-centred vs guess-centred; nearest conceptual antecedent.
- **Ahmed & Salow 2019 (draft pp. 5–8).** The "only case" inference and its implausibility; Cr*; the partitionality diagnosis of Good's theorem.
- **Das 2022; Das 2023; Geanakoplos 1989.** Exploitability and bias under non-partitional evidence; the deterministic version of the CAR point.
- **Easwaran & Nielsen 2025** (§4.4–4.5, p. 1120; §5.3, p. 1129). Likelihood-weighted optimum; CAR in words; uniform vs cosine dials.
- **Easwaran's comment and Pettigrew's post** (20 Dec 2025). The "equally likely" and "random true proposition" readings; the factivity limitation.
- **Heitjan & Rubin 1991** (definition only); **Gill, van der Laan & Robins 1997**; **Grünwald & Halpern 2003** (Thm 3.1, Prop. 4.1, §4.3–4.4); **Gill & Grünwald 2008** (p. 2410 quote; uniform multicovers).
- **Goodman & Salow 2023; Weatherson 2013.** Measurement and appearance-centred models of inexact knowledge.
- **Joyce 1998; Pettigrew 2016.** The dominance framework and the domain of evaluation.
- **Hooker 2000.** Rule consequentialism, for answer 3.
- **Optional:** Medina 2023; Schultheis 2025; Hild 1998; Elga 2013; Halpern, *Reasoning about Uncertainty* (naive vs sophisticated conditioning).

That comes to well over 25 items, which covers Criterion 6. Run the Crossref check before calling the draft final.

---

## Screening forecast

For a well-executed version of the structure above:

| Verdict | Probability |
|---|---|
| NOT READY | 0.35 |
| PASS | 0.05 |
| PASS, FORMAL | 0.53 |
| STRONG | 0.07 |

**Reasons.**
- **For passing.**
  - There is a nameable positive thesis with a formal core: dominance under two-sided margins.
  - It directly defeats the explicit claim on p. 338 for the motivating cases.
  - It meets the obvious replies on their own terms: it grants GEC, it is weighting-free, and it deals with the left-hand case.
  - The question (does accuracy-first epistemology support conditionalization for inexact knowers?) is broad enough to appeal outside formal epistemology. Monty Hall and Williamson's margins are a good hook.
  - Because the central argument is formal, a passing verdict will usually be PASS, FORMAL rather than plain PASS.
- **For NOT READY.**
  - The theorem is elementary once stated; the dominance step is Predd et al.
  - The CAR material is anticipated (Easwaran; E&N).
  - The dialectic ends with M&Z free to bite a population-level bullet. A hostile screener can call that their conceded bedrock and the paper a reply to one article (Criteria 1–2).
  - Dorst 2020 or Nielsen 2021 may turn out to contain more of N5 than I expect.
- **STRONG is unlikely,** for the same reasons.
- **Two independent screenings.** I put the chance that two independent screenings of the final text both avoid NOT READY at about 0.45.

**For comparison.**
- Memo v2's T-broad, drafted as written (with "one source" and "safe evidence is never random"): NOT READY ≈ 0.65. The overclaims are checkable, and the symmetric clock refutes one of them.
- T-narrow as a straight reply: NOT READY ≈ 0.6.

**What would move the forecast up.**
- Confirming that N5 is new after reading Dorst 2020, Nielsen 2021 and Bronfman 2014.
- Keeping M&Z to the role of occasion rather than subject in §§1–2.
