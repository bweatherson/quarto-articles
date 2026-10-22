# Advisor memo: "Borrowing Strength from Strangers" (idea memo v1)

## Verdict: (A). Do not draft this thesis.

The subject is open in philosophy. I found no paper connecting Stein's paradox to fairness or to the right to be treated as an individual. But the thesis as written would very likely be marked EXPECTED, and part of its central argument fails.

1. **Its formal pillars are already in print, one of them in a paper co-written by a probable judge.**
   - Vassend, Sober & Fitelson (2017), fn. 27, cite Brown (1975): Stein's result is "surprisingly robust across different assignments of weights". The same footnote cites Efron & Morris (1972) for "compromise estimators" that limit "the loss in accuracy at the level of individual estimates".
   - The memo's positive proposal is a named classical criterion: Hodges & Lehmann's (1952) restricted Bayes rule. Koenker & Gu (2026) explicitly link it to limited translation and to protecting "individuals".
2. **The formal core does not support the "anti-aggregative" reading.** Pareto-admissibility does not single out own-record assessment. Some pooling estimators are also Pareto-admissible and beat it in total in every state. What does the work in the memo's argument is the baseline, not a refusal to aggregate.
3. **Step 2 overstates its case and misreports a source.** The per-person ex ante case for pooling needs an exchangeable credence, and that credence treats the co-assessees as evidence about you. That puts the paper back inside the statistical-evidence debate it says it escapes. The memo also reverses Eidelson.

There is a nearby paper (§4), but its ceiling is "interesting". It must lead with a philosophical claim, not with mapping Stein onto aggregation.

---

## 1. Priority: where each "what is new" claim already is

| Memo's claim | Already in print | What is left |
|---|---|---|
| Normative reading of Brown; Stein as an aggregation result | VSF 2017 fn. 27: the global loss "implicitly places an equal weight on each of the individual estimation problems"; "Brown (1975) models this by weighting each inaccuracy term". Morris & Lysy (2012): minimaxity is achieved by "'balancing' or 'trading off' component risks". Robbins's "compound decision" framing. Romeijn's 2018 talk "Stein's paradox and group rationality" uses "aggregation" in the judgment-aggregation sense, so disambiguate. | Only "the components are persons". To Fitelson this is his footnote with persons substituted. |
| Limited translation (LT) defended as a fairness principle | Hodges & Lehmann (1952): minimise Bayes risk subject to max risk ≤ 1 + t, where 1 is the stand-alone MLE's risk. That is literally "no one bears much more risk than stand-alone". Koenker & Gu (arXiv 2603.00704, 2026) identify the Huber restricted-Bayes rule with Efron–Morris LT, prove sup R = 1 + k², and say empirical-Bayes rules "may also fail spectacularly for some subpopulations or individuals. This concern underlies the limited translation proposal". Pericchi & Pérez (arXiv 2506.10114, 2025; NEJSDS), "Limiting the Shrinkage for the Exceptional… the 'Clemente Problem'": LT is the Bayes rule under a double-exponential prior. Also Efron & Morris 1972/1975 ("protects individual components"), Bickel 1983, Berger 1982. | Only the claim that the tolerance is a moral parameter. As it stands that is a gloss. |
| Stand-alone guarantee as the content of the right | Morris & Lysy §4: hospital directors consent only if "each was assured" of improvement. The "stand-alone test" / individual rationality in cost sharing (Faulhaber 1975; Moulin 1988); the memo even uses the same term. IR in collaborative and federated mean estimation (Donahue & Kleinberg 2021–23; a NeurIPS 2023 paper on collaborative mean estimation that defines IR as doing better than working alone). Group-level "no harm" guarantees in ML fairness (Ustun, Liu & Parkes 2019; Suriyakumar, Ghassemi & Ustun 2023). Giacomini, Lee & Sarpietro: estimation that "targets individual accuracy rather than aggregate performance"; per-individual minimax regret. | Identifying the *right to be treated as an individual* with such a guarantee, and defending the standpoint. Genuinely open, but the memo has no argument for it yet. |
| Every accuracy standard favours pooling | Calibration of shrunk estimates is "forecast unbiasedness" in the value-added literature (Kane & Staiger 2008; Chetty, Friedman & Rockoff 2014); Kelley 1923 / Stigler 1990. Per-component ex ante gains are "Model-II" or "ensemble" minimaxity (Morris & Lysy; Maruyama, Brown & George 2022). "The exceptional pay" under shrinkage to a group mean: Aigner & Cain 1977, "within-group or individual discrimination is inevitable". | Applying this to Lippert-Rasmussen, Eidelson and Hedden is new, but see §2(f)–(h). |

