# Pretest report: predictable replies to Meehan & Zhang, "Bayes Is Back" (Phil Review 134(3), 2025)

## Phase 1 (blind)

Written after reading only `research/texts/target.txt` (the whole paper, including footnotes and the appendix proofs). I opened nothing else in `bayes-reply/` before saving this section. I checked the numbers with Python scripts in my session scratchpad, not in the project folder.

### 0. The paper in one paragraph, and what checks out

Meehan & Zhang (M&Z) start from a known result. If evidence can be opaque, Bayesian conditionalisation (bcond) does not maximise expected accuracy (EA) among evidentially constant (EC) rules. Schoenfield's meta-conditionalisation (meta-cond) does better, and so do the dogmatic rule (in Dana's case) and mixtures of bcond and meta-cond. Their answer has two parts.

- **Global evidential constancy (GEC).** This is EC plus non-contrastiveness (NC). By Fact 5, a rule satisfies GEC iff it factors as f*(S,π)(p), so it ignores the learning situation E except through E(s). They motivate NC through idempotence (Fact 6).
- **Hi-TEA.** Among GEC rules, the rational rule maximises total expected accuracy (TEA), the unweighted sum of EA over all factive learning situations on a prior space.

Fact 10 says bcond uniquely maximises TEA. Fact 11 says it still does under a weighting λ of learning situations iff λ is "extensional". Fact 12 says a point-mass λ on E is extensional iff E is transparent.

I checked every worked number and found no errors in the results.

- **Brier tables.** Table 1 (−2.08/−2.25), Table 2 (−6.8 vs −2.72), Table 3 (−4.48), Noah (−1.6 vs −1.12) and Dana's left hand (−2.4 vs −0.6) are all correct. Their Brier score sums over all 2^|S| propositions.
- **Fact 3.** It holds for the additive log score too: −3.3666 vs −3.3476.
- **Proofs.** The proofs of Facts 4–12 are correct.

Only minor slips turned up:

- **Mixture definition.** It is missing "(s)" on g.
- **Lemma 2.** It is stated "for all (S,π)", but λ is defined relative to a single prior space.
- **Table 3 prose (p.30).** It says conditionalising on any p other than Dana's evidence gives "a more accurate" credence than the prior. For p = S it gives an equal one.
- **Fact 8, part 2.** The "ϵ < δ/2" bound takes Euclidean distance over states. Over all propositions the constant changes.

So a reply cannot be a "the theorem is false" reply. It has to be about interpretation, motivation or robustness.

Three facts structure the space of objections. I verified each.

- **(F1) Opacity drops out.** For GEC f, TEA(f) ∝ Σ_p π(p)·E_{π(·|p)}[A(f(p))] = ½ Σ_{∅≠p⊊S} EA(f; E_p) + EA(f; E_triv). Here E_p is the transparent binary problem {p, S∖p} and E_triv is the trivial problem. So, up to a constant, TEA is a positive sum of EA over transparent problems only. On Dana's space this gives exactly −2.72 / −4.48 / −6.8 for bcond / dogmatic / one-shot.
- **(F2) Symmetry gives extensionality.** If 𝒞 is any class of learning situations closed under permutations of S, then uniform weighting over 𝒞 is extensional. Proof: a transposition (s s′) with s, s′ ∈ p fixes p and maps {E: E(s)=p} bijectively onto {E: E(s′)=p}. So bcond also maximises uniform TEA restricted to:
  - S4 frames;
  - symmetric (KTB) frames;
  - *opaque-only* frames.

  I checked this numerically on 3 and 4 states.
- **(F3) Extensionality is coarsening at random.** Normalise λ to a credence over learning situations that is independent of the state. Then λ_p(s) ∝ Pr(learn p | s), and extensionality says this is constant on p. That is exactly the CAR condition of Heitjan & Rubin (1991), Gill, van der Laan & Robins (1997) and Grünwald & Halpern (2003). CAR is the condition under which "naive" conditioning on the observed set equals "sophisticated" conditioning on the event of observing it. M&Z do not cite this literature. Their only nearby discussion is the Pearl/Monty Hall footnote 21.

---

### 1. Opacity does no work: the result is Greaves–Wallace with GEC glued on

**Objection.** By F1, among GEC rules Hi-TEA is equivalent to this simpler principle:

