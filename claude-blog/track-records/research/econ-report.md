# Testing experts and forecasters: a technical report on the economics / CS / statistics literature

Prepared for a formal-epistemology paper on what a forecaster's track record can show about expertise.
Compiled 20 October 2026.

---

## 0. How to read this report; access log

**Method.** Every theorem stated below was checked against a text of the paper itself, unless the entry is flagged **[NOT READ]**. For papers I could not open (paywall, bot-blocking, or no author copy found), I give only what the abstract and reliable secondary sources say, and I name those sources. Quotations are verbatim from the version I read. Where I read a working-paper version rather than the published one, I give the version's date. Section, proposition and page numbers can differ from the published version.

**Texts saved** (one `.txt` per paper, extracted with `pdftotext -layout`) in `/mnt/user-data/outputs/track-record-paper/research/texts/`. Filenames are given in each entry. Some other files in that folder (Belot, Zaffora Blando, Hu, Levy, the SEP entries, and `pomatto-sandroni-2018-...`) were put there by a parallel process. I read the Pomatto–Sandroni file in full and use it below.

**Could not access full text**, so these entries rely on the abstract and secondary sources:
- Dawid 1982 and Oakes 1985 (JASA). The only copies I found were third-party mirrors, which I did not use. I rely on Seidenfeld 1985, Foster–Vohra 1998, Belot 2013 and V'yugin 2008.
- Sandroni 2003 (IJGT): abstract, plus restatements in Fortnow–Vohra, Olszewski 2015 and Al-Najjar–Weinstein.
- Sandroni–Smorodinsky–Vohra 2003 (Math OR): secondary sources only (Lehrer 2001 §10.2, Vovk–Shafer App. A, Olszewski 2015).
- Olszewski–Sandroni 2009, *PNAS*: PMC was captcha-blocked and PNAS returned 403. I use the Europe PMC abstract and Olszewski 2015's statement of the theorem.
- Al-Najjar–Sandroni–Smorodinsky–Weinstein 2010 (JET): the IDEAS abstract and Olszewski 2015. The only full-text copy I found was on academia.edu, which was refused as a walled copy.
- Al-Najjar–Sandroni 2013 (*Math. Soc. Sci.*), Al-Najjar–Pomatto–Sandroni 2014 (AER "Claim validation"), Feinberg–Lambert 2015, Foster–Young 2010/2012, Chassang 2013, Hanson–Oprea 2009, Guo–Shmaya 2021: abstracts only.
- Published versions of Dekel–Feinberg 2006 (REStud), Fortnow–Vohra 2009 (Econometrica) and the AER *Falsifiability* text. I read working papers (dated below) and the published abstracts.
- I found no "Sandroni Econometric Society lecture." The nearest surveys are Olszewski's Handbook chapter (read in full, January 2014 version), Pomatto's Caltech lecture slides (saved), and Foster & Vohra (2011), "Calibration: Respice, Adspice, Prospice," Northwestern CMS-EMS DP 1537. The DP 1537 link was dead (404), so that survey was not read.

**Citation verification.** Bibliographic data were checked against Crossref (DOIs in §12) or, failing that, against the publisher, IDEAS/RePEc or arXiv metadata. Three corrections to the citations in the brief:
- Sandroni 2003 is IJGT **32(1): 151–159**, not 51–57.
- Olszewski–Peski 2011 is AEJ: Micro **3(2): 89–113**.
- The 2019 Kavaler–Smorodinsky paper is GEB **118: 94–109**.

---

## 1. The common framework (read this first)

Almost all the economics papers share one skeleton. Getting the quantifiers right is most of the philosophical content.

**Outcomes and theories.**
- Each period an outcome from a finite set S is observed, usually S = {0,1}. A path is ω ∈ Ω = S^ℕ.
- A *theory* (or *forecasting rule*, or *prediction rule*) is a map f from finite histories to Δ(S). By Kolmogorov extension it induces a probability P_f ∈ Δ(Ω); conversely, any P ∈ Δ(Ω) gives one-step-ahead conditionals. The literature therefore treats "theories" and probability measures over paths interchangeably. Al-Najjar–Weinstein fn. 8 notes this is "not entirely innocuous": a test that takes f as input can condition on forecasts at P_f-null histories.

