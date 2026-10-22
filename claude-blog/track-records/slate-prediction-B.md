# Slate prediction B: independent predictability test

Tester's profile: philosopher working on the epistemology of testimony and expertise, decision theory, and the philosophy of AI.

**What I read for Phase 1:**
- econ-report §§0–1, 2–10 (§§3–6 and 9 in full) and §11 (including §11.6).
- philosophy-report §§0–2, 3.1 and 3.3.

I skipped philosophy-report §3.2 ("candidate theses"). I did not open `_NOTES.md` or any `slate*` file. Phase 1 was saved before Phase 2 began.

---

## PHASE 1

### The five papers a competent philosopher would most likely write (most likely first)

#### 1. "What a Track Record Cannot Show" (the novice/expert problem)

**Thesis.**
- Suppose experts issue probabilistic forecasts. Then a lone forecaster's record of realized forecasts cannot certify expertise, even with perfect access to outcomes and unbounded data.
- Goldman's track-record source (E) works only for near-deterministic predictions.
- Every way out adds something the novice was supposed to lack: a prior, a trusted rival, or a full advance commitment. This turns Levy's slogan, that criteria "extend" trust rather than "ground" it, into a theorem.

**Main argument.**
1. Separate the *access* problem (Goldman, Nguyen, Levy, Huang) from the *identification* problem.
2. Present Sandroni 2003, O&S 2008, Shmaya 2008 and O&S 2009 MOR as an impossibility result for identification.
3. Explain why the eclipse and car-repair cases are safe: the hypotheses are deterministic, so the class is restricted.
4. Go through the escape routes (Stewart; AW/FS; future-dependent tests; computation) and argue that each presupposes prior trust or a trusted comparator.
5. Draw the institutional upshot: tournaments and commitment.

**Likelihood:** very high. The philosophy report all but writes this paper.

#### 2. "Strategic Thermometers" (calibration, calibrationism, deference)

**Thesis.**
- Good calibration in someone else's record is no evidence of reliability unless the forecaster is assumed to be non-strategic.
- The reason: a forecaster with no domain knowledge can guarantee calibration on every sequence (Foster–Vohra). More generally, such a forecaster can pass every test a truthful expert passes (Sandroni).
- So the calibrationist model of "treating others as thermometers" (White) rests on a non-manipulability premise it never states.
- There is a self/other asymmetry: you cannot game your own calibration against yourself. This explains why calibrationism is more plausible for higher-order self-doubt than for deference.

**Main argument.**
1. Trace the line from Seidenfeld's question to Foster–Vohra to Sandroni.
2. Combine Dorst (calibration is not necessary for rationality) with Foster–Vohra (calibration is not sufficient for expertise).
3. Use Foster–Hart: refinement, not calibration, is the expertise component, and calibeating cannot create it.
4. But refinement has no absolute pass mark, since an honest forecaster's Brier score is at least p(1−p). So Brier scores work only comparatively too.

**Likelihood:** high.

#### 3. "Expertise Is Contrastive" (likelihoodism; Al-Najjar–Weinstein's relativism)

**Thesis.**
- A forecasting record supports only contrastive claims ("A forecasts better than B", "A forecasts better than my own predictive"). It never supports the monadic claim "A is an expert".
- The comparative tests work because a truthful forecaster's likelihood ratio against any rival is a non-negative martingale (the Ville/Royall universal bound).
- The single-expert tests fail because "ignorant" is a composite alternative, closed under mixture, with no likelihood function.
- Al-Najjar and Weinstein conclude that stochastic *truth* is relative. That overreaches: what is relative is *evidence of expertise*.

**Main argument.**
1. AW Thm 1 and FS Prop 2.
2. Stewart's test read as a comparison with oneself.
3. Kavaler–Smorodinsky's axiomatic characterization of the likelihood ("derivative") test.
4. The limit: when nobody is informed, a contrast certifies nothing (AW Thm 7; O&S PNAS). This is the formal version of Levy's "corrupt field" worry.

**Likelihood:** high.

#### 4. "Prophecy and Prediction" (Popper, falsifiability, the prequential principle)

**Thesis.**
- O&S show that falsifiability cannot demarcate science when theories come from strategic experts.
- But Popper's *other* distinction, between conditional scientific prediction and unconditional prophecy, marks where testability lives. What can unmask a charlatan is commitment to forecasts conditional on histories that have not occurred, or never will.
- So Dawid's prequential principle is right for evaluating *forecasts* and wrong for evaluating *forecasters*.

