# Anti-Anti-Desire-As-Belief — revision to-do

Report: Analysis, ANALYSIS-2024-521.R2, 6 March 2026. Referee 1 recommends publication with revisions; the AE asks only that you address referee 1's remaining concern.

**Before anything else:** the letter gives two months, i.e. ~6 May 2026. That was 15 weeks ago. Email the editorial office to confirm they'll still take the revision as a revision rather than a new submission.

Line numbers below refer to `aadab.qmd` as it currently stands.

---

## 1. The main issue — decide how to frame the Aunties

The referee's complaint is that pp. 8f. *presuppose* that Auntie E's Value follows from EDT and Auntie C's Value follows from CDT, and he can't see the derivation ("Jeffrey's *Logic of Decision* says nothing about the credence one should give to propositions about goodness"). He offers you an escape route: drop the entailment claim, and say only that each judgement about Peter *harmonizes* with a decision theory and can be extended to a general principle.

You have to pick one, and the choice is real.

- [ ] **Decide: derive, or downgrade.** Note that the referee himself points out what's at stake — if the entailments hold, "we wouldn't need the Peter example," and you could argue directly that both major decision theories are incompatible with Lewis's premises. That's a stronger paper but a different one, and a bigger rewrite than *Analysis* length allows at R3. My read is that the derivation is actually available in about six lines (below), and that supplying it costs less than the downgrade does — but the referee has told you he'll accept the downgrade, and R3 is not the place to raise the stakes.

- [ ] **If you derive:** the missing step in both cases is that **Binary Desirability** plus DAB identifies the valuable worlds with the D-worlds (V(*w*) = 1 iff *w* ∈ D). Given that:
  - Jeffrey's own value formula — which is just **Additivity** — gives V(A) = Σ~*w*~V(*w*)Pr(*w*|A) = Pr(D|A). That *is* Auntie E's Value. So the entailment isn't from *Logic of Decision* alone, as the referee assumes; it's from *Logic of Decision* + Binary Desirability + DAB. Say so explicitly.
  - Lewis's imaging formulation of CDT gives V(A) = Σ~*w*~V(*w*)Pr~A~(*w*) = Pr~A~(D) = C~A~(D). That is Auntie C's Value.
  - The honest caveat, and it's the one worth conceding in the letter: the CDT side needs the extra "imaging never moves left or right" assumption (line 124), which is *not* delivered by CDT. That assumption is doing all the work in Auntie C's verdict, and it's currently stated in one clause with no defence. This is the real gap the referee is circling, and it's worth a paragraph either way.

- [ ] **If you downgrade:** change the framing verbs, not the content. Lines 117 ("Auntie E is an evidential decision theorist. For her, the value ... is given by"), 124 ("Auntie C endorses a version of causal decision theory ... In particular, Auntie's values are given by") and 153 ("this is something that only an adherent of EDT should accept") are the places where entailment is implied. Replace with: here are two intelligible judgements about Peter; the first extends naturally to V(A) = Pr(Å|A), which sits well with EDT; the second to the imaging version, which sits well with CDT.