> **(GW+)** f is rational iff f is GEC and f maximises EA in every transparent updating problem.

Each summand in F1 is maximised separately by π(·|p) (Greaves & Wallace / Fact 1), and Fact 10 is just the sum of these. The proof of Fact 7 already shows this structure: it reaches the opaque case by moving to the transparent problem {p, ¬p}. So the accuracy part of the explanation is the internalist's explanation. Bcond is carried into opaque problems by GEC, a constraint that M&Z explicitly say is *not* accuracy-based (§4.3; fn 24). In the motivating cases (Dana), the agent expects bcond to do worse than dogmatism by her own lights. Nothing about accuracy in *her* problem explains why bcond is right for her. So the promised "externalist" vindication that "respects a connection between accuracy and rationality" for opaque learning is not delivered. What is delivered is "internalist vindication + evidentialist supervenience". That is close to the evidential-probability view the paper set aside in §1 and §3.

**Damage.** It is real but partial. M&Z half-concede it in the discussion of Fact 12 ("Greaves and Wallace's result is really a special case..."). They also have a good reply, by F2: bcond *also* uniquely maximises uniform TEA when we sum over **opaque problems only**. So the crude claim, that the result piggybacks on transparent problems, is false. The refined claim, that once GEC is imposed opaque problems carry no accuracy information that transparent ones lack, is true. But it reads more as a deflationary gloss than a refutation. A critic who centres this needs the deeper diagnosis in objection 3.

**Probability a competent critic makes this central: ~0.30.** This is the most obvious move for anyone who reads the proofs of Facts 7 and 10 closely.

---

### 2. Non-contrastiveness / idempotence begs the question against the opponent (and fails in opaque cases)

**Objection.** GEC does almost all the work: given GEC, bcond follows from transparent cases (objection 1). So the argument for NC carries the paper. That argument is weak in four ways.

