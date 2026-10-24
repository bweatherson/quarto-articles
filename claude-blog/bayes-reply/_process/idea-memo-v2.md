# Idea memo v2: reply to Meehan & Zhang, "Bayes Is Back" (Phil Review 134(3): 285–350, 2025)

v1 corrected after a blind pretest (process/pretest-report.md) and an antecedent search (process/canon-check.md). Page numbers below are from the published version.

## 1. The problem
Conditionalization: on learning p, adopt π(·|p). Accuracy arguments (Greaves & Wallace 2006) vindicate it when learning is transparent. Externalists (Williamson 2000, 2014) hold that inexact knowledge has margins for error and so is opaque. With opaque learning, the expected-accuracy maximizer among evidence-dependent plans is meta-conditionalization (Schoenfield 2017). And conditionalization can be predictably biased or have negative value (Salow 2018; Ahmed & Salow 2019; Das 2023; M&Z Fact 3). Question: can accuracy vindicate conditionalization for agents with inexact knowledge?

## 2. M&Z's answer
Global evidential constancy (GEC) plus Hi-TEA: rules are compared by total expected accuracy summed with equal weight over all factive learning situations for the prior space (Fact 10). With weights λ, conditionalization is optimal iff λ is "extensional" (Fact 11, Lemmas 1–2, pp. 338, 344–345). They concede this is "bedrock" (p. 337): non-Bayesians may say "it also matters how likely it is for one to learn p at s" (p. 337). They also offer a two-level picture: clean high-level Bayesian rationality, messy low-level rationality (p. 338).

