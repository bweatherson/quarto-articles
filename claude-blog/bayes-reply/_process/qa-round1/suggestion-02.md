**Prove the Proposition for every strictly proper score by projecting onto the interior. As written, each rule dominates only under its own score, and neither dominates under Meehan and Zhang's additive log score.**

*Where:* §3 and the abstract. The proof, footnotes 1–4, the numbers and the reading of Lemma 1 as coarsening at random check out; the generality does not.

*The problem.* On a line a–b–c–d with prior (.48, .02, .48, .02), learning {a,b,c} at b is two-sided. *f*<sub>log</sub> gives (.96, .04, 0, 0), with Brier inaccuracy 1.84 at b; conditionalization's is 1.44. On a five-state line with prior ∝ (.01, .49, .49, .01, ε), learning {a,b,c,d} at a, *f*<sub>Br</sub> loses 0.38 to conditionalization under the additive log score, which their Fact 3 uses. Their Facts 7, 8 and 10 hold for every strictly proper *A*; your "mirror image" must too.

*The fix.* Let *D*<sub>*A*</sub>(*x*, *c*) = Σ<sub>*s*</sub> *x*(*s*)[*A*(*x*, *s*) − *A*(*c*, *s*)]. Let *f*<sub>*A*</sub>(*p*) minimize *D*<sub>*A*</sub>(·, π(·|*p*)) over credences concentrated on int *p*. Your Pythagorean step, in Bregman form, gives at every *s* in int *p*:

*A*(*f*<sub>*A*</sub>(*p*), *s*) − *A*(π(·|*p*), *s*) ≥ *D*<sub>*A*</sub>(*f*<sub>*A*</sub>(*p*), π(·|*p*)).

The right side is positive iff π(rim *p*) > 0; for log and Brier, equality holds. *f*<sub>log</sub> is the log case, gaining −ln π(int *p* | *p*). *f*<sub>Br</sub> is the Brier case: it adds the rim's mass equally to each interior state. I checked spherical, power and additive log numerically. This is Predd et al.'s (2009) argument for probabilism, on a face of the simplex (from memory; check).

Say also what fails. With two or more interior states, no single rule dominates conditionalization under every score; bets on single states show this. The dominating rule depends on the score, as in Joyce. That conditionalization is dominated does not.

*Hypotheses.* The proof needs only finitely many states and a known reflexive, symmetric *R* with *E*(*s*) ⊇ *R*(*s*), where int *p* = {*s* : *R*(*s*) ⊆ *p*}; lines, ends and connectedness do no work. Regularity is needed only for strict dominance. Concavity is needed only for "any ε"; under the spherical score, which is not concave, a small ε still works by continuity.

*Corrections.* (i) The "lower-dimensional subset" claim in §4 is false as stated. *E*(*s*) = *S* everywhere is two-sided, and every weighting on it is coarsened at random. You must require that a proposition with a nonempty rim is learned. (ii) The gain shrinks with π(rim *p* | *p*). It goes to zero if the grid is refined while *R* stays adjacency, and on a continuum two-sidedness alone typically leaves a rim of prior probability zero. So "uses nothing more" (§5) overstates: the margin needs a known positive width.

*Room:* about 150 words; cut the Dorst/Das/Schoenfield paragraph ending §3.
