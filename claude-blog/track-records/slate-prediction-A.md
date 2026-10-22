# Slate prediction A (predictability test)

Tester: formal/social epistemologist and philosopher of science. Phase 1 was written after reading econ-report §1 and §§2–11 (all of §11, including §11.6) and philosophy-report §§0–2. I did not read philosophy-report §3 or `_NOTES.md`. No `slate*` file was opened before this section was saved.

---

## PHASE 1: What competent philosophers would write

### The five most natural papers (most likely first)

**N1. "Track Records Cannot Ground Trust": the novice/expert paper**
- *Thesis.* Take an expert who issues probabilistic forecasts. Suppose a test of her record alone passes a true expert whatever the truth is. Then a test-aware, uninformed randomizer can pass it too (Sandroni; O&S 2008; Shmaya). So Goldman's track-record source cannot identify experts on its own, and the obstacle is identification, not access. Every escape brings in prior trust or a substantive assumption: a rival, a prior, commitment, or computational limits. That vindicates Levy's view that criteria "extend" trust rather than "ground" it, and it supports the institutional turn.
- *Argument.*
  1. Goldman's five sources. The track record looks like the one non-circular source. The standard objections (Goldman, Nguyen, Levy, Huang) concern access and disputed markers.
  2. Make "track record" precise: realized forecasts against realized outcomes, plus a pass/fail test with prior-free type-I control.
  3. State the impossibility family: Foster–Vohra for calibration, then Sandroni, O&S 2008 and Shmaya for every test, then O&S 2009 MOR for bounded data.
  4. Explain why Goldman's examples (eclipses, mended cars) worked: they are near-deterministic or come from a restricted class.
  5. List the escapes: AW/FS rivals, the Stewart prior, Dekel–Feinberg/O&S commitment, and Fortnow–Vohra/Hu–Shmaya computability. Show that each presupposes trust or a domain assumption.
  6. Conclusion: Levy is vindicated with a theorem. The remedies are institutional (tournaments, consensus, commitment devices).
  7. Objections: real pundits don't randomize; the Bayesian reply.
- *Likelihood.* Near-certain. The philosophy report all but writes it ("the most publishable point").

**N2. "Track Records Are Evidence After All": the Bayesian deflation**
- *Thesis.* The impossibility rests on an unmotivated demand: type-I control for *every* DGP, with charlatans judged path by path. That is maxmin ambiguity aversion (Stewart). For a Bayesian evaluator, a record is ordinary evidence. A likelihood-ratio test against her own predictive passes true experts and gives charlatans probability 0. The right lesson is relativity, not scepticism: a record certifies value added *over the evaluator's prior*.
- *Argument.*
  1. Tests are not evidence. A pass/fail rule with worst-case guarantees is not a measure of evidential support.
  2. Diagnose the prior-free quantifier, using AW's point about the reducibility of Nature's lotteries.
  3. Bayesian reconstruction: put "expert" and "charlatan who knows my prior" on the hypothesis space. Use Stewart Prop. 1 and AW Thm 2.
  4. The cost: true experts are failed when the tester would have learned the truth herself.
  5. Moral: Levy is half right. Trust is not grounded from nowhere, but having a prior is not "already trusting the expert."
  6. Objection: whose prior, for public or institutional evaluators?
- *Likelihood.* Very high. It is the reflex of any Bayesian formal epistemologist.

**N3. "Popper's Charlatan": falsifiability, strategic experts, and conditional prediction**
- *Thesis.* O&S 2011 show that strict falsifiability cannot screen strategic experts. This is a result about testing *theorists*, not *theories*. Falsifiability as a property of a theory's content is untouched, but it fails as a demarcation criterion for *agents* and practices. The results also vindicate two Popperian ideas: refutation beats verification (the contract asymmetry), and *conditional prediction* beats unconditional prophecy. Testability lives in commitment to forecasts at all histories (future-dependent tests), not in an on-path record.
- *Argument.*
  1. O&S's model and their verbatim claims.
  2. The theory/theorist distinction.
  3. Strategic randomization as a new immunizing stratagem. Unlike the soothsayer's vagueness, it is *precise*.
  4. The refutation/verification asymmetry via semicontinuity, and the hidden Cournot principle.
  5. Prediction versus prophecy (C&R ch. 16), mapped onto future-dependent versus prequential tests.
  6. Upshot for demarcation, McLean v. Arkansas and Daubert.
