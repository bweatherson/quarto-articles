# Screening report B: "Bayes at the Edge"

- **Paper title:** Bayes at the Edge
- **Word count:** about 5,300 words of body text plus a 210-word abstract. It cites 29 works.
- **Thesis summary:** Meehan and Zhang's accuracy vindication of conditionalization (Hi-TEA, Fact 10) works only because their total over learning situations is "coarsened at random": it credits learning a proposition at the states on its edge. Suppose every way an agent has of learning about a magnitude leaves a margin around the truth ("two-sided" learning). Then a globally evidentially constant rule that discounts the rim of what is learned accuracy-dominates conditionalization at every state. On this view accuracy recommends certainty that is not knowledge, and for inexact knowers what makes conditionalization rational is a knowledge norm rather than accuracy.
- **Verdict:** NOT READY

Following the project owner's instruction, I have judged this as a reply. The reply format itself counts for nothing either way. The question is whether it is a good reply.

## Deal-breakers

**Criterion 4: the crux is left unanswered, and the author could have seen the problem.** The whole case against Meehan and Zhang turns on one question: how should a rule's response to *p* be graded?

- **The paper's grading** looks at the states where *p* is actually learned. Its dominance result is a comparison over pairs (*E*, *s*) with *E*(*s*) = *p*.
- **The rival grading** looks at the states where *p* is true, by conditional expected accuracy given *p*.

The paper sees this rival. In §5 ("Whose accuracy?") it rewrites Meehan and Zhang's total as a sum over *p* of what π(·|*p*) expects of the rule's response to *p*, and calls this "the strongest reply available". It answers in two sentences. First, this "vindicates evidential probability as a measure". Second, "Right-handed Dana can see that the rule so vindicated is dominated for her."

That is the choice between epistemic and auto-epistemic admissibility, which Medina (2024, *Philosophers' Imprint*) argues at length:

- E-plans should be graded by expected accuracy conditional on E, which yields an accuracy argument for conditionalizing on opaque evidence.
- The paper's ex ante dominance is grading conditional on having learned E, and Medina's poker case and implementation principle are aimed at exactly that.

Meehan and Zhang cite Medina in their nn. 1–2 as the "one exception" to externalist pessimism. Yet the paper never cites Medina. It gives no reason to prefer its own grading beyond asserting dominance relative to that grading. And its conclusion ("for inexact knowers, what makes conditionalization rational is not its accuracy") simply denies Medina's thesis.

A citation would not fix this. The Proposition only has normative force if the paper's grading is the right one, and that is the disputed point. Das (2019, "Accuracy and Ur-Prior Conditionalization") is also absent, though it anticipates the paper's negative conclusion.

## Key strengths

- **The formal core is correct and aimed at the target's own cases.** I checked the Observation, the Proposition and its converse. Predd et al.'s Theorem 1(a)–(b) covers bounded and unbounded additive scores, and their §7.1 covers different components for different propositions. The Brier projection does spread the rim's probability equally over the interior states. A random-prior check on a five-state line found no violations. The result applies to Olivia and right-handed Dana, so it attacks Fact 10's motivating cases, not a peripheral variant. It also reverses Fact 7 within the two-sided class: one rule weakly beats conditionalization in every two-sided problem.
- **The paper links extensionality to coarsening at random (CAR).** Meehan and Zhang's extensionality is CAR, and their Fact 11 is an instance of the characterization by Gill, van der Laan and Robins, as restated in Grünwald and Halpern's Theorem 3.1. This brings a mature literature into the debate and explains why permutation-invariant weightings favour conditionalization. The five-situation mixture table is correct: it gives weights of 1/7, 2/7 and 4/7 on {15,16}, {16,17} and *S*.
- **Quotations and attributions are accurate.** About twenty quotations and page references to Meehan and Zhang match the published text, as do the quotations from Williamson 2014, Salow 2018, Easwaran and Nielsen 2025, Gill and Grünwald 2008, Pettigrew's post and Easwaran's comment. Dana's Brier scores (−2.08 and −2.25) check out. The antecedents footnote places the paper honestly next to Easwaran, Fact 12 and Dorst.

## Key weaknesses

- **The paper adds little to what the target already concedes.** Meehan and Zhang already:
  - prove that non-extensional weightings dethrone conditionalization (Fact 11);
  - prove that a single opaque situation is non-extensional (Fact 12);
  - grant that weighting by likelihood gives a different optimum (pp. 337–338);
  - call the extensionality question "bedrock".

  Easwaran's comment and Pettigrew's post already point out that the result depends on treating every learning situation as equally likely. Given the Observation, the Proposition is a short corollary. For the log score, conditioning on the interior plainly beats conditioning on *p* at interior states. What moves the debate is not the formal step. It is the claim that the agent's own class of learning situations is the one that matters, and Meehan and Zhang explicitly reject that claim (n. 35: "for any agent, irrespective of their uncertainties about their evidential situations"). So the new formal material does not shift the debate by itself, and the weight falls back on the unanswered normative step above.
- **The headline result holds only for an idealization that the paper itself calls unrealistic.** The "Graded margins" section grants three things:
  - real discrimination is graded;
  - pointwise dominance then fails, because the rule that is certain of the interior is infinitely wrong under the log score;
  - all that is left is lower expected accuracy, which is Meehan and Zhang's Lemma 1 plus Easwaran and Nielsen's cosine dial.

  With graded learning CAR is not ruled out, only non-generic, so the abstract's "margins rule it out" overstates the case. There is also an unaddressed tension: if learning is knowledge, stochastic learning that sometimes puts the truth on the rim conflicts with the margin principle that motivates two-sidedness in the first place.
- **The paper's own position is unclear at the key point, and its positive thesis is not new.** §5 says "the view defended in this paper is contrastive": right-handed Dana "should adopt" a rule that left-handed Dana should not. But §6 and the conclusion say a noncontrastive knowledge norm fixes conditionalization and wins. The reader cannot tell whether the paper endorses violating idempotence or only reports that accuracy recommends it. The conclusion then lists the options without saying which one it defends. What is left is the knowledge-first response that Meehan and Zhang already list as option one (p. 288; Williamson 2000; Das 2022). The only addition is that two weaker requirements fix conditionalization in uniform-prior cases, and the paper concedes that with other priors some slack remains.
- **There are smaller accuracy and finishing problems.**
  - Carr 2021 is said to weight world–evidence pairs "evenly", but Meehan and Zhang (n. 35) describe Carr's proposal only as a weighted average. The description of Isaacs and Russell's clock is likewise unverified.
  - The claim that CAR holds "only in special cases" is in Grünwald and Halpern's §3 (Example 3.3) and their conclusion, not §4.
  - "Conditionalization is at the bottom of" the dominance chain is loose, since rules that put more weight on the rim do worse than conditionalization.
  - The .bib is headed "PROVISIONAL … to be checked against Crossref", so Criterion 7's registry check has not been done. My spot checks against Meehan and Zhang's reference list found no errors.
