# Memo 1 check (Tester A)

Checked against my Phase 1 (slate-prediction-A.md: N1–N5, near-misses 6–9, traps T1–T5, surprising theses U1–U3), econ-report §§1–11 and philosophy-report §§0–2.

**Marks.**
- **P**: predicted in my Phase 1, or stated in the reports.
- **D**: derivable from the reports within an hour.
- **N**: not predictable.
- **EXPECTED**: a formal epistemologist would recognise it as known, even if my list missed it.

---

## (a) Predictability of each claim

| Item | Mark | Basis |
|---|---|---|
| **1a.** Protecting every honest learner over a class protects its convex hull | **D** | A one-line integration. The econ report already has the de Finetti instance: Sandroni–Shmaya on the exchangeable class, which is conv(iid) (§4.6), and O&S 2011 fn. 10 ("closed convex class"). It is a neat lemma, but small. |
| **1b.** With bounded data, only non-convex ("sharp") classes resist manipulation | **P** | My U3 (convexity is load-bearing; non-convex families restore finite-data testability) plus T1. |
| **1c.** Coarse expertise and learning from the record are indistinguishable from ignorance | **D** | Follows from 1a together with MOR Prop. 1. |
| **2.** A Bayesian evaluator certifies information, and does so best when she knows least | **P** | My U1, nearly verbatim (Stewart's ε; AW Thm 2). |
| **3a.** 1/w mixture bound | **D** | The standard aggregating/mixture bound. Prediction-with-expert-advice material is in the philosophy report (Herrmann 2022). |
| **3b.** Ville: by her lights, probability ≤ 1/c that the other ever beats her by a factor c | **D** | Philosophy report §(c), Royall's universal bound "is a Ville/martingale inequality". |
| **3b′.** Stewart: lasting outperformance by anyone without her information has probability 0 by her lights | **D** | Econ §5.1, Stewart Prop. 1(ii). |
| **3 as a thesis.** No evaluator can certify that someone judges better than she does | **N relative to my list, but EXPECTED** | It is Dawid 1982 and Seidenfeld 1985 (econ §2.1–2.3: "each coherent forecaster is (almost) sure of his own long-run calibration"), generalized from calibration to likelihood. It is also Lewis 1971 immodesty and Elga 2007. The memo's own Risks section anticipates this. |
| **3, escape routes** (awareness growth, higher-order evidence) | N, but standard | |
| **4.** KL/martingale comparison; AW Thm 1; calibeating parasitism; AW Thm 7 | **P** | Philosophy report §(c), plus my T2, T3 and T5, including the parasitism caveat. |
| **Thesis.** The information/judgment (Hall database/analyst) line *is* the certifiable/uncertifiable line | **N** | Hall is not in either report. This is the memo's real novelty. |
| **Thesis.** Knowing the chances is analyst expertise, hence uncertifiable | **N** | Also false; see (b). |
| **Upshot.** Charmides 170e–171c | N | A good hook. |
| **Upshot.** Levy is right about judgment and wrong about information; his reason is reversed | **P** | My U1, and my S2 critique (2.8). |
| **Upshot.** Tournaments are the only route to recognising judgment; superforecasters | **P** (N1; philosophy report §(e)) | Overstated; see (c). |
| **Upshot.** Hall, the Principal Principle, deference | N | Inherits the conflation in (b). |
| **Upshot.** AI over public data are judgment experts, rankable but not certifiable against us | P (N5), plus an N classification | The classification is doubtful; see (c). |

**Tally.**
- Formal content (claims 1–4): entirely P or D.
- What is unpredicted is the *frame*: Hall's line, the first-person reading of claim 3, Charmides, and the Principal Principle.

---

## (b) Is each formal claim true as stated?

### Claim 1: TRUE in its core, with three corrections

**The lemma is correct.**
- An honest learner with prior π over C announces P_π = ∫Q dπ.
- Suppose Q(T(·,P_π) passes) ≥ 1−ε for every Q ∈ C and every π.
- Integrating over π gives P_π(T(·,P_π) passes) ≥ 1−ε.
- So type-I is controlled over the set of barycentres, which is the closed convex hull if C is compact and π ranges over Borel priors. It needs the measurability of Q ↦ Q(pass P_π), which is routine.
- MOR Prop. 1 then applies.
- Protecting *knowers* alone, the Dirac priors, does not convexify. It is protecting *learners* that does. This is the one genuinely nice small lemma in the memo.

**Correction (i).** MOR Prop. 1 needs Λ convex *and compact*. So the contrapositive is "only by protecting a non-convex *or non-compact* class".

**Correction (ii).** It holds only against computationally unbounded charlatans. Fortnow–Vohra give a finite, prior-free test with type-I control over all of Δ(Ω), a convex compact class, that no efficient charlatan passes. So "prior-free, finite data: only sharp foreknowledge" needs "for unbounded charlatans".

**Correction (iii).**
- The citation is wrong. MOR Prop. 2 is a likelihood-ratio test against the coin flip, over theories whose forecasts are on average far from ½. It is not a "frequency-band test for announced i.i.d. biases". The band test is fine and elementary, but it is the memo's own example.
- MOR's manipulation guarantee is "for every DGP in Λ", in probability, not pathwise unless Λ = Δ(Ω).
- Note too that the charlatan's ζ lives on conv(C). The charlatan needs to know C, and he does, because the test encodes it. So "indistinguishable from ignorance" should read: *indistinguishable from someone who knows only what the test already builds in*.

### Claim 2: TRUE, with qualifications

- "Any forecaster without that knowledge passes with probability 0" holds for strategies that use nothing beyond the evaluator's prior and the public history. Stewart's false expert knows µ, not P.
  - A *partially* informed forecaster is outside both of Stewart's cases and may pass.
  - That fits "certifies information", but then the claim is "some information", not "knows the process".
- Stewart's result is infinite-horizon (a liminf, plus divergence of Σ(p−p̄)²). A finite-data Bayesian version exists via Ville, at level 1/c, but the memo does not state it.
- What passes is information **correctly processed**: the true expert reports P exactly. An informed but miscalibrated forecaster can have a likelihood ratio below 1 against p̄. So the test certifies information *plus* judgment, not information alone.

### Claim 3: the bounds are TRUE; the conclusions drawn from them are not

**(a) The 1/w bound.**
- True on every finite sequence when the other's method is an *atom* of weight w in her prior. P̄(h) ≥ wQ(h), so Q(h)/P̄(h) ≤ 1/w.
- The gloss "the record can never show the other to be much better" is **false** in two cases:
  - w is small: 1/w = 10⁹ is "much better".
  - Her prior is non-atomic, which is the usual case (e.g. Laplace): the other's rule then has weight 0 and there is no 1/w bound. Against a point-mass rule log-LR grows like (d/2) log t, so it is unbounded.
- What (a) actually shows is that recognition is absorption: her posterior on Q rises and she comes to forecast like Q. She *can* recognise *retrospectively* that the other judged better than she did. She cannot expect the other to keep judging better than she now does.
- "Never certify that someone judges better than she does" therefore trades on a present-tense reading: once certified, the other's judgment is hers.

**(b) Ville.**
- True by her lights for any forecaster whose forecasts depend only on the public history plus independent randomization.
- It holds in case (a) too, so the "either/or" is not a dichotomy: the second disjunct always holds.

**(b′) Stewart Prop. 1(ii) applied to a different-prior forecaster.**
- True: (ii) quantifies over every strategy σ not using P, and a different-prior forecaster is a pure σ.
- But it is **µ-probability** 0, not probability 0. The memo's own claim 2 shows the gap.
- *Counterexample.*
  - The evaluator's prior is uniform over iid(q).
  - Forecaster B, with the same evidence, has the prior ½·(uniform over iid) + ½·(uniform over 2-state Markov chains).
  - The truth is a Markov chain with p(1|0) = .9 and p(1|1) = .1.
  - Under the truth, B's predictive merges and the evaluator's does not. B's log-LR grows linearly and Σ(q−p̄)² diverges. **B passes the very Stewart test that claim 2 uses to certify information**, with probability 1 under the truth.
  - B has no information, only a better prior.
- By Stewart's Cor. 1 (and Belot 2013), failure to merge is the *topologically typical* case. So the paths on which better judgment shows up are null by her lights but typical in the topological sense.
- **Claim 3 is the evaluator's orgulity restated, not a limit on what records show.** It belongs in the orgulity literature (Belot; Elga 2016), and the memo does not cite that literature for it.

**The consistency problem across claims 2–4.**
- Claim 3 is evaluated "by her lights" (µ). Claims 2 and 4 are evaluated "under the truth".
- Apply one standard throughout and the asymmetry disappears:
  - **Under the truth:** claim 4's KL argument works just as well with the evaluator as one of the two competitors. Stewart's test passes a better-prior B whenever the world defeats the evaluator's prior. So records *do* certify better judgment in the first person.
  - **By her lights:** she can't expect to be beaten (immodesty). Her "certification" that A judges better than B amounts to A being closer to her own updated predictive, which is not recognition of superior judgment either.
- So "judgment is certifiable only between two others" is an artifact of switching standards.

### Claim 4: TRUE under regularity conditions

- "Picks the KL-closer forecaster with probability → 1" needs three things: the cumulative per-period KL gap → ∞, the martingale part controlled (e.g. forecasts bounded away from 0 and 1, or the gap growing faster than √t), and non-strategic fixed rules.
- The AW Thm 1 and Thm 7 statements are correct.
- The calibeating caveat is correct, and it needs *current*-forecast visibility.

### Thesis sentence: FALSE

The memo says: "Knowing the chances — analyst expertise par excellence — is exactly what no record can certify." This contradicts claim 2: Stewart's true expert *knows the true process* and passes with probability 1−ε.

The identification with Hall conflates two things:
- **The chance function.** It is (per Hall) an analyst relative to history.
- **A forecaster who knows it.** She knows *which* chance function obtains (the laws or parameters), and that is information the evaluator lacks, so she is a database expert relative to her.

Relative to an evaluator who already knows the chance function, there is nothing to certify. Prior-free uncertifiability (claim 1, Sandroni and others) comes from prior-freeness, not from analyst-hood. The abstract's last sentence inherits the error.

---

## (c) Is information versus judgment the right cut?

No. The mathematics draws a different line.

- **What a record certifies is lasting outperformance of a baseline the evaluator commits to:** her predictive (Stewart), a rival (AW/FS), or a non-convex class (claim 1).
- **Records cannot certify *what kind* of superiority produced it.** A coherent evaluator is *forced* to read any outperformance of herself as information, because by her lights a same-evidence agent outperforms her only on a null set.
- So the information/judgment distinction sits in the evaluator's *attribution*, not in the record's *certifying power*.

Each counterexample breaks the cut as stated.

1. **A logically non-omniscient evaluator.** The memo concedes this, but the concession swallows the category.
   - Hall's analyst is "particularly good at evaluating the relevance of one proposition to another". That is logical skill, and for any real evaluator logical skill is information about what her evidence supports.
   - *Example.* An evaluator who can't compute her own predictive forecasts 0.5. A same-evidence forecaster computes it. If the evaluator gives the forecaster's outputs positive credence of tracking the computation, the record certifies her exactly as it certifies database expertise.
   - So for real evaluators "judgment" collapses into (logical) information, which *is* certifiable.
   - What remains uncertifiable is "a better prior" among logically omniscient agents. Under uniqueness that is not a kind of expertise. Under permissivism, "better" means only "luckier with respect to the actual world". Claim 3 then reduces to immodesty.
2. **A forecaster with private information who also judges better.**
   - She passes Stewart's test. The evaluator attributes the whole margin to information; she cannot apportion it.
   - Conversely, a *purely* better-prior forecaster in a world that defeats the evaluator's prior also passes (the Markov example) and would be "certified as informed".
   - So the Stewart test is a test of "beats my predictive", not a test of information. Its "information" reading is only by her lights.
3. **An informed forecaster with poor judgment.** Information that is miscalibrated or badly aggregated can fail Stewart's test and be calibeaten. "Knowing more" is certified only when it comes bundled with judging well. The two kinds are not separately certifiable in either direction.
4. **Superforecasters and AI.** Both gather information (search, retrieval) and have computational skill, which is logical information. Classifying them as pure "judgment experts" is doubtful.
   - Against "we can't certify them against us": under the truth, a head-to-head likelihood comparison between a model and *our* forecasts works exactly as claim 4 says. ForecastBench already scores humans and models on the same questions.

---

## (d) Verdict

**The formal core is EXPECTED. The new frame is not true as stated. It is not yet new and important.**

Credit where due:
- The memo is a better organising idea than slate S2–S4.
- The lemma in claim 1 (protecting learners convexifies) is a clean small contribution.
- Charmides is a good hook.

Problems:
1. **The distinctive claim (3) is Dawid–Seidenfeld self-calibration and Lewis immodesty, extended from calibration to likelihood.** A formal epistemologist will say so, and the econ report quotes the precedent (§2.3). Seidenfeld's line, that each coherent forecaster is "(almost) sure of his own long-run calibration", is the antecedent.
2. **The headline line is not drawn by the mathematics.**
   - Its punchline (knowing the chances is uncertifiable) contradicts claim 2.
   - The first/third-person asymmetry comes from switching between "by her lights" and "under the truth".
   - The judgment category collapses into logical information for any non-ideal evaluator.

**A version that might be new and important** (my suggestion; to be checked).
- *Thesis.* Records certify outperformance of a committed baseline. A conditionalizing, σ-additive evaluator must interpret every certified outperformance of herself as superior information. Better judgment becomes visible only on paths her prior deems impossible, and by Belot and Stewart Cor. 1 those paths are topologically typical. **Orgulity hides better judgment.**
- This turns slate S4 on its head: the expert's orgulity aids testability (PAS), while the evaluator's orgulity blinds her to better judgment.
- It suggests a pairing: *modest evaluators, orgulous experts*.
- **CHECK** whether finitely additive evaluators escape Ville (finitely additive martingales lack the maximal inequality), and so can assign positive probability to lasting outperformance and learn it from the record. Until that is proved, this is a lead, not a thesis.