Also checked and not antecedents: Brusseau 2025 (arXiv 2504.13790), Qian et al. 2015 (environmental compliance), Romeijn (judgment aggregation). The extracted texts of Eidelson, Moss, Hare, Voorhoeve, and Gustafsson & Kowalczyk contain no Stein material.

---

## 2. The formal claims, checked

**(a) 1(a), Pareto-admissibility: true but not distinctive.**
- Every rule that is admissible for total squared error is Pareto-admissible. If some rule were no worse for each person in each state and better for one, it would be better in total.
- Strawderman (1971): for p ≥ 5 there are proper Bayes minimax estimators. They are admissible for total loss, dominate X in total, and pool (each estimate depends on ‖X‖²).
- So X and a pooling rule are both Pareto-admissible, and the pooling rule is better in total in every state.
- By the memo's own uniqueness claim, that pooling rule still leaves someone worse off than stand-alone in some state.
- So neither Pareto nor any Taurekian refusal to compare can tell them apart. Any view that adds even a lexically secondary concern for total accuracy picks pooling.

**(b) The uniqueness claim: correct, and the proof sketch works, but the result is generic.**
- Under strictly convex loss, the only rule no worse than a Pareto-admissible δ* for everyone in every state is δ* itself.
- So the claim singles out X only once X has been made the baseline.
- The right is therefore baseline-relative (a stand-alone or IR constraint), not anti-aggregative. The thesis sentence says the opposite.

**(c) Brown 1975: the statement is right, the normative upshot is too strong.**
- Johnstone (2019, §3) confirms the result as the memo states it. Under "total incompatibility" (the whole nonnegative quadrant of weights), X is admissible. Under bounded weight ratios ("partial incompatibility"), X is inadmissible. Brown gives necessary and sufficient conditions on the class of weights, so read the original for the dimension condition.
- Total incompatibility removes the case against X; it does not make a case for X.
- Every proper Bayes rule, pooling ones included, is admissible under any class of weights that contains one strictly positive weighting. Under squared loss the posterior mean is Bayes for every positive weighting.
- So "exactly when, and because, one is willing to weigh…" overstates.

**(d) Immunity, which changes the framing.**
- Brown (1971, §6.5, per Johnstone): proper Bayes estimators are "immune" to the Stein effect.
- So assessing each person by a stand-alone proper Bayes rule is already admissible in total, and no pooling rule dominates it. An example is Kelley shrinkage toward a fixed population mean taken from base rates.
- Stein's inadmissibility is a fact about the no-prior rule X. "Judging on one's own record is beaten whatever the true values" holds only for flat-prior assessment.
- The real menu has three options:
  - X: no outside information, equal risk for everyone, inadmissible.
  - Base-rate shrinkage: admissible, but the exceptional face unbounded risk (Efron & Morris 1971, Bayes case).
  - Pooling strangers' records: admissible versions exist, and the result depends on the batch.
- The paper must say what only Stein adds: batch dependence, and dominance over X without any prior.

**(e) Bounded scales.**
- Brown & Hwang (1986, per Johnstone): when the parameter space is compact, estimators that are admissible for each person separately are immune.
- Real assessment scales are bounded. So the "dominance whatever the truth" hook disappears for admissible stand-alone rules.
- Either defend the unbounded idealisation or recast the conflict as large expected gains rather than dominance. Expect a formal judge to raise this.

