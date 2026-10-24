**State what the dominance result needs from the error law: add a short measurement-error paragraph showing that "never at the edge" requires bounded error plus slack, and restate "sure loss" accordingly.**

*Where:* the Observation (§2), "a sure loss" (§5), and the §4 diagnosis.

*The gap.* A statistician will ask what instrument error does here. The paper's own measurement models (Williamson 2013, Weatherson 2013) contain the answer, undrawn. A reading c has error support e. The knowledge set is [c−e−m, c+e+m], where m is slack added for safety. The truth is then at depth at least m, which is the Observation. That needs compactly supported error and m ≥ 1. With m = 0 and uniform error, the knowledge set is the support of the likelihood, coarsening is at random, and conditionalization is optimal: the "margin around the guess" family. So §2's dichotomy is a claim about slack.

Gaussian error then splits two ways.

(a) *Williamson's convention:* you learn K only when |ε| ≤ e, otherwise nothing. The Observation survives, and dominance holds whatever the error law. But the best rule is the tilted posterior, proportional to π(s)·f_ε(c−s), not π(·|int p). In a quick check (flat prior, σ = 1.5 steps, e = 3, m = 1) the expected log scores are −2.20 for conditionalization, −1.95 for f_log and −1.75 for the tilted posterior. Edge-stripping gets a little over half the gain. The tilted rule is tuned to σ, so it is more exposed to §5's "whose accuracy?" objection. Present f_log as the robust choice, not the best one.

(b) *Soft margins:* threshold knowledge, with the truth sometimes on the rim (1.5% of the time in the same model if h = 4). Then f_log scores −∞ there, and dominance and "sure loss" fail. What remains is expected-accuracy superiority, already in Gallow, Isaacs–Russell and Easwaran–Nielsen. The diagnosis survives, since λ_p(s) ∝ f_ε(c−s) is not constant. "Forbid" becomes "violate".

Censoring, rounding and interval censoring with independent cut-points are mixtures of partitions (Grünwald–Halpern's CARgen), hence coarsened at random. Say so: slack breaks Bayes, not measurement error as such.

*Fixes in §4.*
- Theorem 3.1 is Gill–van der Laan–Robins's, restated by Grünwald and Halpern. The bibliography prints "Laan".
- For "almost never", cite Grünwald–Halpern §4.4, "sometimes CAR is nothing" (Theorem 4.4, Example 3.3): overlapping observations force zero prior on some atoms, which a regular prior forbids. CAR is often secured by design, so the measure-zero sentence overreads.
- Heitjan–Rubin ignorability needs CAR plus distinctness of mechanism and state: the product structure π×λ in the total (from memory; check).
- Verify the Gill–Grünwald quotation and page.

*Room:* about 150 words. Cut the "Absurdity" paragraph to two sentences, the Das/Schoenfield comparisons ending §3, and the "almost never" sentence.