**Main argument.**
- O&S 2008: future-independent tests are manipulable.
- Shmaya: prequential Borel tests are manipulable, except for tail events.
- O&S 2009 AoS and Dekel–Feinberg: some future-dependent tests are not manipulable.
- O&S 2011: the asymmetry between refutation and verification.
- Popper, *Conjectures and Refutations*, ch. 16.

**Predicted weakness.** The paper will probably sell commitment as a practical remedy. It is likely to miss two things:
- with bounded data, even future-dependent tests are manipulable (MOR Prop 1);
- non-manipulability is only topological (MOR Prop 3).

**Likelihood:** medium-high. Because O&S have already staked out Popper, some philosophers may be deterred.

#### 5. "Leaderboards Can't Certify" (evaluating AI forecasters)

**Thesis.**
- Benchmarks that score AI forecasts against realized outcomes (ForecastBench) can rank systems. They cannot, in principle, certify forecasting competence.
- Optimization pressure can produce a test-passer with no knowledge, without anyone intending to cheat.
- Unlike pundits, however, AI systems can be queried counterfactually, seeded and audited. So the commitment, comparative and computational escapes are open for machines.
- Hence: evaluate comparatively, and with oracle access.

**Main argument.**
- Sandroni and O&S.
- The outcome-indistinguishability hierarchy of Dwork et al. ("auditors should be granted oracle access").
- Fortnow–Vohra and Hu–Shmaya.
- The pitfalls catalogued by Paleka et al.
- A comparative leaderboard certifies ranking only (AW Thm 7).

**Likelihood:** medium-high. It shares the weakness of #4 (MOR Prop 1).

#### Near misses (6–8), in order

6. **"Orgulity Is the Price of Accountability."**
   - Belot-style humble priors make an expert untestable, because testability tracks merging (Pomatto–Al-Najjar–Sandroni 2014; Al-Najjar–Pomatto–Sandroni 2014, "Claim Validation").
   - Very likely from anyone in the orgulity debate, but the economists have already stated the incentive half.
7. **"No Priors, No Experts."**
   - Requiring type-I control for every P amounts to extreme ambiguity aversion (Stewart).
   - For a Bayesian novice the problem is solvable. Under her prior, a forecaster's finite-horizon likelihood ratio against her own predictive is a mean-one martingale.
   - So the theorems are a reductio of evaluation without a prior, not a sceptical result.
8. **"Identification Is Unnecessary."**
   - Olszewski–Pęski, plus regret bounds and meta-induction: you cannot tell who the expert is, but you can do as well as if you could (revocable deference).
   - Herrmann 2022 and Schurz partly occupy this ground.

### The most surprising defensible thesis (my view)

**"Ignorance of chance looks like chance." With finite records, holding a lone forecaster to account requires denying expert standing to modest knowledge.**

**Thesis.**
- Assume bounded data and a computationally unbounded charlatan. Then a test can screen out the ignorant only if the set of hypotheses it protects is not closed under mixing.
- A mixture of candidate truths is exactly what someone ignorant among them would forecast. It is also exactly what an honest expert whose best knowledge is coarse ("it's genuinely 50/50 which regime we're in") would forecast.
- So no test can both protect modest but genuine probabilistic knowledge and exclude the know-nothing.
- What a finite record can certify is knowledge that *resolves* a mixture: which of the sharper hypotheses holds. It cannot certify "knowing the probabilities" as such.
- So the pull of accountability regimes toward sharp, opinionated forecasters is partly *forced*, not merely bad design.
- The link between orgulity and testability (ANPS) is the expert's side of a fact about the tester.

**Argument.**
1. **The theorem.** MOR Prop 1 (with Sandroni–Shmaya 2014 Prop 1): take any test that controls type-I error over a convex compact paradigm, future-dependent tests included. A charlatan can delay its rejection past any fixed horizon. Contrapositive: screening with bounded data requires the protected class to be non-convex, or non-compact.
2. **Why convexity matters (AW §6).** The engine of the impossibility is reducibility: a mixture µ over processes is observationally the single process P_µ.
   - To protect P_µ as a candidate truth is to treat coarse knowledge of P_µ as expertise.
   - The charlatan's minimax strategy bundles together his best replies to Nature's mixtures, and his best reply to each mixture µ is to announce P_µ.
