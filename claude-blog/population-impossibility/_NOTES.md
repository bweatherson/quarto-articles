In-house notes (not for the website).

- Three cold-read screenings: EVALUATE, EVALUATE, EVALUATE (reports v1–v3 in this folder). Each round's critical issues were addressed in the next version; v3's issues (baseline-capacity variant, Compensation/Prop 2/Cor 3 in Lean, Thornley quote verbatim, T5 premises, VRA* objection from the critic's side, book-manuscript hedge) are addressed in the current qmd but have not had a fourth cold read.
- Lean: `cd ArrheniusSix && lake build` (needs elan/Lean 4.34.1; core only). No sorry; axioms propext/Classical.choice/Quot.sound.
- potential_search.py: the LP search of §5 (needs scipy). _numerical-check.py: brute-force check of V against the five conditions.
- The qmd uses only standard Quarto; _test-build-pandoc.pdf is a pandoc/xelatex build with section refs replaced by numbers, for layout checking.
- Carlson 2022 read in full on 2026-10-03 (notes in claude-blog/_notes/carlson2022-notes.md): his escape is non-Archimedean totalism (lexical welfare), he does not question the five conditions, and he explicitly grants the theorem under A-discreteness. §1 and §4 corrected accordingly after the v3 screening.
- Not verified: Arrhenius 2003 and 2009 page ranges (Uppsala volumes, not in Crossref); whether the current book manuscript restates WQA.

## Arrhenius 2026 chapter (added 2026-10-03)

Arrhenius, "Population Ethics: A Challenge to the Project of Normative Ethics?", in Copp, Rosati & Rulli (eds), *Oxford Handbook of Normative Ethics*, OUP 2026, pp. 617–632, doi 10.1093/9780197510926.003.0042 (online 3 Feb 2026). Read via Chrome through the UM proxy.

- §2 restates the five-condition theorem. WQA is given in the ORIGINAL quantifier order ("For any population X, there is a perfectly equal population with very high positive welfare, and a very negative welfare level, and a number of lives at this level, such that ..."). So the latest published statement is the unrepaired one; neither Thomas's gap nor Thornley's WQA* is mentioned.
- Informal conditions are phrased with "better than"; fn 10 says the exact statements (Arrhenius 2000b, 2011 p. 2, forthcoming) use "at least as good as" and are "logically slightly weaker".
- Consequence for the paper: §1 hedge about the book replaced with the fact of the 2026 restatement; footnote after Theorem 1 notes V also satisfies the strict ("better than") forms — NE witness must be raised to 2 (ΔT = 2x−3−2y ≥ 1); checked numerically (30k trials, 0 failures), NOT Lean-verified; footnote says so.
- Chapter also cites Cowie 2022 (Noûs) on error theory; not used.

## Thomas 2018 read in full (2026-10-03)

- §§1–3 and fn 4 as already used. §4 contains a "toy model" (p. 15): integer levels, sufficiency level S, rank by #(very good) − #(very bad), ties by total. Resembles Qizilbash 2005, Knapp 2007, Parfit 2016 (his fn 35). Purpose: show QC and NE fail only at the threshold, so vagueness of S makes the failures borderline.
- Numerically checked (S=5): his model satisfies ED, GNEP, WNS, WQA* and rejects RC; fails NE at both thresholds (x−1 = −S−1 and x = S+1 with y ∈ [−S, S−2]).
- Capacity view = Thomas's model with (i) misery weighted by welfare, threshold at 0, and (ii) first layer capped at 0. The cap is what removes the NE violation and what makes V accept RC. This is a resemblance a referee would spot; now stated in §3 (new paragraph before Theorem 1) and echoed at the end of §5. Honest statement: V was found by the LP search, resemblance noticed afterwards.
- Bib: Knapp2007 (doi 10.5840/jpr20073243), Qizilbash2005 (doi 10.1017/S0266267104000410) added, Crossref-checked. 33 entries.
- Nothing in §4–5 on vagueness bears on the paper's claims otherwise; Thomas's vagueness strategy is a different response (make violations borderline) from V's (no violations).
