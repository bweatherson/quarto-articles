In-house notes (not for the website).

- Three cold-read screenings: EVALUATE, EVALUATE, EVALUATE (reports v1–v3 in this folder). Each round's critical issues were addressed in the next version; v3's issues (baseline-capacity variant, Compensation/Prop 2/Cor 3 in Lean, Thornley quote verbatim, T5 premises, VRA* objection from the critic's side, book-manuscript hedge) are addressed in the current qmd but have not had a fourth cold read.
- Lean: `cd ArrheniusSix && lake build` (needs elan/Lean 4.34.1; core only). No sorry; axioms propext/Classical.choice/Quot.sound.
- potential_search.py: the LP search of §5 (needs scipy). _numerical-check.py: brute-force check of V against the five conditions.
- The qmd uses only standard Quarto; _test-build-pandoc.pdf is a pandoc/xelatex build with section refs replaced by numbers, for layout checking.
- Not verified: Arrhenius 2003 and 2009 page ranges (Uppsala volumes, not in Crossref); whether the current book manuscript restates WQA.
