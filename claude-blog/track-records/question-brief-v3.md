# Question brief (for the predictability test; contains no thesis)

## The question

The expert-testing literature in economics asks whether a record of probabilistic forecasts, together with
the outcomes that followed, can distinguish a forecaster who knows the data-generating process from an
uninformed forecaster who randomises strategically.

Does the *metaphysics of chance* matter to the answer? In particular, it might matter whether chance is Humean
(Lewis's best-system analysis; chances supervene on the mosaic) or primitive (propensities, or chance as a
non-supervenient physical magnitude). If it matters, how, and how much?

## Background: economics

**Setting.**
- Outcomes come from a finite set X; paths ω ∈ Ω = X^∞; laws P ∈ Δ(Ω).
- A paradigm Λ ⊆ Δ(Ω) is the set of laws the tester treats as possible.
- A test T(ω, P) ∈ [0,1] is *finite* if each law P is judged on the first n_P outcomes.
- Λ is **ε-testable** if some finite test (i) accepts P with probability ≥ 1−ε under P, for every P ∈ Λ, and
  (ii) for every randomised strategy ζ ∈ Δ(Δ(Ω)) of an uninformed forecaster, has some P_ζ ∈ Λ under which the
  pass probability is ≤ ε.

**Results.**
- **Sandroni 2003; Olszewski & Sandroni 2008; Shmaya 2008.** With Λ = Δ(Ω), every test with type-I control in a
  broad class can be passed by an uninformed randomiser. The class covers finite tests, future-independent
  tests, and prequential tests even of infinite length.
- **Olszewski & Sandroni 2009, *Math. Oper. Res.*, Prop. 1.** If Λ is convex and compact, every finite test with
  type-I control over Λ is manipulable. The proof is a minimax argument: Nature's mixture over laws is again a
  law, a point Al-Najjar & Weinstein 2008 call reducibility of compound lotteries.
- **Olszewski & Sandroni 2009, *Annals of Statistics*.** A non-manipulable test exists for all of Δ(Ω) if the test
  may use the forecaster's predictions at unrealised histories (future-dependent) and has an infinite horizon.
  Its catching power is only topological.
- **Sandroni & Shmaya 2014.** For the exchangeable class (convex, compact), there is a non-manipulable
  *infinite* prequential test. Finite prequential tests for that class are manipulable.
- **Pomatto 2021, *Theoretical Economics*.**
  - Λ is testable (by finite tests) iff, for every ε > 0, some prior μ on Λ yields a mixture Q_μ = ∫P dμ with
    ||Q_μ − P||_TV ≥ 1−ε for all P ∈ Λ.
  - The likelihood-ratio test "pass iff P(ω^{n_P}) > Q_μ(ω^{n_P})" then has type-I error < ε and is
    ε-non-manipulable.
  - LR tests are least manipulable (a Neyman–Pearson analogue).
  - He reads a paradigm as "a summary of preexisting knowledge", a scientific theory's restrictions, or a normative standard.
- **Kavaler & Smorodinsky 2019.** For *comparing* two forecasters, an ideal test exists iff the admissible laws
  are pairwise mutually singular.
- **Stewart 2011.** A Bayesian tester with prior μ can use a likelihood-ratio test against her own predictive.
  It passes true experts except with probability ε (her prior probability of learning fast), and it passes false
  experts with probability 0 by her lights.

## Background: philosophy of chance

- **Lewis's best-system analysis.** The chance law of a world is the probability function of the system that best
  balances simplicity, strength and fit; fit is the probability the system gives the actual history. Chances at
  t are the law conditioned on the history to t.
- **Undermining.** A Humean chance law can give positive (sometimes large) probability to histories whose best
  system is a different law. This is Lewis 1994's "big bad bug", answered by the New Principle (Lewis 1994;
  Hall 1994; Thau 1994).
- **Primitive chance.** Chances are fixed by physical set-ups or primitive facts that need not supervene on
  the pattern of outcomes. Examples: the Pólya urn (chance of red = current proportion), single-case
  propensities, and chancy dynamical laws.
- **Earman & Roberts 2005, "Contact with the nomic".** Non-Humean laws are not empirically accessible even on all
  possible evidence. They set chance aside.
- **Belot 2024, "Unprincipled" (Rev. Symb. Logic).** Models a theory of chance as a map from worlds to chance
  laws.
