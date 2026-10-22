# Chance ontology check: mixtures, Humean vs primitivist chance, and the testing-experts results

Prepared 20 October 2026 for the track-record paper. Companion to `econ-report.md` (§§1, 3.8, 4.6, 6.1, 11) and `philosophy-report.md`.

**Tags.**
- **[READ]**: I read the relevant text myself this session. The version is noted.
- **[ABSTRACT]**: abstract or metadata only, or a tool-generated summary of a text I could not open directly.
- **[MEMORY]**: my background knowledge, not verified this session. Check before citing.
- **[COMPUTED]**: my own calculation. The method is stated next to it.

---

## 0. Verdicts in brief

1. **BSA lemma.** Half right.
   - The fit inequality is correct.
   - The conclusion "best-system chance functions are never mixtures of rival candidate systems" is **false**. It rests on the premise that a mixture is at least as complex as its components, and that premise fails in general. It also fails in the Humeans' own flagship case, statistical-mechanical chance.
   - A weaker non-closure claim is true: *some* mixtures of Humean chance functions are never best systems, so the Humean class is not convex. But it is true only under an assumption about simplicity that the paper must state and defend.
   - Under MDL-style simplicity (code length), Bayes-mixture systems such as the Pólya/Laplace rule compete with iid(f) and often beat it. Universal mixtures dominate up to a constant.
   - I found no statement of the lemma in the literature.
2. **Pólya urn / propensity.** Correct.
   - The mathematics is textbook.
   - The Pólya urn is the *right* example, better than a two-stage "pick a coin, then toss it" setup, because it has no further fact for a chance-tracker to know.
   - I found nobody stating the philosophical inference in so many words, but it is uncontroversial.
3. **Dawid 1985.** Right about uniqueness. It must be stated with four qualifications:
   - it holds only among *computable* forecasters;
   - it is only *asymptotic*;
   - it says nothing about *existence*;
   - it is *non-constructive*.

   Vovk (1987) gives a sharper version for Martin-Löf randomness.
4. **Undermining.**
   - It does not affect *pathwise* passing, which holds by construction.
   - It does mean the best-system test fails the economists' *probabilistic* type-I condition. In short worlds it fails badly.
   - Requiring knowledge of the whole history has a harsher consequence. **Any test that sees only a finite initial segment, and passes the Humean chance-knower on every path, has no power** when much of the history is still to come. Pathwise Humean certification is certification by the whole mosaic, not by a track record.
5. **Priority.** I found nobody who connects the testing-experts impossibility results (or Foster–Vohra calibration) to the Humean vs primitivist debate. I also found nobody arguing that primitive-chance knowledge is uncertifiable while Humean chance knowledge is certifiable. Near-misses are listed in §5. The search had real gaps (§8).

---

## 1. Claim 1: the BSA mixture lemma

### 1.1 What is right

**Lewis's notion of fit.**
- Lewis 1994 [READ, as quoted in Schwarz 2016, who cites the 1999 reprint p. 234; the *Mind* page is about p. 480, the page Höltgen 2026 gives for the next sentence; check against the original]: "some will fit the actual course of history better than others. That is, the chance of that course of history will be higher according to some systems than according to others. [...] The virtues of simplicity, strength, and fit trade off. The best system is the system that gets the best balance of all three."
- Loewer 2004, p. 1119 [READ]: "The higher the chance a system assigns to the true history (or to segments of it given part of the history) the better its fit."
- Elga 2004 [READ, penultimate draft]: "The fit of such a system is defined to be that chance—how likely the system counts it that things would go just as they actually do."

**The inequality.** Let S₁ and S₂ be candidate systems with time-0 chance functions P₁ ≠ P₂, and let S_λ be a system whose chance function is P_λ = λP₁ + (1−λ)P₂ with 0 < λ < 1. Its fit at actual history H is

  P_λ(H) = λP₁(H) + (1−λ)P₂(H) ≤ max{P₁(H), P₂(H)},

with strict inequality unless P₁(H) = P₂(H). This is correct.

**The correct (weak) lemma** [own reasoning]. Suppose S_λ is no simpler and no stronger than whichever component fits better. Then S_λ is weakly dominated by that component, and strictly dominated when the two fits differ. So a mixture is never uniquely best unless it *buys simplicity* (or strength).

That conditional is all the inequality delivers.

### 1.2 What is wrong: "a mixture is at least as complex as its components"

The premise is false in general. So the conclusion "best-system chance functions are never mixtures of rival candidate systems" is false. Six cases follow.

**(a) Reductio from convexity.**
- Every probability measure on histories that is not a point mass is a non-trivial mixture: P = P(A)·P(·|A) + P(¬A)·P(·|¬A) for any A with 0 < P(A) < 1. The extreme points of the space of measures are the point masses.
- So if best systems were never mixtures of candidate systems, every best system would be deterministic.
- Concretely, iid(½) = ½P_H + ½P_T. Here P_H says "toss 1 lands heads with chance 1; thereafter tosses are fair and independent".
- P_H is a legitimate candidate. It gives chance 1 to the outcome it states, so it does not "guess" in Lewis's sense [MEMORY: Lewis 1994's requirement that systems not state outcomes they treat as chancy].
- At any world whose first toss is heads, P_H's fit is **exactly twice** that of iid(½).
- iid(½), the Humean's favourite chance function, is best only because it is **simpler than its components**.

**(b) Statistical-mechanical chance (Albert, Loewer).**
- The "Mentaculus" probability is the uniform measure over microstates compatible with the past hypothesis. It is a continuous mixture of deterministic histories. The component "the actual initial microstate is x" has fit 1.
- SEP, *Chance versus Randomness*, Supplement D [READ]: "A more accurate description might be provided by a perfect specification of the actual initial condition, but that would be much more complex than the past hypothesis."
- Loewer 2004, p. 1124 [READ]: adding the micro-canonical distribution to Newtonian laws gives "enormous information gain ... with very little cost in simplicity."
- So the best-known Humean chance in physics is a mixture of rival candidates that each fit better.
- Related work:
  - Beisbart 2014 [ABSTRACT] argues that rival SM measures are "roughly equally good," so none is a Humean chance.
  - Dardashti, Glynn, Thébault & Frisch 2014 [ABSTRACT] reply that SM chances are "unsharp."
  - Frigg & Hoefer 2015 [not read; MEMORY] defend a Humean reading of SM probabilities.

