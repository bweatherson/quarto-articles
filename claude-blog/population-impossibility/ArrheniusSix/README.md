# ArrheniusSix

Lean 4 (core library only, no Mathlib) verification accompanying
"A Counterexample to Arrhenius's Sixth Impossibility Theorem".

- `Basic.lean` — the capacity view V (lists of integer welfare levels; H, T⁻, I, J, lexical order), with baseline capacity c.
- `Conditions.lean` — Arrhenius's five conditions in his exact 2011 formulations, Weak Quality Addition*, and the proof that V satisfies the five and violates WQA* (`sixth_theorem_countermodel`).
- `Dist.lean` — welfare distributions as finitely supported count functions.
- `Theorems.lean` — Thomas's reconstructions: T1–T5, T6* (`T6star`), Proposition 2 (`prop2`), Corollary 3 (`cor3`).
- `TheoremsExact.lean` — the repaired theorem for the exact conditions (`T6star_exact`).

Build with `lake build` (Lean 4.34.1). Check axioms with `#print axioms`.