**(f) The ex ante claim: true, with a one-line proof, but it brings back the reference class.**
- Proof: take any exchangeable credence and any permutation-equivariant rule whose total risk is below p in every state. Each person's expected risk is then total/p < 1. My simulation, with one outlier at a random position, gives 0.66 and 0.87.
- But an exchangeable credence under which pooling helps is a de Finetti mixture. On such a credence, the co-assessees' records *are evidence about you*.
- So the per-person case for pooling is the reference-class case, with the batch as the reference class. That is exactly the failure mode the scout predicted.
- "Pooling involves no … assumption of similarity" is true only of the frequentist, aggregate justification. The memo uses the frequentist reading for "no similarity" and the Bayesian reading for "better for each". It cannot have both.

**(g) "Every accuracy-based standard favours pooling" is false for per-person chance accuracy given the facts.** That is the very standard §3 relies on. The defensible version is narrower: every accuracy standard the assessor can apply *without individuating information* favours pooling.

**(h) Calibration.**
- Hedden says "none except perhaps calibration" is a necessary condition. His criterion is defined for probabilistic risk scores, so for point estimates you need the analogue E[θ | θ̂] = θ̂.
- Shrunk estimates satisfy it approximately within the batch; raw scores do not. This is known as forecast unbiasedness, so cite it.
- Hedden's calibration *within groups* (fn. 22) pushes toward group-specific targets. That cuts against the "no stereotyping" framing.

**(i) The standpoint.**
- "Ex post given true value" runs two standpoints together. One is *interim*: she knows her own θ_i but not the others'. The other is *state-wise*: all θ are fixed.
- Use Holmström & Myerson's (1983) ex ante / interim / ex post vocabulary.
- My derivation, by the same reduction as the memo's 1(a), so check it: on a credence that treats persons' values as independent, X is the unique rule that leaves no type worse off at the interim stage.
- But that condemns fixed-prior Kelley shrinkage just as much as Stein pooling. So the "exceptional pays" complaint is not specific to Stein.
- §3 also makes the right depend on the right-holder *knowing* she is exceptional. Teachers do not know their true value-added, and a right should not depend on self-knowledge.

**(j) Numbers and quotations.**
- **LT bound.** Use the elementary bound. By Minkowski, any rule that never moves anyone more than k sd from her own record gives everyone risk ≤ (1+k)² in every state and in any batch. Koenker & Gu's 1 + k² is for the Bayes case with a known prior. The same cap also bounds batch dependence: two batches containing the same record give estimates within 2k of each other.
- **Match numbers to estimators.** "1 → 2.9, total 10 → 6.2" is for James–Stein shrinking to a fixed target. Positive-part shrinkage to the grand mean gives about 2.4 at that configuration (my check).
- **Efron & Morris's "80% of savings"** is an ensemble (Bayes) figure. In the same data, limited translation raised the worst realised error (Munson). Say both.
- **Efron 2010.** His call for "theoretical guidance" is about *relevance*, an epistemic question, not fairness.
- **Houston.** It was a summary-judgment ruling that let a procedural due-process claim proceed on verifiability grounds. It did not hold shrinkage unfair.
- **Eidelson is reversed.** He says that *declining* to consider the brother's record "would hardly have constituted a failure to treat me as an individual". If anything, a committee that *did* consider it might have failed to (p. 209). This helps the paper, because it is the purist's intuition, but the memo cites him for the opposite.

---

## 3. Normative problems the memo does not yet address