**(c) Continuous mixtures with a fixed prior have no free parameter.**
- Laplace's rule, P(heads on n+1 | h heads in n) = (h+1)/(n+2), is the uniform mixture of iid(p). Equivalently, it is a Pólya urn starting with one ball of each colour. It has **zero** free parameters; iid(f) has one.
- Loewer 2004 [READ] lists simplicity measures that include "number of parameters."
- On that measure the Laplace rule is **simpler** than every iid(p). Its fit is lower than iid(f̂)'s by only about ½·log₂n bits plus a constant.
- Whether it wins depends on the exchange rate between simplicity and fit, which Lewis leaves open.

**(d) MDL-style simplicity.**
- Schwarz 2016 [READ] proposes MDL as "an especially noteworthy approach" for the BSA: "Lewis's Humean perspective on the relationship between theories and the world bears a striking resemblance to Rissanen's perspective on the relationship between models and data". He also suggests penalising parameters by how many patterns a parametric family can fit (citing Myung et al. 2000).
- In MDL, a Bayes mixture code is never longer than a two-part code that uses the same prior. Grünwald 2005, §2.5.2 [READ, arXiv math/0406077]: "Bayes is Better than Two-part ... for all xⁿ it never assigns codelengths larger than L̄₂₋ₚ(xⁿ), and in many cases it assigns strictly shorter codelengths."
- The Jeffreys mixture asymptotically matches the minimax-regret (NML) code length [READ: Grünwald 2005, Example 2.19 and §2.6; MEMORY: Rissanen 1996, Xie & Barron 2000].

[COMPUTED] A toy MDL-BSA for a single coin.
- **Setup.** World = N tosses.
- **Candidates.**
  - iid(½), costed at 1 bit.
  - iid(p) with p a dyadic midpoint (2j+1)/2^{d+1}, costed at d bits plus Elias-gamma(d+1).
  - The Laplace rule, costed at 1 bit.
- **Score.** Total = cost − log₂(fit). Lowest total wins.

Excess over the maximum-likelihood code length, in bits:

| N | frequency | best two-part iid(p) | Laplace (Pólya urn) |
|---|---|---|---|
| 10⁴ | 0.4837 | 8.67 (p = ½) | **6.32** |
| 10⁴ | 0.30 | 10.34 | **6.44** |
| 10⁵ | 0.48373 | 10.12 | **7.98** |
| 10⁶ | 0.48373 | 11.21 | **9.64** |
| 10⁶ | 0.30 | 16.09 | **9.77** |
| 10⁶ | 0.5003 | **1.26** (iid ½) | 9.64 |

Probability, under iid(p) data, that each system is best:

