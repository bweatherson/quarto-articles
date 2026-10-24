**Accuracy restricted by the knowledge norm recommends nothing, not the signal theorists' credences: every rule that respects the norm is dominated by another one.**

*Where.* §6: "What accuracy recommends for inexact knowers, once certainty is restricted to what is known, is what the signal theorists recommend."

*The clock.* Take h = 1 and a uniform prior. R(w) is learned only at w. Lowering ε moves each proposition's credence monotonically toward its truth value at w. So under the log score and under every additive strictly proper score, a smaller ε strictly beats a larger one. Under Brier over all propositions, the scores at w are:
- conditionalization: −1.33;
- Easwaran–Nielsen (ε = 3/4): −0.75;
- Ahmed–Salow (ε = 0.3): −0.12;
- ε = 0.01: −0.0001.

The norm-respecting credences form a chain with no top, whose limit is the forbidden certainty.

*In general.* Suppose the score is concave and strictly proper, and *f* never makes the agent certain of what she does not know. Then *f*(*p*) gives the rim positive credence. So, by your converse, some *g* strongly dominates it on int *p*. For 0 < *t* < 1, (1 − *t*)*g* + *t f*(*p*) still respects the norm, and by concavity it strictly beats *f*(*p*) at every interior state. So no rule that respects the norm is undominated.

*And the match is vacuous.* Every symmetric credence on R(w) whose mode is w has the form (ε/3, 1 − 2ε/3, ε/3). The signal theorists' ε comes from a likelihood λ<sub>*p*</sub>, as in Graded margins: Easwaran and Nielsen's 1/4, 1/2, 1/4 puts the truth at the edge half the time. The knowledge norm plays no part.

*Fix.* Replace that sentence with the lemma (word-neutral). This sharpens §7: under the norm, accuracy favours nothing.

*Smaller items.*
- Remark 2 is unproved. If one rule scores every proposition, it is false. When π is uniform on int *p*, π(·|int *p*) dominates under the log score and every such score. Group the propositions by *X* ∩ rim and *i* = |*X* ∩ int *p*|. The gain at an interior state is then a positive multiple of ∫<sub>*c*</sub><sup>*i/k*</sup>(*i/k* − *x*)dφ′ ≥ 0 (checked numerically). The remark holds only with a separate rule for each proposition (Predd et al. §7.1). Restrict it or cut it.
- The converse needs three additions:
  - the Theorem 1(b) step for an arbitrary *f*(*p*), not only π(·|*p*);
  - a line covering the log score;
  - an agenda that contains the singletons, since Predd's propriety is defined proposition by proposition.
- These are sound:
  - the application of Predd on int *p* (repeated events are harmless, and are what make *c* incoherent);
  - the Brier projection;
  - −2.25 and −2.08;
  - the §4 table;
  - Graded margins;
  - Remark 4.
