**Prove the Proposition from Predd et al.'s Theorem 1 on the sample space int *p*, not from their Proposition 3. That closes the gap for unbounded scores, gives an exact converse, and exposes two false claims in §6.**

The Brier projection, Remark 4, §4's three steps and the table all check out.

*The gap.* Proposition 3 needs a bounded gradient. Meehan and Zhang's additive log score is unbounded, so for it your Proposition rests on footnote 2: a sketch plus a numerical check. Every member of *K* gives the rim credence 0, so the gradient is infinite at the projection itself. Predd's unbounded case assumes it is finite there.

*The fix.* Treat credences over *S* as forecasts for the events *X* ∩ int *p*, with sample space Ω = int *p*. Since π(·|*p*) gives the rim positive probability, it is incoherent relative to Ω. Theorem 1(b) covers bounded and unbounded scores alike. It says π(·|*p*) is strongly dominated, at every point of Ω, by a probability concentrated on int *p*. That proves the Proposition in three lines; keep the plain-log argument. It also says what the result is: de Finetti–Joyce dominance, where conditionalization is incoherent relative to the states at which *p* can be learned.

*The converse.* By Theorem 1(a), nothing concentrated on int *p* is weakly dominated there. At each interior state some two-sided situation delivers *p*: set *E*(*t*) = *S* at every other state. So over two-sided learning, a globally evidentially constant rule is undominated iff each *f*(*p*) is concentrated on int *p*. This holds for every Predd score and the plain log score. It makes §6's opening a theorem and can replace Remark 2's unproved claim.

*§6 needs two repairs.*

1. "Concavity then gives…". Meehan and Zhang's Fact 4 assumes concavity; your class of scores lacks it. Let φ″(x) = 1 + 300·exp(−((x − 0.484)/0.02)²), which gives a bounded, strictly proper additive score. Take a four-state line, *p* its first three states, and prior (0.167, 0.334, 0.231, 0.268). The projection *q* beats conditionalization *b* at both interior states. Yet (1−ε)*q* + ε*b* is worse than *b* at the endpoint for every ε from 0.015 to 0.999. Restrict §6 to concave scores.
2. "With ε large enough … on any threshold short of certainty" is false for Dana. At 15 her mixture is (1 − 0.75ε, 0.75ε, 0), so as ε grows her credence in the false "16" approaches 0.75. At thresholds of 0.5 or below, no ε works. Restrict the claim to thresholds above conditionalization's own highest credence in anything stronger than *p*.

Add Predd et al. to the references; the citation renders as "(Predd2009?)". The new proof replaces the second proof bullet and footnote 2, so the word cost is roughly neutral.