3. **Every escape with bounded data refuses some mixtures.**
   - *Dirac measures*: Goldman's eclipses, the extreme points of Δ(Ω).
   - *Parametric families such as i.i.d. Bernoulli.* My own check:
     - Let r_n = √(ln(2/ε)/2n). The test passes the announced q iff |f̄_n − q| ≤ r_n. By Hoeffding, it passes every true q with probability ≥ 1 − ε.
     - A randomization ζ over q passes against a true q* with probability at most about ζ([q* − 2r_n, q* + 2r_n]) + ε.
     - Once r_n < 1/8, there are disjoint such intervals, and ζ cannot put mass above one half in each. So ζ fails against some q*.
     - These are de Finetti's components, not the exchangeable mixtures. The exchangeable class is convex, and there the finite-data impossibility holds.
   - *Learnable-and-predictive theories* (AS²W 2010).
   - *Forecasts bounded away from ½* (MOR Prop 2). This excludes precisely the honest expert whose knowledge is that there is nothing to know.
   - *Stewart and AW Thm 2* refuse mixtures relative to a reference mixture: the tester's own prior predictive, or a diffuse µ. They certify only sharpness beyond it. Stewart's test fails a true expert whose knowledge does not outrun the tester's.
4. **What is and is not certifiable.** The uncertifiable notion is "knows the probabilities" taken over all of Δ(Ω), which does not distinguish claims about chance from credal mixtures. The certifiable notion is "knows which component holds".
   - Corollary, stated with caution: thoroughgoing subjectivism with no prior admits every coherent P as a candidate theory. That is exactly the setting in which probabilistic expertise cannot be tested.
5. **Normative upshot.** Intellectual modesty in experts and record-based accountability conflict at the level of a theorem, not just of incentives. Compare:
   - Witkowski et al.: winner-take-all competitions reward extreme reports.
   - Paleka et al.: the benchmark-optimal strategy may be to "commit to one outcome".
   - ANPS: experts who may remain sceptical can evade rejection.

**Limits (the paper must state these).**
- The thesis fails with unbounded data. O&S 2009 AoS tests protect all of Δ(Ω), though non-manipulability holds only topologically; Sandroni–Shmaya 2014 does the same for the exchangeable class.
- It fails against computationally bounded charlatans: Fortnow–Vohra's test passes every truth.
- Non-convexity is necessary but not sufficient. O&S 2011's falsifiable theories do not form a convex class, yet the falsification contract is still manipulable.
- The i.i.d. example is my own. I have not checked a general theorem that every non-convex compact class admits a test.

**Why it is surprising.** Social epistemology treats intellectual humility as a virtue in experts, and calibration as a measure of that virtue. This thesis says that modest expertise is the one kind a finite record can never tell apart from ignorance. It also says that the remedy for charlatans has a structural cost, and that honest, modest experts bear it.

---

## PHASE 2 (written after Phase 1 was saved; slate-v1.md opened only at this point)

**Checks run against the saved texts:**
- AW 2008, App. A.2: Thm 7, its proof, and the remark that follows it.
- Foster–Hart 2023: §1 and §4 (Thm 3, Remark (c)).
- O&S 2009 MOR: introduction and §§3.1–4.1.
- PANS 2014 (Pomatto–Al-Najjar–Sandroni): §§1 and 4–5.
- Pomatto–Sandroni 2018: §1.1.
- Hu–Shmaya 2013: §3 (admissibility).
- Shmaya 2008: Ex. 1.

ANPS 2014 ("Claim Validation") is available as an abstract only, as the econ report says.

Key for (b): **P** = predicted in my Phase 1 (one of the five, the near misses, or the surprising thesis); **D** = derivable within an hour from the two reports; **N** = not predictable.

### S2. Trust Extended, Not Grounded

**(a) MATCH** with my #1. The thesis, the Levy slogan in the title, and the "whole field" limit (from my #3) all match. It also absorbs near miss #7.

**(b) Claims**

