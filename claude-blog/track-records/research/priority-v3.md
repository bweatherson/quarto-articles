# Priority check v3: proper Humean chance, testable paradigms, and certifying chance-knowledge

Prepared 21 October 2026. Companion to `chance-ontology-check.md` §5 and `econ-report.md`.

**Labels.** [READ] = relevant sections of the full text read myself (version noted). [PART] = part of the text, a tool summary, or a keyword search only. [ABSTRACT] = abstract or metadata only. [COMPUTED] = my own two-line calculation.

Page numbers are journal pages unless a preprint is named. Downloads are in `/tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/prio3/`.

---

## 1. Verdicts

**C1 (δ-proper ⇒ TV ≥ 1−2δ): PARTLY ANTICIPATED.**
- **Found:**
  - Belot 2024 defines exact propriety, λ(Λ) = 1 (Def. 2.8, p. 442).
  - He uses mutual singularity without naming it (proof of Prop. 3.4, p. 444).
  - Pomatto 2021 (p. 142) makes the same point for i.i.d. laws.
- **Not found:** the δ-version and the 1−2δ bound.
- Belot shows why δ > 0 is needed: finite-world Humean theories are improper (fn. 28, p. 445).

**C2 (testable paradigm; likelihood-ratio test against a uniform mixture of n laws): PARTLY ANTICIPATED. The mathematics is there, the chance application is not.**
- **Found:**
  - Pomatto's Prop. 2 and its proof (pp. 142, 154) is this construction for strongly orthogonal mixing laws.
  - Pomatto's Prop. 4 (p. 143) is an ε-testability result for near-orthogonal paradigms.
  - Kavaler & Smorodinsky (Thm. 5) and Olszewski & Sandroni (§4.1) give the pairwise and two-theory cases.
- **Caveat [COMPUTED].** With δ > 0 the bound is ‖Q − P‖ ≥ 1 − 2δ − 1/n. That gives ε-testability for ε > 2δ, not testability in Pomatto's sense (Def. 4, p. 136).