## 3. What is known (to be credited, briefly)
- The optimal λ-rule ∝ π(s)λ_p(s), and extensional ⇔ conditionalization optimal: M&Z's own Lemmas 1–2.
- The informal equivalence to "equal likelihood of using each learning situation": Easwaran's comment on Pettigrew's Substack, 20 Dec 2025. He also gives the reconstruction "chosen uniformly at random from the set of all propositions true at the world".
- Likelihood-weighted optimal updates: Gallow 2021 (Prop. 1); Isaacs & Russell 2023 (Thms 3–4, CAR in their setting); Easwaran & Nielsen 2025 §4.4.
- Statistics: extensionality is coarsening at random (CAR): Heitjan & Rubin 1991; Gill, van der Laan & Robins 1997; Grünwald & Halpern 2003 (Thm 3.1(d); Prop. 4.1 ≈ M&Z Fact 12); Gill & Grünwald 2008 (CAR mechanisms = mixtures of uniform multicovers).
- Williamson 2014 p. 980: in the clock, R(w) is "known only at w". Salow 2018: truth-centred margin evidence is exploitable, guess-centred evidence is not. Ahmed & Salow 2019 and Gallow's draft discuss centre-weighted credences on the clock (0.1/0.8/0.1; 80/10/10). E&N use centre-peaked signal likelihoods.
- Clock models that come out conditionalization-friendly (Carr 2021 §6.1; Isaacs & Russell's clock; E&N p. 1129) all use edge-allowing, uniform error. That is CAR.

## 4. New contributions (checked numerically: code/*.py)
N1 (margin corollary). Margin principle for a method: R(s) ⊆ E(s), with R reflexive (Williamson's margin for error under E = K). If every positively weighted learning situation respects a margin that is two-sided at every state (it contains each state's immediate neighbours on the scale; widths and shapes may otherwise vary by method and by state), then CAR forces every learned proposition to be the whole space. So no nontrivial learning is "at random". Proof: an endpoint s of a learned interval p has a neighbour outside p, so no such situation yields p at s, so λ_p(s) = 0. One line from GvdLR/GH Thm 3.1(d) or M&Z Lemma 2. Present it as a corollary, with its single-situation core credited to Williamson 2014 and Salow 2018.
- Scope (pretest's counterexample): mixtures that include one-sided-margin methods (zero margin on one side at some states) can be CAR. Example on Dana's scale: weights 2/7, 1/7, 1/7, 1/7, 2/7 on ({15},S,S), Dana's ({15,16},S,{16,17}), (S,{15,16},{16,17}), (S,S,{17}), (S,{16,17},S). So CAR needs learning that is exact at the edge of what is learned, in exactly compensating proportions.
N2 (what the equal-weight measure is). M&Z's counting measure is the uniform measure over learning situations that respect a margin of zero (factivity is the margin principle with R = identity). It is CAR because it is permutation-invariant (every permutation-invariant weighting is CAR; elementary). On a 6-point scale with margin 1, only 1/3 of its (state, evidence) pairs respect the margin. For interior states the share is 4^{−m}.
N3 (interior rule). For any weighting supported on situations respecting a fixed margin R, the λ-optimal GEC rule gives zero credence to rim(p) = {s ∈ p : R(s) ⊄ p} ("interior conditionalization"). Under the uniform such weighting, posterior ∝ π(s)/N(s) on int(p) (N(s) = number of propositions containing R(s)).
- Dana: {15,16} → δ15; {16,17} → δ17; S → (1/8, 3/4, 1/8). This is not M&Z's one-shot rule on S, which gives δ16.
- Olivia: [16,18] → δ17.
- Conservative mixtures (1−ε)·interior + ε·conditionalization also beat conditionalization (M&Z's own Fact 4 concavity technique). At ε = 0.3 on the clock this gives Ahmed & Salow's (0.1, 0.8, 0.1).
- Under M&Z's full measure, the interior rule is much worse: −1.60 vs −0.68 Brier, and −∞ under log.
N4 (diagnosis of the clock literature). CAR is the condition under which conditionalizing on p inherits three things: Greaves–Wallace optimality; the martingale property (expected posterior = prior); and non-negative value of information (checked: under M&Z's uniform measure, E[posterior] = prior and conditionalization beats the prior; under the margin-respecting weighting with Dana's prior, E[posterior] drifts to 0.63 on 16 and conditionalization is expected to be less accurate than the prior). So the anomalies of externalist evidence (Schoenfield's non-optimality, Salow's fishing, Das's biased inquiry, Ahmed–Salow negative value, M&Z Fact 3) share one source: margin evidence is not coarsening at random. The models in which they vanish are exactly the edge-allowing CAR models. Partitionality is the deterministic special case.

## 5. Thesis options (advisor to choose)
(T-narrow, a reply) M&Z's extensionality is CAR. For an agent who learns by a method with a two-sided margin (Olivia, Dana, the clock), no weighting over her possible learning is CAR, and M&Z's own principle selects interior-weighted rules. CAR, and with it Bayes, returns only through a reference class containing edge-exact learning (zero-margin or one-sided) in exactly compensating proportions; the equal-weight measure is the zero-margin case. Dilemma: weight the learning the agent can actually be doing, and accuracy rejects conditionalization; weight a compensating population, and the "explanation" of why she should conditionalize appeals to learning she knows she isn't doing. The two-level retreat concedes the point.
(T-broad, a problem paper with M&Z as main target) "Safe evidence is never random": margin-respecting evidence is never coarsening at random. CAR is what conditionalization needs to be accuracy-optimal, unbiased and valuable. So the anomalies of externalist evidence have one source, and the debate between margin models and guess models is a debate about whether evidence is coarsened at random. M&Z's rescue reinstates CAR by averaging over a structure-blind population. Externalist Bayesians must either (i) take evidential probability as primitive and give up the accuracy explanation, or (ii) accept edge-discounting updates for inexact evidence.
My preference: T-broad framing with T-narrow's dilemma as the core argument against M&Z. Generalist hook: Williamson's anti-luminosity meets Monty Hall.

## 6. Objections to prepare
- O1 (M&Z): total expected accuracy is defined over all factive situations; impartiality across methods is the point (pretest §3 gives their best version). Reply: impartial over what? Permutation-invariant impartiality is structure-blindness. Impartiality across the methods an inexact learner could use (two-sided margins) is never CAR (N1). CAR needs edge-exact learning in exact proportions, i.e. a knife-edge.
- O2: The interior rule is overfitted and absurd. Reply: present it as the reductio horn. The softened rule is the plausible one, and it is not Bayes.
- O3: Importance vs frequency readings of λ. N1 is interpretation-neutral.
- O4: Evidence need not be knowledge or safe. Then opacity needs a non-margin source, but M&Z's own cases are margin cases.
- O5: Fallibility. Uniform weighting over non-factive situations makes the dogmatic rule optimal (pretest 4(c); Pettigrew's post). So conditionalization sits at the knife-edge between margins, which push toward the interior, and fallibility, which pushes toward the prior. Possible short section or footnote.
- O6: Maximin aggregation gives dogmatism (pretest 6). Footnote at most.

## 7. Risks
- Formal novelty is modest: N1 is a corollary, N2 is elementary, N3 is a derivation plus examples, N4 is a synthesis. Value lies in the diagnosis.
- "Reply to one paper" and "about a literature" (screening criteria 1–3). T-broad mitigates this.
- Must not overclaim "never CAR" (pretest counterexample).