1. **Self-interest runs one way.** Shrinkage benefits the exceptionally *bad*: Morris & Lysy's minimax rule "would thrill the management of Hospital 26". Symmetric squared error is nobody's welfare. The complainants are the exceptionally good (a desert or credit complaint) and third parties. The contractualist "sacrifice" framing needs either an argument that being overrated sets back an interest, or a right restricted to under-crediting. A bias-based right (not to be systematically under-credited given one's merit) may fit better than a risk-based one.
2. **Whose accuracy is being aggregated?** In the hospital and teacher cases, aggregate accuracy mainly benefits third parties (patients, students). The structure there is individual right versus public good, not aggregation across the assessees' own claims.
3. **The decision-loss objection.**
   - With equal noise, positive-part James–Stein preserves rank order.
   - A threshold on shrunk scores is a threshold on raw scores that moves with the batch's spread, i.e. grading on a curve.
   - Where shrinkage does reorder people (thin records), the issue is not specific to Stein and is already argued: Kane & Staiger; Mehta 2019; Gu & Koenker 2023; Emelianov et al. 2022; and in philosophy Heesen & Romeijn 2019 (*Phil Imprint*).
   - Best available answer: Robbins's (1951) compound decision problem. Classifying each person by her own sign is minimax for each person, yet it is beaten in total by rules that use the empirical distribution. So the conflict is not an artefact of squared error.
4. **§3 takes a side without a new argument.** It sides with Fleurbaey & Voorhoeve (2013) against Hare (2016). Hare's cases have exactly this structure: the agent is ignorant of fixed facts. That is failure mode (d).
5. **The ARC analogy is loose.** LT caps each person's risk relative to a fixed baseline; it is not a relevance threshold between competing claims. "Limited aggregation under risk" is also a crowded field where judges are central (Kowalczyk). Do not say LT *is* partial aggregation.
6. **Unequal noise.** Under raw scores, units with thin records already carry higher risk (Kane & Staiger). So "no worse than stand-alone" protects an unequal baseline. A baseline-relative formulation and an equal-risk formulation agree only when noise is equal. Choose one.

---

## 4. What nearby might work

**Thesis (draft).**
> "Stein cases isolate the distributive core of the complaint against statistical assessment. Without individuating information, every accuracy standard favours using others' data, and no anti-aggregative principle forbids it. So if the exceptional are wronged, the right to be judged as an individual is a *baseline guarantee*: each person is owed, whatever the facts, nearly the risk of misassessment she would bear on her own record alone, i.e. her minimax value. Own-record assessment is the unique rule meeting this exactly, and the unique rule giving everyone equal risk; Stein's theorem fixes its price."

**Claim as new only these three things.**
1. **The structural argument.** Neither assessor-relative accuracy nor anti-aggregation (Pareto) can ground the exceptional person's complaint. The proper-Bayes and immunity points show this. So the right must be baseline-relative.
2. **A principled baseline.** Judged state by state, a complaint measured against the best alternative is degenerate: the constant rule set at her true value has risk 0. So any state-wise view needs a fixed baseline. The per-person minimax value is the non-arbitrary choice, and X uniquely attains it.
3. **A consequence for the *Ethics* debate.** Di Bello & O'Neil's equal protection *is* satisfiable in assessment, but only by an inadmissible rule. Every admissible rule, whether it uses base rates or pools, gives the exceptional higher risk. Climenhaga is right that unequal risks are ubiquitous, and wrong if he means unavoidable. Hedden's calibration picks the unequal rule. Stein makes the price exact.

Credit Hodges–Lehmann, Efron–Morris and Koenker–Gu for the bounded version. Claim only that it is the right's content.

**Structure for 6,000 words.**

| § | Content | Words |
|---|---|---|
| 1 | The case: Clemente and Alvis, batch dependence, the exceptional pay; one small table. Do not open with "Stein is an aggregation paradox". | 700 |
| 2 | Three justifications for pooling (frequentist total; ex ante under exchangeability, conceding that others' records are then evidence; calibration). Accuracy-based accounts of the right endorse pooling. Eidelson's brother case shows the purist intuition is pre-theoretical. | 1,200 |
| 3 | Not anti-aggregation: Pareto, Brown, Strawderman, immunity. | 900 |
| 4 | Which baseline: ex ante, interim and state-wise standpoints; degenerate complaints; minimax value and equal risk; the self-knowledge objection; position against Hare and Fleurbaey–Voorhoeve. | 1,200 |
| 5 | The price and the bounded right: the uniqueness result; restricted Bayes / LT; the (1+k)² bound; bounded batch dependence; the tolerance. | 900 |
| 6 | Objections: decision loss (Robbins), the self-interest asymmetry, unequal noise, bounded scales. | 900 |
| 7 | Conclusion: equal protection, Di Bello & O'Neil, Climenhaga. | 200 |

Cut: the policy diagnosis (one paragraph at most); federated-learning and DRO analogies (one footnote); Gustafsson & Kowalczyk unless a specific step needs it; the ARC analogy; simulations beyond one table.

**Reading list (priority order; \* = must-read for priority/novelty).**
1. \*VSF 2017 in full, especially §§8 and 11 and fn. 27. Look for what "holistic pragmatism" already concedes (per-part goals are legitimate; "exclude" known stars). You need one sentence on why your claim is not "the choice of goal is pragmatic".
2. \*Hodges & Lehmann 1952; Koenker & Gu 2026 §§2–3. Look for the exact restricted-Bayes formulation, so your bounded guarantee adds only the normative identification.
3. \*Brown 1975 (the original), with Johnstone 2019 §3, Brown 1971 §6.5, Brown & Hwang 1986, and Strawderman 1971. Look for the exact conditions, and whether Brown interprets "incompatibility" himself.
4. \*Morris & Lysy 2012 §§1, 3.1 and 4; Efron 2010 with the rejoinder. Look for every normative remark they make.
5. \*Giacomini, Lee & Sarpietro 2026 §§2–3. Their per-individual minimax regret is structurally a complaint model; note their remark that results depend on the menu of rules.
6. \*Di Bello & O'Neil 2020; Climenhaga 2025, which is still unread (PhilArchive was blocked; get it another way). Check whether types defined by true merit count as "types", and whether Climenhaga's argument covers estimation.
7. Lippert-Rasmussen 2011; Eidelson 2013, pp. 209 and 216–18 (re-read); Beeghly 2018; Moss 2018 ch. 10. Look for any account of the right with a baseline structure.
8. Hare 2016; Fleurbaey & Voorhoeve 2013; Frick 2015; Gordon-Solmon, "Should contractualists decompose?". Look at chance versus evidential probabilities, and whether Frick's decomposition condition separates pooling from fixed-prior shrinkage.
9. Holmström & Myerson 1983; Moulin 1988 or Faulhaber 1975. For the vocabulary and any existing defences of the stand-alone test.
10. For positioning, mostly footnotes: Pericchi & Pérez 2025; Robbins 1951; Aigner & Cain 1977; Heesen & Romeijn 2019; Ustun et al. 2019; Suriyakumar et al. 2023; Donahue & Kleinberg.

**Obligations (priority order).**
1. Replace "anti-aggregative" with a baseline claim, and prove the proper-Bayes point in a footnote.
2. Choose the standpoint and defend it without relying on the assessee's self-knowledge, answering Hare directly.
   - *State-wise*: credence-free; yields X uniquely; the strongest version and the most contested.
   - *Interim*: permits pooling exactly to the extent that others' records are evidence about you. It is more moderate, and it condemns only the aggregative surplus. That is a normative answer to Efron's relevance question.
3. Say what only Stein adds over base-rate shrinkage (batch dependence; dominance over X without a prior). Concede that "the exceptional pay" is generic, and turn that into a point: it unifies Stein with statistical discrimination.
4. Bounded scales and the flat-prior baseline: a paragraph, not a footnote.
5. The currency: why chance-risk (or bias) is what the right protects; the self-interest asymmetry; third-party beneficiaries.
6. Decision loss: Robbins; rank invariance under equal noise; thresholds as curve grading.
7. Unequal noise: commit to the baseline-relative or the equal-risk formulation.
8. The tolerance: do not say "set by the stakes" without a rule. At least show the frontier between maximum individual risk and total risk, or say the right fixes only the form of the guarantee.

**Ceiling and biggest risk.**
- Ceiling: "interesting", probably with value theorists. Stein gives a clean case where equal protection has an exact price, and an argument that rights against statistical sacrifice must be baseline-relative. I put "surprising" below 20%.
- Biggest risk: a formal judge reads it as "VSF's holistic pragmatism plus Hodges–Lehmann with a moral label", i.e. EXPECTED.
- Second risk: §4 rests on a contested standpoint.

**An alternative nearby angle (riskier, possibly more surprising).**
- Moss has a rule of consideration: "keep in mind the possibility that they might be an exception". She also holds that moral stakes make such possibilities "epistemically resilient".
- Both have a precise statistical counterpart in heavy-tailed priors. Under such priors, the group's pull is discounted when an individual's data conflict with it (O'Hagan; Pericchi & Pérez derive LT from a double-exponential prior).
- The thesis would be that the right is an *epistemic* constraint on how heavy the prior's tails are, not a distributive constraint.
- This reverses the memo's "distributive, not epistemic" diagnosis and inherits the moral-encroachment controversy. But the bridge from moral encroachment to heavy tails to limited translation appears to be unoccupied. Check before pursuing.

**Go/no-go test.** Write the 150-word abstract of the nearby paper. Give it to a fresh reader together with VSF fn. 27, Koenker & Gu §§2–3, and Morris & Lysy §4. If they can predict every claim in it, stop.

---

### Sources checked this session
- [Johnstone 2019, "Larry Brown's Work on Admissibility"](https://projecteuclid.org/journals/statistical-science/volume-34/issue-4/Larry-Browns-Work-on-Admissibility/10.1214/19-STS744.full) (read §3 via the [NSF copy](https://par.nsf.gov/servlets/purl/10182001))
- [Vassend, Sober & Fitelson preprint](https://philsci-archive.pitt.edu/13303/1/Philosophical%20significance%20of%20Stein%20Preprint.pdf) (fn. 27 text recovered)
- [Koenker & Gu, Robustifying Empirical Bayes](https://arxiv.org/abs/2603.00704)
- [Pericchi & Pérez, the Clemente problem](https://arxiv.org/abs/2506.10114)
- [Giacomini, Lee & Sarpietro](https://arxiv.org/abs/2308.01596)
- [Donahue & Kleinberg, fairness in model-sharing games](https://arxiv.org/abs/2112.00818)
- [NeurIPS 2023, collaborative mean estimation with IR](https://papers.neurips.cc/paper_files/paper/2023/file/9af2b1d6acf561af9c4cf70d52c7a49d-Paper-Conference.pdf)
- [Ustun, Liu & Parkes 2019](https://proceedings.mlr.press/v97/ustun19a.html)
- [Suriyakumar et al., When personalization harms](https://arxiv.org/abs/2206.02058)
- [Romeijn talk](https://www.hss.caltech.edu/news-and-events/calendar/seminar-on-history-and-philosophy-of-science-3)
- [Heesen & Romeijn 2019](https://philsci-archive.pitt.edu/16262)
- [Climenhaga record](https://philarchive.org/rec/CLIURO) (full text blocked)
- [Fleurbaey & Voorhoeve](https://philarchive.org/rec/VOODAY)
- [Brusseau 2025](https://arxiv.org/abs/2504.13790) (not an antecedent)
- Eidelson p. 209: checked against the extracted text at `/mnt/user-data/outputs/stein-paper/research/texts/eidelson.txt`.
- My numerical checks: `/tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/sims/check.py`
  - The ex ante claim holds.
  - Positive-part grand-mean James–Stein gives the outlier a risk of 2.39 at θ₁ = 3.16, against the memo's 2.9.
  - LT beat the stand-alone rule in total risk in every configuration I tried. That is not a proof.