**C3 (mixtures self-undermining, so Nature's lotteries are excluded): PARTLY ANTICIPATED.**
- **Found:**
  - Al-Najjar & Weinstein (p. 554) trace impossibility to reducing "Nature's compound lotteries".
  - Pomatto (p. 137) shows the worst-case mixture must lie outside the paradigm.
- **Not found:** the claim that Humean metaphysics excludes the mixtures.
- **[COMPUTED]** Under exact propriety, Belot's own Def. 2.1(ii) (p. 440) already bans such mixtures. He does not draw this consequence.

**C4 (Humean/primitive asymmetry in certification): epistemic theme ANTICIPATED; testing version NOT FOUND.**
- **Found:** these authors argue that non-Humean chances or laws are not read off the record.
  - Schwarz on primitive chance.
  - Gillies on single-case propensities.
  - Barrett & Chen 2025 on non-constraining probabilistic laws.
  - Earman & Roberts, but for laws only: they set chance aside.
- **Threat:** Barrett & Chen's constraining laws are proper and available to primitivists, so the asymmetry may be proper versus improper chance rather than Humean versus non-Humean.

**C5 (undermining probability bounds certification error): NOT FOUND.**
- **Nearest:**
  - Olszewski & Sandroni treat ε in P(A_P) ≥ 1−ε as the type-I error.
  - Belot (p. 463) identifies impropriety with undermining.
  - Barrett & Chen 2026 (§5.2) bound the error in the Principal Principle (PP) for finite L⋆ laws.

**Single closest source.** Pomatto 2021, Prop. 2 and its proof (pp. 142, 154). Its philosophical twin is Belot 2024, which has propriety and mixture priors but no testing.

---

## 2. Evidence by source

### 2.1 Belot 2024, "Unprincipled," RSL 17(2): 435–474 [READ: CUP open-access PDF, §§1–3, §5 opening, App. A; keyword search of the rest]
- **Def. 2.1 (p. 440).** A theory of chance is a partial map from worlds to measures. Clause (ii) requires λ(L⁻¹(λ)) > 0, which rules out a law that gives "zero chance that it is the law of chance."
- **Def. 2.8 (p. 442).** "We call L proper if all of its laws of chance are proper." Remark 2.9(b) (p. 442) uses the strong law of large numbers (SLLN) to show that Bernoulli laws are proper.
- **Prop. 3.4 (p. 444).** In the proof he writes "the λ_k other than λ_j assign measure zero to Λ_j", and also "the chance hypotheses corresponding to distinct chance laws must be disjoint". This is mutual singularity, used but never named. grep finds no "singular" in the whole text.
- **Cor. 3.5–3.6 (p. 445).** CCP is satisfiable iff L is "proper and has only countably many laws of chance". The witness prior is μ₀ = Σ 2⁻ᵏ λ_k, a mixture of the chance laws. This is structurally Pomatto's Q_μ, though Belot uses it as a rational prior, not as a test benchmark.
- **Footnote 28 (p. 445).** Finite-world frequentism and best-system theories are "unsatisfiable with respect to the finite-world version of CCP (because they are improper)".
- **App. A (p. 463).** Impropriety "launched the large and messy literature on undermining". Improper laws are converted to proper ones by conditioning, λ̄ = λ(·|L⁻¹(λ)). He also shows that the New Principle for L is equivalent to CCP for L̄.
- **Mixtures (pp. 455, 458).** Remarks 5.12 and 5.26 treat mixtures only as priors.
- **Scope (p. 437).** "Non-reductionist theories of chance are neglected throughout".
- **p. 451.** For a Humean, a chance hypothesis is "a holistic fact about the history of the entire universe" (fn. 43 cites Roberts 2001, p. S104).
- **Absent:** no Sandroni, Olszewski, Foster–Vohra, Pomatto, calibration or testing of forecasters. The nearest game-theoretic material is merging (Blackwell–Dubins, Kalai–Lehrer).

### 2.2 Belot 2016, "Undermined," AJP 94(4): 781–791 [PART: tool summary of the PhilSci 12030 preprint; abstract verified]
- **Thesis.** Reductionist accounts "inevitably distort the relations of probability that they take as input" (abstract).
- **Finite case (§3).** With N = 10, the frequentist reading keeps 252 of the 1,024 histories. The fair-coin law conditioned on its chance hypothesis then makes independent tosses dependent.
- **Infinite case (§§5–6).** The fair-coin measure is proper, but conditional structure is still distorted.
- **Relevance to C1 and C5.** This is the cost of propriety. An unconditioned δ-proper law keeps independence but undermines with probability δ; the conditioned (proper) version distorts.
- The tool summary reports no mention of singularity, testing, forecasters, Sandroni, or likelihood ratios.
- **Reply.** Hoefer 2018, "'Undermined' Undermined" (PhilSci 14886) [ABSTRACT] argues that Belot raises no new difficulty.

### 2.3 Pomatto 2021, "Testable forecasts," TE 16: 129–160 [READ: open-access PDF, §§1–4, App. A.4]
- **Thm. 1 (p. 136).** Testable iff for every ε there is μ ∈ Δ(Λ̄) with ‖Q_μ − P‖ ≥ 1−ε for all P ∈ Λ.
- **Thm. 2 (p. 138).** The likelihood-ratio test against Q_μ. Prop. 4's proof (p. 154) confirms that Thm. 2 yields ε-testability from such a prior alone.
- **Mixtures (p. 137).** The worst-case mixture "must not be within the paradigm".
- **Prop. 2 (p. 142).** Mixing laws plus n strongly orthogonal laws for every n give testability. On i.i.d. laws: "any two distinct i.i.d. laws assign probability 1 to different limiting frequencies".
- **Proof of Prop. 2 (p. 154).** "Let μ be a uniform prior over P1, …, Pn", giving ‖Q_μ − P‖ ≥ 1 − 1/n.
- **Fn. 15 (p. 142).** Orthogonal laws alone do not suffice: "Δ(Ω) trivially satisfies the richness assumption but is not testable."
  - Pomatto adds mixing, which gives tail-triviality.
  - δ-propriety does the same job, because every law in the paradigm, not only the n components, is nearly singular to Q. C2 should say so.
- **Prop. 4 (p. 143).** {P̃ : ‖P − P̃‖ > 1−ε} "is ε-testable and is not included in any testable paradigm".
- **Fn. 4 (p. 132).** "The paradigm studied in Al-Najjar et al. (2010) is convex, but testable." So non-convexity is not necessary. Bear this in mind for C3.
- **Absent:** chance metaphysics, Lewis, propensity, undermining.

### 2.4 Al-Najjar, Sandroni, Smorodinsky & Weinstein 2010, JET 145 [ABSTRACT + secondary descriptions; the full text was not reachable]
- Paywalled; the Technion author copy was unreachable.
- **Abstract (IDEAS).** The expert names "a date T by which he will have learned enough", and "Such a test is not possible if the theory is unrestricted."
- **Olszewski 2015 handbook WP, p. 23 [READ].** In ASSW, theories are mixtures over Θ such that the expert can eventually "forecast as if he knew the true parameter θ".
- **Pomatto (p. 142).** The class is "asymptotically reverse mixing", containing deterministic, i.i.d. and Markov laws.
- **Answer to the brief.** The paradigm consists of learnable (merging) representations, not components identifiable from data, and it is convex. There is no chance metaphysics in any of these descriptions.

### 2.5 Jackson, Kalai & Smorodinsky 1999 [READ: 1997 working paper "Patterns, Types, and Bayesian Learning", EconWPA 9711002, not the Econometrica text]
- **Main result.** For asymptotically mixing μ, the unique (up to equivalence) representation that is learnable and provides patterns is the tail-field decomposition (Thm. 1, Cor. 1).
- **Learnability is not identification.** Learnability is "different from requiring that an observer come to identify θ" (WP p. 8). §4 adds that the observer "may never be able to identify θ" (WP p. 14).
- **Absent:** chance, propensity, singularity. The only metaphysical gloss is Nature choosing a component in a "two stage" process (WP p. 2).

### 2.6 Al-Najjar & Weinstein 2008, Econometrica 76(3) [READ: JSTOR scan, pp. 553–555]
- "outside observers can never distinguish" Nature's mixed strategy from the reduced law (p. 553).
- The impossibility rests on reducibility of "Nature's compound lotteries" (p. 554).
- "Stochastic truth" has "infinitely many two-stage lottery" representations (p. 554).
- **Relevance.** Closest to C3. They draw a relativist conclusion; no Humean move.

### 2.7 Olszewski & Sandroni 2009, "Strategic manipulation of empirical tests," MOR [READ: PIER WP 08-015]
- **§4.1 (WP p. 13).** Two theories with "disjoint sets AP1 and AP2 satisfying (1.1)" give a non-manipulable test.
- **(1.1) (WP p. 3).** P(A_P) ≥ 1 − ε.
- **Relevance.** This is n = 2 δ-propriety, with ε as the type-I error, which bears on C5.

### 2.8 Kavaler & Smorodinsky 2019 [READ: arXiv 1710.09461v3]
- **Thm. 5 (p. 20).** An ideal comparison test exists "if and only if W is pairwise mutually singular".
- **Example 2 (p. 20).** i.i.d. forecasts, decided by limiting frequency.
- **Scope.** Two experts, not a single-expert paradigm.

### 2.9 Olszewski 2015 handbook WP and Pomatto's lecture notes [PART: keyword search plus the passages cited]
- **Olszewski.** No mutual singularity anywhere. He sets interpretation aside: "One may disagree about the way we should interpret the concept of probability" (WP p. 17).
- **Pomatto's notes.** A likelihood-ratio slide uses a rival P* with P(E) = 1 and P*(E) = 0, but only to illustrate manipulability. There is no paradigm result.

### 2.11 Earman & Roberts 2005
- **Part II [READ: author-hosted UNC PDF].** Rival law hypotheses agree "even on single-case objective chances (which might not supervene on the Humean base)" (p. 263). Chance is set aside.
- **Part I [NOT ACCESSED].** No author-hosted copy was found, so I did not use the course-site copy.

### 2.12 Barrett & Chen
- **2025, "Algorithmic randomness and probabilistic laws," BJPS [READ: arXiv 2303.01411v2, §1, notes].**
  - Standard probabilistic laws rule out no world, so the law may be true with "no empirical evidence whatsoever for its acceptance" (p. 2).
  - The cure is constraining laws L⋆, offered to Minimal Primitivism and to Humeans alike (fn. 1, p. 2; p. 10).
- **2026, "Algorithmic randomness, exchangeability, and the PP," BJPS [READ: arXiv 2510.24054v3, §§3.1, 5.2, 6].**
  - "at most one candidate L⋆βθ is true of the actual sequence" (p. 8). This is exact disjointness.
  - Finite L⋆ "approximates the PP with precise error bounds" (p. 16).
  - The PP derivation is "metaphysically neutral" (p. 18).
  - No testing of forecasters.

### 2.13 Schwarz 2016, "Best system approaches to chance" [READ: umsu.de preprint, §§5–6]
- On primitive chance, "we have no direct way to inspect this primitive quantity" (§5, preprint p. 14).
- No testing of forecasters.

### 2.14 Other candidates in item 5
None of these links chance to the testing-experts literature.
- **[ABSTRACT]:** Gallow 2023 (CJP); Bhogal & Hicks 2025 (J. Phil., on undermining).
- **[PART]:** Lopez-Wild 2026, "Testing for priors", where "testing" means Martin-Löf tests and Unprincipled is cited only in the bibliography; Barrett, Chen & Lopez-Wild 2026; Hubert 2021; Zaffora Blando 2024; Maclean 2010 thesis, which reports Gillies' view that single-case propensities "cannot be empirically verified".
- **Not read this session (searches only):** Hoefer 2019; Ismael 2008; Briggs 2009; Pettigrew; Dardashti et al.; Fenton-Glynn; Hicks; Frigg & Hoefer; Werndl; von Plato; Sterkenburg; Herrmann. Several are covered at [ABSTRACT] in `chance-ontology-check.md` §5.

---

## 3. What the author must cite or answer

1. **Pomatto, Prop. 2, fn. 15 and Prop. 4.** Present C2 as Pomatto's construction with δ-propriety in place of mixing and tail-triviality. State it as ε-testability for ε > 2δ [COMPUTED]. That is also where C5 belongs.
2. **Belot 2024.**
   - Credit Def. 2.8 and the disjointness used in Prop. 3.4.
   - Note that his CCP priors Σcₖλₖ are Pomatto's Q_μ.
   - Note that Def. 2.1(ii) already bans mixtures under exact propriety.
   - Answer his fn. 28 on finite-world impropriety, which is why δ > 0.
3. **Belot 2016 and Hoefer 2018.** Conditioning a law on its own hypothesis restores propriety but distorts the probabilities. Say which kind of law the certification theorem uses: δ-proper laws with undermining, or conditioned laws.
4. **Barrett & Chen 2025/2026.** This is the strongest objection to C4: a primitivist with constraining laws gets disjoint possibility sets. Either restrict C4 to non-constraining (propensity) chance, or argue that constraining laws are covertly Humean.
5. **Al-Najjar & Weinstein 2008, pp. 553–554.** This is the source of the phrase "Nature's compound lotteries". Contrast their relativism about "stochastic truth" with your exclusion of mixtures.
6. **ASSW 2010, via Pomatto fn. 4.** A convex paradigm can be testable, so excluding mixtures is sufficient, not necessary. Obtain the full text (paywalled).
7. **Mixing as the a posteriori restriction.** Pomatto (p. 142) shows the paradigm of all mixing laws is testable. A propensity theorist who takes physics to deliver mixing or ergodicity therefore gets testability. C4's "without an a posteriori restriction" must concede this explicitly.
8. **Roberts 2001 [ABSTRACT] and Briggs 2009 §3.3 [NOT READ].** Both are cited by Belot (fn. 43, p. 451) on whether Humean chance facts can ever be evidence. This bears on whether a record can certify a holistic fact.

---

## 4. Search log

**Full texts fetched**
- Belot 2024: CUP PDF.
- Belot 2016: PhilSci 12030 PDF, via WebFetch summary.
- Pomatto 2021: econtheory.org.
- JKS 1997 WP: EconWPA.
- Earman & Roberts Part II: UNC.
- Barrett & Chen 2025 and 2026; Barrett, Chen & Lopez-Wild 2026; Whitmeyer & Zhang 2023; Hubert 2021: all arXiv.
- Schwarz BSA: umsu.de.
- Maclean 2010: McMaster.
- Local texts: Olszewski 2015; Kavaler & Smorodinsky; Pomatto notes; Al-Najjar & Weinstein 2008; Olszewski & Sandroni MOR; Zaffora Blando; and other files in `texts/`.

**Blocked or failed**
- PhilSci record pages: "Request Rejected"; curl failed TLS.
- PhilPapers and PhilArchive search pages.
- ASSW 2010 (Technion): connection reset, then robots.txt.
- Earman & Roberts Part I.
- Suárez 2020 Element (robots.txt).

**Citation APIs**
- **Pomatto 2021, Semantic Scholar** (DOI 10.3982/TE3767): two citers, Whitmeyer & Zhang, "Testing experts who can learn" (arXiv 2303.15723), and Massari, "The market test" (SSRN 2023). Both are economics.
- **Pomatto 2021, OpenAlex** (W4230696393): cited_by_count = 2. The citer listing failed because of the daily budget.
- **Pomatto 2021, Crossref:** 0. No philosophical citers.
- **Semantic Scholar citers of Belot 2024** (7), **Belot 2016** (6), and **Earman & Roberts Parts I and II** (58 and 46): titles scanned. Chance-related ones were checked as above. None concerns testing forecasters.

**WebSearch queries** (about 35; "ext" marks extended mode)
- *Targets:* Belot "Undermined"; ASSW and JKS PDFs; citers of Pomatto 2021; Lopez-Wild; "Mechanical Turkeys" (no abstract found); Bhogal & Hicks; Barrett & Chen; Roberts 2001; Skow 2007 (not reached); Maclean; von Plato; Genin & Kelly.
- *Bridge queries, all without a hit:*
  - Humean chance + "testing experts"/Sandroni (ext);
  - "primitive"/"non-Humean chance" + empirically inaccessible + "Contact with the nomic" (ext);
  - Earman–Roberts replies on chance (ext);
  - chance + "mutually singular" + undermining (ext);
  - Sandroni + "Principal Principle"/"objective chance" (ext);
  - Sandroni + Hoefer/Schwarz/Belot/Pettigrew;
  - "Foster and Vohra" + chance;
  - "self-undermining" + mixture;
  - typicality + "mutually singular";
  - "track record" + chances + propensity (ext);
  - "testable paradigm" + chance;
  - "Olszewski and Sandroni" + philosophy journals;
  - "probability of undermining";
  - Hoefer *Chance in the World* + testing;
  - two queries restricted to PhilPapers, PhilArchive and PhilSci.
