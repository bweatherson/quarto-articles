# Idea memo v3: Humean chance and the certification of experts

Status: this is a core revision written after the two NOT READY screenings of "The Record and the Account".

The old thesis was that a record certifies chance-knowledge only relative to an account. That thesis is
Pomatto's (2021): his "paradigm" is "a summary of preexisting knowledge". He states it as a theorem and adds
an optimality result. The old headline clause, "accounts closed under mixture certify no one", holds only for
finite tests. Sandroni & Shmaya (2014) give a non-manipulable infinite prequential test for the exchangeable class.

## Question

Does the metaphysics of chance make a difference to whether a record of forecasts can certify that someone
knows the chances? In particular, does Humean chance (Lewis's best system) differ here from primitive chance
(propensities, or chance as a primitive physical magnitude)?

## Background results (economics)

**Setting.**
- Outcomes are drawn from a finite set X.
- Paths ω ∈ Ω = X^∞, and laws P ∈ Δ(Ω).
- A paradigm Λ ⊆ Δ(Ω) is the set of laws the tester treats as possible.
- A test T(ω, P) ∈ [0,1] is *finite* if each P is judged on the first n_P outcomes.

**Testability.** Λ is ε-testable if some finite test meets two conditions:
- it accepts P with probability ≥ 1−ε under P, for every P ∈ Λ;
- for every randomised strategy ζ ∈ Δ(Δ(Ω)) of an uninformed forecaster, some P_ζ ∈ Λ makes the pass probability ≤ ε.

**Prior results.**
- **O&S 2009 (MOR) Prop. 1.** If Λ is convex and compact, every finite test with type-I control is manipulable.
- **Pomatto 2021, Thm 1, Cor. 1, Thm 2.**
  - Λ is testable iff, for every ε, some prior μ on Λ has a mixture Q_μ = ∫P dμ with ||Q_μ − P||_TV ≥ 1−ε for every P ∈ Λ.
  - The likelihood-ratio test "pass iff P(ω^{n_P}) > Q_μ(ω^{n_P})" then works.
  - The proof of Thm 2 uses only the existence of μ, so an ε-version holds for each fixed ε.
- **Shmaya 2008.** With Λ = Δ(Ω), every prequential test, even an infinite one, is manipulable.
- **Sandroni & Shmaya 2014.** For the exchangeable Λ there is a non-manipulable infinite prequential test.

## Core claims

**(L1) Properness gives near-singularity.**
- Let a Humean theory of chance be a measurable map BS: Ω → Δ(Ω), sending each world to its chance law. Here the
  path ω is the whole supervenience base; see the locality caveat below.
- Call P **δ-proper** if P{ω : BS(ω) = P} ≥ 1−δ. Belot 2024 calls δ = 0 "proper".
- If P ≠ P′ are both δ-proper, then ||P − P′|| ≥ 1 − 2δ.
- Proof: the events A_P = {BS = P} and A_P′ = {BS = P′} are disjoint. So P′(A_P) ≤ δ, while P(A_P) ≥ 1−δ.

**(L2) Hence testability.**
- Let Λ_H be any class of δ-proper laws with at least n members, and put a uniform prior on n of them.
- Then ||Q_μ − P|| ≥ 1 − 2δ − 1/n for every P ∈ Λ_H.
- By Pomatto's Thm 2, the likelihood-ratio test against Q_μ has type-I error < 2δ + 1/n and is
  (2δ+1/n)-non-manipulable.
- With δ = 0 and infinitely many laws, the class is testable by finite tests.

**(L3) The mixtures that drive the impossibility theorems are not Humean chances.**
- The impossibility theorems run on mixtures of chance laws: Nature's compound lotteries (Al-Najjar & Weinstein 2008 §6; the minimax step in O&S 2009).
- A non-trivial mixture of distinct δ-proper laws is maximally self-undermining: Q_μ{BS = Q_μ} ≤ δ.
- So mixtures of possible chance laws are not themselves possible chance laws. On a Humean view, the
  impossibility theorems quantify over "laws" that could not be the chances.

**(P) Primitivism supplies no such restriction.**
- A device whose physical state at t is a function of the past record can realise any law with full support.
  Examples are the Pólya urn and generalised urns: a mechanism sets the bias of the next toss as a function of past outcomes.
- So nothing in primitivism keeps the class of possible chance laws away from Δ(Ω). Two cases follow:
  - With Δ(Ω) as the class, Shmaya's theorem means no test certifies.
  - With a convex compact class, no finite test certifies (O&S; Pomatto Cor. 1).
- A primitivist can certify only relative to a restriction drawn a posteriori from physics. A restriction that
  a primitivist adopts is a substantive bet that risks type-I error. For the Humean, the restriction is part of
  what chance is.

**(U) Undermining is the price.**
- Certification error is bounded below by the undermining probability (the "big bad bug" of Lewis 1994, Thau 1994, Hall 1994).
- Schwarz's 10-toss example: iid(½) undermines itself with probability 0.754.
- A toy MDL best-systems account gives undermining probabilities of 0.003–0.115, depending on n (chance-ontology-check §4, computed).
- Undermining is usually treated as a bug in the Principal Principle. Here, a small undermining probability is what
  buys the Humean the ability to tell experts from charlatans.

## Thesis (one sentence)

If the chances are Humean and rarely undermine themselves, then a record of the whole pattern on which they
supervene can, in principle, certify that a forecaster knows them. If the chances are primitive, no record can,
unless physics independently restricts which chance processes are possible.

## Threats (honest list)

1. **Locality.**
   - L1 needs BS to be a function of the record. Real records are local: one coin, one forecaster's domain.
   - Humean chance for a local record is a marginal of a proper global law, and marginals need not be near-singular.
     Example: many coins minted from a Beta prior whose biases are not in the mosaic. A coin's chance law is then
     Pólya(a,b), and Pólya(a,b) and Pólya(a′,b′) are mutually absolutely continuous.
   - So the Humean advantage is "in principle", for records of the whole supervenience base. This must be stated,
     and it limits the practical upshot.
2. **Finite worlds.**
   - δ can be large: it is large at the resolution limit, where MDL parameter precision is about 1/√n.
   - Undermining probabilities depend on the standards of simplicity and fit, so the quantitative bound inherits that slack.
3. **Infinite horizon.**
   - The asymmetry is for finite tests only.
   - O&S 2009 (AoS) give a non-manipulable future-dependent test for all of Δ(Ω).
   - Sandroni & Shmaya give a prequential test for the exchangeable class.
   - The primitivist gets certification "at infinity" in the economists' (topological) sense.
4. **Ties and imprecise best systems** (Fenton-Glynn; Dardashti et al.). If ties are resolved by taking convex
   sets of chance functions, mixtures come back in.
5. **Time-indexed chance and information.**
   - Primitivist chance after a hidden selection event is the component, not the mixture.
   - A chance-tracking expert who learns hidden states is not modelled by one law announced at time 0.
   - Say which framework (announced law or prequential) the thesis uses.
6. **Priority.**
   - Belot 2024, "Unprincipled": proper theories of chance, worlds-to-laws maps. Does he note mutual singularity?
   - Al-Najjar, Sandroni, Smorodinsky & Weinstein 2010 (JET): testing theories with learnable and predictive
     representations, building on Jackson, Kalai & Smorodinsky 1999.
   - Earman & Roberts 2005, "Contact with the nomic", and anyone who extends it to chance.
   - Any philosopher citing Pomatto 2021 or Olszewski & Sandroni on Humean chance.
7. **Triviality.**
   - L1 and L2 are one-liners given Pomatto. The contribution is the connection plus the asymmetry.
   - The risk is a verdict of "EXPECTED / thin".

## What carries over from the old paper (as support, not as thesis)

- The Charmides frame: 170d–171c, the doctor and the pretender.
- Stewart's ε example: a Bayesian tester certifies information beyond her prior.
- The record as textbook: chance is learnable from the record (merging).
- The provenance norm: fix the paradigm before the record accrues.
