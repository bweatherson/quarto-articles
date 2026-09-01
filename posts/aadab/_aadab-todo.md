# Anti-Anti-Desire-As-Belief — R3 to-do

Report: Analysis, ANALYSIS-2024-521.R2, 6 March 2026. Referee 1 recommends publication with revisions; the AE asks only that you address referee 1's remaining concern.

**Still the first thing:** the letter gave two months, i.e. ~6 May 2026. Email the editorial office to confirm they'll take this as a revision rather than a new submission.

**Decision recorded (1 Sep 2026): the downgrade route.** Each Auntie's judgement about Peter *harmonizes* with a decision theory and extends naturally to a general principle; no claim that it *follows from* the decision theory. The referee has said explicitly he'll accept this.

Working file: `aadab-R3.qmd` (`draft: true`, so it renders in the project but stays out of listings and the sitemap). Line numbers below refer to that file.

## Revision markup

The editorial office wants additions in **bold** and substantial deletions struck through. `_revision-marks.lua` (wired into the YAML) handles both PDF and HTML:

- inline: `[new words]{.add}` and `[cut words]{.del}`
- whole paragraphs: `::: {.add}` … `:::` (likewise `.del`)

Constraints: a `.del` can't cross a paragraph break in the PDF, so strike multi-paragraph deletions paragraph by paragraph; keep display math and footnotes outside `.del`; math inside an added *block* prints unbolded (the surrounding bold text still marks it as new).

Mark everything in "The rewrite" below. The typo and notation fixes were made silently — say so in the response letter.

## Done (silently, 1 Sep 2026)

- All the referee's typos and the ~18 others from the old list.
- **Possible Independence** renamed **Possible Dependence** throughout (the referee was right that the old label had it backwards); the reductio's last line now names the premise it contradicts.
- Notation unified along the referee's suggested lines: `Pr` throughout, the *x*/X action–proposition split gone, `D` eliminated from §2. **Auntie E's Value** is now V(A) = Pr(Å | A) (line 124); **Auntie C's Value** is V(A) = Pr~A~(Å) (line 131). The *a*/A level slips at the old lines 122/131 fixed.
- `[@Lewis1981bn]` added at line 133; equation number still unverified (TODO comment sits in the text).
- Mechanics: date updated; author block commented out (title page renders anonymous — checked); PDF `output-file` renamed so it can't clobber the R2 PDF on a site render.

## The rewrite — all of it in .add/.del markup

- [ ] **Line 121 — Auntie E's framing.** "For her, the value of an arbitrary descriptive proposition A is given by" implies the value function comes from EDT. Downgrade: hers is one intelligible judgement about Peter; it extends naturally to V(A) = Pr(Å | A); and that principle sits well with (without following from) EDT.

- [ ] **Line 128 — Auntie C's framing.** Same move for the imaging formula. Two extra jobs in this paragraph: (a) the "changing the moral facts is a bigger change than changing any descriptive facts" assumption is one clause carrying Auntie C's entire verdict, and it is *not* delivered by CDT — it deserves a sentence or two of motivation even on the downgrade route, since it's the gap the referee was circling; (b) the footnote about epistemic possibility doesn't supply that motivation.

- [ ] **Line 157 — "this is something that only an adherent of EDT should accept."** The third entailment-flavoured spot. Reframe as harmony, not commitment.