- **(a) Fact 6 is NC restated.** Formal idempotence compares two *one-shot* problems, E and E∧E′. It is not sequential learning. The sequential intuition ("learning p again shouldn't move you") is idempotence*, which needs Accumulation, and meta-cond rejects Accumulation. So Fact 6 does not supply an independent intuition.
- **(b) The second learning can add higher-order information.** In M&Z's own Dana variant (fn 29–30), take the joint situation E_R ∧ E_L, where E_R is the opaque right-hand problem (Dana's original) and E_L is the transparent left-hand one. The joint situation equals E_L, so it is transparent. At 15oz, the second experience gives Dana no new first-order information. It does give her knowledge *that* {15,16} is what she has learned. Idempotence requires this higher-order gain to be idle. That is exactly the point at issue with Dorst-, Salow- and Schoenfield-style opponents. The reply in §4.3, which appeals to ex ante planning and a sleepy-traveller analogy, is about later irrational doubt, not about learning.
- **(c) Opaque Monty Hall.** Take states (car door, door Monty opens) with prior (1/6, 1/6, 1/3, 1/3). Suppose the agent learns only "goat behind 3" (opaque, in Bronfman's sense). Bcond gives car-at-1 : car-at-2 = 1/2 : 1/2. Meta-cond gives 1/3 : 2/3, the protocol-sensitive answer. NC just *is* the demand that the protocol be ignored. M&Z concede in fn 21 that the opaque Monty Hall case is unclear, so NC is not independently established for exactly the cases where it is needed.
- **(d) The paper concedes the point.** M&Z themselves say (§5.3) that anyone sceptical of GEC "must also be skeptical of bcond". The explanation therefore presupposes bcond's defining structural feature. Taken at face value, it is no explanation to anyone who doesn't already accept that feature.

**Damage.** Potentially high: if NC is unmotivated, Hi-TEA has no non-question-begging input. But it turns into a clash of intuitions about higher-order evidence, and M&Z can say they only aim to show the externalist Bayesian "has a leg to stand on".

**Probability: ~0.30.** This is the natural centre for a higher-order-evidence or Dorst/Salow-style critic.

---

### 3. Hi-TEA is conditionalisation behind a veil of ignorance: the theorem is CAR

**Objection.** This is formal and, I think, new. Let 𝓔 be the set of factive learning situations on S. Build the *veiled* problem:

- states Ω = S × 𝓔;
- prior P(s, E) = π(s)/|𝓔|;
- evidence Ê(s, E) = E(s) × 𝓔, so the agent learns that the state is in E(s) but does **not** learn which learning situation she is in.

Then:

- **(i) GEC = EC behind the veil.** By Fact 5, on this prior space the GEC rules are exactly the plans for the veiled problem that are evidentially constant.
- **(ii) TEA is veiled EA.** TEA(f) = |𝓔| · EA_P(f) for every rule f. This is the subjective reading of Carr (2021) that M&Z mention in fn 35 and then disclaim.
- **(iii) The veil satisfies CAR, so meta-cond collapses to bcond.** Pr(learn p | s) = (2^{|S|−1})^{|S|−1} / |𝓔| = 2^{−(|S|−1)}, which is constant on p. Meta-cond in the veiled problem is P(· | Ê = p × 𝓔), and its S-marginal is π(·|p). So **Fact 10 is Schoenfield's theorem (Fact 2) applied to the veiled problem, where CAR makes meta-cond and bcond coincide.**
- **(iv) Facts 11 and 12 are known results.** Fact 11 is the CAR characterisation: under the veil prior λ, naive conditioning is optimal iff CAR. Fact 12 is the known fact that a deterministic coarsening satisfies CAR iff it is a partition (Gill et al. 1997; Grünwald & Halpern 2003).

**Why it damages the main claim.** It shows what "accurate in general" means: expected accuracy *for an agent who does not know her own learning situation and spreads credence over all of them uniformly*. NC is the informational constraint of the veil: respond only to E(s), never to E. M&Z then face a dilemma, using their own fn 35 distinction.

- **Subjective reading.** The vindication applies to veiled agents, not to Dana, who by stipulation knows E. For a real agent with *non-uniform* uncertainty about her learning situation, CAR generally fails, and her best plan is the veiled meta-cond, which is non-Bayesian.
- **"Objective" reading (M&Z's).** The uniform veil prior is an indifference prior over learning situations. Its only credential is symmetry (F2), and symmetry is exactly what the externalist's motivating cases lack (objective 4).

Either way, the result shows that bcond is right in the sense of making opacity average out into CAR-transparency, not in a sense on which opacity is respected. So "Bayes is back" is an internalist vindication for a fictional agent.

**What M&Z can say back.** "Yes, that's the rule-level point of view; high-level rationality abstracts from structure" (their two-level remark, §5.3). The critic's answer: then high-level Bayesian rationality is the rationality of agents who are blind to the structure of their own evidence. That is not an *externalist* Bayesianism.

**Probability: ~0.15.** It needs familiarity with the CAR / naive-vs-sophisticated conditioning literature. Anyone who has worked on Monty Hall-type updating or the Grünwald–Halpern material is likely to see it.

---

### 4. The weighting is not neutral: extensionality = structural blindness, and natural weightings reverse the verdict

**Objection.** M&Z concede (Fact 11) that the verdict depends on extensional weighting and call this "bedrock". The critic shows the bedrock is in the wrong place, in four steps.

- **(a) Extensionality is just symmetry.** By F2, extensional weightings include every uniform weighting over a permutation-invariant class. Extensionality is guaranteed by ignoring all structure on S beyond its cardinality.
- **(b) Respecting the margin structure reverses the verdict.** The externalist's motivating cases (Williamson's clock, Olivia, Dana) get their opacity from *metric* structure. Weight uniformly over the *symmetric margin-for-error frames* for that metric, E(s) = {t : |t − s| ≤ δ_s}. This weighting is non-extensional, and the TEA-optimal GEC rule is f(p) = π(·|λ_p). That is an "interval-reading" or midpoint rule: on learning an interior interval, be (nearly) certain of its midpoint. I computed Brier averages:

  | Prior space and class | Optimal rule's avg EA | bcond avg EA |
  |---|---|---|
  | 6-state line, uniform prior, δ_s ∈ {0,1,2} independently (729 frames) | −1.78 | −7.20 |
  | Dana's space, constant δ ∈ {0,1,2} | −0.43 | −0.77 |

  On Dana's space the optimal rule is f({15,16}) = δ₁₅, f({16,17}) = δ₁₇, f(S) = (1/8, 3/4, 1/8). This is a GEC rule that reproduces the truth rule in Olivia. It is the very "meta-cond in Bayesian clothing" the paper was built to exclude.
- **(c) The verdict depends on factivity.** Weight uniformly over *all* learning situations E: S → 𝒫(S)∖{∅}, factive or not. Then λ_p is constant on all of S, and the TEA-optimal rule is the **dogmatic** rule. Mixing in fallible situations with weight η gives "shrunk" conditionalisation. So the Bayesian verdict holds only at the knife-edge where every counted situation is factive. M&Z say they are "not wedded" to factivity (fn 4).
- **(d) The continuum case.** For continuous S (Olivia is naturally continuous), there is no uniform measure over learning situations, so the "neutral" weighting gives out exactly where it is needed.

**Damage.** Moderate to high, because it turns M&Z's concession into a reversal for the very cases that motivate them. It is weaker as a standalone point than as a corollary of objection 3, since M&Z can repeat the two-level reply.

**Probability: ~0.20.** Many critics will start from the authors' own Fact 11 discussion. Fewer will produce the margin-frame or non-factive counterexamples.

---

### 5. Rule vs plan: GEC never constrains any agent's plan, so Dana's rationality is fixed by Noah's accuracy (rule-consequentialist collapse)

**Objection.** For any single problem (S,π,E), every EC plan extends to a GEC rule. M&Z's own "one-shot" construction does this: set f*(p) = g(s) for s with E(s) = p, and use bcond elsewhere (Fact 5). So GEC places *no* restriction on what any individual agent may plan, beyond within-problem EC. All the normative pressure on Dana's plan comes from aggregating accuracy over counterfactual agents in problems she is not in. In ethics, rule-level evaluation over act-level evaluation is justified by followability, publicity, teachability or coordination. M&Z explicitly disown followability as the basis of GEC (§4.3), and none of the others applies to a single idealised agent planning her own updates. Their §5.3 reply to "why should Dana care?" ("our proposal is pitched at the externalist Bayesian") only restates that GEC is assumed. The jaywalking analogy fails because the reasons why rules beat acts in that case are absent here.

**Damage.** Significant for the claim that rationality is "truth-conducive (in a sense)". The sense turns out to be: conducive to truth for others. M&Z anticipate a version of this (§5.3, fn 37), but their answer is thin.

**Probability: ~0.20.** It is a natural centre for an ethicist-epistemologist or a Gallow / Isaacs–Russell sympathiser.

---

### 6. Aggregation: why the sum? Maximin (the Rawlsian veil) selects dogmatism

**Objection.** "Most accurate in general" is a choice of social-welfare-style aggregator over problems. M&Z use the sum, a utilitarian / Harsanyi aggregator. Use instead the robust, Rawlsian maximin aggregator, min_E EA(f; E). The trivial problem caps every rule's worst case at E_π A(π) (by propriety), and the dogmatic rule reaches that cap in every problem. So the dogmatic rule is always maximin-optimal. Bcond is maximin-optimal iff no factive E on the prior space makes bcond worse than the prior. That fails on Dana's space (−1.188 vs −1.12). Over 300 Dirichlet-random priors on three states with Brier scoring, it fails in about 85% of cases. So "Bayes is back" holds for Harsanyi's veil and fails for Rawls's.

**Damage.** Moderate. M&Z can defend sum-aggregation as the natural "average-case" notion. But it shows that the aggregator, not accuracy, decides between bcond and dogmatism.

**Probability: ~0.06.** It is usually a section of a reply, not its centre.

---

### 7. Model-relativity: "same prior over S" requires leaving the agent's knowledge of her learning situation out of the model

**Objection.** NC applies only between problems with the *same prior space*. Dana and Noah share a prior over weights, but they differ in what they know about their own learning: Dana is certain of biconditionals that Noah is not (fn 22). M&Z's own standard of model adequacy, applied to Litmus and to Monty Hall in fn 21, requires the protocol to be represented in S. Apply that standard to Dana and Noah and they no longer share a prior space, so NC is silent. Alternatively, keep S coarse, so that states are individuated only by weight and facts about evidence sit outside the model. Then the quantification over "all learning situations on S", used in both NC and TEA, ranges over situations that are incoherent with what the states represent. In a model whose states encode what the agent learns, only one learning situation is coherent, so NC is vacuous and TEA reduces to EA in that one problem, where meta-cond wins.

**Damage.** Potentially high, because it attacks the coherence of the formal frame. But it is easy to make vague, and M&Z flag it as a "subtle issue" (fn 19, 22).

**Probability: ~0.10.**

---

### 8. The followability route was dismissed too quickly, and Hi-TEA vindicates an unexecutable plan

**Objection.** By M&Z's own luminosity point (§3.3, item 4), bcond is non-luminous in every opaque problem. They also concede that diachronic continence fails in Dana (§4.3). So what Hi-TEA vindicates is an ex ante plan that the agent cannot know she is executing. Meanwhile M&Z reject Margin-style followability arguments that would rule out the mixtures. A defender of Gallow, Isaacs & Russell or Schultheis-style views will argue the following. An explanation of rationality that ignores whether the plan can be carried out answers a different question. The "explanatory challenge" (why bcond and not the truth rule) is best *dissolved*, not answered, and Hi-TEA's normative GEC is ad hoc relative to it. A related version presses Locality and Margin. Margin is plausible only for rules whose sensitivity the agent can track, and in opaque problems the agent cannot track bcond's.

**Damage.** Low to moderate. It mostly restates a rival programme that M&Z explicitly set aside.

**Probability: ~0.08.**

(Lower-ranked ideas I considered and dropped: scoring-rule dependence (Fact 8 already removes it); a mistake in Fact 9's counting (none: (2^d)^d is correct); and permissivism / non-deterministic rules (M&Z discuss it via Pettigrew 2020).)

---

### Which one I would write

**I would write objection 3, "Bayes behind the veil", with objections 1, 4 and 6 as its corollaries.**

Reasons:

1. **It explains the result instead of just complaining about it.** It shows in a few lines that Facts 9–12 are known results: CAR, plus Schoenfield/Greaves–Wallace applied to a veiled problem. That gives the reply a solid formal core that doesn't depend on contested intuitions about higher-order evidence, which objection 2 does.
2. **It turns M&Z's concessions into a dilemma.** The concessions are the "bedrock" remark on extensionality, fn 35's objective vs subjective reading of TEA, and the two-level picture. On the subjective (Carr) reading the vindication is for agents who do not know their learning situation, which is not Dana. On the objective reading the uniform veil is an indifference prior, justified only by symmetry (F2).
3. **It generates new and checkable counter-results:**
   - a structure-respecting veil (margin-for-error frames) gives the midpoint / one-shot rule;
   - a non-factive veil gives dogmatism;
   - a Rawlsian (maximin) veil gives dogmatism.

   These show that bcond depends on a uniform, structure-blind, factive, Harsanyi-style veil, each feature doing real work.
4. **It reframes objection 1 correctly.** The issue is not that transparent problems secretly do the work: by F2, opaque-only aggregation also gives bcond. The issue is that *symmetric averaging makes opacity CAR-transparent*. That version survives M&Z's best reply to objection 1.
5. **The upshot is clear and fair.** M&Z's theorem is correct and illuminating, but it vindicates bcond for agents who treat their opacity as noise that averages out. That is the internalist's theorem for an agent behind a veil, not an externalist vindication.

---

## Phase 2

Written after saving Phase 1 and then reading `process/pretest-phase2.md` and `process/candidate.md`. I did not open `code/` or `_NOTES.md`. I re-checked everything with my own scripts.

### 1. Prediction

**Overall match.**

- **The candidate's formal core is my Phase 1 objection 3**, "Hi-TEA is conditionalisation behind a veil; the theorem is CAR". I gave that objection **p ≈ 0.15**.
- **Its thesis is my objection 4(b)**: a weighting that respects the margin structure is non-extensional and reverses the verdict towards a midpoint / one-shot-type rule. I gave objection 4 **p ≈ 0.20**.

My stated top pick was "objection 3 with 4 as corollary". The candidate is that reply with the emphasis reversed: the margin theorem is the headline and CAR is background. I would put the probability that a competent critic makes *one of 3 or 4* central at about 0.3. For the candidate's specific headline, a general theorem that "margin-respecting learning is never CAR", my estimate is about 0.10. In Phase 1 I had an instance of it on two small examples, but not the general R-closure argument.

**Point by point.**

| Candidate point | Predicted? | Where in Phase 1 |
|---|---|---|
| 1. Reduction to an auxiliary problem; Facts 10–12 = CAR results | **Yes** | F3 and objection 3 (i)–(iv). I built the veiled problem with *opaque* evidence E(s)×𝓔 and used Schoenfield's theorem. The candidate uses the *transparent* cell "the proposition I learned is p" and Greaves–Wallace. The two constructions are equivalent. |
| 2. Permutation-invariant weighting ⇒ CAR | **Yes** | F2, with the same transposition proof. |
| 3. Margins ⇒ not CAR | **Partly** | Objection 4(b): I showed numerically that weighting margin-for-error frames is non-extensional. I did not have the general R-closure / connectedness argument. |
| 4. Interior rule, including the Dana numbers δ₁₅ / δ₁₇ / (1/8, 3/4, 1/8) | **Partly (largely)** | Objection 4(b) has exactly these Dana numbers and the midpoint rule for interior intervals. I did not characterise the rule as conditioning on int(p) with weight 1/N(s), and I did not state the conservative-mixture corollary for this weighting. |
| 5. Uniform measure: 1/3 → 1/4 → 4^{−m} margin-respecting pairs; "exact cancellation"; mixed domains not CAR | **No** | Nearest is my "structure-blindness" diagnosis. The quantities and the cancellation decomposition are new to me. |
| 6. GEC doesn't block meta-cond's verdicts in margin cases | **Yes** | Objection 4(b) ("meta-cond in Bayesian clothing", truth rule in Olivia) and objection 5 (GEC constrains no individual plan). |

### 2. Soundness of points 1–4 (my own checks)

**Point 1 (reduction): correct.**

- With P(s, E) = π(s)λ(E)/Σλ, the cells C_p = {(s, E): E(s) = p} partition S × 𝓔 and are factive, so the auxiliary problem is transparent.
- TEA_λ(f) = Σλ · EA_P(f) holds for any GEC f.
- The score depends only on the S-coordinate. So, by strict propriety, the best S-credence on C_p is the S-marginal of P(·|C_p), which is π(·|λ_p) (Lemma 1).
- Pr(learn p | s) = λ_p(s)/Σλ is a genuine conditional distribution over p for each s, so "λ_p constant on p" is exactly CAR.
- Two small caveats:
  - The "iff" needs E_π[λ_p] > 0; when λ_p ≡ 0 the rule is unconstrained.
  - The accuracy is scored on the S-marginal, not on Ω. This is harmless but should be said.
- **Literature.** Verified: Pettigrew's Substack post "Bayesianism when learning isn't straightforward" (20 Dec 2025) has a comment by Kenny Easwaran that day. He says the uniform weighting is "basically equivalent to assuming you are equally likely to be using it in any of these situations", and reconstructs the signal as "chosen uniformly at random from the set of all propositions true at the world". So the reduction in point 1 **is anticipated**. I could *not* verify the Easwaran & Nielsen 2025 citation (§4.4, p.1120) or "Isaacs & Russell 2023 Theorem 4" by web search, and they need checking.

**Point 2 (permutation invariance ⇒ CAR): correct.**

- Let E^σ(σs) = σ(E(s)). If λ(E^σ) = λ(E) for all σ, then for s, s′ ∈ p the transposition (s s′) maps {E: E(s) = p} onto {E: E(s′) = p} bijectively, preserving weight.
- The condition is sufficient, not necessary.
- M&Z's counting measure satisfies it.

**Point 3 (margins ⇒ not CAR): the argument is valid, and the margin premise is fair locally. But the theorem relies on an unstated premise that is not part of the margin principle, and without it the headline is false.**

*Validity.* Suppose every E with λ(E) > 0 satisfies R(s) ⊆ E(s). Then λ_p(s) = 0 whenever R(s) ⊄ p. CAR then requires every learned p to be R-closed. For a symmetric, connected R, the only nonempty R-closed set is S. So there is no nontrivial learning. (If R is not symmetric, "R-connected" must mean *strongly* connected, and the candidate should say so.) I verified the formula λ_p(s) = (Π_t N(t))/N(s) · 1[R(s) ⊆ p] by enumeration for n = 3 and n = 4.

*Fairness.* "R(s) ⊆ E(s)" is a fair rendering of Williamson's margin-for-error principle under E = K, *for a given agent using a given method*.

*The unstated premise.* The theorem additionally needs that **one fixed, symmetric, connected closeness relation R governs every learning situation that gets positive weight**. Williamsonian safety is relative to the method. Different hands, instruments and gauges have different margins, and some have one-sided error. Once margins vary from method to method, margin-respecting learning *can* be CAR with nontrivial learning. Two counterexamples, both checked by script:

- **(a) Same symmetric margin structure, different closeness graphs.** Take Dana's frame {15:{15,16}, 16:S, 17:{16,17}} and its two images under permutations of {15,16,17}. Each one respects a symmetric, connected margin relation (a path graph). The uniform weighting over the three is CAR. More generally, take the class of all factive E that respect *some* symmetric connected R; equivalently, E's symmetric accessibility graph is connected. That class is permutation-invariant, so by point 2 it is CAR. On three states it has 10 members, 9 of them nontrivial. Weakness: the other two graphs are not "closeness on a weight scale". This counterexample works for an abstract agenda, or for confusion structures such as aliasing, not for a magnitude.
- **(b) Fixed geometry (Dana's own scale), interval evidence only, one-sided margins.** Use these weights:

  | Weight | Learning situation (15 / 16 / 17) | Margin respected |
  |---|---|---|
  | 2/7 | {15} / S / S | left margin R_L(s) = {s−1, s} |
  | 1/7 | {15,16} / S / {16,17} (**Dana's own situation**) | symmetric |
  | 1/7 | S / {15,16} / {16,17} | R_L |
  | 1/7 | S / S / {17} | right margin R_R(s) = {s, s+1} |
  | 2/7 | S / {16,17} / S | R_R |

  Check that it is CAR:
  - λ_{15,16} = (1/7, 1/7);
  - λ_{16,17} = (2/7, 2/7);
  - λ_S = (4/7, 4/7, 4/7).

  Every situation's evidence is a convex interval and is safe relative to its own method's margin. By Fact 11, bcond is TEA-optimal for this mixture, even though it gives positive weight to Dana's symmetric-margin situation. The LP finds such mixtures for n = 3, 4 and 5. With *symmetric* margin-1 situations alone it finds none, which agrees with the candidate's theorem.

*Consequence.* The thesis sentence ("learning with a margin for error ... is never CAR") is overstated. The correct statement is about weightings supported on situations that share one symmetric, connected R. The "unsafe evidence" diagnosis only makes sense relative to that fixed R: evidence the candidate calls unsafe is safe for a method with a finer or one-sided margin. The more robust diagnosis is the candidate's own point 2: M&Z's measure wins because it is blind to structure, not because it weights the impossible.

**Point 4 (interior rule): correct, with two inaccuracies.**

*Verified on Dana's space* (the margin-respecting class has 4 situations):

- the rule maps {15,16} → δ₁₅, {16,17} → δ₁₇ and S → (1/8, 3/4, 1/8);
- in Olivia, learning [16,18] gives int = {17};
- the λ-TEA comparisons:

  | Rule | λ-TEA, Brier | λ-TEA, additive log |
  |---|---|---|
  | interior rule | −0.650 | −2.105 |
  | bcond | −1.154 | −3.357 |
  | (1−ε)·interior + ε·bcond, ε = 0.1 | −0.655 | −2.170 |

  The mixture is GEC and conservative, and still beats bcond, as concavity guarantees.

*Inaccuracies:*

- "That is M&Z's own one-shot foil on the opaque evidence" is true only for {15,16} and {16,17}. On S, which Dana learns at 16oz, the one-shot rule gives δ₁₆ and the interior rule gives (1/8, 3/4, 1/8). Dana's EA under the interior rule is −0.1125: between bcond (−1.188) and meta-cond (0).
- The candidate omits a fact M&Z will use against it. Under M&Z's own full measure, the interior rule's TEA is −1.597 (Brier), against −0.680 for bcond, and **−∞** under the log score.

There is also a gap: when int(p) = ∅, λ_p ≡ 0 and the rule needs a default.

*(Points 5 and 6, briefly.)*

- The 1/3 → 1/4 → 4^{−m} fractions are correct. They are unweighted (state, evidence) pairs: 5/12 for n = 3, 3/8 for n = 4, 1/3 for n = 6.
- The "exact cancellation" decomposition λ_p = c·1[R(s) ⊆ p] + c·1[s ∈ p, R(s) ⊄ p] = c·1_p is correct.
- "Mixed domains are not CAR" is true *for transparent + fixed-R margin* mixtures. It is false for mixtures with one-sided-margin methods, per counterexample (b).
- Point 6 is correct in Olivia. In Dana it holds only on {15,16} and {16,17}.

### 3. The strongest reply Meehan & Zhang could give

"The critic's theorem is a special case of Fact 11, which we stated and discussed (§5.3): any non-extensional weighting dethrones bcond. What is new is the claim that margin-for-error learning is *intrinsically* non-extensional. That claim holds only if a single symmetric closeness relation governs every learning situation in the reference class. The margin principle requires no such thing. Safety is relative to the method: Dana's left and right hands have different margins, and a gauge that can only under-read has a one-sided margin. Our prior spaces (S, π) carry no metric, and the closeness relation belongs to the learning situation, not to the space. Let margins vary as methods do, and margin-respecting learning is CAR. On Dana's own scale, Dana's situation mixed with one-sided-margin gauges, each yielding interval evidence safe by its own lights, gives an extensional weighting under which bcond is optimal. So the evidence the critic calls 'unsafe' is unsafe only for one method. Our measure does not weight the impossible. It is impartial across methods, and impartiality across the p-states is precisely the content of extensionality we defended.

"The 'interior rule' confirms our picture rather than undermining it. It turns the shape of the evidence into near-certainty about where the truth lies by encoding one mechanism's geometry. Under an impartial measure it is badly inaccurate: −1.60 vs −0.68 Brier on Dana's space, and −∞ under the log score. It is the updating counterpart of a rule tuned to a single jaywalking intersection. That some rule beats bcond when we already know which mechanism produced our evidence is exactly what we conceded in Facts 3, 8 and 12. Our closing two-level picture already allows low-level, mechanism-sensitive rationality to depart from high-level Bayesian rationality. The critic has given a nice example of the low level. They have not shown that the high-level vindication fails."

**Does the candidate survive?** Partly.

- **What M&Z's reply breaks.** Point 3's headline ("never CAR") and the "unsafe evidence" rhetoric do not survive as stated. Counterexample (b) is on Dana's own scale and contains Dana's own situation.
- **What remains.** A sharper version of the dilemma survives. In the paradigm cases (one agent, one method, known geometry), the "impartial" measure that vindicates bcond gives weight to methods the agent knows she is not using. So Hi-TEA does not explain why *she* should conditionalise, and the two-level retreat concedes that accuracy does not vindicate bcond at the level where the explanatory challenge arose.

That is a real point, but it is close to the extensionality "bedrock" M&Z already conceded. So the candidate's contribution is a precise and well-illustrated sharpening, not a refutation. Its novelty is also reduced: point 1 is anticipated (Easwaran's comment), and point 3 is elementary.

### 4. Verdict: **PURSUE WITH CHANGES**

The three most important changes:

1. **Re-scope point 3 and reframe the thesis.**
   - State the theorem with its real premises: one fixed, symmetric, (strongly) connected R shared by all positively weighted situations.
   - Drop "never CAR" and the unrelativised "unsafe evidence" language.
   - Confront the method-relativity reply head-on, using counterexample (b). Argue that, for the externalist's paradigm agent (one method, a margin structure she knows), the relevant reference class holds R fixed. Alternatively, make the paper an explicit dilemma: a structure-respecting measure gives the interior rule (a reductio of the accuracy route); a structure-blind or method-impartial measure gives bcond, but not as an explanation for the paradigm agent.
2. **Re-centre on what is new, and fix the novelty record.**
   - Present the CAR / auxiliary-problem reduction as background. Credit Easwaran's 20 Dec 2025 Substack comment and Grünwald & Halpern.
   - Verify the Easwaran & Nielsen 2025 and Isaacs & Russell Thm 4 citations (I could not).
   - Search Salow 2018, Das 2023, Dorst, Gallow 2021 and Schultheis for the margin observation.
   - Lead with the margin dilemma and the cancellation analysis (point 5), which are the genuinely new parts.
3. **Handle the interior rule honestly.**
   - Correct the "one-shot foil" claim: the rules differ on S, (1/8, 3/4, 1/8) vs δ₁₆.
   - Specify a default when int(p) = ∅.
   - Say up front that under M&Z's full measure the interior rule is far worse (−∞ under log), and present it as the *reductio horn* of the dilemma, not as a rival rule anyone should adopt. Otherwise the overfitting reply in §3 above wins.