**Tests.** A *test* is a function from (theory or forecast sequence, data) to {PASS, FAIL}. Variants:
- **Infinite-horizon / "theory" tests:** T: Δ(Ω) × Ω → {0,1} (Dekel–Feinberg; Olszewski–Sandroni 2009 AoS). The expert announces the whole P at time 0.
- **Rejection tests / tests that reject in finite time:** for each P the rejection set {ω: T(P,ω)=0} is a union of cylinders, i.e. open (O&S 2008; 2009 AoS Def. 5). The rejection time may be unbounded.
- **Finite tests:** the verdict depends on the first n outcomes. In Sandroni 2003, n is the same for all theories; in Olszewski 2015 it may depend on P.
- **Prequential tests:** the verdict depends on P only through the forecasts made along the realized path (Dawid's prequential principle).
- **Future-independent tests** (O&S 2008, Def. 2): if f and f′ agree up to period m, then f is rejected at an (m+1)-history iff f′ is. The verdict at time t uses only predictions about data already seen. "Future-dependent" tests may use forecasts conditional on histories not yet realized, including counterfactual ones.
- **Acceptance tests:** the acceptance sets are open (O&S 2009 AoS Def. 7).

**Type-I control: "does not reject the truth."** For ε ∈ [0,1],

  ∀P ∈ Λ:  P({ω : T(P,ω) = PASS}) ≥ 1 − ε    (Λ = Δ(Ω) unless a "paradigm" is imposed)

- The probability is computed under the *same* P the expert announced. The clause says: *whatever the data-generating process is*, an expert who reports it (or its conditionals along the path) passes with probability at least 1 − ε. This "for every P" is the **prior-freeness** assumption.
- Some papers use strict ">" (Olszewski 2015 Def. 2; O&S 2009 MOR Def. 3); others use "≥". Nothing turns on it.
- O&S 2008 §5.2.1 notes that the informed expert need not be truthful: it suffices that for every f some f̃ satisfies P_f(T(f̃) rejects) ≤ ε.

**Manipulability / "ignorantly passed."** For ε ∈ [0,1],

  ∃ζ ∈ Δ(Δ(Ω)) ∀ω ∈ Ω:  ζ({P : T(P,ω) = PASS}) ≥ 1 − ε    (sometimes 1 − ε − δ)

- ζ is a "random generator of theories." The charlatan **randomizes once, at time 0**, over theories. For prequential tests this is equivalent, by Kuhn's theorem (Shmaya 2008 §4), to a behavioral strategy that randomizes the forecast each period given past outcomes and past own forecasts.
- ζ may depend on the test but on nothing else. The probability is over the charlatan's own randomization only, and the statement holds **for every path ω**. Nature is a worst-case adversary who knows ζ but not its realization. This is Foster–Vohra's "adaptive adversary."
- If Nature could see the realized forecast before choosing the outcome (the "prescient adversary"), no forecaster could even be calibrated (Foster–Vohra §3; Oakes).
- **The charlatan must know the test.** O&S 2008 §5.2.3: the result extends to a tester who randomizes over tests if the charlatan knows the randomization. O&S 2009 MOR Example 1: if test and theory are chosen simultaneously, the zero-sum game between tester and charlatan may have no equilibrium.

**Non-manipulability** comes in grades. Each says the charlatan **can** be caught on some data, not that he probably **will** be.
- Weakest: ∀ζ ∃ω with ζ({P: FAIL at ω}) > ε.
- "ε-effective" (O&S 2009 MOR): ∀ζ the "revelation set" R^ε_ζ = {ω: ζ(FAIL at ω) ≥ 1 − ε} is nonempty.
- Strong: ∀ζ the revelation set R^0_ζ (fail with ζ-probability 1) is uncountable (Dekel–Feinberg, under CH), or comeager, i.e. the complement of a first-category set (O&S 2009 AoS).
- O&S 2009 MOR Prop. 3 (§4 below) shows that "probably will be caught" is unattainable in measure-theoretic terms for any fixed measure Q.

**The engine of the negative results** is a minimax argument: Fan's minimax theorem, or Martin's determinacy of Blackwell games.
- Consider a zero-sum game: Nature picks P (or a mixture over P), the expert picks ζ, and the payoff is the passing probability.
- For every *pure* P, the expert has a good reply: announce P, which passes with probability ≥ 1 − ε. Nature's mixtures μ over Δ(Ω) reduce to a single P_μ = ∫P dμ, so the expert also has a good reply to every mixed strategy of Nature. Al-Najjar–Weinstein §6 call this reducibility the key point.
- If the game has a value, a single ζ guarantees ≈ 1 − ε against **every** path.
- All the technical work is in getting the topological conditions (compactness, semicontinuity) needed for the minimax theorem. Those conditions are exactly where the positive results find room: future-dependent, non-open, non-Borel or non-convex settings.

---

## 2. Calibration: the origin

### 2.1 Dawid (1982), "The Well-Calibrated Bayesian." **[NOT READ — secondary sources]**
*JASA* 77(379): 605–610 (rejoinder p. 612), doi:10.1080/01621459.1982.10477856.

**Result** (as stated in Seidenfeld 1985, Theorem 3.1, who credits Pratt 1962 and Dawid 1982).
- A forecaster's sequence of forecasts p_i = P(e_i | f_1, …, f_{i−1}) comes from a single coherent probability P, updated on feedback.
- Let ξ_i ∈ {0,1} be any selection rule whose value is determined by information available before forecast i, with ξ_i = 1 infinitely often.
- Let f̄_k be the relative frequency of the events and p̄_k the average forecast within the selected subsequence among the first k forecasts.
- Then **with P-probability 1**, lim_k (f̄_k − p̄_k) = 0.

**What it shows.** Every coherent (countably additive) Bayesian is certain, by his own lights, that he will be calibrated on every selection rule of this kind. Belot (2013) restates it this way: "every prior on the space of binary sequences considers the set of sequences relative to which it is not computably calibrated to be a set of measure zero."

**What it does not show.** That the Bayesian *will* be calibrated on the actual sequence. The "almost surely" is the forecaster's own. Seidenfeld (1985) also notes that the proof needs countable additivity; under finite additivity "two limitations" arise (Seidenfeld App., citing Dubins 1974).

### 2.2 Oakes (1985), "Self-Calibrating Priors Do Not Exist," with comments by Dawid and Schervish. **[NOT READ — secondary sources]**
- Oakes: *JASA* 80(390): 339, doi:10.1080/01621459.1985.10478117.
- Dawid, "Comment," 80(390): 340, doi:10.2307/2287892.
- Schervish, "Comment," 80(390): 341, doi:10.2307/2287893.
- Crossref lists both comments as "Self-Calibrating Priors Do Not Exist: Comment." I could not verify any further subtitle.

**Result** (Foster–Vohra 1998 p. 380; V'yugin 2008; Belot 2013).
- No deterministic forecasting system (equivalently, no prior with posterior-predictive forecasts) is calibrated on every outcome sequence.
- Foster–Vohra: "Oakes shows that it is impossible to construct a joint distribution for an infinite sequence of events whose posterior mean is guaranteed to be calibrated for every possible sequence of outcomes."
- Proof idea, which Foster–Vohra credit to Dawid 1985: let x_i = 1 iff the forecast p_i ≤ 0.5. Foster–Vohra write ≤; V'yugin writes <. This defeats calibration on the two bins [0, ½] and (½, 1], giving calibration score ≥ ¼ (Foster–Vohra).
- Schervish's comment (Belot 2013): "every forecasting system fails to be high-low calibrated relative to an uncountable infinity of possible data sequences."

**Gloss.** Combined with Dawid 1982: each coherent forecaster is sure he will be calibrated, yet for each one there are sequences on which he is not. Belot 2013 (saved; arXiv 1306.4943) strengthens this: the failure set is topologically typical (comeager).

### 2.3 Seidenfeld (1985), "Calibration, Coherence, and Scoring Rules." **[READ: full text]**
*Philosophy of Science* 52(2): 274–294, doi:10.1086/289244. File: `seidenfeld-1985-calibration-coherence-scoring-rules.txt` (JSTOR copy posted on the author's CMU page).

**Claims, quoted from the abstract.**
- "(ii) Subject to feedback, calibration in the long run is otiose. It gives no ground for validating one coherent opinion over another as each coherent forecaster is (almost) sure of his own long-run calibration."
- "(iii) Calibration in the short run is an inducement to hedge forecasts. A calibration score, in the short run, is improper."

**Theorems used.**
- Theorem 1 (Schervish 1983): on a finite sequence, a miscalibrated forecaster's "well-calibrated counterpart" (forecasts relabelled by their bin frequencies) outperforms him in similar decisions.
- Theorem 3.1: the Pratt/Dawid result in §2.1 above.

He stresses that the agreement is "internal": the asymptotic calibration is judged "from the point of view of the forecaster." This is a philosophy-venue antecedent of the "self-calibration" theme.

### 2.4 Foster & Vohra (1998), "Asymptotic Calibration." **[READ: published text]**
*Biometrika* 85(2): 379–390, doi:10.1093/biomet/85.2.379. File: `foster_vohra1998_asymptotic_calibration_Biometrika.txt` (the copy archived in D. K. Levine's RePEc working-paper archive).

**Setup** (pp. 380–383).
- Binary outcomes X_t. Forecasts f_t lie in a finite grid A = {0, 1/k, …, 1}. n_t(p) is the number of periods with forecast p, and ρ_t(p) the frequency of rain among them.
- Calibration score: C_t(F,X) = Σ_{p∈A} (ρ_t(p) − p)² · n_t(p)/t.
- "Rules of the game": (1) the statistician picks a randomized forecasting method F and reveals only its distribution to Nature; (2) each period the statistician draws f_t while Nature simultaneously picks X_t, knowing F's distribution but not the draw; (3) the penalty is C_t.

**Definition (ε-calibration), verbatim** (checked against the page image): "A randomised forecast rule F is ε-calibrated if, for all X, lim_{t→∞} pr{C_t(F, X) < ε} > 1 − ε. Note that X is allowed to be a stochastic process that may depend on the previous realisations of the F's and X's."

**Theorem 1.** "A randomised forecast using the μ_t defined by equation (2) with k = 1/ε² is an ε-calibrated forecast." Equation (2) is a regret-balancing condition, solved for a stationary distribution of a stochastic matrix.

Section 4 gives Sergiu Hart's non-constructive minimax proof. Hart (2022, arXiv 2209.05863) writes it up and shows that "N³ periods suffice to guarantee a calibration error of at most 1/N."

**Explicitly does not show / limits.**
- Randomization is essential against a "prescient" Nature that sees the forecast first. Such a Nature can force C_t ≥ ¼ for any deterministic or revealed forecast (§3).
- The authors themselves say calibration is not sufficient for goodness: alternating 0,1 versus constant ½ are both calibrated (p. 380).
- Calibration only to a finite grid. Lehrer (2001 §2) notes that Foster–Vohra's "combined calibration test" with unrestricted forecasts is not even Type-I-error free.

---

## 3. Single-expert impossibility (manipulability) results

### 3.1 Lehrer (2001), "Any Inspection is Manipulable." **[READ: author's final version, 11 March 2001]**
*Econometrica* 69(5): 1333–1347, doi:10.1111/1468-0262.00244. File: `lehrer2001_any_inspection.txt`.

**Definitions.**
- A *checking rule* D = (C, U) assigns to each history ω^n events C(ω^n) ⊆ U(ω^n) ⊆ Ω. Here Ω is the finite state space.
- The forecast µ passes the calibration test induced by D at ω^∞ if, whenever D is active infinitely often (T^n → ∞), lim f^n(D, ω^n, µ) = 0. Here f^n is the average over active periods of µ(U|·)[1_C − µ(C|·)].
- A *test* ψ(µ, ω^∞) ∈ {PASS, FAIL} is "Type I-error free" if, for every µ, ψ(µ,·) = PASS µ-a.s. Calibration tests are Type-I-error free by the strong law of large numbers.
- A *mixed* test is a distribution λ over checking rules.

**Theorem 1.** "Given λ, there is a forecasting µ s.t. for any ω^∞, the sequence f^n(D, ω^n, µ), of random variables defined over D, converges λ-almost surely to zero."

**Corollary 1.** For any countable set D₀ of checking rules there is a forecast µ that passes every D ∈ D₀ at every ω^∞. In fn. 1: if D₀ is all Turing-computable rules, "the forecasting scheme will be non-computable."

**Notable features.**
- The manipulating forecast is **deterministic** (§10.2). This works because Lehrer's checking rules depend on past outcomes and, per §10.1, past predictions, **but not on the current prediction**.
- Prop. 2: the set of all checking rules is not the span of any countable set (by Oakes).
- §10.4 conjecture: "any Type I-error free set is manipulable." He adds that "there is no obvious way to define what is Type II-error."

### 3.2 Sandroni, Smorodinsky & Vohra (2003), "Calibration with Many Checking Rules." **[NOT READ — secondary]**
*Mathematics of Operations Research* 28(1): 141–153, doi:10.1287/moor.28.1.141.14264.

**Per secondary sources.**
- Extends Lehrer to countably many *forecast-based* checking rules: rules that may condition on the current forecast lying in a set D ⊂ [0,1], as well as on past outcomes.
- The manipulating scheme randomizes over a finite set of predictions (Lehrer §10.2).
- Shmaya (2008, fn. 3) cites SSV Example 2.1 for the claim that such tests "do not admit a pure manipulation."
- Vovk–Shafer (App. A) note that SSV's rules use x₁…x_{n−1} and p_n but ignore the earlier forecasts. Their own Theorem 6 covers arbitrary measurable selection rules on the whole forecast/outcome history.

### 3.3 Sandroni (2003), "The Reproducible Properties of Correct Forecasts." **[NOT READ — abstract + restatements]**
*International Journal of Game Theory* 32(1): 151–159, doi:10.1007/s001820300153.

**Abstract** (IDEAS): "Let a test be an arbitrary function from sequences of forecasts and outcomes to {0,1} … Consider any test that does not reject the truth, i.e. it does not reject when the announced forecasts are the conditional probabilities of the data generating process. Based on Fan's (1953) Minimax theorem, I show that it is possible to produce forecasts that will not be rejected on any sequence of outcomes."

**Precise form**, as restated by Fortnow–Vohra (ECCC 2006, "Theorem 1 (Sandroni's Theorem)").
- Setting: horizon n; test T: Sⁿ × [0,1]ⁿ → {0,1}, applied to the realized forecasts.
- If T passes the truth with probability 1 − ε for all P, then some randomized forecasting algorithm F satisfies, for every s ∈ Sⁿ, Pr_F(T(s, f(s)) = 1) ≥ 1 − ε.
- Olszewski 2015 (fn. 7): Sandroni's finiteness assumption has the same n for all theories.

This is the first result covering *any* test, not just calibration-type tests. It is the "Sandroni impossibility theorem" cited throughout.

### 3.4 Vovk & Shafer (2005), "Good Randomized Sequential Probability Forecasting is Always Possible"; defensive forecasting. **[READ: Working Paper #7, revised 12 Sept 2007, which contains the JRSSB text plus appendices]**
*JRSS B* 67(5): 747–763, doi:10.1111/j.1467-9868.2005.00525.x. File: `vovk_shafer2005_good_randomized_GTPwp7.txt`.

**Framework.**
- Game-theoretic probability. A *statistical test is a betting strategy for Sceptic*, who bets at Forecaster's odds. The test is failed if Sceptic's capital K_n → ∞.
- "Binary Forecasting Game II": each round Sceptic announces a bounded function S_n: [0,1] → ℝ, so his bet may depend on the forthcoming forecast. Forecaster announces a distribution P_n on [0,1]. Reality announces x_n. A Random Number Generator draws p_n. Then K_n := K_{n−1} + S_n(p_n)(x_n − p_n).

**Theorem 3.** "Forecaster has a winning internal strategy in Binary Forecasting Game II." Forecaster wins if his own capital F_n → ∞ (the RNG was bad) or K_n stays bounded.

**Theorem 4** (finitary). For any ε > 0 Forecaster can guarantee K_n ≤ (1+ε)F_n for each n.

**Theorem 5** (added 2007). The randomization can be concentrated on two points |p′_n − p″_n| < ε_n, so "a tiny amount of randomization is sufficient."

**Theorem 6** (App. A). Any countable collection of measurable selection rules can be simultaneously "properly calibrated."

**Theorem 2.** Without randomization, Sceptic and Reality can jointly defeat Forecaster.

**Defensive forecasting** (WP §1, §5.2). "Randomization is not needed in the quite common case where the properties we want for the forecasts can be enforced by a strategy for the sceptic that is continuous in the forecast" (citing Vovk, Takemura & Shafer 2005). This is the deterministic analogue of the Foster–Hart "continuous calibration" result (§9.1).

**Philosophical claims** (WP §5.3, which may differ from the JRSSB text).
- "This shows that probability theory applies broadly to the real world. But this breadth of applicability undermines some conceptions of stochasticity. If everything is stochastic to a good approximation, then the bare concept of stochasticity has limited content."
- "There is content in the assertion that a sequence obeys a probability distribution P that we specify fully before any observation … But there seems to be very little content in the assertion that a sequence is governed by a completely unknown probability distribution."
- "because he succeeds regardless of the xs, it is awkward to call Forecaster's ps predictions. Perhaps we should call them descriptions of the past rather than predictions of the future."

### 3.5 Olszewski & Sandroni (2007), "Contracts and Uncertainty." **[READ: published, open access]**
*Theoretical Economics* 2(1): 1–13. File: `olszewski_sandroni2007_contracts_and_uncertainty_TE.txt`. This is the result that bears on "scoring rules versus tests."

**Setup.**
- One period, binary outcome. A *contract* is any pair of transfers c(i, p) depending on Bob's announced p and the outcome i. A proper-scoring-rule payment is a special case.
- The informed Bob has a signal that the probability lies in [p − ε, p + ε].
- The uninformed Bob is maxmin (Gilboa–Schmeidler) over all probabilities and may randomize (finite support) over announcements.

**Proposition 1.** "If an informed expert strongly accepts a contract c then an uninformed expert also accepts contract c." "Strongly accepts": expected utility at the signal exceeds the outside option by some δ > 0 for every signal p.

**Proposition 2** (many periods). The same holds for any *bounded* contract evaluated with discounting (β < 1).

**Implication.** No payment scheme, including one built from a strictly proper scoring rule, screens informed from uninformed experts in this setting. A proper scoring rule makes truth-telling optimal *for an expert who has beliefs*. It does not make *accepting the contract* unprofitable for an expert who has none.

### 3.6 Olszewski & Sandroni (2008), "Manipulability of Future-Independent Tests." **[READ: PIER WP 08-014, 15 April 2008, post-referee]**
*Econometrica* 76(6): 1437–1466, doi:10.3982/ECTA7428. File: `olszewski_sandroni2008_future_independent_PIER08-014.txt`.

**Definitions.**
- A theory is f: finite histories → [0,1] (the probability of 1).
- A test T maps theories to sets T(f) of finite histories "considered to be inconsistent with the theory," closed under extension. So rejection always happens at a finite time, but data sets are unbounded.
- Def. 1: T does not reject the DGP with probability 1 − ε if P^f(T(f)) ≤ ε for any f ∈ F.
- Def. 2 (future-independent): see §1.
- Def. 4: T can be ignorantly passed with probability 1 − ε if ∃ζ ∈ Δ(F) with ζ({f: s^t ∈ T(f)}) ≤ ε for all finite histories s^t.

**Proposition 1.** "Fix ε ∈ [0, 1] and δ ∈ (0, 1 − ε]. Any future-independent test T that does not reject the data-generating process with probability 1 − ε can be ignorantly passed with probability 1 − ε − δ." (Fn.: "ε … need not be 'small'.")

**Proposition 1′** (contract reading).
- Bob's reward is u and his disutility from rejection is M. Bob does not discount.
- "If the informed expert accepts test T, then the uninformed expert accepts test T", for a uninformed expert who evaluates by the worst-case path.
- The authors: "no matter how severe the punishment for having a theory rejected, no matter how small the reward for delivering a theory, no matter how large the data set the tester eventually has at her disposal – despite all of this, the completely uninformed expert will choose to announce a theory, provided that the test is future-independent, that the test is known, and that the informed expert also chooses to announce a theory."

**Proposition 2.** For any ε there is a regular (future-independent) ε-test *harder than the likelihood(-ratio) test* against an alternative f_δ. So the likelihood test can be ignorantly passed too.

**Extensions and limits** (§5.2).
- The result extends to theories restricted to forecasts in [a, b]. It does **not** extend to classes bounded away from ½ (see §3.8).
- Partial future-dependence (T-period-ahead) is still manipulable.
- Section 8, eq. (5.3): for any ζ, the sup over histories and over all future-independent tests that do not reject the truth with probability 0.5 of ζ_T(s^t) equals 1. So **no single ζ passes all such tests at once**. The charlatan needs to know which test is used.

**Key claim** (abstract). "Tests that cannot be ignorantly passed do exist, but these tests must make use of predictions contingent on data not yet observed at the time the forecasts are rejected. Such tests cannot be run if forecasters report only the probability of the next period's events on the basis of the actually observed data."

**What it does not show.** Anything about tests that use the forecaster's counterfactual or distant-future predictions. The authors explicitly do not object to those when an expert claims "a complete understanding of the stochastic process."

### 3.7 Shmaya (2008), "Many Inspections are Manipulable." **[READ: published, open access]**
*Theoretical Economics* 3(3): 367–382. File: `shmaya2008_many_inspections.txt`.

**Definitions.**
- Prediction rule f: S^{<ℕ} → Δ(S). Test function T: Δ(S)^ℕ × S^ℕ → {0,1}, applied to the realized predictions and the realized infinite path. So the test is prequential, and verdicts may be "at infinity."
- Def. 4: T "does not reject the truth with probability 1−ε" if P(f passes T over Θ₀, Θ₁, …) ≥ 1 − ε for every process (Θ_n) with f its conditionals.
- Def. 5: T is ε-manipulable if ∃ a probability ξ over prediction rules with ξ{f: f passes T over s} ≥ 1 − ε for every s ∈ S^ℕ.

**Theorem 1.** "Let T: Δ(S)^ℕ × S^ℕ → {0,1} be a Borel test function. If T does not reject the truth with probability 1 − ε, then T is ε + δ-manipulable for every δ > 0." The proof uses Martin's determinacy of Blackwell games.

**Theorem 2.** Let S = {0,1}. "Under the axiom of choice, there exists a universally measurable test function T" that (i) does not reject the truth with probability 1, and (ii) for every ξ some s ∈ S^ℕ has ξ{f: f passes T over s} = 0. So T is not ε-manipulable for any ε > 0.

**§7 (finite-horizon generalization and Example 1).**
- k-horizon predictions, with k possibly history-dependent, remain manipulable.
- But if each period the expert predicts a *tail* event B (determined only at infinity) and T_B passes iff lim q_n = 1_B(s), then T_B is not ε-manipulable for ε < ½ whenever B is not F_σ. Example: B = "infinitely many 1's."

**Conclusion** (verbatim). "The paper bears good news and bad news for the inspector. There exist sequential inspections that are not manipulable … However, such inspections must be either non-Borel or rely on predictions about events that are not determined at any finite period."

**Relation to O&S 2008** (Shmaya §3.3). Neither result implies the other. O&S's inspector must reject at a finite time, but may use the whole prediction rule up to that point, including off-path predictions. Shmaya's inspector may decide at infinity, but sees only on-path predictions.

### 3.8 Olszewski & Sandroni (2009), "Strategic Manipulation of Empirical Tests." **[READ: PIER WP 08-015, April 2008, post-referee]**
*Mathematics of Operations Research* 34(1): 57–70, doi:10.1287/moor.1080.0347. File: `olszewski_sandroni2009_strategic_manipulation_PIER08-015.txt`.

**Setup.** Tests T: Ω × Δ(Ω) → {0,1}, which may be future-dependent. A "paradigm" Λ ⊆ Δ(Ω) is a set of permissible theories; others are rejected out of hand.

**Definitions.**
- *Rejection can be delayed for m periods with probability 1 − ε* if ∃ζ such that for every P̃ ∈ Λ, (P̃ × ζ){(s,P): T^m(s,P) = 1} ≥ 1 − ε. Here T^m rejects at m iff T rejects on every extension of s|m.
- *Arbitrarily delayed* means: for every m.

**Proposition 1.** "Let Λ be a convex, compact paradigm. Let T be an arbitrary test that accepts any data-generating process in the paradigm Λ with probability 1 − ε. Then, rejection by the test T and the paradigm Λ can be arbitrarily delayed with probability 1 − ε − δ."
- This applies to Δ(Ω) and to the exchangeable processes.
- So with any **bounded** data set, *every* type-I-controlled test, even a future-dependent one, is manipulable.
- There is a discontinuity: ζ̂_m → ζ̂ in the limit, but the limit cannot delay rejection forever if the test is effective.

**Proposition 2** (non-convex paradigm).
- Λ_{m,δ} is the set of theories whose forecasts are, on average, far from ½: (1/m)Σ(f_t − 0.5)² > δ on every positive-probability m-history.
- The likelihood-ratio test against the coin-flip P̄ passes every DGP in Λ_{m,δ} with probability 1 − ε, but rejection "cannot be delayed for m periods with probability ε."
- Λ̃_{m,δ} is open, and every open set meets it for m large.

**§4.2, Example 1.** With simultaneous choice of test and theory, the tester–expert game "may have no equilibrium."

**Proposition 3** ("effectiveness bound"). "Fix a probability measure Q … Consider a test T that passes any data-generating process with probability 1 − ε. For every real number ν > 0, there exists a random generator of theories ζ such that Q(A^{1−ε−δ}_ζ) ≥ 1 − ν." Here A^{1−ε−δ}_ζ is the set of paths where ζ passes with probability greater than 1 − ε − δ. Remark 1 extends this to any finite family of Q's.
- **So the paths on which a charlatan can be caught can never have non-negligible probability under any measure fixed in advance.** Non-manipulability is at best topological.

**Conclusion** (verbatim). "Any test that accepts the data-generating process is susceptible to strategic manipulation for arbitrarily long periods of time. Even if a tester has arbitrarily large data sets at her disposal, she will only be able to discredit a strategic expert in a limited sense."

### 3.9 Al-Najjar & Sandroni (2013), "A Difficulty in the Testing of Strategic Experts." **[NOT READ — abstract only]**
*Mathematical Social Sciences* 65(1): 5–9, doi:10.1016/j.mathsocsci.2012.07.002. The abstract fragment on IDEAS: "contracting problem between a principal who wants to be informed about relevant stochastic processes and an expert who claims to know which process will generate the data. The data generating process is known to belong to a given class." I cannot report the result.

---

## 4. Single-expert *possibility* results (prior-free)

### 4.1 Dekel & Feinberg (2006), "Non-Bayesian Testing of a Stochastic Prediction." **[READ: two working papers — Feb 2005 "Non-Bayesian Testing of an Expert," and July 2005 "A Category Test that Cannot be Manipulated"; published abstract only]**
*Review of Economic Studies* 73(4): 893–906, doi:10.1111/j.1467-937X.2006.00401.x. Files: `dekel_feinberg2006_nonbayesian_testing_WP2005-02.txt`, `dekel_feinberg2005_category_test_cannot_be_manipulated_WP2005-07.txt`. The earliest version was titled "A True Expert Knows Which Question Should Be Asked."

**Test.** t: Δ(Ω) → 2^Ω. The prediction P passes iff the realized ω ∈ t(P). No type-I error means P(t(P)) = 1 for all P.

**Results.**
- **Prop. 1:** every P assigns probability 1 to some first-category (meagre) set S_P. Example: for i.i.d.(α), the set of paths with limiting frequency α.
- **Thm 3** (Feb 2005 WP): "For every first category set S ⊂ Ω the set of measures M_S = {µ ∈ Δ(Ω) | µ(S) > 0} is a category 1 set in the weak* topology." So a "category test" (t(P) meagre with P(t(P)) = 1) is passed with positive probability by a *fixed* wrong prediction only for a meagre set of true distributions.
- **Prop. 4** (finite approximation): closed nowhere-dense sets with P-probability > 1 − ε. A non-expert is failed in finite but unbounded time for most true λ.
- **Prop. 1 of the July 2005 WP:** "Assume the continuum hypothesis. There exists a test that does not reject the true expert with probability 1 and that cannot be manipulated on a set of points that is of category II." That is, ∀µ ∈ Δ(Δ(Ω)) there is a category-II set S ⊂ Ω such that µ{P : ω ∈ t(P)} = 0 for every ω ∈ S. The construction uses a Lusin set.
- Prop. 2 gives the finitely-determined version under CH.

**Published abstract** (IDEAS). "… there exists such a test that cannot be manipulated, in the sense that an uninformed predictor, who is pretending to know the true distribution, is guaranteed to fail on an uncountable number of realizations, no matter what randomized prediction he employs."

**Limits.**
- The WP itself says "the category 1 set of distributions that cannot be ruled out may still be big … if Bob only knows that the distribution on [0,1] has positive density, then he can claim to 'know' that the distribution is uniform and not be failed."
- Category, not measure, is the notion of smallness. They defend this by the Sierpiński–Erdős measure/category duality under CH.
- Olszewski 2015 adds that the intuition that *every* category test is hard to pass "is, however, not entirely correct, since Olszewski and Sandroni (2011) exhibits a category test that can be ignorantly passed."
- *My inference:* the Popperian falsification test of O&S 2011 is such a test. A falsifiable theory's never-falsified set is closed with empty interior.

### 4.2 Olszewski & Sandroni (2009), "A Nonmanipulable Test." **[READ: arXiv reprint of the published article]**
*Annals of Statistics* 37(2): 1013–1039, doi:10.1214/08-AOS597. File: `olszewski_sandroni2009_nonmanipulable_test_AoS_arxiv.txt`.

**Definitions.**
- Test T: Ω × Δ(Ω) → {0,1}.
- Def. 2 (type I): P(A_P) ≥ 1 − ε for all P.
- Def. 3 (manipulable): ∃ζ_T ∈ ΔΔ(Ω) ∀s: ζ_T{P: T(s,P) = 1} ≥ 1 − ε.
- Def. 4 (revelation set): R^ε_ζ = {s: ζ{P: T(s,P) = 0} ≥ 1 − ε}.

**The global category test.**
- Fix a countable dense set S = {s¹, s², …} ⊂ Ω.
- For each P, i, k, let t(i,k,P) be the least t with P(C(s^i_t) − {s^i}) ≤ 2^{−(k+i)}.
- T̂_S(s,P) = 0 iff s ∉ S and s ∈ ⋂_k ⋃_i C(s^i_{t(i,k,P)}).

**Theorem 1.** "The global category test T̂_S does not reject the data-generating process with probability one. Given any random generator of theories ζ ∈ ΔΔ(Ω), the revelation set R̂^0_ζ is the complement of a first-category set of paths." The construction is in ZFC (no CH) and is explicit.

**Further results.**
- **Prop. 1 / Cor. 1:** every test has a harder *rejection test* (rejects in finite time) with type-I level 1 − ε − δ. So a nonmanipulable rejection test exists, and its revelation sets contain an open dense set.
- **Prop. 2:** a nonmanipulable *likelihood-ratio* test exists. The alternative Q_P is built from P, so this is non-prequential.
- **§4.2, Props. 3–4 (random prequential tests).**
  - Prop. 3: a randomized likelihood test (Peter Grünwald's suggestion, per Olszewski 2015) has comeager revelation sets for ṽ-almost every draw of the test.
  - Prop. 4: every jointly-measurable random prequential test is nonetheless manipulable in the ex-ante sense ζ̃{P: ṽ-a.s. T̃(θ,s,P) = 1} ≥ 1 − δ.
  - Authors: "Proposition 4 is a natural generalization … of existing results showing that prequential tests are manipulable."
- **Prop. 5:** every *acceptance test* (open acceptance sets) with type-I level 1 − ε is manipulable with probability 1 − ε − δ.

**What it does not show** (authors, §3.2). "we do not claim that an uninformed expert is likely to be rejected by a global category test, nor do we claim that a theory that passes our test must be closely related to the data-generating process. In addition, we are not confidently advocating the use of global category tests." Note also: every theory, including the true one, is *accepted only on a first-category set of paths*. The test passes the truth with probability one while "rejecting" every theory on a topologically large set.

**On the prequential principle** (§4.2). "These results pose a difficulty for the prequential principle, because they indicate that the prequential principle must be discarded to produce a nonmanipulable test."

### 4.3 Olszewski & Sandroni (2011), "Falsifiability." **[READ: Dec 19, 2009 version, whose abstract matches the AER abstract verbatim; also the March 2008 PIER WP 08-016, a shorter earlier version]**
*American Economic Review* 101(2): 788–818, doi:10.1257/aer.101.2.788. Files: `olszewski_sandroni2011_falsifiability_WP2009-12.txt`, `..._WP2008-03_PIER08-016.txt`.

**Published abstract** (verbatim, AER). "We examine Popper's falsifiability within an economic model in which a tester hires a potential expert to produce a theory. Payments are contingent on the performance of the theory vis-à-vis data. We show that if experts are strategic, falsifiability has no power to distinguish scientific theories from worthless theories. The failure of falsification in screening informed and uninformed experts motivates questions on the broader concepts of refutation and verification. We demonstrate an asymmetry between the two concepts. Like falsification, verification contracts have no power to distinguish between informed and uninformed experts, but some refutation contracts are capable of screening experts."

**Model** (finite outcome set S, infinite horizon, no discounting).
- *Theory* f: finite histories → Δ(S).
- **Def. 1:** "A theory f is falsifiable if every finite history (s₁,…,s_t) has an extension (s₁,…,s_t,…,s_m) such that P_f(s₁,…,s_m) = 0." R_f is the set of finite histories with P_f-probability 0.
  - This is *permanent* falsifiability. Fn. 7: the result also holds under the weaker "transient" notion.
- *Falsification contract:* Bob receives u > 0 for announcing a falsifiable theory, and pays disutility d > 0 if some history in R_f is ever observed: U(f,s) = u − d if some s^t ∈ R_f, otherwise u.
- The uninformed Bob randomizes once (ζ ∈ Δ(F)) and evaluates by V(ζ) = inf_{s∈Ω} E_ζ U(f,s), the Gilboa–Schmeidler extreme maxmin. "The worst-case scenario is computed ex-ante (i.e., before Bob randomizes)."

**Proposition 1.** "For any payoffs u > 0 and d > 0, and for any ρ > 0 smaller than u, there exists a randomization device ζ̄ ∈ Δ(F) such that, given any future realization of the data, Bob's expected utility is strictly positive and bounded away from zero. That is, V(ζ̄) > u − ρ > 0."
- Construction: blocks of length growing fast enough. Draw a block-pattern x_t uniformly in each block. f_x forbids one outcome right after the pattern "x_{t+1} at block t+1." The chance that any fixed path hits a forbidden pattern is ≤ Σ r^t < ε.
- §II.B extends this to L testers with different data streams.
- Motivating one-shot urn example: with n colours, the theory "colour i is impossible," with i drawn uniformly, is falsified with probability 1/n whatever the urn.

**General contracts** (§III).
- U(f,s) = u(f,∅) + Σ_t u(f,s^t), bounded.
- *Verification contract:* u(f,s^t) ≥ 0 for all nonempty s^t (Bob is paid when the theory does well).
- *Refutation contract:* u(f,s^t) ≤ 0 (Bob pays when it does badly).
- An informed expert accepts if Ū(f) = E_{P_f}U(f,s) > 0 for all allowed f. An uninformed expert accepts if ∃ζ with V(ζ) > 0.

**The propositions.**
- **Prop. 2:** "Assume that theories are unrestricted. If an informed expert accepts a verification contract, then an uninformed expert also accepts this verification contract." This holds more generally for any closed convex class of theories (fn. 10), e.g. exchangeable processes.
- **Prop. 3:** under any verification contract and any information cost c > 0, "the expert prefers not to become informed."
- **Prop. 4:** "Assume that theories are not restricted. Then there exists a refutation contract (with bounded payoffs) that screens between informed and uninformed experts."
  - The *simple refutation contract* (Popper's swans): Bob gets δ ∈ (ε, ½) up front, and pays 1 if Alice sees a run of at least m(f) white swans followed by a non-white swan. Here m(f) is chosen so that P_f(1̄_{m(f)}) ≤ ε.
  - Since 1̄_m ↓ ∅, every ζ puts mass ≥ 1 − δ on theories rejected after some m*. On the path 1^{m*}0…, E_ζU < 0.
  - The authors note that "the Cournot principle is implicitly used here because negative payoffs are triggered not by conclusive rejection, but by the observation of events deemed unlikely by the theory."
- **Prop. 5:** the simple refutation contract still screens when theories are restricted to be exchangeable. Proof via an i.i.d. process with a high probability of white.
- **Prop. 6:** "For every contract C₁ which is accepted by an informed expert, there exists a less beneficial refutation contract C₂ that is also accepted by an informed expert." Hence, whatever the restriction on theories, if a screening contract exists then a screening refutation contract exists.

**Why the asymmetry holds.** The technical source is lower semicontinuity. Verification payoffs are lower semicontinuous in the path, so Fan's minimax theorem applies. Refutation payoffs need not be: "a single observation may not change a large data set topologically, but may have a strong negative impact on the evaluation of some theories."

**Philosophical claims** (verbatim).
- "Popper's work is essentially conceptual and not descriptive."
- "we stress that what Popper means by falsifiability is the feasibility of conclusive empirical rejection."
- "Thus, Popper's strict falsification criterion (which requires a theory to assert that some events are impossible) cannot deter even the most ignorant expert because the feasibility of conclusive empirical rejection can be removed by strategic randomization."
- "For an honest (exogenous) theory, falsifiability makes a fundamental conceptual distinction … In contrast, when theories are produced by a potentially strategic expert, falsifiability does not impose significant constraints on uninformed experts."
- "This result casts doubt on the idea that falsifiability can demarcate legitimate theories from worthless theories."
- On verification: "no knowledge over the data-generating process is necessary to produce theories that will, in the future, prove to be supported by the data. The widespread practice of supplying theories that account for the facts is vulnerable to the usual reproach centered at the existence of alternative theories that also explain the data. However, … even without knowing the data, uninformed 'experts' can fabricate theories that will be supported by the data."
- "Popper was right to point out the asymmetry between verification and refutation. However, his argument is based on the idea that some empirical claims can be conclusively rejected, but not conclusively demonstrated. This asymmetry becomes immaterial when refutation is understood as (strict) falsification, and theories are produced by strategic experts. If refutation is understood more broadly … the asymmetry can be established by proving the existence of a screening refutation contract and the nonexistence of a screening verification contract."
- "These two results deliver an original argument supporting the fundamental idea that refutation is a better maxim for empirical research than verification."
- Olszewski's own gloss (Handbook 2015 §10.1): they "find formal support for the maxim that theories should never be fully accepted, and that they should be rejected when proven inconsistent with the data."
- Motivation cited: McLean v. Arkansas (1981/82) and the Daubert standard.

**Limits.**
- (§III.E) "One weakness of our tests … is that an uninformed expert fails the test only in the case of few histories or processes." The screening needs unbounded data and no discounting. Compare O&S 2007 (discounting kills screening) and O&S 2009 MOR (bounded data kills it).
- The uninformed expert is extreme-maxmin. With a less pessimistic decision rule he may accept (O&S 2009 AoS §3.2).
- Fn. 15: "It is an open question whether propositions 2 and 3 still hold if theories are restricted to be falsifiable."
- **Follow-up:** Whitmeyer & Zhang (arXiv 2303.15723v2, Aug 2025, "Redeeming Falsifiability?"; earlier titled "Testing Experts Who Can Learn"; file `whitmeyer_zhang2025_redeeming_falsifiability_arxiv.txt`).
  - In a one-shot model, the expert holds a "state-of-the-art" prior over models and *can acquire information at a cost*. The charlatan cannot learn and is maxmin.
  - The set of models T is "balanced": no outcome is least likely under all models.
  - Theorem 2.1: "There exists a contract that screens charlatans." Here the contract is "announce an impossible outcome; fined d if it occurs."
  - Their Prop. 2.2 recovers O&S's negative result when the expert cannot learn.

### 4.4 Pomatto, Al-Najjar & Sandroni (2014), "Merging and Testing Opinions." **[READ: arXiv reprint of published article]**
*Annals of Statistics* 42(3): 1003–1028, doi:10.1214/14-AOS1212. File: `pomatto_alnajjar_sandroni2014_merging_testing_opinions_AoS_arxiv.txt`.

**Setup.**
- *Opinions* are Savagean (strongly nonatomic) **finitely additive** probabilities on Ω.
- A test T: Δ → open sets (the rejection set).
- Def. 2 (Λ-controls type I with probability 1−ε): P(T(P)) ≤ ε for P ∈ Λ. "an expert … *expects* to pass the test by honestly reporting what he believes." This is a subjective reading of type-I control.
- Strategies ζ have finite support.
- Nonmanipulable (Def. 4): ∀ζ ∃ a cylinder C_ζ on every path of which ζ fails with probability 1.
- An opinion P has the *Blackwell–Dubins property* if P merges with every opinion Q ≪ P.

**Theorem 2.** "Consider the case where any opinion is allowed. Let T be a test that Δ-controls for type I errors with probability 1 − ε. The test T can be manipulated with probability 1 − ε − δ."

**Theorem 3.** "Consider the case where opinions must satisfy the Blackwell–Dubins property. … There exists a test T that Δ_BD-controls for type I error with probability 1 − ε and is nonmanipulable." Note that this nonmanipulability is *at a finite history*.

**Gloss** (authors). "Under incentive problems, strategic experts can only be discredited if they are restricted to a subframework where opinions that are compatible with the data generating process are eventually accurate." So testability is tied to Bayesian merging.

### 4.5 Al-Najjar, Sandroni, Smorodinsky & Weinstein (2010), "Testing Theories with Learnable and Predictive Representations." **[NOT READ — abstract + Olszewski 2015]**
*Journal of Economic Theory* 145(6): 2203–2217, doi:10.1016/j.jet.2010.07.003.

**Abstract.** "We study the problem of testing an expert whose theory has a learnable and predictive parametric representation, as do standard processes used in statistics. We design a test in which the expert is required to submit a date T by which he will have learned enough to deliver a sharp, testable prediction about future frequencies. We show that this test passes an expert who knows the data-generating process and cannot be manipulated by a uninformed one. Such a test is not possible if the theory is unrestricted."

**Olszewski 2015 §7.**
- Theories are represented as distributions over parameters θ.
- "Learnable": the expert eventually forecasts as if he knew θ. "Predictive": the next t outcomes hardly improve predictions of the distant future given θ.
- There is a **finite** test that (1) does not reject any learnable-and-predictive DGP, and (2) for any random generator of such theories, some such DGP rejects the charlatan with arbitrarily high probability. (The survey text says "Sandroni et al. (1999)" at this point, evidently a slip for Al-Najjar et al. 2010.)
- Olszewski reports their methodological point: restrictions "should be aligned with normative standards, such as those typically expected of scientific theories and statistical models."

### 4.6 Sandroni & Shmaya (2014), "A Prequential Test for Exchangeable Theories." **[READ: arXiv 1305.4421]**
*Journal of Dynamics and Games* 1(3): 497–505, doi:10.3934/jdg.2014.1.497. File: `sandroni_shmaya2014_prequential_test_exchangeable_arxiv.txt`.

- **Prop. 1** (Sandroni's argument extended): for any convex compact paradigm Γ, any *finite* test that accepts DGPs in Γ is manipulable w.r.t. Γ. Here manipulability means ∃ζ over Γ with (ζ⊗µ)(pass) > 1 − ε for every µ ∈ Γ.
- **Prop. 2** = Shmaya 2008.
- **New result:** for the convex compact paradigm of exchangeable processes there *is* an infinite prequential test that is non-manipulable. In fact every strategy fails on co-meager many DGPs.
- Idea: by de Finetti, the infinite path reveals the parameter q, and the on-path forecasts reveal Bob's prior. The test then reduces to a one-shot test.
- Authors: "With finite (perhaps arbitrarily long) streams of forecasts and outcomes, it is possible to make arbitrarily accurate statistical inferences about q and yet this is insufficient to screen informed and uninformed experts."

### 4.7 Hu & Shmaya (2013), "Expressible Inspections." See §8.2 (computability).

---

## 5. Bayesian testing: what changes when the tester has a prior

### 5.1 Stewart (2011), "Nonmanipulable Bayesian Testing." **[READ: author's version dated 10 Feb 2011; also tecipa-360 WP]**
*Journal of Economic Theory* 146(5): 2029–2041, doi:10.1016/j.jet.2011.06.015. Files: `stewart2011_nonmanipulable_bayesian_testing.txt` (+ `_WP`).

**Setup.**
- The tester has a prior µ ∈ ΔΔ(Ω) over DGPs; P̄ = ∫P dµ is her predictive.
- True experts report P(ω^t). False experts know µ (not P) and may use any mixed strategy σ. The test is **prequential**.
- Likelihood-ratio score: S(h_t) = Π_{s≤t} p_s(ω_s) / p̄_s(ω_s), where p̄ is the tester's own Bayesian forecast.
- The expert passes iff (1) liminf_t S(h_t) > 1, **and** (2) Σ_t (p_t(1) − p̄_t(1))² diverges.
- ε := Pr_µ[Σ_t (p_t(1) − p̄_t(1))² converges], where p_t is the true conditional. This is the prior probability that the tester learns the truth quickly on her own.

**Proposition 1.** "(i) a true expert passes the test with µ-probability 1 − ε, and (ii) for any forecasting strategy σ, the false expert passes the test with (µ, σ)-probability 0 (regardless of the value of ε)."

**Proposition 2 / Corollary 1** (robustness). For any Q, the set of P with which Q weakly merges with positive probability is category I. "The set of distributions P ∈ Δ(Ω) for which a true expert fails the test with positive P-probability is category I."

**What changes.**
- (a) Type-I control is required only for µ-most P, not for every P.
- (b) The charlatan's passing probability is computed under µ × σ: Nature's randomization over DGPs is now "real" (not reducible), and the charlatan is evaluated on average over it rather than on the worst path.
- (c) Condition (2) forbids copying the tester's own forecasts. The expert must add value relative to the prior.

**Author's comments.**
- On the prior-free requirement: "The typical requirement in the literature that true experts must pass with high probability for every true distribution, while offering a useful idealized benchmark, is difficult to justify if the tester is viewed as an agent facing a decision problem. For natural payoffs, this requirement arises only if the tester has an extreme form of ambiguity aversion" (§3.1).
- Stewart notes the test "fails true experts if the tester's forecasts converge to the correct probabilities sufficiently quickly," in which case "the additional value of the expert's forecasts becomes small even when they are correct."

**Follow-up.** Feinberg & Lambert (2015), "Mostly Calibrated," *IJGT* 44(1): 153–163, doi:10.1007/s00182-014-0423-0. **[abstract only]** A "prequential test based on calibration that also fails the informed forecaster on at most a category I set of true distributions and is non-manipulable."

### 5.2 Related "prior" formulations
- Al-Najjar et al. 2010 (§4.5) and Pomatto–Al-Najjar–Sandroni 2014 (§4.4) restrict the *class* rather than putting a prior on it.
- Olszewski 2015 §9.1 summarizes the Bayesian point: "a tester equipped with a prior can make forecasts herself without the help of any expert. So, the tester will find the expert's forecasts valuable only when these forecasts are more precise than her own."
- Al-Najjar–Weinstein's Theorem 2 (§6.1) is also Bayesian in this sense. Its nonmanipulability holds for priors µ that are "diffuse" (the set M(ε,δ,L)).

---

## 6. Comparative testing (two or more experts)

### 6.1 Al-Najjar & Weinstein (2008), "Comparative Testing of Experts." **[READ: published text, the JSTOR copy posted on Weinstein's site; the OCR loses some right-margin characters]**
*Econometrica* 76(3): 541–559, doi:10.1111/j.1468-0262.2008.00846.x. File: `alnajjar_weinstein2008_comparative_testing.txt`.

**Setup.**
- Finite horizon n. Two experts forecast each period and may condition on each other's past forecasts.
- An n-period comparative test T^n: Aⁿ × Fⁿ × Fⁿ → {0, 0.5, 1}. It is symmetric, and its value 0.5 means inconclusive.
- Their test is non-counterfactual: it uses only on-path forecasts.
- L_t = Π_{s≤t} f₁^s(a(s)) / f₀^s(a(s)). Pick expert 1 if Lⁿ > 1, expert 0 if < 1, and return 0.5 if = 1.

**Theorem 1.** "If Expert i is truthful, then for every ε > 0, there is an integer K such that for all integers n, distributions P, and mixed forecasting strategies φ_j (j ≠ i), there is P × φ_j probability at least 1 − ε that either (a) T^n picks Expert i or (b) the two experts' forecasts are ε-close in all but K periods." K depends only on ε and #A. The proof uses the Fudenberg–Levine (1992) rate of convergence for active supermartingales.

**Theorem 2** (Bayesian game).
- Nature draws P ∼ µ. Expert 0 learns P; Expert 1 knows only µ.
- "For every ε and δ > 0 there is an integer L such that for every µ ∈ M(ε, δ, L) the value of the game to Expert 1 is less than ε."
- M(ε, δ, L): in at least L periods, µ's one-step conditional does not concentrate mass ≥ 1 − δ in an ε-ball. **Cor. 3:** for such µ and any φ₁, some P ∈ supp µ gives the uninformed expert winning probability < ε.

**Theorems 4–5** (infinite horizon).
- The truthful expert is picked, or the forecasts merge (|f₀ − f₁| → 0), with probability 1.
- For µ ∈ M(ε,δ), the value to the uninformed expert is 0.

**Theorem 7** (impossibility). Let a test τ(aⁿ, f₀, f₁) ∈ {0,1} be meant to say "at least one expert is informed," and suppose it returns 1 with probability ≥ 1 − ε whenever one expert is truthful. Then for every mixed φ₀ of Expert 0 there is a φ₁ for Expert 1 such that, for every aⁿ, the pair passes with probability ≥ 1 − ε. So "the known limitations on single-expert testing still have force in the multiple-expert setting."

**Diagnosis** (§6). "the key to understanding the impossibility theorem is the reducibility of Nature's compound lotteries"; "Comparative testing reverses the impossibility result because the presence of an expert who knows the realized distribution eliminates the reducibility of Nature's compound lotteries."

**Limits.**
- Theorem 1 does not exclude an uninformed expert who gets lucky (case b). After the authors' modification (return "inconclusive" when case (b) is recognizable), the test does not certify the informed expert either.
- With a non-diffuse µ (e.g. a point mass), the "uninformed" expert is as informed as the other.
- The test says nothing when *both* experts are uninformed.

**Philosophical claims** (verbatim).
- "These differences in performance in a comparative test stem from how much they know relative to their opponents. This supports our view that any identifiable notion of truth is inherently relative: In recognizing a stochastic truth we cannot do better than to define it as the belief of the most knowledgeable expert." (p. 550)
- "Where does that leave us with the assumption that a test must pass the truth and the notion of stochastic truth itself? There is clearly no ambiguity in the meaning of a deterministic truth. The meaning of stochastic truth, as the quote from Keynes suggests, is much less obvious. A typical distribution P on outcomes can have infinitely many two-stage lottery representations µ (with P^µ = P). Different representations correspond to meaningful and distinct information structures. But these different information structures are relevant only to the extent that there is an observer who is at least partially informed of what the truth is." (p. 554)
- "an interpretation of the impossibility literature, combined with our positive results for comparative testing, is that the only coherent notion of 'true' probabilities is relative. That is, we cannot say whether or not a theory is correct in any absolute sense, only that it is better than others." (p. 555)
- Fn. 23: "The impossibility results seem to undermine the central methodological principle of falsifiability as a criterion for judging whether a theory is scientific or not. The impossibility results imply that given any rule of evaluating scientific theories, a strategic expert can produce a falsifiable theory Q that is unlikely to be rejected by that rule, regardless of what the truth is."
- They appeal to Kuhn-style history (p. 555). Newtonian theory was "upheld for decades despite many empirical anomalies" and "eventually replaced, but only as a consequence of a comparison with a better theory—general relativity." "Expected utility theory continues to be the dominant theory in economic models despite the overwhelming evidence against it. The reason, we suspect, is the lack of a convincing alternative."
- Epigraph, credited by them to Keynes's *Treatise on Probability* (1921): "O False and treacherous Probability, / Enemy of truth, and friend of wickednesse; …"

### 6.2 Feinberg & Stewart (2008), "Testing Multiple Forecasters." **[READ: WP January 2008; published abstract checked]**
*Econometrica* 76(3): 561–582, doi:10.1111/j.1468-0262.2008.00847.x. File: `feinberg_stewart2008_testing_multiple_forecasters_WP2008.txt`.

**Setup.**
- Infinite horizon. Forecasts are one of n intervals I₁…I_n. Experts observe each other's past forecasts.
- **Cross-calibration test:** for every forecast *profile* l = (l¹,…,l^M) that occurs infinitely often, the empirical frequency f_T^l must satisfy limsup_T |f_T^l − (2l^j − 1)/(2n)| ≤ 1/(2n).

**Results.**
- **Prop. 1:** an expert forecasting according to the true P passes with probability 1 "no matter what strategies the other potential experts use."
- **Prop. 2:** "In the presence of a true expert, for every strategy µ of a false expert, the set of distributions P under which the false expert will pass the cross-calibration test with positive (µ, P)-probability is a category one set of distributions in Δ(Ω) endowed with the weak* topology."
- **Prop. 4** (no true expert; *strict* cross-calibration): "For any strategy profile µ = (µ₁,...,µ_M) of M ≥ 2 (false) experts, the set of realizations on which at least two potential experts simultaneously pass the strict cross-calibration test with positive probability is a category one set in Ω."
  - Assumption: "experts cannot correlate their randomized predictions … Otherwise, false experts could act as one and manipulate the test."
  - **Cost:** strict cross-calibration fails some true experts (abstract: "but at the cost of failing some true experts").
- **Cor. 1:** for all but a category-one set of P, at least M − 1 experts fail.

### 6.3 Olszewski & Sandroni (2009), "Manipulability of Comparative Tests." **[NOT READ — abstract + Olszewski 2015]**
*PNAS* 106(13): 5029–5034, doi:10.1073/pnas.0812602106.

**Abstract** (Europe PMC). "Multiple self-proclaimed experts claim that they know the probabilities of future events. A tester does not know the odds of future events and she also does not know whether, among the multiple experts, there are some who do know the relevant probabilities. So the tester requires each expert to announce, before any data are observed, the probabilities of all future events. A test either rejects or does not reject each expert based on the observed data and the profile of the probabilities announced by the experts. We assume that the test controls for the type I error of rejecting the true probabilities. However, consider the case in which all experts are uninformed … We show that they can still independently produce false forecasts that are likely to both pass the test, no matter how the data evolve in the future."

**Olszewski 2015, Prop. 8.** "Every comparative future-independent test which rejects theories in finite time, and which does not reject the truth with probability 1 − ε, can be ignorantly passed with probability 1 − ε − δ."
- "Does not reject the truth" means for any theory announced by the *other* expert.
- "Ignorantly passed" means by *independent* randomizations.
- The proof "combines" the single-expert argument "with a fixed-point argument."

**Interpretation** (Olszewski 2015). Feinberg–Stewart's reversal raises the question "whether the reversion of the negative result is caused by allowing for simultaneous testing of multiple experts, or rather by allowing for some possibility of rejecting informed experts. Olszewski and Sandroni (2009a) suggest that this is due to the latter rather than the former reason." Fn. 14: their tests reject in finite time, so "their results have no direct implications regarding calibration tests, which give the verdict at infinity."

### 6.4 Kavaler & Smorodinsky (2019), "On Comparison of Experts." **[READ: arXiv 1710.09461v3]**
*Games and Economic Behavior* 118: 94–109, doi:10.1016/j.geb.2019.08.005. File: `kavaler_smorodinsky2019_comparison_of_experts_arxiv.txt`.

**Setup.** Comparison test T: Ω^∞ × F × F → {0, ½, 1}. Axioms:
- *Anonymous:* T(ω, f₀, f₁) = 1 − T(ω, f₁, f₀).
- *Non-counterfactual:* T depends only on the play path.
- *Error-free* (Def. 3): P^f_{1−i}({T = i}) = 0. If expert 1−i's forecasts are the truth, the test never picks i.
- *Reasonable* (Def. 4): if P_i(A) > 0 = P_{1−i}(A), then P_i(A ∩ {T = i}) > 0.

**Derivative test.** D = 1 if the likelihood ratio of f₀ to f₁ along ω converges to 0 (f₁ "infinitely more likely"), 0 symmetrically, ½ otherwise.

**Results.**
- **Theorem 1:** D is reasonable and error-free.
- **Theorem 2:** "Let T be an anonymous, non-counterfactual, reasonable test. If T ≁ D then T is not error-free."
- **Prop. 1 / Cor. 1:** if P₁ ≪ P₀, any error-free test is inconclusive with positive P₀-probability.
- **Theorem 5:** a non-counterfactual anonymous "ideal" test (one that picks the true expert with probability 1) exists for a class W iff W is pairwise mutually singular.

**What it does not show.** It is an axiomatic characterization of comparison, not a strategic analysis. The "experts" are given forecasting strategies, and manipulation by randomizing charlatans is not the focus. They note that Al-Najjar–Weinstein's finite-horizon test is "anonymous and reasonable but is not error-free," and Feinberg–Stewart's induced comparison test is "anonymous and error-free but not reasonable."

**Companion.** Kavaler & Smorodinsky, "A Cardinal Comparison of Experts," arXiv 1908.10649 (abstract only): axioms produce an essentially unique likelihood-ratio-type test that, via supermartingale rates, detects the informed expert in fixed finite time when the advice is sufficiently distinct.

### 6.5 Other multi-expert / comparative items (brief)
- **Barreras & Riascos**, "Screening of Informed and Uninformed Experts," arXiv 1912.06244 (read; 6 pp.): a contract that "pit[s] competing forecasts … against each other and take[s] advantage of the uncertainty experts have about the other experts' knowledge … will work even when there is only a single data point."
- **Babichenko (2026)**, "Testing Decision Makers without Counterfactuals," arXiv 2606.02095 (read abstract and intro). Setting: a decision-maker versus an adviser in a bandit environment where only the chosen arm's outcome is seen, and agents want to be selected by a scoring test.
  - With simultaneous arm choices, a scoring test identifies the more-informed agent.
  - With sequential choices, no scoring test does.
  - "no scoring test can simultaneously identify the more informed agent and achieve more than half of the welfare attained by welfare-maximizing decisions."

---

## 7. Decision-theoretic and principal–agent approaches

### 7.1 Olszewski & Pęski (2011), "The Principal-Agent Approach to Testing Experts." **[READ: author's WP]**
*AEJ: Microeconomics* 3(2): 89–113, doi:10.1257/mic.3.2.89. File: `olszewski_peski2011_principal_agent_testing.txt`.

**Abstract** (verbatim). "Despite this negative result, we show that there often exist contracts that allow a decision maker to attain the first-best payoff without learning the expert's type. This kind of full-surplus extraction is always possible in infinite-horizon models in which future payoffs are not discounted. If future payoffs are discounted (but the discount factor tends to 1), the possibility of full-surplus extraction depends on a constraint involving the forecasting technology."

**Results.**
- Props. 1–2 (δ = 1, bounded payoffs): menus of contracts with chosen grace periods, dismissal once the decision maker's average surplus turns negative, and a small proportional bonus are "ε first best."
- For δ < 1, there are negative results (Props. 3–4: irreversible contracts) and positive ones for reversible contracts as δ → 1 (Prop. 5).

**Point.** Separating the types is unnecessary if what matters is the *value of the advice*. The informed expert need not even report truthfully.

### 7.2 Others (brief, abstract-level unless noted)
- **Deb, Pai & Said (2018)**, "Evaluating Strategic Forecasters," *AER* 108(10): 3057–3103, doi:10.1257/aer.20170299 (WP Feb 2017 saved; not read in full). Bayesian dynamic mechanism design without transfers, for an expert who "may strategically misrepresent information to inflate the principal's perception of his quality." "The optimal deterministic mechanism … evaluates a single, optimally timed prediction."
- **Foster & Young (2010)**, "Gaming Performance Fees by Portfolio Managers," *QJE* 125(4): 1435–1458, doi:10.1162/qjec.2010.125.4.1435 (abstract). "there exists no compensation mechanism that separates skilled from unskilled managers solely on the basis of their returns histories." Foster & Young (2012), *Quantitative Finance* 12(5): 671–683, propose a conservative "strategy-proof" test of returns that assumes only a martingale-difference structure.
- **Chassang (2013)**, "Calibrated Incentive Contracts," *Econometrica* 81(5): 1935–1971, doi:10.3982/ECTA9987 (abstract): detail-free dynamic contracts obtained by "calibrating" payoffs against benchmark contracts, robust to non-i.i.d. returns.
- **Gradwohl & Salant (2011)** and **Echenique & Shmaya (2008)** are summarized in Olszewski 2015 §9.2. Their message: "in the decision-theoretic setting, the tester is indeed able to benefit almost fully from … the expert's advice if the expert is informed, without losing much if the expert is ignorant." Not read; publication data not verified.
- **Guo & Shmaya (2021)**, "Costly Miscalibration," *Theoretical Economics* 16(2): 477–506, doi:10.3982/TE3991 (abstract): miscalibration cost as a proxy for a forecasting platform's commitment power.

---

## 8. Computational limits

### 8.1 Fortnow & Vohra (2009), "The Complexity of Forecast Testing." **[READ: ECCC TR06-149, Dec 2006; published abstract checked]**
*Econometrica* 77(1): 93–105 (IDEAS: v77y2009i1p93-105). File: `fortnow_vohra2009_complexity_forecast_testing_ECCC.txt`.

**Setup.** Finite n. A test T: Sⁿ × [0,1]ⁿ → {0,1} on realized forecasts, so prequential. "Passes the truth with probability 1−ε." "Ignorantly passed": for every s, Pr_F(T(s, f(s)) = 1) ≥ 1 − ε. They state Sandroni's theorem as their Theorem 1.

**Results.**
- **Theorem 2:** for any time bound t(n) there is a test of complexity p(n)·t(n) that passes the truth with high probability. Moreover, there is a single distribution P (a point mass on a diagonalizing sequence s*) on which *every* forecaster of complexity t(n) fails for large n. The test fails a forecaster on s* if the forecaster gives s* probability ≤ ε.
- **Theorem 3 ("factoring test"):** a polynomial-time test, which can be padded to linear time, that passes the truth. Any forecasting algorithm that can ignorantly pass it "can be used to factor composite numbers."
- **Theorem 4 (ECCC version):** a linear-time "PSPACE test." A forecaster who can ignorantly pass it yields a probabilistic algorithm for a PSPACE-complete language.
- The published abstract says only "solve computationally difficult problems … Thus, unlike Sandroni's work, a computationally efficient forecaster cannot always fool this test independently of nature."

**Caveats.**
- The authors (ECCC conclusion): "This would suggest that Sandroni's impossibility result has little relevance to the testing of practical forecasting algorithms."
- Olszewski 2015 objects that Fortnow–Vohra "assume that nature gives the informed expert 'on a piece of paper' all the probabilities … In practice, the informed expert may know just the method of generating correct forecasts, but may face computational restrictions similar to those faced by the ignorant expert."

### 8.2 Hu & Shmaya (2013), "Expressible Inspections." **[READ: published, open access]**
*Theoretical Economics* 8(2): 263–280, doi:10.3982/TE992. File: `hu_shmaya2013_expressible_inspections_TE.txt`.

**Theorem 1.** "For every ε > 0, there exists an expressible test T that does not reject admissible truth with probability 1 − ε and such that for every computable strategy f, there exists some computable S-valued stochastic process X for which R(T, f, X) > 1 − ε."
- *Expressible* = Turing-computable. The test is prequential and future-independent, and can be made polynomial-time.
- The test passes true experts for **all** admissible processes, not just computable ones.

**Theorem 2.** Any expressible test that does not reject truth is manipulable by a strategy computable relative to the halting problem (class Δ⁰₂).

**Abstract.** "Our conclusion overturns earlier results that prequential or future-independent tests are manipulable, and shows that computability considerations have significant effects in these problems." Lehrer's footnote (§3.1) is the mirror image: passing all computable calibration tests requires a non-computable forecast.

### 8.3 Rates for calibration (how much data a calibrating charlatan needs)
- Foster–Vohra: O(T^{2/3}) ℓ₁ calibration error.
- Qiao & Valiant (2021, STOC, doi:10.1145/3406325.3451050): lower bound Ω(T^{0.528}).
- Dagan, Daskalakis, Fishelson, Golowich, Kleinberg & Okoroafor (2025, STOC, doi:10.1145/3717823.3718178): "O(T^{2/3−ε}) for some ε > 0" and lower bound Ω(T^{0.54389}), "the first ω(T^{1/2}) calibration lower bound for oblivious adversaries."
- Hart (2022): N³ periods suffice for error ≤ 1/N.
- These are statements about calibration specifically, not general tests. They bear on how fast a *calibration*-based test could tell a charlatan from an honest i.i.d. forecaster. Even for fair coins, honest calibration error is Ω(√T).

### 8.4 Outcome indistinguishability (complexity-theoretic view)
See §9.3.

---

## 9. Recent work, 2015–2026

### 9.1 Foster & Hart (2021), "Forecast Hedging and Calibration." **[READ: arXiv 2210.07169 = JPE version of Sept 2021]**
*Journal of Political Economy* 129(12): 3447–3490, doi:10.1086/716559. File: `foster_hart2021_forecast_hedging_calibration_arxiv.txt`.

**Definitions.**
- Classic calibration score K_t = Σ_x (n_t(x)/t)·‖e_t(x)‖, with e_t(x) the average of a_s − x over periods with forecast x. ε-calibrated means limsup_t sup_a E[K_t] ≤ ε.
- *Continuous binning* Π = (w_i), with w_i: C → [0,1] continuous and Σ_i w_i = 1. *Continuously calibrated*: limsup sup_a K_t^Π = 0 for every continuous binning.

**Theorem 11.**
- (D) "There exists a deterministic procedure of type FP that is continuously calibrated."
- (S) For every ε > 0 there is a stochastic (minimax-type) ε-calibrated procedure.
- (AD) There is an ε-almost-deterministic fixed-point procedure that is ε-calibrated.
- Part (D) implies smooth calibration (Foster–Hart 2018, *GEB* 109: 271–293, doi:10.1016/j.geb.2017.12.022) and weak calibration (Kakade–Foster 2004; *JCSS* 74(1): 115–130, 2008).

**"Leakiness."** With deterministic continuous calibration, the forecast may be revealed before the action is chosen and calibration still holds.

**Quotes.**
- "forecast-hedging makes it clear that this is a misnomer, as there is no actual prediction of rain or no rain tomorrow … Rather, calibration obtains by what can be referred to as 'back casting' (instead of forecasting): forecast-hedging guarantees that the past track record can essentially only improve, no matter what the weather will be."
- Fn. 4 links this to "the related literature on the 'manipulability of tests'."
- They defend calibration's *economic utility* (§1.1): calibrated forecasts let decision-makers act on forecasts "as if they were probabilities."

### 9.2 Foster & Hart (2023), "'Calibeating': Beating Forecasters at Their Own Game." **[READ: arXiv 2209.04892v3, March 2026, which corrects an appendix]**
*Theoretical Economics* 18(4): 1441–1474, doi:10.3982/TE5330. File: `foster_hart2023_calibeating_arxiv.txt`.

**Definitions** (quadratic version). The Brier score B = R + K, where:
- K is the calibration score: the average squared distance between each bin's label and the bin's average outcome.
- R is the *refinement* score: the average within-bin variance. R "measures how good the sorting into bins with the same forecast is, and thus attests to 'expertise'."

**Main conclusion** (verbatim). "Conclusion: Experts should better be tested by the Brier score and not by calibration alone."

**Calibeating.** Online, "beating the Brier score by an amount equal to the calibration score."

**Theorem 3.** For any given forecast sequence b with finitely many values B, the deterministic procedure c_t = ā_{t−1}(b_t) (the past frequency in the current bin) satisfies 0 ≤ B^c_t − R^b_t ≤ γ²|B|(ln t + 1)/t for all sequences.

**Theorems 4–7.** Calibeating can be done by a procedure that is itself calibrated (stochastic), or continuously calibrated (deterministic), and for several forecasters at once ("multi-calibeating").

**Remark (c) after Theorem 3.** "One cannot guarantee a Brier score that is lower than the refinement score of b."

**Relevance.** Calibration can be had for free (the impossibility side), but refinement cannot be *created* by an uninformed procedure. Calibeating preserves refinement and does not generate it. Foster–Hart do not claim a nonmanipulable *test* in the Sandroni sense.
- *My observation, not theirs:* against Nature playing i.i.d. fair coins, every forecaster's expected Brier score is ≥ ¼. So no "pass if Brier ≤ c" rule can both pass every truth and exclude an ignorant constant-½ forecaster.
- Related: Lee, Noarov, Pai & Roth (2022), "Online Minimax Multiobjective Optimization: Multicalibeating and Other Applications," *NeurIPS* 35 (Crossref-verified; not read).

### 9.3 Multicalibration and Outcome Indistinguishability

**Hébert-Johnson, Kim, Reingold & Rothblum (2018)**, "Multicalibration: Calibration for the (Computationally-Identifiable) Masses," *ICML 2018*, PMLR 80: 1939–1948. **[READ: arXiv 1711.08513v2]** File: `hebert_johnson_et_al2018_multicalibration_arxiv.txt`.
- Batch setting: individuals i ∈ X with true probabilities p*_i.
- **Def. 2.2:** x is α-calibrated w.r.t. S if some S′ ⊆ S with |S′| ≥ (1 − α)|S| has |E_{i∼S_v∩S′}[x_i − p*_i]| ≤ α for all v, where S_v = {i: x_i = v}.
- *α-multicalibrated w.r.t. C*: α-calibrated on every S ∈ C, a class of efficiently identifiable subpopulations.
- This is the "moral equivalent" of calibration with many checking rules (Dwork et al. say exactly this about SSV03).
- Online, against adversarial sequences, multicalibration is achievable without any knowledge of the process: Gupta, Jung, Noarov, Pai & Roth, "Online Multivalid Learning: Means, Moments, and Prediction Intervals" (arXiv 2101.01739; abstract read), which give an online algorithm "satisfying the notion of multicalibration from Hebert-Johnson et al." "against an online sequence of adversarially chosen examples." This is the CS counterpart of Lehrer/SSV manipulability.
- **Omnipredictors** (Gopalan, Kalai, Reingold, Sharan & Wieder, arXiv 2109.05389; abstract read) are obtained "through a connection to multicalibration."

**Dwork, Kim, Reingold, Rothblum & Yona (2021)**, "Outcome Indistinguishability," *STOC 2021*: 1095–1108, doi:10.1145/3406325.3451064. **[READ: ECCC TR20-176]** File: `dwork_et_al2021_outcome_indistinguishability_ECCC.txt`.
- **Definition** (verbatim, in symbols). For a class of distinguishers A and ε > 0, p̃ satisfies (A, ε)-OI if, for every A ∈ A, |Pr_{(i,o*_i)∼D*}[A(i, o*_i; p̃) = 1] − Pr_{(i,õ_i)∼D(p̃)}[A(i, õ_i; p̃) = 1]| ≤ ε. Here õ_i ∼ Ber(p̃_i).
- There is a four-level hierarchy: No-Access, Sample-Access, Oracle-Access and Code-Access.
- Sample-access-OI is "equivalent" to multicalibration, and no-access-OI to multi-accuracy.
- Under fine-grained complexity assumptions, the top two levels need predictors whose complexity is not polynomial in the distinguishers' complexity and 1/ε.
- "This hardness result provides the first scientific grounds for the political argument that … auditors should be granted oracle access to the algorithm, not simply historical predictions." **This is the CS analogue of the economists' "future-dependence / counterfactual" lesson.**

**Their explicit comparison with expert testing** (§1.4, "Tests vs. Distinguishers").
- They restate Sandroni (2003) for "natural" histories.
- "the Algorithm does not compete with the actual Nature p*, but only with the hypothetical Nature that passes the test with the lowest probability."
- "tests have semantics — you want to pass the test … In contrast, distinguishers output 0 or 1 with no semantics."
- Philosophical framing: "predictors satisfying OI give rise to models of Nature that cannot be falsified based only on observational data"; "This framing seems to give an elegant computational perspective on the scientific method, when consider p̃ as expressing a hypothesis that cannot be falsified through observational investigation."

**Relation to expert testing.** OI and multicalibration are *standards a predictor can be required to meet*. They are not tests of whether the predictor's author knows the truth. Nature's p* is a fixed latent object, data are i.i.d. samples from D*, and the predictor is *constructed from data*. Because they are achievable from data alone (or adversarially online), passing them does not certify private knowledge, which is exactly the economists' point. Their positive role is to say what an evaluator with bounded resources *cannot* refute.

### 9.4 Scoring rules versus tests; truthful calibration measures
- **The core distinction** (several sources). A proper scoring rule gives an agent **who has a belief** an incentive to report it. A test asks whether the report reflects **knowledge**.
  - O&S 2007 (§3.5): no payment scheme screens knowers from non-knowers under maxmin uncertainty with discounting.
  - Olszewski 2015 §5.3: "In my view, the major drawback in having a test that can be ignorantly passed is not that such a test cannot differentiate between informed and ignorant decision makers, but rather that the test is vulnerable to the kind of actions of malicious agents that computer scientists study."
- **Haghtalab, Qiao, Yang & Zhao (2024)**, "Truthfulness of Calibration Measures," *NeurIPS 2024*. **[READ: arXiv 2407.13979v2]**
  - A calibration measure is *truthful* if predicting the true conditional expectation approximately minimizes the expected penalty.
  - Taxonomy (Table 1): ECE, maximum swap regret, smooth calibration, distance from calibration and other measures have large truthfulness gaps. Theorem 1.1: for product distributions with marginals bounded away from 0 and 1, truthful forecasting incurs Ω(√T) smooth calibration error while some algorithm achieves polylog(T).
  - **Proper scoring rules** are "(1,0)-truthful" but **not "complete"** (Table 1). Completeness, in their sense, requires that predicting i.i.d. Bernoulli outcomes with the correct parameter incur "no or o(T) penalty." *My gloss of why it fails:* for a proper score such as Brier, the truthful penalty is p(1−p)·T = Θ(T), so the score has no absolute pass mark.
  - They propose the "Subsampled Smooth Calibration Error," which is (O(1), 0)-truthful.
- **Hartline, Hu & Wu (2025)**, "A Perfectly Truthful Calibration Measure," arXiv 2508.13100v3. **[READ: abstract/intro]** In the batch setting, "all known calibration measures incentivize predictors to lie in order to appear more calibrated." They give ATB (averaged two-bin calibration error), "perfectly and strictly truthful, sound and complete."
- **Seidenfeld 1985:** short-run calibration scoring is "improper" (§2.3).
- **Forecasting competitions.** Witkowski, Freeman, Vaughan, Pennock & Krause (2023), "Incentive-Compatible Forecasting Competitions," *Management Science* 69(3): 1354–1374, doi:10.1287/mnsc.2022.4410. **[READ: arXiv 2101.01816 abstract/intro]**
  - "Proper scoring rules incentivize truthful reporting if all forecasters are paid according to their scores. However, incentives become distorted if only the best-scoring forecaster wins a prize, since forecasters can often increase their probability of having the highest score by reporting more extreme beliefs."
  - They give two mechanisms: one incentive-compatible and optimal in the single-event two-forecaster case, the other selecting the best forecaster with probability → 1 as the number of events grows (under independence of beliefs across events).

### 9.5 Testing AI/LLM forecasters
- **Karger, Bastani, Chen Yueh-Han, Jacobs, Halawi, Zhang & Tetlock (2025)**, "ForecastBench: A Dynamic Benchmark of AI Forecasting Capabilities," *ICLR 2025*. **[READ]** File: `karger_et_al2025_forecastbench_ICLR.txt`.
  - Leakage control: "To avoid any possibility of data leakage, ForecastBench is comprised solely of questions about future events that have no known answer at the time of submission."
  - Metric: "we use the Brier score … Brier scores are strictly proper, incentivizing truthful reporting from participants."
  - Manipulation concerns raised: "model developers face financial incentives to exaggerate their accuracy … subtle benchmark manipulation or overfitting is harder to catch." LLM teams get questions 24 h before the due date, giving "less time to be able to game the system."
  - Result at that time: superforecasters (Brier 0.096) beat the best LLM (0.122, p < 0.001). The top LLMs had access to crowd forecasts on market questions.
- **Paleka, Goel, Geiping & Tramèr (2025)**, "Pitfalls in Evaluating Language Model Forecasters," arXiv 2506.00723 (ICLR 2026 per mlanthology listing; not verified). **[READ]**
  - Temporal and logical leakage in backtests, unreliable date-restricted retrieval, and "piggybacking on human forecasts."
  - "Gaming benchmarks through betting": "forecasting benchmarks can reward strategic gambling over accurate uncertainty estimation … The benchmark-optimal strategy might be to commit to one outcome and condition all predictions on that guess."
  - Leaderboard selection on correlated questions produces "a winner's curse problem"; the top performer is "likely overestimated, having achieved its ranking through systematic overconfidence."
  - "calibration can penalize useful forecasting, while Brier scores over-emphasize performance on questions with a high base rate."
- **Observation.** In these two papers, the manipulation worries are about data leakage, copying the crowd, and winner-take-all variance-seeking (the Witkowski et al. phenomenon). Neither cites the Foster–Vohra / Sandroni / Olszewski–Sandroni literature (I searched both texts). That literature's question, whether a forecast-generating procedure *could have passed without knowledge*, is not posed there. Its comparative results (Al-Najjar–Weinstein) and computational results (Fortnow–Vohra, Hu–Shmaya, OI) are the relevant theoretical tools for leaderboard-style evaluation.

### 9.6 Prediction markets (peripheral)
- **Hanson & Oprea (2009)**, "A Manipulator Can Aid Prediction Market Accuracy," *Economica* 76(302): 304–314 (abstract only). In a Kyle-style model with a manipulator who has a target price, "the mean target price has no effect on prices, and raising the variance of the target price can increase average price accuracy."
- This is about manipulating *prices*, not about certifying an individual's expertise. I found no prediction-market paper that addresses the Sandroni-type question directly, and did not pursue this further.

### 9.7 Other recent items
- Pomatto & Sandroni (2018), philosophy venue: §10.
- Whitmeyer & Zhang (2025): §4.3.
- Babichenko (2026): §6.5.
- Belot (2013, 2020) and Zaffora Blando (2024) are in the texts folder from the parallel process; not reviewed here.

---

## 10. Pomatto & Sandroni (2018), "An Axiomatic Theory of Inductive Inference." **[READ IN FULL: Caltech WP dated 17 April 2017]**
*Philosophy of Science* 85(2): 293–315, doi:10.1086/696386. File: `pomatto-sandroni-2018-axiomatic-inductive-inference.txt`.

**Note: this is not an expert-testing paper.** It applies the authors' finitely-additive machinery (from Pomatto–Al-Najjar–Sandroni 2014 and Al-Najjar–Pomatto–Sandroni 2014) to the "Bayesian orgulity" debate (Belot 2013). It cites Elga (2015), Huttegger (2015), Kelly (1996), Juhl & Kelly (1994) and Weatherson (2015) as part of that debate.

**Setup.**
- Ω = {0,1}^∞ with an algebra Σ containing finite histories. A "coherent view of the world" is a **finitely additive** probability P on Σ, updated by Bayes' rule.
- Bob designates a set A of "laws" (lawlike paths). Assumption 1: A countable. Assumption 2: P({ω}) > 0 for ω ∈ A and P(A^c) > 0. Assumption 3: every finite history is compatible with some law and some non-law.

**Definitions.**
- Def. 1, *inductive in the sense of Hume:* ∀ω ∈ A, P(A | ω^t) → 1.
- Def. 2, *inductive in the sense of Goodman:* ∀ω ∈ A, P({ω} | A ∩ ω^t) → 1.
- Def. 3, *inductive:* both.
- Def. 4: P({ω} | ω^t) → 1 for ω ∈ A ("enough pattern data transforms the past into a near infallible guide to the future"). **Remark 2:** inductive ⇔ Def. 4.
- Def. 5, *completely inductive in the sense of Hume:* additionally P(A^c | ω^t) → 1 for P-a.e. ω ∈ A^c.
- Defs. 7–9, *pragmatic* versions: P(ω^{t+k} | ω^t) → 1 for every k and ω ∈ A, plus open-set analogues for A and A^c.

**Results** (the authors call known results "propositions," new ones "theorems").
- **Separation Theorem:** some coherent views are inductive in Hume's sense but not Goodman's, and vice versa. Constructions mix a σ-additive P_σ with finitely additive S (S(A) = 0 while agreeing on cylinders) or R (zero on singletons, one on a sequence of laws converging to ω̄).
- **Prop. 1** (Kelly): σ-additive ⇒ inductive.
- **Prop. 2:** σ-additive ⇒ completely inductive in Hume's sense ("Bayesian orgulity").
- **Prop. 3** (corollary of Elga 2015): for any ε there is a coherent P with P(A | ω^t) ≤ ε for every t and every ω ∈ A. This is complete Humean skepticism.
- **Complete Humean Induction Theorem:** a non-σ-additive P can be completely inductive in Hume's sense. So orgulity does not require σ-additivity.
- **Structure Theorem:** let Σ̄ be the smallest algebra containing the finite histories and {ω} for ω ∈ A. "A coherent view of the world P is inductive if and only if is σ-additive on Σ̄."
- **Pragmatic Induction Theorem:** "Every coherent view of the world is pragmatically completely inductive." Proof: the restriction of P to the algebra of finite histories extends σ-additively, P ≥ P_σ on open sets, and P_σ is inductive.

**Philosophical claims** (verbatim).
- "Thus, σ-additivity is the definitive condition that assumes away both Hume's and Goodman's skepticism about induction. It is not necessary to rule out either type of skepticism, but it is required to rule out both types simultaneously."
- "No matter how coherent beliefs are formed, they must express confidence that mechanical repetitions of Bayes' rule transform sufficiently numerous pattern data into a near infallible guide to a bounded future … Therefore, any coherent view of the world contains a seed of orgulity."
- They present the Pragmatic Induction Theorem as a "formalization of de Finetti's viewpoint on induction," quoting de Finetti (1970): "the problem of induction is, in fact, no longer a problem."
- On restrictions (§7): laws are deterministic. Extending the Structure Theorem to stochastic data-generating processes "is a (very) difficult problem."

**Relevance to track records.** The link to expert testing runs through Pomatto–Al-Najjar–Sandroni 2014 (§4.4): experts can be discredited exactly when their opinions are restricted to those for which Bayesian merging holds. Pomatto–Sandroni show which *axioms on belief* deliver merging-type confidence. Al-Najjar–Pomatto–Sandroni 2014, "Claim Validation" (*AER* 104(11): 3725–3736; abstract only), draws the incentive consequence: "If experts can be skeptical about the validity of claims then they can strategically evade rejection. In contrast, if experts are required to conclude that claims backed by sufficient evidence are likely to be true, then they can be tested and rejected."

---

## 11. Synthesis

### 11.1 What exactly is impossible, and what is possible

**Impossible.** These hold in the prior-free, single-expert setting, with the type-I requirement "for every P in a class Λ, the truth passes with P-probability ≥ 1 − ε," and with a charlatan who knows the test and may randomize at time 0.

| # | Class of tests / data | Result | Source |
|---|---|---|---|
| 1 | Calibration (finite grid), adaptive adversary | ε-calibrated randomized forecaster exists | Foster–Vohra 1998 |
| 2 | Countably many checking rules not depending on current forecast | One *deterministic* forecast passes all, on every path | Lehrer 2001 |
| 3 | Countably many forecast-based checking rules / any countable battery of betting tests | Randomized forecaster passes all | SSV 2003; Vovk–Shafer 2005 |
| 4 | Any finite-horizon test (common n), prequential | Manipulable | Sandroni 2003 |
| 5 | Any future-independent test rejecting in finite (unbounded) time | Manipulable at level 1 − ε − δ | O&S 2008 |
| 6 | Any Borel prequential test, verdict possibly at infinity | Manipulable | Shmaya 2008 |
| 7 | Any test whatsoever, including future-dependent, but with bounded data (any fixed m), over a convex compact Λ (e.g. Δ(Ω), exchangeable) | Rejection can be delayed m periods | O&S 2009 MOR |
| 8 | Any test, for any finitely many measures Q_j fixed in advance | Charlatan passes on paths of Q_j-probability ≈ 1 | O&S 2009 MOR, Prop. 3 |
| 9 | Acceptance tests; verification contracts; Popperian falsification contract | Manipulable / cannot screen | O&S 2009 AoS Prop. 5; O&S 2011 Props. 1–3 |
| 10 | Any bounded contract with discounting (incl. scoring-rule payments) | Cannot screen | O&S 2007 |
| 11 | Randomized prequential tests (ex ante) | Manipulable | O&S 2009 AoS Prop. 4 |
| 12 | "Is at least one of two experts informed?" (finite horizon) | Manipulable | Al-Najjar–Weinstein Thm 7 |
| 13 | Comparative future-independent rejection tests, all experts uninformed, independent randomization | Jointly manipulable | O&S 2009 PNAS (per Olszewski 2015) |
| 14 | Savagean finitely additive opinions, any type-I-controlled test | Manipulable | Pomatto–Al-Najjar–Sandroni 2014 Thm 2 |
| 15 | Return histories of portfolio managers | No compensation scheme separates skilled from unskilled | Foster–Young 2010 (abstract) |

**Possible.**

| # | What is relaxed | Positive result | Kind of nonmanipulability | Source |
|---|---|---|---|---|
| A | Future-dependence: expert commits to a full theory at t = 0 | Category test passing truth w.p. 1 | Fail w.p. 1 on uncountable / category-II path sets (needs CH) | Dekel–Feinberg 2006 |
| B | Same, in ZFC; also a rejection-test and a likelihood-test version | Global category test | Revelation set comeager (contains open dense set for the rejection version) | O&S 2009 AoS |
| C | Unbounded data, no discounting; refutation (not verification) contracts | Simple refutation contract screens | ∀ζ ∃ a finite history after which ζ fails w.p. ≥ 1 − δ | O&S 2011 Props. 4–6 |
| D | Non-Borel prequential test (needs AC), or predictions of tail events | Not manipulable | ξ fails w.p. 1 at some path | Shmaya 2008 Thm 2, Ex. 1 |
| E | Paradigm restriction: exchangeable + infinite data | Prequential test | Co-meager DGPs | Sandroni–Shmaya 2014 |
| E′ | Learnable + predictive representations | Finite test | Some DGP rejects w.h.p. | Al-Najjar et al. 2010 |
| E″ | Blackwell–Dubins opinions | Test | Cylinder of sure failure | Pomatto et al. 2014 |
| E‴ | Non-convex paradigm (forecasts not too close to ½) | Likelihood test vs coin flip | Rejection not delayable | O&S 2009 MOR Prop. 2 |
| F | Type-I only for µ-most P (tester has prior) | Likelihood test vs tester's own forecasts | Charlatan passes w. (µ×σ)-prob. 0; true expert fails only on category-I set of P | Stewart 2011; Feinberg–Lambert 2015 |
| G | Second expert who is informed | Likelihood-ratio / cross-calibration test | Charlatan wins only if close to truth (AW) or only on category-I set of P (FS) | AW 2008; FS 2008 |
| H | Computationally bounded charlatan | Complexity/computability-based tests | Some (computable) DGP fails every bounded charlatan | Fortnow–Vohra 2009; Hu–Shmaya 2013 |
| I | Goal = value of advice, not type | First-best menus of contracts | Not needed | Olszewski–Pęski 2011 |
| J | Expert can acquire information; charlatan cannot | Falsification contract screens (one-shot) | Charlatan rejects contract | Whitmeyer–Zhang 2025 |

**Three points recur.**
- (a) Every prior-free nonmanipulability result is **topological, not probabilistic**: charlatans *can* be caught, on a meagre-complement or uncountable set of paths, but O&S 2009 MOR Prop. 3 shows they cannot be shown *likely* to be caught under any measure fixed in advance.
- (b) O&S 2009 AoS observe that their nonmanipulable test **accepts every theory, the true one included, only on a first-category set of paths**. It is "Popperian" in a topological sense.
- (c) Passing a nonmanipulable test does *not* show the theory is close to the truth (O&S 2009 AoS §3.2; Dekel–Feinberg on the uniform-density example).

### 11.2 The role of prior-freeness, and what changes with a prior

**The prior-free requirement.** Type I control ∀P ∈ Δ(Ω), and manipulation assessed pathwise ∀ω. This is what makes the minimax argument bite. Al-Najjar–Weinstein's diagnosis: when the type-I clause holds for every pure P, Nature's mixtures are useless, because a mixture µ over processes is observationally the single process P_µ. So the charlatan's best reply to any "Nature strategy" is just to announce it, and minimax turns this into one ζ good against every path.

**What changes with a prior.**
- **Stewart 2011.** If type I is required only for µ-most P, and the charlatan's success is evaluated under µ × σ, a likelihood-ratio test against the tester's own Bayesian forecasts is nonmanipulable (charlatan's passing probability 0). It fails true experts only on a category-I set of P. The price is that the test checks *value added over the tester's prior*: it fails a true expert whenever the tester would have learned the truth quickly herself.
- **Stewart on decision theory.** Requiring no type-I error for every P corresponds, for a maxmin tester, to "a strong form of ambiguity aversion" (every Q must be an atom of some prior in her set). An expected-utility tester has no reason for it.
- **Restricting the class instead of using a prior** (Al-Najjar et al. 2010; Sandroni–Shmaya; Pomatto et al. 2014). Whether this helps depends on topology and convexity. Convex compact classes (exchangeable, closed convex hulls) do **not** escape the finite-data impossibility (O&S MOR Prop. 1; Sandroni–Shmaya Prop. 1). Non-convex, or "learnable and predictive" / Blackwell–Dubins, classes can.
- **Merging and testability.** Pomatto–Al-Najjar–Sandroni's link (testability ⇔ merging property) explains why: the classes in which charlatans can be discredited are those in which Bayesian learning from data eventually works.
- **The prior-holding tester and the expert's value.** Olszewski 2015 §9.1: a tester with a prior can forecast herself, so the expert matters only when more precise than her. This is why every Bayesian positive result is a *comparative* result in disguise: expert versus tester's predictive (Stewart), or expert versus a rival (AW Thm 2).

### 11.3 Commitment to predictions about unobserved and counterfactual data

**The cleanest structural lesson.** With prior-freeness, single-expert nonmanipulability requires the test to use the expert's predictions at histories that have not occurred, either *yet* (future-dependence) or *ever* (counterfactual, off-path).
- **O&S 2008:** future-independent tests are manipulable. Nonmanipulable tests "must make use of predictions contingent on data not yet observed at the time the forecasts are rejected."
- **Shmaya 2008:** prequential Borel tests are manipulable. The exception is predictions about tail events, which are not settled at any finite time.
- **O&S 2009 AoS §4.2:** "the prequential principle must be discarded to produce a nonmanipulable test." Grünwald's randomized prequential test is only a partial exception (O&S AoS Props. 3–4).
- **For a track record of realized forecasts**, which is what a forecaster's "track record" usually is, the prior-free, single-expert impossibility is therefore robust: Sandroni 2003, O&S 2008, Shmaya 2008, and O&S 2009 MOR for bounded data.
- **Escape routes that keep only realized forecasts** all add something else:
  - a second, informed expert (AW 2008; FS 2008 cross-calibration);
  - a prior (Stewart; Feinberg–Lambert);
  - a restricted class (Sandroni–Shmaya, with infinite data);
  - computability limits on the charlatan (Hu–Shmaya's test is prequential *and* future-independent).
- O&S 2008 §5.2.2 treat commitment as part of the expert's *claim*: "If Bob claims that he has a complete understanding of the stochastic process (including the odds of distant future events), then future-dependent tests can be used." If he claims only T-period-ahead competence, only (distant-)future-independent tests are legitimate, and those are manipulable.
- The **CS analogue** is OI's hierarchy (Dwork et al. 2021). Auditors with only historical predictions (no/sample access) can be satisfied by efficiently constructed predictors. Oracle- or code-access auditors can run strictly stronger tests, which motivates their claim that "auditors should be granted oracle access to the algorithm, not simply historical predictions."
- **Babichenko (2026)** extends the "no counterfactuals" theme from forecasts to decisions, where the counterfactual arm is never observed.

### 11.4 Comparative testing: when it works, when it fails

**Works when exactly one expert is informed.**
- Al-Najjar–Weinstein's finite-horizon likelihood-ratio test either picks the informed expert or the two forecasts were ε-close in all but K periods, with K uniform over P, n and the rival's strategy. With a diffuse prior over DGPs, the uninformed expert's value → 0 (Thms 2, 5).
- Feinberg–Stewart's cross-calibration test passes the truthful expert with probability 1 whatever the others do, and passes a charlatan with positive probability only for a category-one set of DGPs.
- Both tests are prequential. The other expert's on-path forecasts substitute for the counterfactual predictions a single-expert test would need.
- Kavaler–Smorodinsky give an axiomatic characterization (the "derivative," i.e. limiting likelihood-ratio, test). Perfect identification is possible exactly for mutually singular pairs; error-free tests must sometimes be inconclusive when the measures are mutually absolutely continuous.

**Fails when the question is whether *anyone* is informed.**
- Al-Najjar–Weinstein Thm 7: "at least one informed" cannot be tested.
- O&S 2009 PNAS: independently randomizing uninformed experts jointly pass any comparative future-independent rejection test that controls type I.
- Feinberg–Stewart's strict cross-calibration makes simultaneous passing by ≥ 2 uninformed experts topologically rare, but only by failing some true experts. Olszewski's reading is that this sacrifice of type-I control, not multiplicity itself, drives the reversal.
- Independence of the charlatans' randomizations (no collusion) is essential: "Otherwise, false experts could act as one and manipulate the test" (FS).

**Lesson** (Al-Najjar–Weinstein's own). Comparative testing certifies **relative** informativeness. Its natural conclusion is "better than the rival," not "knows the truth."

### 11.5 Computational limits
- The manipulating forecasters in the impossibility theorems are existence proofs (minimax, or Martin determinacy) and can be computationally monstrous.
  - Lehrer: passing all computable checking rules needs a non-computable forecast.
  - Fortnow–Vohra: a linear-time test passed by the truth that only a factoring (or, in the ECCC version, PSPACE-solving) forecaster can ignorantly pass.
  - Hu–Shmaya: there is a computable (indeed polynomial-time, prequential, future-independent) test that no computable charlatan can manipulate. Yet any computable test is manipulable by a halting-oracle (Δ⁰₂) strategy, so the boundary sits exactly at Turing computability.
- **Caveat** (Olszewski 2015). These positive results assume the informed expert is handed the true probabilities. A real informed expert may face the same computational constraints.
- **Simple tests stay cheaply manipulable.** Calibration-type tests are passed by efficient algorithms: Foster–Vohra; Foster–Hart's simple binary procedure; online multicalibration algorithms. Rates are now known to lie between Ω(T^{0.54389}) and O(T^{2/3−ε}) for ℓ₁ calibration.
- In OI, lower bounds show that satisfying the strongest (oracle- and code-access) auditors is computationally hard.

### 11.6 Philosophical claims made by the authors themselves (verbatim)

**Olszewski & Sandroni, "Falsifiability"** (AER 2011; Dec 2009 text).
- "We show that if experts are strategic, falsifiability has no power to distinguish scientific theories from worthless theories."
- "what Popper means by falsifiability is the feasibility of conclusive empirical rejection."
- "Popper's strict falsification criterion (which requires a theory to assert that some events are impossible) cannot deter even the most ignorant expert because the feasibility of conclusive empirical rejection can be removed by strategic randomization."
- "This result casts doubt on the idea that falsifiability can demarcate legitimate theories from worthless theories."
- "Popper was right to point out the asymmetry between verification and refutation. … This asymmetry becomes immaterial when refutation is understood as (strict) falsification, and theories are produced by strategic experts."
- "These two results deliver an original argument supporting the fundamental idea that refutation is a better maxim for empirical research than verification."
- "even without knowing the data, uninformed 'experts' can fabricate theories that will be supported by the data. This result makes the standard critique salient."

**Olszewski (2015, Handbook survey).**
- "In my opinion, this literature is about the philosophy of science, or more precisely, about probabilistic models."
- "Actually, I believe that scientific testing methods should be designed so as to exclude any test that can be ignorantly passed, i.e., no test should be passable by a person with malicious intent, who is ignorant about a particular forecasting problem but who is otherwise smart."
- On the literal (informed/ignorant) reading: "The literal interpretation faces a number of conceptual problems. For example, what does it mean to know the probabilities of future events?" He also invokes Raiffa's critique: once the lottery ζ is resolved, "the decision maker faces uncertainty again."
- "statistics … (implicitly) assumes that the hypotheses being tested were born out of thin air … The research on testing experts presented in this chapter is all about 'strategic hypothesis testing'."

**Olszewski & Sandroni.**
- 2008, Econometrica: "This result shows that it is difficult to dismiss false, but strategic, experts who know how theories are tested. This result also shows an important role that can be played by predictions contingent on data not yet observed."
- 2009 AoS: "These results pose a difficulty for the prequential principle."

**Al-Najjar & Weinstein (2008).**
- "the only coherent notion of 'true' probabilities is relative. That is, we cannot say whether or not a theory is correct in any absolute sense, only that it is better than others."
- "any identifiable notion of truth is inherently relative."
- Fn. 23: the impossibility results "seem to undermine the central methodological principle of falsifiability."

**Dekel & Feinberg** (Feb 2005 WP).
- "Obviously deterministic theories can be tested easily – either what they predict comes to pass or does not. If the 'truth' is stochastic, how close can one get to testing a prediction?"
- "any unique property of a distribution that demonstrates knowledge of the distribution is known only to whoever knows the distribution … This is why she needs to ask Bob what the right question is." (Earlier title: "A True Expert Knows Which Question Should Be Asked.")

**Vovk & Shafer** (2007 WP §5.3).
- "If everything is stochastic to a good approximation, then the bare concept of stochasticity has limited content."
- Forecasts that succeed regardless of outcomes are better called "descriptions of the past rather than predictions of the future."
- "when probability is used in a way that succeeds regardless of how events turn out, we do not need to look farther to find reasons for its success."

**Foster & Hart.**
- "calibration obtains by what can be referred to as 'back casting' (instead of forecasting)" (2021).
- "Experts should better be tested by the Brier score and not by calibration alone" (2023).

**Seidenfeld (1985).** Long-run calibration "gives no ground for validating one coherent opinion over another as each coherent forecaster is (almost) sure of his own long-run calibration"; the agreement is "'internal' (in Putnam's 1981 phrase)."

**Dwork et al. (2021).**
- OI "give[s] rise to models of Nature that cannot be falsified based only on observational data."
- "an elegant computational perspective on the scientific method."

**Pomatto & Sandroni (2018).**
- "σ-additivity is the definitive condition that assumes away both Hume's and Goodman's skepticism about induction."
- "any coherent view of the world contains a seed of orgulity."

**Fortnow & Vohra** (ECCC 2006). "This would suggest that Sandroni's impossibility result has little relevance to the testing of practical forecasting algorithms."

**Whitmeyer & Zhang (2025).** If the expert's knowledge "is endogenous, the falsifiability criterion does 'separate the wheat from the chaff'."

### 11.7 Points of caution for the paper
1. **"Pass the true expert w.p. ≥ 1 − ε" quantifies over DGPs, with probability under that DGP.** It is not a frequentist error rate over a population of experts, and not the tester's credence.
2. **"Manipulable" is a worst-case-over-paths statement about the charlatan's own lottery.** It requires the charlatan to know the test (or the distribution over tests) and Nature to be unable to see the realized lottery. It does *not* say the charlatan's forecasts are good, nor that they share any property of the truth beyond those the test checks (O&S 2009 AoS §3.1).
3. **"Non-manipulable" is almost always topological** (comeager or uncountable failure sets, or nonempty revelation sets). By O&S 2009 MOR Prop. 3 it cannot be measure-theoretic for any fixed measure. The tester learns that the charlatan *can* fail, not that he *probably* will.
4. **Infinite versus finite.** With bounded data, every type-I-controlled test is manipulable over convex compact classes (O&S 2009 MOR). Every positive prior-free single-expert result needs unbounded data, and often an undiscounted principal (contrast O&S 2007 with O&S 2011).
5. **Randomization.** The charlatan's randomization is essential for calibration and general tests (Oakes; Foster–Vohra). It can be tiny (Vovk–Shafer Thm 5; Kakade–Foster), and is unnecessary for tests continuous in the forecast (defensive forecasting; Foster–Hart's continuous calibration) or for checking rules ignoring the current forecast (Lehrer). Olszewski 2015 questions whether ex-ante randomization really helps a maxmin charlatan ex post.

---

## 12. Bibliography (Crossref-verified unless noted)

- Al-Najjar, N. I., & Weinstein, J. (2008). Comparative testing of experts. *Econometrica* 76(3): 541–559. doi:10.1111/j.1468-0262.2008.00846.x
- Al-Najjar, N. I., Sandroni, A., Smorodinsky, R., & Weinstein, J. (2010). Testing theories with learnable and predictive representations. *JET* 145(6): 2203–2217. doi:10.1016/j.jet.2010.07.003
- Al-Najjar, N., & Sandroni, A. (2013). A difficulty in the testing of strategic experts. *Math. Soc. Sci.* 65(1): 5–9. doi:10.1016/j.mathsocsci.2012.07.002
- Al-Najjar, N., Pomatto, L., & Sandroni, A. (2014). Claim validation. *AER* 104(11): 3725–3736. doi:10.1257/aer.104.11.3725
- Babichenko, Y. (2026). Testing decision makers without counterfactuals. arXiv:2606.02095 (arXiv metadata).
- Barreras, J., & Riascos, A. (2019). Screening of informed and uninformed experts. arXiv:1912.06244 (arXiv metadata).
- Belot, G. (2013). Failure of calibration is typical. arXiv:1306.4943 (journal version not checked here).
- Chassang, S. (2013). Calibrated incentive contracts. *Econometrica* 81(5): 1935–1971. doi:10.3982/ECTA9987
- Dagan, Y., Daskalakis, C., Fishelson, M., Golowich, N., Kleinberg, R., & Okoroafor, P. (2025). Breaking the T^{2/3} barrier for sequential calibration. *STOC 2025*: 2007–2018. doi:10.1145/3717823.3718178
- Dawid, A. P. (1982). The well-calibrated Bayesian. *JASA* 77(379): 605–610. doi:10.1080/01621459.1982.10477856
- Dawid, A. P. (1985). Self-calibrating priors do not exist: Comment. *JASA* 80(390): 340. doi:10.2307/2287892
- Dawid, A. P. (1985). Calibration-based empirical probability. *Ann. Statist.* 13(4): 1251–1274. doi:10.1214/aos/1176349736
- Dawid, A. P. (1984). Present position and potential developments: Some personal views. Statistical theory: The prequential approach. *JRSS A* 147(2): 278ff. doi:10.2307/2981683 (Crossref gives the start page only)
- Deb, R., Pai, M., & Said, M. (2018). Evaluating strategic forecasters. *AER* 108(10): 3057–3103. doi:10.1257/aer.20170299
- Dekel, E., & Feinberg, Y. (2006). Non-Bayesian testing of a stochastic prediction. *REStud* 73(4): 893–906. doi:10.1111/j.1467-937X.2006.00401.x
- Dwork, C., Kim, M. P., Reingold, O., Rothblum, G. N., & Yona, G. (2021). Outcome indistinguishability. *STOC 2021*: 1095–1108. doi:10.1145/3406325.3451064
- Feinberg, Y., & Lambert, N. (2015; online 2014). Mostly calibrated. *IJGT* 44(1): 153–163. doi:10.1007/s00182-014-0423-0
- Feinberg, Y., & Stewart, C. (2008). Testing multiple forecasters. *Econometrica* 76(3): 561–582. doi:10.1111/j.1468-0262.2008.00847.x
- Fortnow, L., & Vohra, R. V. (2009). The complexity of forecast testing. *Econometrica* 77(1): 93–105 (IDEAS; DOI not checked). ECCC TR06-149.
- Foster, D. P., & Hart, S. (2018). Smooth calibration, leaky forecasts, finite recall, and Nash dynamics. *GEB* 109: 271–293. doi:10.1016/j.geb.2017.12.022
- Foster, D. P., & Hart, S. (2021). Forecast hedging and calibration. *JPE* 129(12): 3447–3490. doi:10.1086/716559
- Foster, D. P., & Hart, S. (2023). "Calibeating": Beating forecasters at their own game. *TE* 18(4): 1441–1474. doi:10.3982/TE5330
- Foster, D. P., & Vohra, R. V. (1998). Asymptotic calibration. *Biometrika* 85(2): 379–390. doi:10.1093/biomet/85.2.379
- Foster, D. P., & Young, H. P. (2010). Gaming performance fees by portfolio managers. *QJE* 125(4): 1435–1458. doi:10.1162/qjec.2010.125.4.1435
- Foster, D. P., & Young, H. P. (2012). A strategy-proof test of portfolio returns. *Quantitative Finance* 12(5): 671–683 (IDEAS).
- Gupta, V., Jung, C., Noarov, G., Pai, M. M., & Roth, A. Online multivalid learning: Means, moments, and prediction intervals. arXiv:2101.01739 (published version not verified).
- Haghtalab, N., Qiao, M., Yang, K., & Zhao, E. (2024). Truthfulness of calibration measures. *NeurIPS 2024*; arXiv:2407.13979.
- Hanson, R., & Oprea, R. (2009). A manipulator can aid prediction market accuracy. *Economica* 76(302): 304–314. doi:10.1111/j.1468-0335.2008.00734.x
- Hart, S. (2022). Calibrated forecasts: The minimax proof. arXiv:2209.05863.
- Hartline, J., Hu, L., & Wu, Y. (2025). A perfectly truthful calibration measure. arXiv:2508.13100.
- Hébert-Johnson, Ú., Kim, M. P., Reingold, O., & Rothblum, G. N. (2018). Multicalibration: Calibration for the (computationally-identifiable) masses. *ICML 2018*, PMLR 80: 1939–1948.
- Hu, T.-W., & Shmaya, E. (2013). Expressible inspections. *TE* 8(2): 263–280. doi:10.3982/TE992
- Kakade, S., & Foster, D. P. (2008). Deterministic calibration and Nash equilibrium. *JCSS* 74(1): 115–130. doi:10.1016/j.jcss.2007.04.017
- Karger, E., et al. (2025). ForecastBench: A dynamic benchmark of AI forecasting capabilities. *ICLR 2025* (proceedings page).
- Kavaler, I., & Smorodinsky, R. (2019). On comparison of experts. *GEB* 118: 94–109. doi:10.1016/j.geb.2019.08.005
- Lee, D., Noarov, G., Pai, M., & Roth, A. (2022). Online minimax multiobjective optimization: Multicalibeating and other applications. *NeurIPS* 35: 29051–29063.
- Lehrer, E. (2001). Any inspection is manipulable. *Econometrica* 69(5): 1333–1347. doi:10.1111/1468-0262.00244
- Oakes, D. (1985). Self-calibrating priors do not exist. *JASA* 80(390): 339. doi:10.1080/01621459.1985.10478117
- Olszewski, W. (2015). Calibration and expert testing. In *Handbook of Game Theory with Economic Applications*, vol. 4: 949–984. doi:10.1016/B978-0-444-53766-9.00018-5
- Olszewski, W., & Pęski, M. (2011). The principal-agent approach to testing experts. *AEJ: Micro* 3(2): 89–113. doi:10.1257/mic.3.2.89
- Olszewski, W., & Sandroni, A. (2007). Contracts and uncertainty. *TE* 2(1): 1–13 (from the PDF itself).
- Olszewski, W., & Sandroni, A. (2008). Manipulability of future-independent tests. *Econometrica* 76(6): 1437–1466. doi:10.3982/ECTA7428
- Olszewski, W., & Sandroni, A. (2009). A nonmanipulable test. *Ann. Statist.* 37(2): 1013–1039. doi:10.1214/08-AOS597
- Olszewski, W., & Sandroni, A. (2009). Strategic manipulation of empirical tests. *Math. Oper. Res.* 34(1): 57–70. doi:10.1287/moor.1080.0347
- Olszewski, W., & Sandroni, A. (2009). Manipulability of comparative tests. *PNAS* 106(13): 5029–5034. doi:10.1073/pnas.0812602106
- Olszewski, W., & Sandroni, A. (2011). Falsifiability. *AER* 101(2): 788–818. doi:10.1257/aer.101.2.788
- Paleka, D., Goel, S., Geiping, J., & Tramèr, F. (2025). Pitfalls in evaluating language model forecasters. arXiv:2506.00723.
- Pomatto, L., Al-Najjar, N., & Sandroni, A. (2014). Merging and testing opinions. *Ann. Statist.* 42(3): 1003–1028. doi:10.1214/14-AOS1212
- Pomatto, L., & Sandroni, A. (2018). An axiomatic theory of inductive inference. *Philosophy of Science* 85(2): 293–315. doi:10.1086/696386
- Qiao, M., & Valiant, G. (2021). Stronger calibration lower bounds via sidestepping. *STOC 2021*: 456–466. doi:10.1145/3406325.3451050
- Sandroni, A. (2003). The reproducible properties of correct forecasts. *IJGT* 32(1): 151–159. doi:10.1007/s001820300153
- Sandroni, A., & Shmaya, E. (2014). A prequential test for exchangeable theories. *J. Dynamics and Games* 1(3): 497–505. doi:10.3934/jdg.2014.1.497
- Sandroni, A., Smorodinsky, R., & Vohra, R. V. (2003). Calibration with many checking rules. *Math. Oper. Res.* 28(1): 141–153. doi:10.1287/moor.28.1.141.14264
- Schervish, M. J. (1985). Self-calibrating priors do not exist: Comment. *JASA* 80(390): 341. doi:10.2307/2287893
- Seidenfeld, T. (1985). Calibration, coherence, and scoring rules. *Philosophy of Science* 52(2): 274–294. doi:10.1086/289244
- Shmaya, E. (2008). Many inspections are manipulable. *TE* 3(3): 367–382 (from the PDF itself).
- Stewart, C. (2011). Nonmanipulable Bayesian testing. *JET* 146(5): 2029–2041. doi:10.1016/j.jet.2011.06.015
- V'yugin, V. V. (2008). A game-theoretic version of Oakes' example for randomized forecasting. arXiv:0808.3746.
- Vovk, V., & Shafer, G. (2005). Good randomized sequential probability forecasting is always possible. *JRSS B* 67(5): 747–763. doi:10.1111/j.1467-9868.2005.00525.x
- Whitmeyer, M., & Zhang, K. (2025). Redeeming falsifiability? arXiv:2303.15723v2.
- Witkowski, J., Freeman, R., Vaughan, J. W., Pennock, D. M., & Krause, A. (2023). Incentive-compatible forecasting competitions. *Management Science* 69(3): 1354–1374. doi:10.1287/mnsc.2022.4410