- [ ] **Add the arithmetic.** The referee named what he wants: two judgements "demonstrably incompatible with the conjunction of DAB and Additivity." Four lines:
  - Auntie E: V(A) = Pr(Å | A) = 0.8, but Pr(Å) = 0.59. **Equation** fails; **Additivity** holds (it's what generated her value).
  - Auntie C: V(A) = Pr~A~(Å) = 0.59 = Pr(Å), and V(¬A) = 0.41 = Pr(¬Å). **Equation** holds *exactly* — given no-left-right imaging, imaging preserves the Å-column marginal — while Σ~*w*~V(*w*)Pr(*w* | A) = 0.8 ≠ 0.59, so **Additivity** fails.
  - State it as the clean dilemma it is. It also makes the Peter example indispensable rather than dispensable (it's what fixes the imaging geometry) — which is your answer to the referee's "we wouldn't need the Peter example" aside.

- [ ] **Line 135 — show the working.** "Auntie C hopes that Peter does *a* iff Pr(Å) > Pr(¬Å)" is asserted with no derivation. It only becomes visible once the reader sees that the desirable cells are the diagonal of @tbl-credence — doing *a* is desirable at ⟨A, Å⟩, not doing it at ⟨¬A, ¬Å⟩. Spell out the two imaged distributions.

- [ ] **The third-personal bridge.** EDT and CDT are theories of what an agent has reason to *do*; the Aunties aren't choosing, they're hoping about someone else's choice. Nothing in either theory computes a spectator's hopes. Line 133 gestures at this ("It is not measuring the thing an altruistic friend hopes is maximised") and moves on — state the bridge principle you're relying on. This is the referee's worry in its sharpest form, and the downgrade framing makes it easier: you need only that the extended principles are *intelligible* ways for a hoper to value, not that decision theory delivers them.

- [ ] **Introduce "DACB" by name.** The referee uses it throughout; the draft never does. It's the natural label for the general principle each Peter judgement extends to — exactly what the downgrade framing needs.

- [ ] **Line 133 — two problems in one sentence.** First, the §2/§4 tension: this line leans on the usefulness/desirability distinction, and §4 argues Lewis isn't entitled to it; add one sentence flagging that you'll contest Lewis's *use* of the distinction later. Second, a knock-on from the notation change: "after the first character, it just is the special case of that equation" was written when the formula read V(*x*) = C~*x*~(D), which did look like Lewis's equation after one character; Pr~A~(Å) doesn't. Rewrite the comparison.

- [ ] **Line 88 — "not all six of these assumptions can be correct, if DAB is true."** The conditional is off: **Equation** *is* the DAB premise, so the six are jointly inconsistent full stop (given **Possible Dependence**). Given the trouble the "inconsistent" language caused at R1, get this sentence exactly right.

- [ ] **Line 182 — the sure-thing argument gets two sentences,** not one. It's the load-bearing step of §4's generalisation beyond first-personal cases.

## Verify against the originals

- [ ] Line 161: "Should you take that actions?" — almost certainly "that action". Check the whole heavily-elided quote against Lewis 1996, p. 303; a referee who looks it up should find it faithful.
- [ ] Line 167: check the quote against Lewis 1988, p. 323.
- [ ] Line 133: confirm the equation number (11) in Lewis 1981, then delete the TODO comment.

## Submission mechanics

- [ ] Email the editorial office about the deadline (see top).
- [ ] Response letter: say which framing you chose and why; concede that the entailment claim was doing more work than it could bear (the referee has effectively offered you this concession — take it); note that the notation was overhauled along the lines of his first complaint and that typos were fixed silently rather than marked.
- [ ] Line 42: decide whether "Draft for submission" is still the right after-body note for the marked-up copy.
- [ ] Confirm *Analysis* needs nothing further for anonymity at R3 (the title page is currently anonymous).

## When it lands — merging back into aadab.qmd

- Merge the R3 body into `aadab.qmd` *minus* the markup: grep for `{.add}`, `{.del}`, and `::: {.add` / `::: {.del`.
- In `aadab.qmd`: update `date:`, drop "in progress" from `categories:`, change the after-body note.
- The R3-only YAML (`draft: true`, `filters:`, the ulem line, the R3 `output-file`) doesn't come across; the author block stays as it is in `aadab.qmd`.
- Delete `aadab-R3.qmd`, `aadab-R3.tex`, `_revision-marks.lua`, and the rendered R3 pages in `_site`, or the draft lingers unlinked on the public site.
- `_to_delete/` in this folder is leftover session debris — safe to delete any time.
