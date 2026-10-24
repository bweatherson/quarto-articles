# Screening report A: "Bayes at the Edge" (paper-v4-as-screened.qmd)

- **Paper title:** Bayes at the Edge
- **Word count:** about 5,300 (body, excluding the 210-word abstract and the references); 29 works cited
- **Thesis summary:** Suppose every way an agent learns about a magnitude leaves a margin for error around the truth ("two-sided" learning). Then conditionalization is accuracy-dominated, under the simple log score and every additive, continuous, strictly proper score, by a single globally evidentially constant rule that withdraws credence from the rim of what is learned. Meehan and Zhang's total-expected-accuracy vindication therefore holds only because their equal weighting is "coarsening at random": it counts learning in which the truth sits at the edge of what is learned. Accuracy instead rewards certainty that is not knowledge, so for inexact knowers, what makes conditionalization rational is not its accuracy.
- **Verdict:** NOT READY

## Deal-breakers

**Criterion 4: an obvious objection to the headline thesis goes unanswered.** The paper's thesis reaches beyond the target in its abstract ("what makes conditionalization rational is not its accuracy") and its conclusion ("For inexact knowledge she cannot have all three"). Zendejas Medina 2024 (*Philosophers' Imprint*) directly denies that thesis. Medina gives an accuracy-theoretic argument for conditionalizing on opaque evidence, explicitly including Williamson-style clock cases. The argument combines conditional expected accuracy with "epistemic admissibility": plans are conditioned on what is learned, not on the fact that it is learned.

The author could have seen this. Meehan and Zhang single Medina out in their second footnote (p. 287) as "One exception" to the externalists who give up on an accuracy explanation. Schultheis 2025 (n. 4), which the paper also cites, names Medina as denying that the Bayesian dilemma is genuine. Yet the paper never cites Medina, and its conclusion's list of externalist options leaves his option out.

The paper already has what it needs to answer him. In the section "Whose accuracy?" it notes that Meehan and Zhang's total is a π(*p*)-weighted sum of the accuracy that π(·|*p*) expects of the response to *p*. That summand is exactly Medina's conditional evaluation. The Proposition then shows that, for a two-sided learner, the plan Medina vindicates is beaten at every state where *p* is actually learned. The paper never takes this step. Without it, its main claim beyond the target is unsupported against the leading alternative in the literature.

## Key strengths

- **A correct result aimed at the centre of the target.** I checked several things:
  - The Observation.
  - The Proposition's appeal to Predd et al.'s Theorem 1. That theorem allows unbounded continuous scores and any finite vector of events, so treating credences as forecasts for the events *X* ∩ int *p* works.
  - The Brier dominator: projecting onto the interior adds the rim's mass equally to each interior state. I confirmed this analytically and in a randomized numerical check.
  - The converse characterization.
  - Dana's scores at 15: −2.25 for conditionalization, −2.08 for keeping the prior, and 0 for the dominating rule.

  The result attacks Fact 10 and Hi-TEA, not a side issue. It reverses Fact 7 ("no rule that rules them all") for exactly the learners Meehan and Zhang use as motivation: Olivia, right-handed Dana and the clock.
- **The dominating rule does not depend on the weights.** Fact 11 already shows that a non-extensional weighting gives a different optimum. Here, though, the same rule dominates under every weighting of two-sided situations, and the agent needs only to be certain that her learning is two-sided. So Meehan and Zhang's fallback (that the choice of weighting is "bedrock", p. 337) cannot rescue conditionalization for such a learner. This is the paper's best contribution beyond the target. The closing line about what "high-level" rationality must abstract from makes the point sharply.
- **The coarsening-at-random diagnosis.** Read as probabilities, extensionality just is coarsening at random. The 2/7–1/7 mixture on Dana's scale checks out: {15,16}, {16,17} and *S* each get constant weight across their own states. The diagnosis links the target to Gill et al. and Grünwald–Halpern, and it explains why the clock models of Carr, Isaacs–Russell and Easwaran–Nielsen (uniform-error version) looked friendly to conditionalization.

## Key weaknesses

- **Little is new beyond what the target itself concedes, apart from one short lemma.** Meehan and Zhang already prove three relevant things:
  - optimality holds iff the weighting is extensional (Fact 11);
  - any single opaque learning situation is non-extensional (Fact 12);
  - the likelihood-weighting objection itself, which they state in their own words: "it also matters how likely it is for one to learn p at s" (p. 337).

  Easwaran's comment supplies the equal-likelihood reading, and Pettigrew's post the point that the result "relies on you thinking each evidence function is equally likely". The claim in "How Bayes comes back" that margins make extensionality impossible is Fact 12 plus the Observation. The CAR identification is largely a relabelling that the paper itself credits to Easwaran. What remains new is the dominance lemma, whose content is that learning *p* two-sidedly puts the truth in int *p*, so conditionalizing on int *p* does better.
- **The decisive step in the argument is asserted, not argued.** Meehan and Zhang's strongest reply is that total expected accuracy is an agent-independent measure (n. 35), and noncontrastiveness is what requires one rule to serve learners of every type. The paper answers in two paragraphs: the measure "vindicates evidential probability as a measure", not the agent's choice. That is where the dispute actually lies. A reader who accepts the target's rule-consequentialist framing (the jaywalking analogy, p. 289; the collapse objection, n. 37) gets no reason to treat this redescription as a defeat for Meehan and Zhang rather than a restatement of their view.
- **The paper's own position on contrastivity is unclear.** "Whose accuracy?" first says that "the view defended in this paper is contrastive": right-handed Dana should adopt a rule that left-handed Dana should not. It then shows that this violates idempotence in Meehan and Zhang's two-hand sequence. It then says "I accept the verdict" and sides with the knowledge norm, which forbids the move. A reader cannot tell whether the paper endorses hand-indexed updating or rejects it. The conclusion's dilemma suggests rejection, which would make the earlier sentence false.

  The paper also misses a point that would help it. The idempotence violation arises only because Meehan and Zhang model the left hand as having no margin. On a grid finer than both hands' margins, both hands are two-sided, and so is their combined evidence. The dominating rule (*f*~*A*~ in the paper), applied to total evidence, is then idempotent.
- **Smaller accuracy slips.**
  - The "mirror image of Briggs and Pettigrew" misdescribes their result. Their dominance is of prior–posterior *pairs*. With the prior held fixed, a rule that does not conditionalize but keeps each cell's credence inside that cell is not dominated. So "every rule but conditionalization is dominated" is wrong as stated.
  - The Dorst footnote on effacing evidence about "even position" holds only for odd *h*. With *h* = 2, the evidence about evenness tracks the truth.
  - "Radical response" is quoted from p. 334 but cited to pp. 288 and 307.
  - Conditionalization is not "at the bottom" of the chain in "What accuracy recommends", since rules worse than conditionalization also satisfy the requirement.
  - The .bib file labels itself provisional and not yet checked against Crossref.
  - Two nearby antecedents are missing: Das 2022's invariant Dutch books against conditionalizing on non-transparent evidence (the betting analogue of the dominance claim) and Bronfman 2014.

The reply to Meehan and Zhang is correct and well aimed, and as a discussion note it is close. It is not ready because the thesis it uses to reach beyond the target ignores the published argument that most directly contradicts it, and because its central philosophical step is a two-paragraph redescription.
