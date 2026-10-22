# Memo 1 check (tester B): "Knowing More and Judging Better"

**What this check is based on.**
- Read: `idea-memo-v1.md`. Compared against my Phase 1 (`slate-prediction-B.md`) and the econ report.
- Checked in the saved texts: Stewart 2011 (§§3–4, Prop. 1 and the false-expert assumptions); O&S 2009 MOR (§§1, 3–4.1); PANS 2014 (§§1, 4); AW 2008 (Thm 7); Foster–Hart 2023 (Thm 3).
- The probability arguments under (b) are my own checks.

**Bottom line.**
- The formal content is mostly credited results plus standard facts: propriety/immodesty, Ville, the Bayesian mixture bound, consistency of the likelihood ratio.
- Three of the four claims were in my Phase 1.
- The one new element, the line between information and judgment taken from Hall, is the part that fails. It is internally inconsistent about "knowing the chances". It does not survive non-ideal evaluators. And the record does not draw it: the line the mathematics draws is prior-relative learnability, plus first person versus third person.
- Verdict: **EXPECTED as to content; the new framing is not correct as stated.**

---

## (a) P / D / N against my Phase 1

Key: **P** = predicted in my Phase 1; **D** = derivable within an hour from the reports; **N** = not predictable.

| Item | Label | Where it was in my Phase 1, or why not |
|---|---|---|
| Claim 1: prior-free, finite data, only sharp foreknowledge | **P** | My "most surprising thesis", nearly verbatim. The added step "protecting honest learners means protecting the convex hull" is D. |
| Claim 2: a Bayesian evaluator certifies information | **P** | Near miss #7 ("No Priors, No Experts": a likelihood ratio against her own predictive is a mean-one martingale under her prior). Also #1: the own-prior route certifies only value added. |
| Claim 2's twist, "best when she knows least" | **D** | Immediate from Stewart's ε. Econ report §11.2: the test "fails a true expert whenever the tester would have learned the truth quickly herself". |
| Claim 3(a): the 1/w mixture bound | **D** | Standard bound for Bayesian mixtures and aggregation. Not in my Phase 1. |
| Claim 3(b): Ville; Stewart applied to a forecaster with a different prior | **P** | #7 states the Ville bound. |
| Claim 3 as a thesis: "no first-person certification of better judgment" | **D** | The memo itself flags it as Lewis's immodesty. |
| Claim 4: the likelihood ratio picks the forecaster closer in KL; AW Thm 1; calibeating and AW Thm 7 as caveats | **P** | #3 ("Expertise Is Contrastive"). The caveats come from my Phase 2 critique of S2. |
| Upshot: Charmides gets two answers; "a non-doctor is better placed than a doctor" | **D** (the Charmides framing is N) | The reversal is from Stewart's ε, and it is an artefact (see c). |
| Upshot: the novice/expert problem splits; Levy is right about judgment and wrong about information | **D** | #1 had the Levy convergence; the split is new framing. |
| Upshot: tournaments are the only route to recognising judgment | **P** | #1, #3, #5. |
| Upshot: Hall's two kinds of expert; the Principal Principle's expert (chance) is uncertifiable | **N** | Contradicts claim 2 (see b, c). |
| Upshot: AI forecasters are judgment experts; benchmarks can rank them but not certify them | **P** for "rank, not certify" (#5); **N** for the "judgment expert" label | The label is doubtful (see c). |

The memo's preamble understates how predictable this is. It says tester B produced only "only sharp knowledge is certifiable". In fact my Phase 1 contains claims 1, 2 and 4, and the Ville half of claim 3. What I did not predict is the first-person impossibility for judgment and the Hall framing.

---

## (b) Is each formal claim true as stated?

### Claim 1

1. **"Protects every honest learner (any prior, any truth in the class) ⇒ protects the convex hull": TRUE.**
   - For a learner with prior π, her predictive is Q_π = ∫P dπ, and Q_π(T(Q_π) passes) = ∫ P(T(Q_π) passes) dπ(P) ≥ 1 − ε.
   - Even the weaker subjective requirement suffices: each learner expects, by her own lights, to pass (PANS's reading of type I).
   - For a compact class M, the predictives of all Borel priors make up the closed convex hull, which is compact. If M is not compact, MOR Prop 1 does not directly apply.
2. **"… so with bounded data it is manipulable (MOR Prop 1)": TRUE, but the citation is idle as worded.**
   - If the test must pass every honest learner *under every truth in M*, a forecaster with no information passes it trivially by being an honest learner. He needs no randomization and no minimax argument.
   - MOR Prop 1 does real work only under the subjective formulation (each learner expects to pass). There it delivers a randomization over the hull that passes against every truth in the hull.
   - Rewrite the claim with that formulation.
3. **"Tests can resist manipulation with bounded data only by protecting a non-convex class": TRUE, with two qualifications.**
   - It needs compactness, and it needs a computationally unbounded charlatan.
   - Fortnow–Vohra give a finite test that protects all of Δ(Ω) and cannot be manipulated by bounded charlatans.
   - The scope is a lone forecaster.
4. **Attribution.** The frequency-band test for announced i.i.d. biases is my own example, not MOR Prop 2. MOR Prop 2 is the likelihood test against the coin flip over the paradigm "forecasts far from ½". MOR §4.1's two-theory paradigm is the simplest case. Credit them separately.
5. **"Coarse expertise and the capacity to learn from the record are indistinguishable from ignorance": overstated.**
   - It should read: "cannot be certified by any prior-free, bounded-data test of a lone forecaster against an unbounded charlatan".
   - The "capacity to learn" half is close to a tautology. Relative to M, a learner over M *is* a know-nothing with a prior.
   - The interesting question, whether good learners can be told from bad ones, belongs to claims 3 and 4.

### Claim 2

1. **The quotation of Stewart Prop 1 is accurate.** The true expert passes with µ-probability 1 − ε, where ε = Pr_µ[Σ_t (p_t − p̄_t)² < ∞]. Any false-expert strategy σ passes with (µ, σ)-probability 0.
2. **"Any forecaster without that knowledge passes with probability 0": FALSE as worded, TRUE for forecasters with no information beyond the history.**
   - Stewart's false experts "know only the tester's prior µ and may choose their forecasts according to any mixed strategy". Each P ∈ Δ(Ω) is a pure strategy, so a forecaster with a different prior is covered.
   - A *partially* informed forecaster (some information about P, not all of it) can pass, provided his information is not something the tester would learn quickly.
   - That actually suits the memo's thesis, but the wording should be "without information beyond the shared history".
3. **"By her lights" is essential.**
   - Stewart's robustness result (Prop 2: true experts fail only on a category-I set of P) covers only the true-expert side.
   - On the charlatan side the guarantee is µ-probability only. If her prior is wrong, a forecaster with no information but a better prior can pass under the truth.
4. **"Best when she knows least" conflates a diffuse evaluator with a mistaken one.**
   - ε is small when she does not expect to learn quickly. A confident but wrong evaluator has ε ≈ 1 by her own lights.
   - Say: "the less she expects to learn on her own".
5. **Horizon.** Stewart's test is infinite-horizon (a liminf), so "probability 0" holds only in the limit. In a finite version the charlatan's passing probability is at most 1/c (by Ville), not 0.

### Claim 3

1. **(a) The 1/w bound: TRUE on every finite history, under two conditions.**
   - The conditions: the other's method is a single forecasting measure P_k, and P_k is an *atom* of her prior with weight w. Then P̄(h) ≥ w·P_k(h), so the likelihood ratio is at most 1/w.
   - **It fails for priors with densities.** If his method is one point of a smooth prior over a d-parameter family, his likelihood ratio against her predictive can grow without bound, of order n^{d/2}. Example: a fixed-bias forecaster against Laplace's rule gains a factor of about √n on sequences typical for that bias. Those cases fall under (b). So the dichotomy should be "atom versus non-atom", not "among her hypotheses versus not".
   - **The bound does not separate judgment from information.** It holds equally for an information expert whose true P is an atom of her prior. Stewart's ε then excludes him as well, because she learns an atomic truth quickly.
   - So claims 2–3 together draw the line at *prior weight and learnability*, not at information versus judgment.
2. **(b) Ville and Stewart applied to a different-prior forecaster: TRUE, by her lights.**
   - Take any forecaster whose forecasts depend only on the history and on independent randomization. Under her predictive P̄, his likelihood ratio against p̄ is a non-negative martingale with mean 1, so P̄(sup_n LR_n ≥ c) ≤ 1/c.
   - Lasting outperformance (LR → ∞, or Stewart's two conditions) has P̄-probability 0.
3. **The step to "no evaluator can certify" is where the claim fails.**
   - Ville's inequality *is* a test: the other's likelihood ratio is a test martingale against her forecasts (Shafer–Vovk testing by betting).
   - So if she observes LR ≥ c, she rejects her own forecasting system at level 1/c. By her own lights, no strategy can fake this, a charlatan's included.
   - An evaluator who treats her own predictive as a hypothesis, in the way of Box, Gelman's posterior predictive checks or Dawid's prequential approach, is thereby shown that the other did better than her model allows.
   - That is not conditionalization, but it is the standard reading of the very inequality the memo cites. Calling it "higher-order evidence" understates it.
   - Claim 4 then lets her treat her own forecasts as one of the two compared forecasters.
4. **Net.** Claim 3 is true only as "a coherent agent cannot, by conditionalizing, come to believe that a different prior beats her". That is Lewis's immodesty, i.e. propriety, and it is EXPECTED.

### Claim 4

1. **The KL claim is TRUE only under conditions.**
   - Under the truth, log LR_n = D_n + M_n. Here D_n = Σ_t [KL(p_t‖q₂,t) − KL(p_t‖q₁,t)], and M_n is a martingale whose quadratic variation grows with Σ_t (q₁,t − q₂,t)².
   - The ratio picks the closer forecaster with probability → 1 if:
     - forecasts are bounded away from 0 and 1; and
     - D_n → ∞ faster than √⟨M⟩_n, for example with a per-period KL gap bounded below.
   - When the two are nearly equidistant from the truth but far from each other, or when the cumulative gap is finite (both merge with the truth), the ratio can stay inconclusive or pick the farther forecaster with positive probability. Compare Kavaler–Smorodinsky: an error-free test must be inconclusive with positive probability under mutual absolute continuity.
   - "Closer" must also mean cumulatively closer, not closer at each period.
2. **AW Thm 1 is stated correctly:** it picks the truthful forecaster, or the forecasts are ε-close in all but K periods.
3. **The caveats are correct.**
   - Calibeating needs the rival's current forecast and gains exactly the rival's calibration error.
   - AW Thm 7 covers two experts over a finite horizon, and AW say it does not extend to the infinite horizon without further restrictions.

---

## (c) Is Hall's database/analyst line the right cut? No. Several cases break it.

1. **The memo is internally inconsistent about knowing the chances.**
   - The thesis says knowing the chances is "exactly what no record can certify".
   - But claim 2 certifies "an expert who knows the true process". In the econ framework that *is* knowing the chances. It counts as information relative to a tester who is uncertain which process holds.
   - Al-Najjar–Weinstein's representation point decides this. The same forecasting behaviour (P's conditionals along the history) can be described as information (she observed a draw P ~ µ) or as judgment (her prior is δ_P). The record is identical either way.
   - What differs is the modal profile across the *evaluator's* possibilities: do his forecasts covary with the P she is uncertain about?
   - So the cut is evaluator-relative. For any evaluator who represents the chances as unknown, knowing them is database expertise, and it is certifiable by claim 2.
   - Hall's "chance is an analyst" concerns the conditional structure Ch(·|H_t). It does not settle how an agent uncertain over chance hypotheses should classify someone who knows which one holds.
2. **Claim 3(a) and Stewart's ε draw the line in the wrong place.** Information experts whose truth is an atom, or quickly learnable, are not certifiable either. The real line is "information she lacks and would not quickly learn" versus "everything else".
3. **Non-ideal evaluators: the memo's escape removes its applications.**
   - For a logically non-omniscient evaluator, her actual forecasts are not the predictive of any coherent prior. So Ville does not bound a better-computing forecaster's likelihood ratio against them, and superior computation is certifiable against what she actually forecasts.
   - The memo's fix is to count this as "database expertise of a logical kind". That moves every case it advertises to the information side: superforecasters, AI forecasters, the Charmides doctor.
   - Claim 3 is then left applying only to logically omniscient agents who differ in prior. There, "judges better" is contested (permissivism) or analytic (immodesty).
4. **Specific breaking cases.**
   - **A doctor recognizes a doctor.** The "non-doctor is better placed" reversal comes from Stewart's assumption that false experts know the tester's prior µ. When µ is concentrated (an informed evaluator), that assumption hands the quack the evaluator's knowledge. Drop it, and an informed evaluator certifies an informed candidate by *agreement*, the quack failing because he cannot match her. That vindicates "it takes one to know one" (Goldman's agreement source) rather than reversing it. Stewart's test certifies value added, not knowledge.
   - **The dogmatic modeller.** The evaluator uses an i.i.d. model; the other uses a Markov-chain prior; the truth is Markov. The other's likelihood ratio against her grows exponentially. By her lights that is an event of probability at most 1/c, and any statistician concludes that her model is wrong and his is better. So superior judgment *is* recognized from the record, in her own case.
   - **AI with a corpus.** LLM forecasters have database expertise in the plain sense: training data and retrieval. Calling them "judgment experts reasoning over public data" misclassifies them.
   - **Stewart's partially informed forecaster.** His case shows that what claim 2 can certify is information the evaluator would not quickly learn, including partial knowledge of the chance structure. That cuts across Hall's categories.
5. **A cut the mathematics supports:**
   - by her own lights, an evaluator can be shown only information she lacks and would not learn quickly (Stewart; Olszewski §9.1);
   - she can never, by conditionalizing, be shown that a different coherent prior is better (immodesty);
   - she *can* reject her own forecasts with the other's likelihood ratio as a test martingale, and compare herself with him as a third party (claim 4);
   - prior-free, with bounded data, only sharp foreknowledge is certifiable (claim 1).

   The operative contrast is first person, conditionalizing, versus testing and third person. It is not information versus judgment.

---

## (d) Verdict: EXPECTED

1. **The formal content is known.**
   - Claim 1 is my Phase-1 thesis, plus one trivial step.
   - Claim 2 is Stewart, glossed with Olszewski §9.1.
   - Claim 3 is Lewis's immodesty, plus Ville, plus the mixture bound. The memo itself flags this as EXPECTED.
   - Claim 4 is standard likelihood-ratio consistency plus AW.
2. **The new element fails.** The Hall-based thesis is inconsistent with claim 2 about knowing the chances. It is undercut by AW's representation-relativity. It does not apply to any non-ideal evaluator, which covers every advertised application. And its signature reversal (the least informed evaluator is best placed) is an artefact of Stewart's assumption that charlatans know the evaluator's prior.
3. **A defensible version is a solid but expected synthesis.** That version: "a record certifies to you only information you lack and would not quickly learn; it can make you reject your own forecasts, but you cannot conditionalize your way to believing that another prior beats yours; prior-free, only sharp foreknowledge". It would sit comfortably as a section of the S2-plus-sharpness paper I recommended.
4. **The one piece that might be new and useful runs against claim 3.** Using the other's likelihood ratio as a test martingale against one's *own* forecasts is a self-test that no charlatan can game, by the evaluator's own lights. It is how a novice can recognise being out-judged (D). If kept, it reverses claim 3 rather than supporting it.