- *Likelihood.* High. Popper is the obvious generalist hook, and O&S invite the reply.

**N4. "Strategic Thermometers": calibration, deference and calibrationism**
- *Thesis.* Calibrationism and calibration-based deference (White's thermometers, Masterton) assume that another agent's calibration record is evidence of reliability. Foster–Vohra show that anyone can secure calibration on every sequence without knowledge, and Sandroni extends this to every test. So another agent's record supports trust only under a non-strategic premise. Calibration is neither necessary for rationality (Dorst) nor sufficient for expertise (FV). Refinement and proper scores certify only comparatively. Self-calibration survives, because there is no strategic gap between me and myself.
- *Argument.*
  1. Calibrationism and the thermometer analogy.
  2. Seidenfeld's partial result (the one-note weatherman).
  3. FV's pathwise calibration, then Sandroni.
  4. Thermometers don't read their own tests, but agents do.
  5. The self/other asymmetry.
  6. Brier = calibration + refinement. Calibeating shows refinement can't be manufactured, but a Brier threshold has no absolute pass mark.
  7. A restated deference principle.
- *Likelihood.* High among formal epistemologists, somewhat lower for a generalist venue.

**N5. "Testing Machine Forecasters": benchmarks, rivals and counterfactual access**
- *Thesis.* Evaluating AI forecasters by their realized records (ForecastBench-style) falls under the manipulability theorems. Online calibration and post-hoc recalibration produce good records without knowledge. Sound evaluation must be comparative (head-to-head on the same questions), prior-relative, or must exploit the fact that models can be *queried counterfactually* (Dwork et al.'s oracle/code access). AI is therefore the domain where the theorists' future-dependent tests become usable.
- *Argument.*
  1. AI forecasters and benchmarks.
  2. The theorems.
  3. Trained models are test-aware optimizers, a realistic case of the theorems' charlatan.
  4. Leakage and crowd-copying as instances.
  5. Remedies: tournaments, oracle access, commitment to conditional forecasts.
  6. Implications for AI epistemic authority and capability attribution.
- *Likelihood.* High, given 2026 interest.

**Near-misses (sixth to ninth).**
- (6) "Expertise is contrastive": likelihoodism, AW's "truth is relative," "is anyone informed?" being untestable, so fields cannot be certified. This often ends up folded into N1 or N2.
- (7) "Accountability requires orgulity": Belot's orgulity linked to testability via Pomatto–Al-Najjar–Sandroni and Claim Validation.
- (8) A Goodhart / zero-knowledge-gaming paper.
- (9) A meta-induction paper: the same minimax mathematics gives universal optimality and impossibility.

**Traps I expect natural papers to fall into.** These are checks for Phase 2.
- **(T1) "Demand full models / inspect the model / oracle access" as a practical fix.** Prior-free, this is false for any bounded data set. O&S 2009 MOR Prop. 1: with bounded data, *every* type-I-controlled test, including future-dependent ones, has rejection delayable past the horizon over a convex compact class. Future-dependent positive results (Dekel–Feinberg, O&S AoS, O&S 2011) need unbounded data, no discounting, and are only topological (MOR Prop. 3). Oracle access in OI helps only through *computational* bounds on the predictor. Even then Olszewski's caveat applies: the honest expert may face the same bounds.
- **(T2) "Comparative tests certify expertise."** They certify relative informativeness. AW Thm 1 has a disjunctive conclusion: the truthful expert wins, or the two forecasts are close. Both AW and FS need one expert to be truthful (FS also needs no collusion).
- **(T3) "Is anyone informed?" is untestable, so whole fields cannot be certified even comparatively.** AW Thm 7 is a finite-horizon, prior-free result. O&S PNAS covers future-independent finite-time rejection tests with *independent* randomizations. FS strict cross-calibration makes joint passing by uninformed experts topologically rare, at the price of type-I control. With a prior, Stewart tests a lone forecaster (or a field's consensus) against the tester's own predictive. So "cannot be certified" holds only prior-free and only among the field's own members.
- **(T4) "Orgulity makes testing possible."** The PAS 2014 contrast is between all Savagean finitely additive opinions (Thm 2: every test manipulable) and BD opinions (Thm 3: a nonmanipulable test exists at a finite history, with unbounded data). Every σ-additive opinion already has the BD property and is orgulous (Pomatto–Sandroni Prop. 2). Yet in the σ-additive world, prequential, future-independent and bounded-data tests are *all* still manipulable. So orgulity (merging) is at most a necessary condition in the finitely additive framework, not what makes testing possible. Stewart's escape comes from the *tester's* prior, not the expert's orgulity. Claim Validation is abstract-only in the report.
- **(T5) Calibeating as a "test."** Foster–Hart do not claim a nonmanipulable test. Calibeating shows refinement cannot be *created*, only copied. Note a twist: a knowledge-free procedure that sees a miscalibrated expert's forecasts can *beat* that expert's Brier score by her calibration error. So in a Brier tournament among non-truthful forecasters, a parasite can win.

### Three less obvious but defensible theses (would surprise a formal epistemologist)

**U1. It takes a non-expert to certify an expert. Ignorance is a resource for testing.**
- *Claim.* The prior-relative escapes work *better the less the evaluator knows*:
  - Stewart's test fails true experts with probability ε, the tester's prior probability that she would learn the truth quickly on her own.
  - AW Thm 2 gives the uninformed rival value near 0 exactly when the common prior µ is diffuse.
- A well-informed evaluator, whose predictive is already close to the truth, cannot tell an expert from someone copying her own predictive. A diffuse-prior novice can, even when the charlatan *knows* the novice's prior.
- *Why it surprises.* It inverts "it takes one to know one," Nguyen's cognitive islands, and Levy's "it would take genuine expertise to apply the criteria." For probabilistic forecasting, what makes evaluation possible is being a (σ-additive) Bayesian with a non-concentrated prior, not being an expert.
- *Limits.* It needs an idealized tester who can compute her own predictive. It certifies value added, not absolute expertise.

**U2. The theorems are about test-aware optimization, not ignorance, so they bite harder on machines than on pundits.**
- *Claim.* Records *do* separate sincere experts from sincere non-experts:
  - A fixed wrong theory, or a sincere Bayesian whose prior does not merge with the truth, fails category/likelihood tests for all but a meagre set of DGPs (Dekel–Feinberg Thm 3; Stewart Cor. 1; O&S AoS for any ζ).
  - What records cannot screen is a forecaster who *knows the test* and generates forecasts against it: randomizing (FV, Sandroni) or defending (Vovk–Shafer, Foster–Hart for continuous tests).
- So Goldman's novice/expert problem, which concerns sincere rivals with conflicting views, is largely untouched by the impossibility. What is touched is the gaming problem.
- That agent is unrealistic for most human experts, who neither know the scoring rule nor implement minimax randomization. It is exactly what an ML model is when it is trained, selected or recalibrated against the evaluation metric.
- *Why it surprises.* Philosophers will read the theorems as a general scepticism about human track records. The correct reading says they are mostly a result about Goodhart dynamics in optimized systems.

**U3. Whether a track record can show expertise depends on the metaphysics of chance, specifically on whether chances are closed under mixture.**
- *Claim.* The engine of every prior-free impossibility is the "reducibility of Nature's compound lotteries" (AW §6): a mixture µ over possible truths is itself a possible truth P_µ, so the charlatan's best reply to any Nature strategy is just to announce it. Convexity is load-bearing:
  - O&S MOR Prop. 1 versus Prop. 2;
  - Sandroni–Shmaya;
  - O&S 2011 Prop. 2's "closed convex class."
- On views where genuine chance hypotheses form a *non-convex* family, Nature's mixtures are credences, not chances, and the minimax engine stalls. Examples: Humean best-system chances (a 50/50 mixture of iid(.3) and iid(.7) is never the best system for any world), or lawlike parametric families.
- The known non-convex and "learnable and predictive" positive results show that the stall can restore *finite-data* testability.
- *Why it surprises.* Formal epistemologists treat the problem as purely about evidence and incentives. It turns partly on a metaphysical premise that Humeans reject and primitivists about chance (who allow chancy selection of processes) accept.
- *Limits.* Non-convexity is necessary for escape, not sufficient. Specific structure is needed (AW's own remark that two-stage representations matter only relative to an informed observer).

---

## PHASE 2: Assessment of slate-v1 (S2–S4)

Written after saving Phase 1. Key: **P** = predicted in Phase 1 or stated in the reports. **D** = derivable from the reports within an hour. **N** = not predictable.

### S2. "Trust Extended, Not Grounded"

**(a) MATCH with N1.** It matches nearly step for step: Levy, "extend not ground," the three escapes recast as trust, and the field claim (my near-miss 6 and trap T3). The one non-N1 element is the ranking claim, which is my T5.

**(b) Claims**

| # | Claim | Mark | Verdict |
|---|---|---|---|
| 2.1 | The track record is the standard "objective" evidence | P | Fine |
| 2.2 | No single-record test, however much data, separates knower from strategic ignoramus unless the tester brings something | P | Correct for Borel prequential tests and computationally unbounded charlatans (Sandroni; O&S 2008; Shmaya; O&S MOR). Exotic exceptions are non-Borel tests (Shmaya Thm 2) and tail-event predictions. |
| 2.3 | What the tester brings is *always* prior trust: own prior (value added), rival's honesty and independence (relative), restriction on the world | P | Overstated, in two ways. (i) It **omits the computability escape.** Hu–Shmaya give a prequential, future-independent, polynomial-time test, valid for all admissible truths, that no computable charlatan passes (Fortnow–Vohra similarly). That is a restriction on the *forecaster*, not trust and not a restriction on the world. (ii) "Trust" is stretched to cover the tester's own prior and a modelling restriction, which are not trust in anyone. |
| 2.4 | Track records extend trust; they cannot ground it | P | The slogan stands only with the equivocation in 2.3. |
| 2.5 | Whether a field knows anything cannot be settled by its members' records, even comparatively | P (phil report (v)) | **Holds only in qualified form.** AW Thm 7 is finite-horizon, and its quantifier is "for every φ₀ there is a φ₁," so the second charlatan must know the first's strategy. O&S PNAS (NOT READ; known only via Olszewski 2015 Prop. 8) covers *future-independent, finite-time-rejection* tests with independent randomizations. Neither covers verdict-at-infinity tests. FS strict cross-calibration makes joint passing by ≥2 uninformed experts topologically rare, but only by failing some true experts. Olszewski reads the type-I sacrifice, not multiplicity, as the cause. So the defensible statement is: *no comparative test among the members that controls type-I error for every truth can guarantee exposing a field of strategic randomizers.* A sincere but wrong field is still exposed for typical truths. A field's consensus can be tested against an outside prior (Stewart), which is "bringing something," consistent with S2. |
| 2.6 | Rankings among forecasters who see one another's forecasts reward recalibrating the crowd rather than knowing the domain | D (econ §9.2 + §9.5; my T5) | **Supported only in weakened form.** Calibeating does give a knowledge-free procedure that, *seeing the host's current forecast*, gets Brier ≈ the host's refinement and so beats the host by the host's calibration score. Multi-calibeating does this against several hosts at once. Paleka et al.'s "piggybacking" and Karger's LLMs-with-crowd-access are real cases. But: (i) Foster–Hart Remark (c): the parasite cannot beat the host's refinement, so its score is borrowed knowledge, not knowledge-free success. (ii) Against a *calibrated truthful* host the parasite gains roughly nothing. It ties, which is AW Thm 1's case (b). So rankings do not reward recalibration *rather than* knowledge. They reward knowledge plus calibration and **misattribute whose knowledge it is**, whenever the knowers are miscalibrated (as humans are). (iii) It needs simultaneous visibility of current forecasts. AW/FS let experts condition only on *past* forecasts. |
| 2.7 | The novice/expert problem has no performance-based solution | P | **False as stated.** Goldman's problem is the *two-expert* problem, which is exactly the comparative case. Given that one candidate is informed (a presupposition of the problem, not trust in a particular candidate), AW's likelihood-ratio test picks her, up to near-agreement. Sincere non-experts are also exposed for all but a meagre set of truths (Dekel–Feinberg Thm 3; Stewart Cor. 1). What has no performance-based solution is the *absolute* question, and the comparative question when nobody may be informed and candidates are strategic. |
| 2.8 | Levy's pessimism has a theorem behind it | P (phil report, verbatim) | **Equivocal.** The theorems grant perfect access, so they do not support Levy's access and disputed-markers reasons. They partly *contradict* his central reason ("it would take genuine expertise to apply the criteria"). The Bayesian escape works *best* for a tester with a diffuse prior: Stewart's ε is the tester's probability of learning the truth herself, and AW Thm 2 needs a diffuse µ. Only the structural slogan is vindicated. |

**(c) New and important?** Only 2.6. It matters because it attacks the *practical form* of the comparative escape (tournaments and leaderboards), so it is not just an aside. The fix it suggests is new and concrete: blind current forecasts, or score each forecaster's value added *over the visible crowd* (Stewart's test with the crowd as the "prior"). As written it is overstated. Everything else in S2 is predicted.

**(d) False or overstated:** 2.7 (false for Goldman's own problem); 2.3 "always" (computability omitted); 2.8 (the theorems cut against Levy's reason); 2.5 and 2.6 (need the qualifications above).

### S3. "Expertise Is Not Behavioural"

**(a) PARTIAL.**
- Its true content is predicted:
  - the counterfactual-commitment lesson is N3 and econ §11.3;
  - the escape list is N1;
  - the AI-queryability point is N5.
- The Blockhead and psychologism framing is unpredicted.

**(b) Claims**

| # | Claim | Mark | Verdict |
|---|---|---|---|
| 3.1 | In domains of chance, expertise is not a matter of performance | N | Does not follow (see 3.6). |
| 3.2 | For *any* test the knower passes, a know-nothing can pass it on every course of events by randomizing | P | **False as stated, and S3 contradicts it later** by conceding that "inspecting the model" helps. With unbounded data, future-dependent tests are nonmanipulable (Dekel–Feinberg; O&S AoS; O&S 2011 refutation contracts). So are non-Borel tests, and tests against computable charlatans. "Pass on every course" should read "pass with high probability over his own lottery on every course." The correct scope is any *prequential* (Borel) test, or *any* test with bounded data. |
| 3.3 | This is Blockhead transposed to forecasting | N | **Misleading, in fact inverted.** Blockhead matches the intelligent agent's dispositions under *every* input, so counterfactual probing cannot expose him. The charlatan's forecasts *differ* from the expert's, and counterfactual probing (future-dependent tests) is exactly what exposes him, in the limit. He is also test-specific: O&S 2008 eq. 5.3 shows no single ζ passes all future-independent tests. The charlatan is an *anti*-Blockhead. |
| 3.4 | For tests used in practice the Blockhead is cheap | D (econ §11.5) | True for calibration-type tests (FV, Foster–Hart deterministic, online multicalibration). Not true for all efficient tests (Fortnow–Vohra). |
| 3.5 | What separates expert from charlatan is not any pattern in the forecasts actually made but commitments about contingencies that never arise | P | Overstated. AW/FS (rival) and Stewart (prior) separate them using *only on-path forecasts*. Minor point: O&S 2008's condition is data "not yet observed" at rejection time, not data that "never arise." |
| 3.6 | So expertise is psychologistic | N | **Non sequitur and mislabelled.** (i) The separating "model" is the forecast function at all histories. That is a *counterfactual behavioural disposition*, which a Rylean dispositionalist accepts for free. S3's own AI point (querying the model) is behavioural elicitation. The literature's "informed expert" is defined behaviourally and relationally: she announces P equal to the DGP. (ii) The inference runs from "a test of actual records can't detect X" to "X is not behavioural." Expert and charlatan *behave differently*; only the verdicts coincide. The real contrast is between *actualist* and *modal* behaviourism, not between behaviourism and psychologism. |
| 3.7 | The rescue routes reach past behaviour: model inspection (only with unbounded data), comparison, prior, bounded computation | P / D | "Model inspection helps only in the limit of unbounded data" is **correct** (O&S 2009 MOR Prop. 1: with bounded data, any type-I test, even with the full P, is delayable over convex compact Λ). Add: even in the limit the help is only topological (MOR Prop. 3), and it needs no discounting. But comparison and prior do not reach "past behaviour." They reach past the *lone record*. Only bounded computation constrains the forecaster's internals, and Olszewski's caveat applies: the honest expert faces the same bounds. |
| 3.8 | Consequences for reliabilism | N | Unspecified. Reliabilism looks *safe*: the charlatan's process is reliable for passing, not for matching chances. |
| 3.9 | AI forecasters' models can be queried, as a person's cannot | P | **In tension with 3.7.** If inspection buys nothing with bounded outcome data, querying an AI buys nothing prior-free. Dwork et al.'s oracle-access advantage is a *computational-hardness* result, so S3 must route the AI claim through the bounded-computation escape. "As a person's cannot" is also overstated: persons can be made to commit to full conditional theories (that is the O&S setup), just at greater cost. |

**(c) New and important?** The headline thesis is new, but false as stated. Its repaired form would be new and possibly important:
- *Repaired thesis.* Forecasting expertise is a **modal** property of forecasting dispositions, and the actual record underdetermines it.
- *The anti-Blockhead contrast.* Unlike intelligence, forecasting expertise *is* exposed by counterfactual probing, but only in the unbounded limit and only topologically. For finite AI evaluation, what does the work is computational bounds, not access per se.

**(d) False or overstated:** 3.2 (self-contradicted); 3.3 (inverted analogy); 3.5; 3.6 (core inference invalid; "psychologistic" is the wrong category); 3.9 (inconsistent with S3's own correct bounded-data caveat).

### S4. "The Social Cost of Modesty"

**(a) NO.** It matches my near-miss 7. The philosophy report §1.2(4) flags exactly this bridge: "orgulous (merging) opinions are testable and modest ones can evade tests. No philosopher has picked this up." So the thesis is P/D even though it is not in my top five.

**(b) Claims**

| # | Claim | Mark | Verdict |
|---|---|---|---|
| 4.1 | Orgulity, Belot, and the repairs (Elga, Huttegger, Weatherson) | P | Background. Note that the PAS framework covers Elga's finitely additive repair, not Weatherson's imprecise one. |
| 4.2 | Orgulity "is what makes an expert's claims testable" | P/D | **False as a general claim.** Every σ-additive opinion is orgulous (Pomatto–Sandroni Prop. 2) and has the Blackwell–Dubins property. Yet in the σ-additive setting, prequential, future-independent and bounded-data tests are *all* manipulable (Sandroni; O&S 2008; Shmaya; O&S MOR). Across the σ-additive literature orgulity is *held fixed*. The difference-makers are future-dependence plus unbounded data (Dekel–Feinberg, O&S AoS, O&S 2011), a rival (AW, FS), the **tester's** prior (Stewart), computability (Fortnow–Vohra, Hu–Shmaya) and non-convex paradigms. Orgulity is a difference-maker only in PAS 2014's *finitely additive* extension (Thm 2 vs Thm 3). Even there the positive result is a test on the full announced opinion with unbounded data, nonmanipulable only in the sense that for every ζ *some* cylinder surely fails it. |
| 4.3 | A know-nothing can pass *any* test a knower would pass; this is avoided *only* when experts must be confident that well-supported claims are true | P (Claim Validation abstract) | **False twice.** "Any test" is false for future-dependent tests. "Only" is false because Stewart, AW/FS and Hu–Shmaya avoid manipulation with no requirement on experts beyond the σ-additivity that the impossibility theorems also assume. The "only" comes from the Claim Validation *abstract*, which the econ report has not read [ABS], and it is relative to a finitely additive framework. |
| 4.4 | A modest expert cannot be distinguished from a charlatan | D (PAS Thm 2) | True within the finitely additive framework, for Savagean, Elga-style modesty. The implied converse (an orgulous expert *can* be distinguished) is false for records and for bounded data. |
| 4.5 | The orgulity debate concerns others' ability to hold her to account | N | Framing only. It inherits 4.2's problem. |
| 4.6 | Modest in credence, immodest in assertion | N | New, and it fits the formal fact that PAS restricts *announced* theories. But (i) it **deflates the thesis**: if only assertions must be orgulous, Belot's critique of orgulous *credence* is untouched, and the social function belongs to the form of announced theories, not to orgulity as an attitude. (ii) PAS's type-I clause is subjective: the expert "expects to pass by honestly reporting what he believes." A modest expert who asserts an orgulous theory she does not believe loses that guarantee. The proposed split breaks the clause that protects honest experts. |

**(c) New and important?** The credence/assertion split is new but self-undermining. Nothing in S4 is both new and important.

**(d) False or overstated:** 4.2 and 4.3 (core claims); 4.6 (undercuts the thesis). It also leans on an abstract-only source.

### Predictability tally

| | P | D | N | Matches a natural paper? |
|---|---|---|---|---|
| S2 | 7 | 1 | 0 | MATCH (N1) |
| S3 | 4 | 2 | 3 | PARTIAL (N1/N3/N5 plus a new frame) |
| S4 | 3 | 1 | 2 | NO (near-miss 7, flagged in the phil report) |

None of my three "surprising" theses (U1 ignorance as a resource, U2 test-awareness and sincerity, U3 the metaphysics of chance and convexity) appears in the slate. Two of them refute S2's headline claims: U1 against 2.8, U2 against 2.7.

### Ranking for a generalist journal, and bluntly

1. **S2: pursue, but not as written.**
   - *Strengths.* It is the most predictable paper in the space, but the space is empty in philosophy (priority check). Its core impossibility claims are accurate.
   - *Changes needed.*
     - Drop "no performance-based solution," which a Goldman-literate referee will refute from the two-expert framing.
     - Add the computability escape.
     - Stop calling a prior or a modelling restriction "trust."
     - Fix the Levy claim: the slogan is vindicated, his reason is reversed.
     - Qualify the field claim to type-I-controlled, prior-free, future-independent or finite-horizon tests among the members.
     - Reformulate 2.6 as *misattribution* plus a design remedy (blind current forecasts, or score value added over the visible crowd).
   - With U1 or U2 as a headline, it rises from a solid Phil Studies / Synthese / Episteme paper toward PPR / Noûs. As it stands it is a competent import whose thesis the research report already wrote.
2. **S3: highest ceiling, but wrong at its centre.**
   - "Psychologistic" and the Blockhead analogy will be rejected by any philosopher of mind. The separating property is a counterfactual *disposition*, and the charlatan is an anti-Blockhead.
   - Worth pursuing only as "expertise is modal, not actualist," with the anti-Blockhead contrast as the hook. Its AI section must be rerouted through computational bounds, because S3's own (correct) bounded-data caveat kills the "query the model" argument otherwise.
   - If repaired, it could beat S2 for a generalist venue. As written, it would not survive review.
3. **S4: do not pursue as a standalone paper.**
   - Its central claim (orgulity makes testing possible) is false in the standard σ-additive setting, where orgulity is universal and track-record testing is still impossible.
   - Its "only when" rests on an unread abstract, and its proposed resolution dissolves its own thesis.
   - Salvage: one paragraph in S2 or S3 noting that Elga-style finitely additive modesty makes an expert untestable (PAS Thm 2). Or, at most, a short Phil Sci / Ergo note after reading PAS 2014 and Claim Validation in full.

**Bottom line.**
- S2 is the paper to write, after cutting its overclaims.
- S3 has the better idea but needs its thesis inverted from "psychologistic" to "modal."
- S4 should be dropped.
- Nothing in the slate is both new and important as stated. The nearest is S2's tournament-parasitism point, which has to be restated as a claim about misattributed credit.