- [ ] **Either way, add the arithmetic.** The referee names the thing he wants: two judgements "demonstrably incompatible with the conjunction of DAB and Additivity." You have the numbers to show it in four lines and you currently don't:
  - Auntie E: V(A) = Pr(D|A) = 0.8, but Pr(Å) = 0.59. So **Equation** fails; **Additivity** holds (it's what generated her value).
  - Auntie C: V(A) = C~A~(D) = 0.59 = Pr(Å), and V(¬A) = 0.41 = Pr(¬Å). So **Equation** holds exactly, while Σ~*w*~V(*w*)Pr(*w*|A) = 0.8 ≠ 0.59, so **Additivity** fails.
  - That second result is nicer than the paper lets on: given the no-left-right imaging assumption, imaging preserves the Å column marginal, so Auntie C satisfies **Equation** *exactly*, not approximately. Worth stating as the clean dilemma it is. It also makes the Peter example indispensable rather than dispensable — it's what fixes the imaging geometry — which is your answer to the referee's "we wouldn't need the Peter example" aside.

- [ ] **Show that Auntie C's value ranks the two acts.** Line 131 asserts "Auntie C hopes that Peter does *a* iff C(Å) > C(¬Å)" with no working. It's correct, but only once the reader has seen that D is the diagonal of @tbl-credence — that Peter's doing *a* is desirable at ⟨A, Å⟩ and his not doing it is desirable at ⟨¬A, ¬Å⟩. Spell out the two imaged distributions.

- [ ] **Address the third-personal bridge.** This is the referee's worry in its sharpest form and neither of you has quite said it. EDT and CDT are theories of what an agent has reason to *do*. The Aunties aren't choosing; they're hoping about someone else's choice. Nothing in either decision theory tells you how a spectator's hopes should be computed. You gesture at this at line 129 ("It is not measuring the thing an altruistic friend hopes is maximised") and then move on. State the bridge principle you're relying on. If the paper is going to lean on decision theory at all, this is where the load is.

- [ ] **Introduce "DACB" by name.** The referee uses it throughout; the current draft never does. If it was in R1 and got cut, put it back — it gives you a label for the general principle the Peter judgement extends to, which is exactly what the referee's preferred framing needs.

- [ ] **Check the §2/§4 tension.** Line 129 uses the usefulness/desirability distinction to explain why Auntie C's formula differs from Lewis's; §4 argues Lewis isn't entitled to that distinction. Not a contradiction, but a reader hitting §4 may think you've sawn off the branch. One sentence at line 129 flagging that you'll contest Lewis's *use* of the distinction later would fix it.

## 2. Notation — the referee's first complaint, and he's right

Section 1 uses `Pr`, propositions `A`, and `Å`. Section 2 switches without comment to `C`, actions `x`/`X`, and a proposition `D`. Section 3 (line 137) switches back to `Pr` and `Å`. This is one paper.

- [ ] Pick `Pr` throughout (Section 1 sets the convention and Lewis's argument is stated in it).
- [ ] Drop the `x`/`X` action-vs-proposition split. The referee's suggestion is the right one: **Auntie E's Value** as V(A) = Pr(Å|A), **Auntie C's Value** as V(A) = Pr~A~(Å).
- [ ] Explain `D` or eliminate it. Right now line 117 defines D as "the propositions that things are desirable" — a single fixed proposition — and then line 122 evaluates it against *two different* actions, which only works because of the simplifying assumption at line 98 that ¬Å reads as "not-*a* is good". The referee couldn't tell what D was versus Å, and that's a fair reaction. Either state the identity D = (A∧Å) ∨ (¬A∧¬Å) explicitly, or drop D and write everything with Å.
- [ ] Line 131 mixes levels: "she does hope that Peter does A" (A is the proposition, *a* is the act). Same slip at line 122 vs 131.

## 3. Referee's typos

- [ ] Line 84: "contradicts our assumption" → name the premise. **But note:** the referee writes "contradicts *Possible Dependence*", and your premise at line 68 is called **Possible Independence**. The referee is right and the label is wrong — the premise asserts that Pr(Å) ≠ Pr(Å|A), i.e. that Å can *depend* on A. (The old draft had independence as the reductio's absurd *conclusion*; the name looks like a leftover from that framing.) Rename to **Possible Dependence** at lines 68, 72, 86 (×2), 84.
- [ ] Line 88: "a proposition about someone, call him Peter, might do" → "about what someone, call him Peter, might do".
- [ ] Line 98: "and Å that it is deisrable/good" → "and Å that this action is desirable/good".

## 4. Other errors I found

Typos and slips:

- [ ] Line 45: "and its gets to the conclusion" → "and it gets".
- [ ] Line 82: "**Restriced Conditionalisation**" → "Restricted".
- [ ] Line 88: "we are very confidence in Peter's moral judgment" → "confident".
- [ ] Line 96: "Both Aunties E and Auntie C" → "Both Auntie E and Auntie C".
- [ ] Line 98: "the Proposition" → "the proposition".
- [ ] Line 100: "both Auntie's have the same credal distribution" → "both Aunties have".
- [ ] Line 113 (table caption): "Auntie's credence" → "The Aunties' credence" (they share it).
- [ ] Line 117: "and D is the propositions that things are desirable" → "the proposition".
- [ ] Line 124: "In the formula, C~*x*~ be the result of *imaging*" → "let C~*x*~ be the result"; and "on the proposition *x* is performed" → "on the proposition that *x* is performed".
- [ ] Line 139: "If desires to take a pill" → "If one desires to take a pill".
- [ ] Line 141: "this is a kind of desire as beleif" → "belief".
- [ ] Line 145: "once remember what kinds of things worlds are" → "once we remember".
- [ ] Line 145: "belief about *desirabilty*" → "desirability".
- [ ] Line 159: "**Aditivity**" → "**Additivity**".
- [ ] Line 178: "both Auntie's should desire" → "both Aunties should".
- [ ] Line 180: "**Addition** has to fail ... **Addition** entails" → "**Additivity**" (twice).

Quotations and citations to verify against the originals:

- [ ] Line 157: "Should you take that actions?" — almost certainly "that action". Check the whole quote against Lewis 1996, p. 303; the ellipses are heavy and a referee who looks it up should find it faithful.
- [ ] Line 129: "This resembles equation (11) in 'Causal Decision Theory'" — verify the equation number in Lewis 1981, and add the citation `[@Lewis1981bn]` rather than a bare title in quotes.
- [ ] All 16 citation keys resolve against `brian-quarto.bib`. No missing references.

Substantive things a hostile reader could pick at:

- [ ] Line 84: "not all six of these assumptions can be correct, if DAB is true." The conditional is odd — **Equation** *is* the DAB premise, so the six are jointly inconsistent full stop (given Possible Dependence). Given how much trouble the "inconsistent" language caused you at R1, this sentence is worth getting exactly right.
- [ ] Line 124: the claim that "changing the moral facts is a bigger change to the world than changing any descriptive facts" is stipulated in a single clause and carries Auntie C's entire verdict. See §1 above — at minimum it deserves a sentence of motivation, and the footnote about epistemic possibility doesn't supply one.
- [ ] Line 178: the sure-thing argument ("weird to hope he chooses Down conditional on Left, and Down conditional on Right, and unconditionally hope he chooses Up") is stated in one sentence. It's the load-bearing step of §4's generalisation beyond first-personal cases. Give it two.

## 5. Submission mechanics

- [ ] The editorial office wants additions in **bold** and substantial deletions struck through in the revised file. You'll need a Quarto/LaTeX approach for this — probably a `\revadd{}`/`\revdel{}` macro pair in `include-in-header`, or `latexdiff` on `aadab.tex` against the R2 `.tex` (which you still have) and then hand-tidy.
- [ ] Update `date:` (line 5) from "2 May 2025".
- [ ] Check the anonymisation: the header macro says `Anon` (line 33) but the `author:` block still carries your name, affiliation, and ORCID, which will print in the PDF. Either strip it for the submission copy or confirm *Analysis* doesn't re-anonymise at R3.
- [ ] Drop "in progress" from `categories:` when this lands, and update the after-body note (line 38, "Draft for submission.").
- [ ] Write the response letter. Two things to say explicitly: which framing you chose in §1 and why, and — if you downgrade — that you agree with the referee that the entailment claim was doing more work than it could bear.