| N | p | Laplace wins | some iid(p') wins | iid(½) wins |
|---|---|---|---|---|
| 10³ | 0.3 | 0.976 | 0.024 | 0.000 |
| 10⁴ | 0.3 | 1.000 | 0.000 | 0.000 |
| 10⁴ | 0.4837 | 0.622 | 0.000 | 0.378 |
| 10⁴ | 0.75 | 0.027 | 0.973 | 0.000 |
| 10⁴ | 0.5 | 0.003 | 0.000 | 0.997 |

Reading the tables:
- Under this coding, the Humean chance of a coin whose bias is not a short dyadic number is the **Laplace rule, a mixture**. iid systems win only when the frequency sits within about √(log N / N) of a cheaply codable number.
- The result depends on the language. A decimal code would make 0.3 cheap. That is the point: **whether mixtures are best systems is hostage to the simplicity metric.**

**(e) Universal mixtures** [reasoning plus MEMORY].
- Take a pure code-length reading of simplicity plus fit, with no restriction on candidate systems.
- A universal mixture then dominates every computable system up to an additive constant. Examples are the Solomonoff–Levin a priori semimeasure, or computable mixtures such as Krichevsky–Trofimov or context-tree weighting. The bound is −log M(x) ≤ −log P(x) + K(P) + O(1) [MEMORY: Li & Vitányi; Vovk 1987 [READ] uses the a priori semimeasure M with P(a) = M(a)·O(1) for every r.e. semimeasure P].
- On that reading the "best system" would be nearly the same mixture in every world.
- "Knowing the chance" would then need no knowledge of the world. A charlatan who announced the universal mixture would be a Humean chance-knower.
- A Humean who wants the certification thesis must therefore use a simplicity measure that **penalises mixture-formation**. Options include Lewis's syntactic simplicity in perfectly natural predicates, a parameter-and-axiom count that charges for priors, or Hoefer/Schwarz-style restrictions to local dynamical chance. The paper must say which.

**(f) Many coins, minting distributions, and time-indexed chance.**
- Lewisian chance updates by conditionalisation [READ: Dorr 2006 seminar notes, "Chances at later times are derived from chances at earlier times by conditionalising"]. So by total probability, **earlier chance functions are always mixtures of later ones**: Ch₀ = Σ_h Ch₀(h)·Ch_t.
- The non-closure claim must therefore be about *rival* systems, not about chance at different times.
- With many coins, a hierarchical system ("each coin's bias drawn from Beta(a,b); tosses iid given the bias") can beat listing every coin's bias. There are two sub-cases:
  1. **The bias is a categorical fact in the mosaic** (mass distribution, say). The time-0 chance is then a mixture, and the post-minting chance is a component. Here the mixture is a genuine Humean chance at early times.
  2. **The bias is not in the mosaic.** The fit is a product, over coins, of Beta-mixture probabilities. The Humean chance of a coin's next toss is then its posterior predictive, a Pólya-type rule. That is a mixture at every time.
- So Humean non-closure can hold only for **one-off** mixtures, which no recurrent mosaic pattern supports. It cannot hold for repeated minting.

**(g) Infinite worlds.**
- **Correction to the brief.** Elga 2004 does *not* endorse infinitesimal fits. His abstract [READ]: "Neither an appeal to infinitesimal probabilities nor a patch using standard measure theory avoids the difficulty. But there is a way to avoid it: to replace the notion of 'fit' with the notion of a world being typical with respect to a theory."
  - His argument: regular nonstandard approximations of a standard measure "span the entire range of infinitesimals" in the fit they give the actual history (Appendix A, Corollary 1).
  - His proposal: "fit profiles", the chances a system gives to true, simply expressible "test propositions" (after Gaifman & Snir 1982).
- **What each fit measure does to the lemma** [own reasoning]:
  - *Lewis's raw fit.* Every continuous system has fit 0, so everything ties.
  - *Elga's fit profiles.* For each test proposition the mixture's chance is a weighted average, so it is never above the larger of the components' chances. But which component is larger can switch from one proposition to another, and Elga's comparison ("predominantly greater") is left imprecise. On tail propositions ("limiting frequency ∈ [a,b]") the matching component gets 1 and the mixture gets λ, so the lemma is plausible but not a theorem.
  - *Limiting per-trial log-likelihood.* The mixture and its better component **tie**, because the difference is O(1)/n.
  - *Eventual likelihood ratio, with mutually singular components.* The component wins, because the ratio tends to λ < 1.
- **The Laplace rule in an infinite world.** Under every one of these measures, the Laplace rule beats every iid(p) with p ≠ the limiting frequency; the likelihood ratio grows exponentially. If the limiting frequency is not finitely specifiable, no statable iid system competes, and an exchangeable mixture is the best *statable* system.
  - Belot 2024's toy BSA [READ] sidesteps this by declaring sequences with incomputable frequency "lawless."
  - Barrett & Chen 2026 [READ] avoid fit altogether with "statistical constraining laws" L\*: "at most one candidate L\*βθ is true of the actual sequence, so best systems can be compared by simplicity and informativeness alone". On that view a mixture-constraint is less informative, so mixtures lose. That last step is my extrapolation, not theirs.

### 1.3 Is the lemma in the literature?

I found **no statement** of it, in any form. Nearest items:
- **Elga 2004** [READ]: fit and infinite worlds, as above.
- **Schwarz 2016** [READ]: suggests MDL. He does not discuss mixtures.
- **Beisbart 2014; Dardashti et al. 2014; Fenton-Glynn 2017/2019** [ABSTRACT]: ties and unsharp or imprecise best-system chances.
  - If Humean chance is a *set* of tied chance functions, and sets are taken convex (as is usual for credal sets), mixtures re-enter at the level of the set.
- **Hicks 2017**, "Making Fit Fit" [ABSTRACT]: fit as accuracy at the world.
  - With a log score this is Lewis's fit.
  - With per-step averaged accuracy, a mixture ties its better component in the limit.
- **Belot 2024**, "Unprincipled" [READ]: models a theory of chance as a map from worlds to chance laws. He discusses mixtures of *priors* (Remarks 5.12, 5.26) and the Bayes–Laplace prior as "a Lebesgue-uniform mixture of the Bernoulli measures." He does not discuss whether mixtures can be chance laws.
- **Barrett & Chen 2026** [READ]: de Finetti mixtures in *credence* collapse to a single model, given an L\* law.
- **Hoefer 2007** [ABSTRACT: tool reading of the final draft]: the Best System "'smoothes off' the actual frequencies," so the chance of 00 can be "1/N — whatever the actual frequency may be!" This supports a simplicity measure that penalises precision. The tool found no mixture (bag-of-coins) discussion in the part it read.
- **Lewis 1980** [MEMORY]: given the Principal Principle (PP), credence equals expected chance. So an uninformed agent's credence *is* a mixture of chance hypotheses. That is the subjective side of the reducibility the economists exploit.

### 1.4 What the paper can safely say

- **(L1) Fit.** A non-trivial mixture's fit is a weighted average of its components' fits.
- **(L2) Weak dominance.** A mixture system is never uniquely best unless it is simpler (or stronger) than its better-fitting component.
- **(L3) Non-convexity, under an explicit assumption.** Suppose stating a two-component mixture is never cheaper than stating its components; for example, ½iid(0.3) + ½iid(0.7) in a single-coin world. Then that mixture is never best:
  - at frequency near 0.3, iid(0.3) is simpler and fits about 1 bit better;
  - at frequency near ½, iid(½) wins by far.

  So the class of best-system chance functions is not convex.
- **Drop "never mixtures."** State the simplicity assumption that excludes Laplace-type and universal mixtures, and acknowledge the SM and hierarchical cases.

### 1.5 What non-convexity actually does in the testing argument

1. **Bounded data.**
   - MOR Prop. 1 needs a convex, compact paradigm, so non-convexity removes the theorem.
   - It does not by itself give a non-manipulable test.
   - MOR §4.1 [READ] gives the minimal positive case: a paradigm {P₁, P₂} with disjoint acceptance sets, where "rejection ... cannot be delayed for m periods with probability higher than 0.5 + 0.5ε".
   - Prop. 2 is a different, larger example.
2. **Correction on Prop. 2.** MOR Prop. 2 is a **likelihood-ratio test against the fair coin** on the paradigm Λ_{m,δ}: theories whose forecasts are, on average, far from ½ on every positive-probability m-history [READ]. It is *not* "iid processes with an announced bias and a frequency-band test."
   - That iid/frequency-band example is valid [own check]. Hoeffding gives uniform type-I control with a band of half-width t = √(ln(2/ε)/2m). Against Nature's uniform prior over p, any announced p passes with probability about 2t; for ε = 0.05 and m = 10⁴ that is about 0.027.
   - But the example is the paper's own, or an instance of the §4.1 disjoint-acceptance idea. Do not attribute it to Prop. 2.
3. **Unbounded data.** Convexity is not the issue.
   - Sandroni & Shmaya 2014 give a non-manipulable prequential test for the *convex* exchangeable class with infinite data (econ-report §4.6).
   - O&S 2009 *AoS* give a non-manipulable future-dependent test for all of Δ(Ω) (econ-report §4.2).
   - So "primitive chances are uncertifiable" is false at infinite horizon in the economists' topological sense. The Humean/primitivist contrast must be stated for **bounded data or prequential tests**, or as a contrast in the *kind* of non-manipulability (§4.4).
4. **The property the Humean test actually exploits** is weaker than "mixtures are never best." It is that a mixture P_μ of distinguishable Humean chance functions is **self-undermining**: P_μ{ω : BS(ω) = P_μ} ≈ 0, where BS(ω) is the best system of history ω.
   - That property licenses the Humean tester to drop the type-I requirement for mixtures. Dropping it is what breaks the minimax step.
   - MOR Prop. 3 (for any fixed Q, some ζ passes Q-almost surely) does not constrain such a test, because it applies only to tests that pass *every* data-generating process.
   - The charlatan's best reply to Nature's μ is the P maximising P_μ{BS = P}. This is small for diffuse μ over distinguishable systems, and large when μ merely decomposes a simple system into complex components, as in case (a). That is the right answer: in case (a) the charlatan does know the chance.

---

## 2. Claim 2: the Pólya urn and propensity

**Verdict: correct.** The mathematics is standard, the propensity reading is right, and the Pólya urn is the right example.

**The identity.**
- Start a Pólya urn with a red and b black balls, adding one ball of the drawn colour each time. The probability of a particular sequence with h reds in n draws is

  B(a+h, b+n−h)/B(a,b) = ∫ pʰ(1−p)ⁿ⁻ʰ Beta(a,b)(dp).

- So the process is exchangeable, with a Beta(a,b) de Finetti measure.
- [COMPUTED] I checked numerically on 2000 random cases (maximum error 2×10⁻¹⁵), including permutation invariance.
- Sources:
  - Textbook [MEMORY: Feller, vol. II, §VII.4].
  - Dirichlet generalisation: Blackwell & MacQueen 1973 [Crossref; content MEMORY].
  - Characterisation: Hill, Lane & Sudderth 1987, Thm 1. "The only exchangeable and non-deterministic urn processes are i.i.d. and Pólya sequences" [READ via El-Dakkak & Peccati, arXiv math/0610590, §4].

**No hidden parameter.**
- The de Finetti parameter is the limiting proportion of red, a tail random variable that is fixed at no finite time.
- The urn's physical state at time t, (a + h_t, b + t − h_t), is a function of past outcomes.
- So a single-case propensity theorist who knows the current chance at each draw knows exactly the mixture's posterior predictive, and nothing more.

**Why the Pólya urn and not a two-stage coin.**
- A two-stage setup ("a chance device picks coin A or B, then the chosen coin is tossed repeatedly") also has a mixture as its time-0 law.
- But after stage 1, a primitivist who tracks current chances knows the component, because the chosen coin's bias is a present physical fact. Her forecasts are the component's.
- This is Al-Najjar & Weinstein's point (2008, p. 554) [READ]: "A typical distribution P on outcomes can have infinitely many two-stage lottery representations ... Different representations correspond to meaningful and distinct information structures."
- The Pólya urn is the case where the law *is* a mixture and there is **no further fact** to know.
- On a primitivist view, then, knowing the chances can amount to knowing only a mixture. The primitivist cannot waive the type-I requirement for mixtures.

**Closure under mixture.**
- MOR Prop. 1 needs a convex, compact class.
- The primitivist gets convexity of time-0 laws from two-stage setups with a λ-biased chance device, provided such setups are physically possible and their stage-1 outcome is not part of the observed data.
- Δ(Ω) is weak*-compact.
- The Pólya urn adds the stronger point that some mixtures are chance processes *even for a chance-tracker*.

**Is it standard?**
- The mathematics is textbook.
- I found no source that states "on propensity views the class of chance processes is closed under mixture" as such.
- Philosophers usually run de Finetti the other way: exchangeable *credence* as a mixture over chance hypotheses.
  - "Chance as objectified credence" (de Finetti, Jeffrey).
  - Schwarz's 2025 blog post on de Finetti [ABSTRACT].
  - Barrett & Chen 2026 [READ].
  - Diaconis & Skyrms 2018 discuss urns and de Finetti [MEMORY].
- The inference is uncontroversial. A sentence of argument suffices.

**Caveats.**
1. *Long-run propensity views* (Popper, Gillies) take the repeatable conditions to be the whole run from the initial composition. The time-0 law is still the mixture.
2. *Humeans can have it too.* In a world whose mosaic records many urns' compositions, "chance of red = current proportion of red" is a short Humean law whose fit is the Pólya probability. Humean and propensity chance diverge only where the mixing is not grounded in recurrent patterns in the mosaic (cf. §1.2(f)).

---

## 3. Claim 3: Dawid 1985 and the identifiability of "the chances"

**Dawid 1985 itself: NOT READ.** Project Euclid blocked automated access. The content below comes from sources I did read:
- Belot 2013, §1 [READ];
- Roth, Tolbert & Weinstein 2023, §1.3 [READ];
- Dawid 2017, §8 [READ, arXiv 1406.5540];
- Vovk & Shen 2010 intro [READ, ALT 2008 version].

The paper is *Ann. Statist.* 13(4): 1251–1274, with discussion and rejoinder to p. 1285. Schervish's discussion is pp. 1274–1282.

**Setting** (Belot 2013, citing Dawid 1985 §5).
- Binary outcomes a₁, a₂, ….
- A forecasting system F issues π_k on the basis of a₁…a_{k−1}.
- A *selection rule* δ decides whether day k is selected, "depending only on a₁, … a_{k−1} and on the forecast probability π_k."
- F is *calibrated* for a with respect to δ if the mean discrepancy aₖ − πₖ over the selected days tends to 0 (or if only finitely many days are selected).
- F is *computably calibrated* if it is calibrated with respect to every computable selection rule.

**The uniqueness result.**
- If two **computable** forecasting systems are both computably calibrated for a, then pₖ − qₖ → 0.
- Roth–Tolbert–Weinstein: they "must approximately agree in their predictions almost everywhere — that is, except on a finite subset of the data."
- Dawid 2017, §8.1.4: "suppose that we have two forecasters, who issue respective forecasts (pk) and (qk), and that both sets are H-valid. It can then be shown ... that, as k increases without limit, the difference between pk and qk must approach 0. We may term this result asymptotic identification."
  - There Dawid attributes the result to "Dawid 1982b" (*The Well-Calibrated Bayesian*). He formalises the "H-based" condition "through the theory of computability (Dawid 1985a)."
  - Cite 1985 for the computable version and note the attribution.
- **Proof idea** [own reconstruction]. Select the days on which pₖ > qₖ + ε. If the other forecaster is computable, this rule is computable relative to each forecaster. Calibration of both on this subsequence forces the average of p − q to 0, so only finitely many such days exist.
- **Companion fact** (Belot 2013, citing Dawid 1982 and 1985). Every computable Bayesian forecaster is computably calibrated with probability 1 under its own prior.

**Conditions and limits.**
1. **Both forecasters must be computable.** Non-computable forecasters fall outside the result.
   - Example [own]: Chaitin's Ω is Martin-Löf random, so the constant-½ forecaster is computably calibrated on it.
   - But Ω is computable from the halting problem. A forecaster with that oracle forecasts every bit with certainty, is perfectly calibrated, and disagrees with ½ everywhere.
   - This is the same boundary as Hu–Shmaya 2013 and Lehrer 2001 (econ-report §11.5).
2. **Existence is not guaranteed.**
   - Belot 2013 [READ]: "each forecasting system fails to be high-low calibrated relative to typical data sequences—and typical data sequences have the feature that no computable forecasting system is high-low calibrated for them."
   - Dawid 2017, fn. 7, concedes existence "is however not guaranteed (Schervish 1985; Belot 2013)."
3. **Agreement is only asymptotic.** Finitely many disagreements are allowed, of any size and with no bound on when they occur. So nothing is identified by a finite record.
   - Dawid 2017: "we could typically change their values for a finite number of individuals, without affecting H-validity."
   - Roth–Tolbert–Weinstein: such models "may substantially disagree on any finite set of data."
4. **The result is non-constructive.** Dawid 2017: "entirely non-constructive ... there is no H-based system that can be guaranteed to be H-calibrated (Oakes 1985; Dawid 1985b)". In his §9: such values are available "only 'at infinity,' and even then these asymptotic values are uncomputable."
5. **The selection-rule notion is von Mises–Church style, and weak (Ville).** Dawid noted this. Vovk & Shen 2010 develop a Martin-Löf/martingale version of prequential randomness [READ, intro].

**Sharper and related results.**
- **Vovk 1987** [READ: Vovk's own English translation at vovk.net; *Doklady AN SSSR* 294(6): 1298–1302, also *Soviet Math. Dokl.* 35(3): 656–660].
  - **Theorem 2.** If ω is Martin-Löf random with respect to computable P and Q, then Σᵢ (P(ωᵢ|ωⁱ)/Q(ωᵢ|ωⁱ) − 1)² < ∞.
  - **Theorem 3.** If ω is random with respect to P, then ω is random with respect to Q iff Σᵢ ρ(Pᵢ^ω, Qᵢ^ω) < ∞, where ρ is Hellinger distance.
  - This is the cleanest "the chances are identifiable relative to computable measures" theorem.
- **Vovk & Shafer 2005**, Appendix E, "Jeffreys's law" (after Dawid 1984, p. 281) [READ, WP7]. Theorem 8: Sceptic has a strategy such that "if Kn and K′n are bounded, then lim (pn − p′n) = 0." In words, two forecasters who both survive betting must merge.
  - §5.3 adds: "There is content in the assertion that a sequence obeys a probability distribution P that we specify fully before any observation ... if it is not refuted then Forecaster can avoid refutation himself only by agreeing with P's predictions in the limit."
- **Huttegger, Walsh & Zaffora Blando 2026**, arXiv 2504.00440v3 [ABSTRACT]. They characterise Martin-Löf and Schnorr randomness by weak merging and summable KL divergence, as "global analogues of Vovk's theorem [Vov87]."

**Use for the paper.**
- Dawid's "empirical probability" is itself a Humean-style quantity. It supervenes on the sequence and is unique up to asymptotic equivalence among computable forecasters.
- Dawid 2017: "No commitment as to the existence of 'true probabilities' is called for."
- Höltgen 2026 [READ] notes the affinity with Lewis's best-system account: "Dawid could be seen as linking the best-systems view on probability with our more pragmatic notion of model-based predictions."
- So the gloss "'the chances' are identifiable from the record relative to a computational class" is fair if "identifiable" means *uniquely determined in the limit, among computable forecasters, when such a forecaster exists*. It is not fair if it means learnable or certifiable from a finite record.

---

## 4. Claim 4: undermining futures and the best-system test

**Undermining is real and standard.**
- Sources: Lewis 1994; Thau 1994; Hall 1994 [Crossref; content READ via Schwarz 2016].
- Schwarz 2016's 10-toss example [READ]: the sequences compatible with iid(½) being the best system "plausibly ... all have five 0s and five 1s." So iid(½) gives probability 1 − 252/1024 ≈ **0.754** to its own being undermined.
- Belot 2016 [ABSTRACT: tool summary of the PhilSci preprint]: for N = 10, frequentism discards "more than three-quarters of the histories."

**Pathwise passing is unaffected.** Define T(P, ω) = pass iff P = BS(ω). A forecaster who announces BS(ω) at ω passes on every ω, by construction. Undermining does not touch this.

**What undermining does affect.**

**4.1 The economists' type-I clause is probabilistic, and the test fails it.**
- For this test, P{ω : T(P,ω) = pass} = P{BS = P} = 1 − P(undermined).
- [COMPUTED] Under the toy MDL-BSA of §1.2(d), iid(½) gives these probabilities to its own being undermined:

  | N | 10 | 20 | 100 | 1000 | 10⁴ |
  |---|---|---|---|---|---|
  | P(undermined) | 0.109 | 0.115 | 0.035 | 0.010 | 0.003 |

  Under the frequentist "chance = exact frequency" rule the figure is 0.754 at N = 10.
- In infinite-sequence models it can be exactly 0. Belot 2024 [READ] calls a theory of chance *proper* if each law gives probability 1 to its own chance hypothesis. His toy BSA, which assigns Bernoulli(r) to incomputable sequences with computable frequency r, is proper. There the Humean test has **zero** type-I error even by the economists' standard.
- **So the paper must say which type-I standard it uses.**
  - The Humean pathwise standard is arguably the right one for a Humean. A function undermined at ω was not the chance at ω, so failing it there is no type-I error.
  - The New Principle makes this precise. In Hall 2004's form, quoted by Schwarz [READ], Cr(A | Ch_t = f ∧ E) = f(A | Ch_t = f ∧ E). So by the forecaster's own lights, Cr(pass | Ch = P) = 1.
  - The economists' standard and the Humean one **come apart exactly by the undermining probability**. Say so explicitly.

**4.2 The forecaster must know the whole history's best system.**
- Humean chance-knowledge is information about the future. Schwarz 2016: "for Humeans, information about chance contains statistical information about the history of outcomes".
- It is therefore inadmissible in Lewis's original sense, which is the source of the "Big Bad Bug". This is fine for the test, which asks her to *announce* the chance function. But her own New-Principle credences are P(·|T), not P.

**4.3 Finite-data versions are powerless** [own lemma; easy].
- Let T(P, h) be a test that sees only the first n outcomes h and passes the Humean chance-knower on every path.
- Then T(P, h) = pass for every P in BS([h]), where [h] is the set of histories extending h.
- If the rest of the history is long relative to n, essentially every candidate is the best system of some extension of h, because frequencies are dominated by the tail. So the test passes everything.
- **Pathwise Humean certification is therefore certification by the whole mosaic, delivered at the end of the world or "at infinity," not by a track record.**
- With bounded data the Humean must go back to the probabilistic type-I standard. Undermining probabilities then count as type-I error, and any escape depends on two things: non-convexity, and the candidate systems being distinguishable on the data (MOR §4.1).

**4.4 The pathwise test's non-manipulability is cheap, and depends on the range of BS.**
- For any ζ and δ, all but finitely many systems get ζ-mass below δ. So ζ fails with probability above 1 − δ on every path whose best system is outside that finite set.
- That is stronger than the economists' topological results. It is bought with the pathwise standard and whole-history data.
- If the best-system account's simplicity crowns a Laplace or universal mixture on most paths, the range of BS concentrates. A charlatan who announces the mixture then passes on most paths (§1.2(d)–(e)).
- Ties ("if nature is kind"; Fenton-Glynn's unsharp chances) make BS(ω) undefined or set-valued on some paths, so the test needs a rule for them.

---

## 5. Claim 5: priority

**Bottom line.** I found no work that connects the testing-experts impossibility results, or Foster–Vohra calibration manipulability, to the Humean vs primitivist debate. I also found none arguing that primitive-chance knowledge is uncertifiable while Humean chance knowledge is certifiable.

Checked: web searches over philosophy and statistics phrasings; the PhilSci and PhilArchive records surfaced by those searches; Crossref; and the full texts listed below. See §8 for gaps.

**Near-misses.** Each of these does part of the job and none does the whole.

| Work | What it does | What it does not do |
|---|---|---|
| Al-Najjar & Weinstein 2008, pp. 554–555 [READ] | Closest economist precursor. "The meaning of stochastic truth ... is much less obvious. A typical distribution P on outcomes can have infinitely many two-stage lottery representations ... these different information structures are relevant only to the extent that there is an observer who is at least partially informed of what the truth is." Concludes "the only coherent notion of 'true' probabilities is relative." | No Humean or propensity framing. Their "relative truth" is the opposite of the Humean answer, on which the realised component is the truth. |
| Olszewski 2015, §5.3 [READ] | "what does it mean to know the probabilities of future events?" | Sets interpretation aside: "One may disagree about the way we should interpret the concept of probability". |
| Vovk & Shafer 2005/2007, §5.3 [READ] | "If everything is stochastic to a good approximation, then the bare concept of stochasticity has limited content ... there seems to be very little content in the assertion that a sequence is governed by a completely unknown probability distribution." | Not about chance metaphysics. Closest in spirit to "primitive chance claims are uncertifiable." |
| Dawid 2017, *Synthese* [READ] | Asymptotic identification. "No commitment as to the existence of 'true probabilities' is called for." Surveys propensity and chance interpretations. | No testing-experts results; no Humean/primitivist contrast. |
| Höltgen 2026, arXiv 2609.09855 [READ, relevant passages] | Links Dawid's calibration view to Lewis's best-system account. Discusses Foster–Vohra. Rejects probabilities "'out there.'" | No manipulability theorems; no certification thesis. |
| Roth, Tolbert & Weinstein 2023 [READ] | Sandroni 2003 and individual probabilities. "we do not take such radical under-determination ... to in anyway impugn the objectivity of such assignments." | No chance metaphysics. |
| Belot 2024, "Unprincipled" [READ] | Humean chance plus PP plus computability and learning. | Non-reductionist accounts "are neglected throughout"; no testing experts. |
| Belot 2016, "Undermined" [ABSTRACT] | Reductionism "inevitably distort[s] the relations of probability that [it] take[s] as input." | No testing or forecasters, per the tool summary. |
| Barrett & Chen 2026, *BJPS* [READ, arXiv v3] | De Finetti plus Martin-Löf randomness plus PP, for Humeans and minimal primitivists alike. | No testing experts. |
| Earman & Roberts 2005, *PPR* [READ: abstracts and II §3] | Epistemological argument for Humean supervenience of *laws*: "one can combine a modest realism about laws of nature with a proper recognition of the importance of empirical testability ... only if one accepts HS." Structurally the closest philosophical precursor. | Not strategic, and not about chance. They allow that "single-case objective chances ... might not supervene on the Humean base." |
| Lewis 1994; van Fraassen 1989; Loewer 2004; Schwarz 2016 [READ: Schwarz's summary] | The epistemic argument for Humean chance: "we have no direct way to inspect this primitive quantity; physicists estimate chances by using the Principal Principle". | About the Principal Principle (PP), not about certifying experts. |
| Caso 2016; Johns 2018; Hicks 2017; Ackermans 2022 [ABSTRACT] | Chance–credence norms and fit. | None touches testing experts. |
| Shieber 2015 and Grodniewicz 2022 (philosophy-report §1.2) | Use the testing results in testimony theory. | Not about chance. |

**Assessment.**
- The connection appears new.
- Expect referees to cite Earman–Roberts, Lewis's PP challenge to primitivists, Al-Najjar–Weinstein's "relative truth", Vovk–Shafer's "little content" remark, and Dawid's asymptotic identification. The paper should cite all five as the nearest precursors.
- It should then say what is new: a strategic, theorem-backed version. It should also say where Humeanism and primitivism diverge: whether Nature's compound lotteries reduce, which comes down to closure under mixture and self-undermining. And it should be honest that the Humean advantage lives at infinite horizon or with pathwise type-I control, not in finite track records (§4.3).

---

## 6. Suggested wording changes (short)

1. Replace "best-system chance functions are never mixtures of rival candidate systems" with (L2)–(L3) of §1.4, plus an explicit simplicity assumption that excludes Laplace and universal mixtures. Footnote the statistical-mechanics and hierarchical cases.
2. Do not describe MOR Prop. 2 as "iid with announced bias plus a frequency band." It is a likelihood-ratio test against the fair coin on Λ_{m,δ}. Present the iid/frequency-band test as your own example, an instance of MOR §4.1.
3. Qualify "no test ... can screen out a strategic ignoramus" with "using bounded data or prequential tests." O&S 2009 *AoS* and Dekel–Feinberg give non-manipulable infinite-horizon tests for all of Δ(Ω).
4. For the best-system test, say that type-I control is pathwise. Note that it fails the economists' probabilistic standard by exactly the undermining probability. State that only whole-history data make it work.
5. State Dawid as: uniqueness among *computable* forecasters, asymptotic only, existence not guaranteed (Schervish; Belot 2013). Cite Vovk 1987 for the Martin-Löf version.

---

## 7. Bibliography

Checked against Crossref unless noted.

- Al-Najjar, N. I. & Weinstein, J. (2008). Comparative testing of experts. *Econometrica* 76(3): 541–559. doi:10.1111/j.1468-0262.2008.00846.x
- Barrett, J. A. & Chen, E. K. (2026). Algorithmic randomness, exchangeability, and the Principal Principle. *BJPS*. doi:10.1086/743818 (read: arXiv 2510.24054v3)
- Barrett, J. A. & Chen, E. K. (2025). Algorithmic randomness and probabilistic laws. *BJPS*. doi:10.1086/738573 (not read)
- Beisbart, C. (2014). Good just isn't good enough: Humean chances and Boltzmannian statistical physics. In *New Directions in the Philosophy of Science*, 511–529. doi:10.1007/978-3-319-04382-1_36
- Belot, G. (2013). Failure of calibration is typical. *Statistics & Probability Letters* 83(10): 2316–2318 (per philosophy-report; read: arXiv 1306.4943).
- Belot, G. (2016). Undermined. *AJP* 94(4): 781–791. doi:10.1080/00048402.2016.1139604
- Belot, G. (2024). Unprincipled. *Review of Symbolic Logic* 17(2): 435ff. doi:10.1017/S1755020323000151 (open access; read)
- Blackwell, D. & MacQueen, J. B. (1973). Ferguson distributions via Pólya urn schemes. *Ann. Statist.* 1(2): 353–355. doi:10.1214/aos/1176342372
- Dardashti, R., Glynn, L., Thébault, K. & Frisch, M. (2014). Unsharp Humean chances in statistical physics: A reply to Beisbart. In *New Directions in the Philosophy of Science*, 531–542. doi:10.1007/978-3-319-04382-1_37
- Dawid, A. P. (1982). The well-calibrated Bayesian. *JASA* 77(379): 605–610. doi:10.1080/01621459.1982.10477856
- Dawid, A. P. (1985). Calibration-based empirical probability (with discussion). *Ann. Statist.* 13(4): 1251–1274 (discussion to 1285). doi:10.1214/aos/1176349736 (NOT READ)
- Dawid, A. P. (2017). On individual risk. *Synthese* 194(9): 3445–3474. (read: arXiv 1406.5540)
- Dawid, A. P. & Vovk, V. (1999). Prequential probability: principles and properties. *Bernoulli* 5(1): 125–162. doi:10.2307/3318616 (not read)
- Diaconis, P. & Freedman, D. (1980). Finite exchangeable sequences. *Ann. Probab.* 8(4): 745–764. doi:10.1214/aop/1176994663 (not read)
- Earman, J. & Roberts, J. T. (2005). Contact with the nomic, Parts I–II. *PPR* 71(1): 1–22; 71(2): 253–286. doi:10.1111/j.1933-1592.2005.tb00428.x; doi:10.1111/j.1933-1592.2005.tb00449.x
- El-Dakkak, O. & Peccati, G. Hoeffding decompositions and two-colour urn sequences. arXiv math/0610590 (journal version not checked).
- Elga, A. (2004). Infinitesimal chances and the laws of nature. *AJP* 82(1): 67–76. doi:10.1080/713659804 (read: June 2003 penultimate draft)
- Fenton-Glynn, L. (2017). Imprecise best system chances. In *EPSA15 Selected Papers*, 297–308. doi:10.1007/978-3-319-53730-6_24. Also (2019) Imprecise chance and the best system analysis, *Philosophers' Imprint* 19(23) (from the journal URL; not Crossref-checked).
- Frigg, R. & Hoefer, C. (2015). The best Humean system for statistical mechanics. *Erkenntnis* 80(S3): 551–574. doi:10.1007/s10670-013-9541-5 (not read)
- Gaifman, H. & Snir, M. (1982). Probabilities over rich languages, testing and randomness. *JSL* 47(3): 495–548. doi:10.2307/2273587
- Grünwald, P. (2005). Introducing the MDL principle / A tutorial introduction to MDL. In *Advances in MDL*, MIT Press. doi:10.7551/mitpress/1114.003.0004 (read: arXiv math/0406077)
- Hall, N. (1994). Correcting the guide to objective chance. *Mind* 103(412): 505–518. doi:10.1093/mind/103.412.505
- Hall, N. (2004). Two mistakes about credence and chance. *AJP* 82(1): 93–111. doi:10.1080/713659806
- Hicks, M. T. (2017). Making fit fit. *Phil. Sci.* 84(5): 931–943. doi:10.1086/693967 (abstract)
- Hill, B. M., Lane, D. & Sudderth, W. (1987). Exchangeable urn processes. *Ann. Probab.* 15(4): 1586–1592. doi:10.1214/aop/1176991995
- Hoefer, C. (2007). The third way on objective probability. *Mind* 116(463): 549–596. doi:10.1093/mind/fzm549
- Hoefer, C. (2019). *Chance in the World*. OUP. doi:10.1093/oso/9780190907419.001.0001 (not read)
- Höltgen, B. (2026). A unifying perspective on probabilities as model predictions. arXiv 2609.09855.
- Huttegger, S. M., Walsh, S. & Zaffora Blando, F. (2026). Algorithmic randomness and the weak merging of computable probability measures. arXiv 2504.00440v3.
- Lewis, D. (1980). A subjectivist's guide to objective chance. In *Studies in Inductive Logic and Probability* II: 263–294. doi:10.1525/9780520318328-009
- Lewis, D. (1994). Humean supervenience debugged. *Mind* 103(412): 473–490. doi:10.1093/mind/103.412.473
- Loewer, B. (2001). Determinism and chance. *SHPMP* 32(4): 609–620. doi:10.1016/s1355-2198(01)00028-4 (not read)
- Loewer, B. (2004). David Lewis's Humean theory of objective chance. *Phil. Sci.* 71(5): 1115–1125 (JSTOR copy read).
- Olszewski, W. & Sandroni, A. (2009). Strategic manipulation of empirical tests. *Math. Oper. Res.* 34(1): 57–70. doi:10.1287/moor.1080.0347 (read: PIER WP 08-015)
- Rissanen, J. (1996). Fisher information and stochastic complexity. *IEEE Trans. Inf. Theory* 42(1): 40–47. doi:10.1109/18.481776
- Roth, A., Tolbert, A. W. & Weinstein, S. (2023). Reconciling individual probability forecasts. *FAccT '23*: 1124–1138.
- Schwarz, W. (2014). Proving the Principal Principle. In A. Wilson (ed.), *Chance and Temporal Asymmetry*, 81–99. doi:10.1093/acprof:oso/9780199673421.003.0004
- Schwarz, W. (2016/2017). Best system approaches to chance. In *Oxford Handbook of Probability and Philosophy*. doi:10.1093/oxfordhb/9780199607617.013.19 (read: October 2014 draft)
- Thau, M. (1994). Undermining and admissibility. *Mind* 103(412): 491–504. doi:10.1093/mind/103.412.491
- Vovk, V. G. (1987). On a criterion of randomness. *Doklady AN SSSR* 294(6): 1298–1302; *Soviet Math. Dokl.* 35(3): 656–660 (bibliographic data from Vovk's own note; not Crossref).
- Vovk, V. & Shafer, G. (2005). Good randomized sequential probability forecasting is always possible. *JRSS B* 67(5): 747–763. doi:10.1111/j.1467-9868.2005.00525.x (read: GTP WP 7)
- Vovk, V. & Shen, A. (2010). Prequential randomness and probability. *TCS* 411(29–30): 2632–2646. doi:10.1016/j.tcs.2010.04.002
- Woodward, J. (2014). Simplicity in the best systems account of laws of nature. *BJPS* 65(1): 91–123. doi:10.1093/bjps/axt026 (not read)
- Xie, Q. & Barron, A. R. (2000). Asymptotic minimax regret for data compression, gambling, and prediction. *IEEE Trans. Inf. Theory* 46(2): 431–445. doi:10.1109/18.825803

---

## 8. Access log and search gaps

**Blocked**
- Project Euclid (Dawid 1985; Hill–Lane–Sudderth) returned an Incapsula bot page.
- Taylor & Francis (Belot 2016) returned a fetch error.
- PhilSci-Archive refused curl (TLS), but some pages worked through WebFetch summaries.
- OpenAlex's free daily budget was exhausted by earlier work today, so no citation-graph searches were run this session.
- PhilPapers search was not attempted (Cloudflare, per philosophy-report).
- Google Scholar was not used.
- The Foster–Vohra survey DP 1537 link is dead.

**Read in full or in the relevant parts** (texts in the session scratchpad, not saved to `texts/`)
- Elga 2004 draft; Schwarz 2016 draft; Loewer 2004; Belot 2024; Barrett & Chen 2026; Dawid 2017; Vovk 1987; Vovk–Shen; Grünwald tutorial; Höltgen 2026; Earman–Roberts I–II (parts); SEP *Chance versus Randomness* Supplement D; Dorr's 2006 seminar notes.
- Also the already-saved Belot 2013, Roth–Tolbert–Weinstein 2023, Al-Najjar–Weinstein 2008, Olszewski 2015, O&S 2009 *MOR*, and Vovk–Shafer WP 7.

**Searches to run by hand before submission**
- PhilPapers: `Sandroni chance`; `"testing experts" Humean`; `calibration "best system"`; `"undermining" forecaster`.
- Google Scholar "cited by" for Al-Najjar & Weinstein 2008, Dawid 1985 and Olszewski 2015, filtered to *Synthese*, *Phil Sci*, *BJPS*, *Erkenntnis*, *AJP*, *Phil Studies*, *Noûs*.
- Hoefer 2019, chapters 3–4, for any "chance setup" treatment of mixtures (e.g. coins drawn from a bag).