| # | Claim | P/D/N |
|---|---|---|
| 1 | No test of a single forecaster's record distinguishes the knower from the strategic ignoramus unless the tester brings something to it | P |
| 2 | What the tester brings is always "prior trust": in her own forecasts, in a rival, or in a restriction on the world | P (my #1 almost verbatim) |
| 3 | The own-prior route certifies only value added; the rival route certifies only relative superiority | P (#1, #3, #7) |
| 4 | Track records extend trust and cannot ground it; Levy's pessimism has a theorem behind it | P |
| 5 | Whether a whole field knows anything cannot be settled by its members' records, even comparatively | P (#3's limit) |
| 6 | Rankings among forecasters who see one another's forecasts reward recalibrating the crowd rather than knowing the domain | D (from Foster–Hart; not in my slate) |
| 7 | The novice/expert problem has no performance-based solution | P (overstated; see d4) |

**(c) New and important?** Only claim 6.
- It matters for AI leaderboards where models can see crowd forecasts. ForecastBench's top LLMs had access to crowd forecasts, and Paleka et al. warn about "piggybacking" on human forecasts.
- As written it is wrong in degree (d1).

**(d) False or overstated**

1. **Claim 6 is overstated.**
   - Foster–Hart's online calibeater c_t = ā_{t−1}(b_t) needs the rival's *current* forecast. It achieves a Brier score of about R^b, so it beats b by b's calibration score K^b. It cannot go below b's refinement (Thm 3; Remark (c)).
   - So the gain equals the crowd's miscalibration. Against a calibrated crowd, or an informed forecaster (asymptotically calibrated), the gain is zero.
   - The gain is also a genuine improvement in the forecasts, so "rather than" is wrong.
   - AW Thm 1 still picks the truthful expert (or the forecasts are close) even when experts condition on each other's past forecasts.
   - Correct version: a ranking can be topped by a forecaster who knows nothing but the crowd's current forecasts, by a margin equal to the crowd's calibration error. Rank above the crowd is evidence of domain knowledge only beyond that margin.
2. **Claim 5 ("whole field … even comparatively") needs qualifiers.**
   - AW Thm 7 covers two experts and a finite horizon. AW say it "does not extend to the infinite horizon – at least not without additional restrictions."
   - O&S PNAS covers many experts with independent randomizations, but only for future-independent tests that reject in finite time.
   - Feinberg–Stewart's strict cross-calibration test works over an infinite horizon. It makes joint passing by two or more uninformed experts topologically rare, at the cost of failing some true experts.
   - So the claim is true for finite horizons, or for tests that protect every truth. It is not unconditional.
3. **The trichotomy in claim 2 is incomplete, and "trust" is stretched.**
   - Bounding the charlatan's computation involves no trust in anyone. Hu–Shmaya's test is prequential and future-independent, and passes true experts for every admissible (rational-valued) process; Fortnow–Vohra give a finite-horizon test.
   - The rival must be *informed* (AW's "truthful" means forecasting with the true P), not *honest*. An honest ignoramus is useless as a rival (AW Thm 7).
   - Stewart's prior is a prior about the world, not trust in a person. A referee will say the Levy convergence is partly verbal, because Levy's trust is trust in persons and institutions.
4. **Claim 7 is overstated.** It ignores Olszewski–Pęski: performance-contingent menus attain first-best without learning the expert's type (δ = 1). It also ignores deference by regret bounds. Both are performance-based solutions to the practical problem. Say instead: "no performance-based solution to the *identification* problem."
5. **Minor.** "However much data" is true for records of realized next-period forecasts under Borel tests. But Shmaya's Ex. 1 (tail events) is a counterexample for a single record, with no prior, if the record includes forecasts of tail events.

### S3. Expertise Is Not Behavioural

**(a) PARTIAL.**
- "Commitments about contingencies that never arise" is my #4.
- AI queryability is my #5.
- The Blockhead/psychologism framing and the reliabilism angle are not in my five.

**(b) Claims**

| # | Claim | P/D/N |
|---|---|---|
| 1 | In domains of chance, expertise is not a matter of performance | P (implicit in #1 and #4) |
| 2 | For *any* test a knower would pass, a randomizer passes it on every course of events | P (overstated; d4) |
| 3 | This is Block's Blockhead transposed to forecasting | D |
| 4 | For tests used in practice, the Blockhead is cheap | D (econ §11.5) |
| 5 | What separates expert from charlatan is her model: commitments about contingencies that never arise | P (#4) |
| 6 | So expertise is a psychologistic property | N (and mislabelled; d2) |
| 7 | The rescue routes are all ways of reaching past behaviour | N (false for 3 of 4; d1) |
| 8 | Inspecting the model helps only with unbounded data | D (MOR Prop 1; I predicted #4 and #5 would miss this, and S3 does not) |
| 9 | There are consequences for reliabilist accounts of expertise | D |
| 10 | AI models can be queried as a person's cannot | P (#5) |

**(c) New and important?** The framing is new and could matter for the philosophy of mind and AI. But the central inference fails (d1–d3). S3 does avoid the bounded-data trap I predicted.

**(d) False or overstated**

1. **Claim 7 is false for three of the four routes.**
   - AW's and FS's comparative tests are prequential: they use only forecasts both forecasters actually made.
   - Stewart's test is prequential.
   - Hu–Shmaya's test is prequential and future-independent.
   - These routes reach past the lone, prior-free, computationally unbounded setting, not past behaviour. So the evidence supports "expertise is not manifest in a lone forecaster's prior-free test verdicts", not "expertise is not behavioural".
   - Only model inspection reaches past actual behaviour, and that is the one route that is useless with bounded data.
2. **"Psychologistic" is the wrong category.**
   - A model is a set of conditional forecasts at every history: a complete profile of counterfactual forecasting dispositions. That is behaviourism in the dispositional sense Block targets. Blockhead's point was precisely that matching all such dispositions is not enough.
   - The charlatan also has a model: the theory he draws from ζ. The global category test catches the randomization ζ, not some psychological deficit in the realized model.
   - What separates expert from charlatan is externalist (the expert's model is true, and not by accident). It is not a fact about internal processing.
3. **The Blockhead analogy does not fit.** Blockhead's outputs are identical to an intelligent agent's. The charlatan's forecasts differ from the expert's; they merely get the same verdict. The point is about how coarse tests are, not about behaviour.
4. **Claim 2 is false as stated.** It fails for:
   - future-dependent tests with unbounded data (O&S 2009 AoS; Dekel–Feinberg);
   - non-Borel tests (Shmaya Thm 2);
   - predictions of tail events (Shmaya Ex. 1);
   - computable charlatans (Hu–Shmaya).

   The abstract concedes some of these later, so its first sentence contradicts its body.
5. **Claim 8 is correct but incomplete.** Even with unbounded data, the model route is only topological. Under any measure fixed in advance, the charlatan passes on a set of paths with probability close to 1 (MOR Prop 3). "Helps only in the limit" should read "helps only in the limit, and then only topologically".
6. **Claim 10 buys nothing.** Given claim 8, being able to query an AI's model gains nothing in any finite evaluation of a lone system without a prior. The consequence for AI should be stated negatively, or tied to computation and comparison rather than to querying.

### S4. The Social Cost of Modesty

**(a) NO** match with my five. It does **MATCH** my near miss #6 ("Orgulity Is the Price of Accountability"), and it is a special case of my most surprising thesis.

**(b) Claims**

| # | Claim | P/D/N |
|---|---|---|
| 1 | Orgulity has a social function, overlooked by its critics: it makes an expert's claims testable | P (#6) |
| 2 | A know-nothing can pass any test that a knower would pass | P (overstated) |
| 3 | This is avoided only when experts must be confident that well-supported claims are true | P (a paraphrase of the ANPS abstract) |
| 4 | A modest expert cannot be distinguished from a charlatan | P (#6; generalized in my thesis) |
| 5 | The orgulity debate is about accountability, not only about a first-person attitude | D |
| 6 | Be modest in credence and immodest in assertion | N (relative to my slate), though it is formally easy (d3) |

**(c) New and important?** Claim 6 is new and formally correct. But the reason it is correct sinks the title thesis (d3).

**(d) False or overstated**

1. **Priority.**
   - The ANPS abstract says: "If experts can be skeptical about the validity of claims then they can strategically evade rejection. In contrast, if experts are required to conclude that claims backed by sufficient evidence are likely to be true, then they can be tested and rejected." S4's key premise is a near-verbatim paraphrase.
   - PANS 2014 says the same in terms of merging: experts "can only be discredited if they are restricted to a subframework where opinions that are compatible with the data generating process are eventually accurate."
   - Pomatto–Sandroni 2018 appeared in *Phil Sci*, inside the orgulity debate (it cites Belot, Elga, Huttegger and Weatherson). It points to ANPS for "how different dispositions towards induction can affect incentive problems", and ties Belot's orgulity to Blackwell–Dubins convergence.
   - So the link has not been "overlooked". It is flagged in the debate's own venue. Only the philosophical spin, and claim 6, are new.
2. **"Avoided only when" and "makes claims testable" are overstated.**
   - Every classical impossibility theorem (Sandroni 2003; O&S 2008; Shmaya 2008; O&S 2009 MOR) is proved for σ-additive opinions. Those opinions have the BD property (by the Blackwell–Dubins theorem; PANS note that Δ_BD strictly contains the σ-additive opinions), and they are orgulous (PS 2018 Prop 2).
   - So fully orgulous experts remain manipulable by every prequential test, every future-independent test, and every bounded-data test.
   - What orgulity buys (PANS Thm 3) is a future-dependent test such that every finite-support randomization is rejected for sure at *some* finite history. That needs unbounded data and gives no probabilistic guarantee (cf. MOR Prop 3).
   - Orgulity is therefore necessary, within Savage's finitely additive framework, but nowhere near sufficient. "Only when" is true only in the empty sense that every positive result assumes orgulous opinions. So does every negative result.
3. **S4's own fix shows the cost is close to zero.**
   - PANS: an opinion has the BD property iff it is an extreme point of E(P), the set of opinions that agree with P on every cylinder. So a modest (non-BD) opinion is a *mixture of opinions that make identical finite-data predictions*.
   - The restriction of any opinion to the cylinders extends to a σ-additive measure (Carathéodory; the same step as in PS 2018's Pragmatic Induction proof). This gives a σ-additive, hence BD and orgulous, "twin" that agrees with the opinion on every finite history. (One proviso: PANS require opinions to be strongly nonatomic.)
   - A modest expert can assert her twin. The rejection sets in PANS Thm 3 are single cylinders, so by her own credence she expects to pass exactly as before.
   - So "modest in credence, immodest in assertion" costs nothing predictively, and the "social cost of modesty" in this sense is nil.
   - Worse, the twin is σ-additive, so all the classical impossibility results apply to it.
   - The modesty at stake in the orgulity debate concerns limits and tail events. Accountability is decided at finite horizons.
4. **Minor.** "A modest expert cannot be distinguished from a charlatan" should read "a test that must accept modest opinions can be manipulated". PANS Thm 2 is about the class of opinions a test must accept, not about an individual expert.

### Ranking and verdict

1. **S2.** The core is sound and its overstatements are fixable. But it is the paper the philosophy report already outlines, and my #1 almost verbatim. Surprise is low and the risk of being scooped is high. Pursue it only if the calibeating point is made precise and promoted, and the "trust" vocabulary is tightened.
2. **S3.** The most original of the three, but its central inference fails:
   - three of its four rescue routes are behavioural;
   - "psychologistic" misnames what are really dispositions;
   - the AI consequence goes the wrong way once MOR Prop 1 is applied.

   As framed, not worth pursuing. A repaired version ("expertise is manifest only relationally, not in a lone forecaster's verdicts") collapses toward S2.
3. **S4.** Not worth pursuing as framed:
   - the economists already stated the link, in the debate's own journal;
   - orgulity buys only existential, unbounded-data testability;
   - the credence/assertion split costs nothing, because orgulity concerns only tail events.

**Does my most surprising thesis beat them?** Yes, on surprise and on novelty, and it is what S4 should have been.
- PANS's own characterization (BD iff extremality) shows that the modesty at stake in orgulity is mixing over opinions that finite data cannot tell apart. That kind of modesty is free to shed.
- My thesis puts modesty in mixtures over hypotheses that finite data *can* tell apart: coarse knowledge. There the cost is real:
  - MOR Prop 1: a convex compact paradigm makes every test manipulable with bounded data.
  - MOR's large non-convex paradigm admits everything except theories "sufficiently close to a given theory f".
  - A coarse expert with credence ½P₁ + ½P₂ who must assert P₁, under a test with power against P₁ when P₂ is true, expects to fail with probability about ½.
- It unifies:
  - Goldman's deterministic cases (extreme points of Δ(Ω));
  - MOR Prop 2;
  - AS²W's learnable-and-predictive theories;
  - PANS's extremality characterization;
  - Stewart's value-added condition.
- It is less safe than S2. It rests on one interpretive step (AW's reducibility read as "protecting coarse knowledge") and on my own i.i.d. check. It also fails with unbounded data and against computationally bounded charlatans.

**Recommendation.** For a single paper, use S2's frame with my thesis as its central new claim. S4's material would become the section on "the wrong kind of modesty", with the twin argument. Alternatively, write my thesis as a standalone paper.

**On predictability.** My Phase 1 predicted S2 almost exactly, S4 as a near miss (and as a special case of my thesis), and part of S3's content. Only three elements were not predicted: S2's calibeating claim, S3's Blockhead/psychologism framing, and S4's credence/assertion split. Each of them is overstated or undermines its own abstract.
