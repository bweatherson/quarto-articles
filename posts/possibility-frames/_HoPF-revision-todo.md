# HoPF — revision to-do list

Compiled from the referee report plus a read-through of `HoPF.qmd`. Line numbers refer to the current `.qmd`.

Priority key: **[A]** must fix before resubmission · **[B]** substantive, referee didn't flag · **[C]** structural/framing · **[D]** presentation · **[E]** build · **[F]** citations.

---

## A. Things the referee identified

- [ ] **A1. The RRef++ argument (§1 "Modal Constraints", ll. 190–192) is wrong and has to be rebuilt.** The referee is right on both counts. (a) The necessary-and-sufficient condition for □ᵢA to be refinable is Holliday's **R⇒win** (Prop. 2.30), not RRef++; Holliday's proof of 2.30 uses persistence of A, not refinability, which answers your "I don't quite see how that would work". (b) The stronger claim — that defining Rᵢ from □ᵢ *forces* RRef++ — is false: powerset possibilizations of Kripke frames are R-tight (Facts 2.38 + Lemma 4.34.4) but need not satisfy RRef++ (Fact B.1). Replace the paragraph with: RRef++ is sufficient, R⇒win is necessary and sufficient, and cite 2.30.
- [ ] **A2. Consequence of A1 that needs its own decision — and the answer is already in `new-work/_modal-notes.md`.** The RRef++ paragraph was the *only* independent argument in the paper for RRef++; the persistence/refinability argument was already conceded to be overkill (ll. 182–184). Once it goes you need a different frame condition. `_modal-notes.md` ¶26–32 already makes exactly the referee's point ("Humberstone adds a somewhat stronger condition than **R-Win**, but for reasons Holliday [App. B.1] goes over, this is too strong… it fails in some powerset possibilizations… so it's hard to motivate it") and offers two positive motivations for R-Win instead — the powerset-possibilization argument and the stories-as-sets-of-propositions construction. **The two papers currently take contradictory positions on the central frame condition.** Reconciling them is the single highest-value edit available.
- [ ] **A2a. Good news: the §2 theorem survives the switch to R-Win.** I checked both relations in the §2 frame against R-Win (the biconditional at `_modal-notes.md` l. 6) and both satisfy it, in both directions. Kripke frames satisfy it trivially when ≤ is identity, so ML(K) ⊆ ML(H) survives too. So you can swap the frame condition without touching §2.
- [ ] **A2b. But re-check the ◇Official ⇔ ◇Simple equivalence (l. 176) under R-Win**, since the right-to-left half currently leans on RRef++.
- [ ] **A3. The Harrison-Trainor criticism (l. 280) is incorrect as stated.** Refinability for predicates in your own framework (l. 125) is stated over *objects*, not names, so the "there is no later world where there is some name c for them" argument doesn't get off the ground — and it contradicts your own official condition four pages earlier. Either drop the objection or replace it with the object-level version (see B4, which I think is the argument you actually want).
- [ ] **A4. |f(A,x)| ≤ 1 does not deliver CEM (ll. 338, 343) — fixed by the port. See the §4 section below.**
- [ ] **A5. Give an actual countermodel for Disjunction (l. 403, ll. 405–411).** Still needed, but the port turns this from an open-ended task into a bounded finite-model exercise. See §4 below.
- [ ] **A6. Referee's footnote 2 — no truth clause for `□→` is ever given.** The clause exists in `_modal-notes.md` App. B l. 64. See §4 below.
- [ ] **A7. Typos the referee lists.** `Vbls` → `At` or similar (l. 82); `c_1, \dots` → `c_1, c_2, \dots` (l. 104); `\nmodels_x''` → `\nmodels_{x''}` and `\models_x'` → `\models_{x'}` (l. 192, both occurrences); rewrite the garbled sentence at l. 270; `$\forall\text{-Elimitation}` (l. 274 — misspelled *and* the `$` is never closed, which breaks the math from there on); "In the the possible" (l. 298); `existsx` → `\exists x`.

---

## B. Further substantive problems

- [ ] **B1. ∃ is both primitive and defined.** L. 133 gives `[∃]` its own truth clause; l. 254 says "I introduced the universal quantifier as basic, and simply defined ∃ as ¬∀¬". Pick one. (They do look equivalent given domain monotonicity, but if you keep both you owe the proof.)
- [ ] **B2. The weakening of UpR (l. 184) looks like it has the direction reversed.** You state: if x ≤ x′ and xRy then ∃z ≥ y with x′Rz. Persistence of *□* needs the mirror image — if x ≤ x′ and x′Ry then ∃z ≤ y with xRz — and the condition as you state it is what secures persistence for *◇*. The gloss that follows ("if x′ can access a world where A, then so can x") also points the opposite way from the condition it glosses. Check against Holliday p. 62 and fix whichever is wrong. (Also: "world" → "possibility".)
- [ ] **B3. §1's three basic results (l. 88) are asserted without proof or precise citation.** Persistence, refinability, and classicality for the base language. Either prove them or cite Humberstone/Holliday by proposition number. Same for the parallel claim about ⋁ at l. 100 — it's easy, but it's the one novel bit of the language, so it should be on the page.
- [ ] **B4. The refinability objection to an existence predicate, done properly.** Under your `[Fⁿ]` clause, ⊨ₓ Eo iff ∀y ≥ x ∃z ≥ y: o ∈ V(E,z) — which, with domain monotonicity, means E is true of exactly the objects *guaranteed to enter the domain eventually*, not the objects in D(x). That is the real problem with Harrison-Trainor's proposal and it doesn't depend on names.
- [ ] **B5. But then the demonstrative fix (ll. 284–286) doesn't obviously escape the same problem — and this is the most serious unflagged issue in §3.** `𝐔x` and `Ix@` are still atomic predications, so they're still governed by the ∀∃ clause and by persistence/refinability for predicate extensions. If V(𝐔,·) grows as the domain grows, "one of us" grows too and the proposal collapses back into E; if it doesn't grow, persistence is fine but you need to say why. Show that 𝐔 and I satisfy persistence and refinability, or explain why they're exempt.
- [ ] **B6. Two further problems with `@` as a name for the actual possibility (l. 286).** (i) Persistence for names (l. 119) makes a name's denotation *constant* across refinements, so `@` denotes one fixed possibility rather than "whichever possibility we're evaluating at" — which is exactly the work you need it to do. (ii) `Ix@` requires possibilities to be objects in D(x), i.e. in the range of the first-order quantifiers. Neither is addressed.
- [ ] **B7–B11 have moved to the §4 section below**, since the port changes what needs doing.

**Note:** B1, B4, B5, B6, B13, B14, B15, B16, B17 and B18 are all §3 items and are retired by the cut. B5, B6 and B14 are carried over to X7 as the things a future quantifiers paper would have to settle.
- [ ] **B12. Lewis's Limit-Assumption-free clause is misstated (l. 351).** As written: "A □→ B is true at w if there is some world where A is true such that there is no closer world where A ∧ ¬B is true." Lewis needs an A ∧ **B** world with no closer A ∧ ¬B world. Also "is true if" → "iff", and the vacuous case needs a mention.
- [ ] **B13. The necessitism argument (ll. 290–296) is a strawman by the paper's own lights.** You note at l. 306 that on Williamson's own statement necessitism just *is* step 2, so steps 3–5 are idle and the "possibilities blocks 4→5" response was never going to be interesting. Rather than presenting the argument and then dismantling the framing, reconstruct a version a necessitist would recognise — or cut the numbered argument and lead with the Williamson quotation.
- [ ] **B14. The proof system in §3 is never specified and never shown sound.** The derivation at ll. 258–264 uses =Intro, ∃-Introduction, Necessitation, ∀-Introduction. None of these rules is stated, and none is verified against your semantics. Since the entire necessitism discussion turns on the derivation going through *in the possibilities framework*, this is a real gap. Relatedly, §1 proves classicality only for the propositional fragment (l. 88) — the quantified extension's classicality is assumed, never argued.
- [ ] **B15. The KTB → constant domain claim (l. 266) needs a citation or a proof.** It's standard-ish but the exact form ("any two worlds connected by the ancestral of R must share the same domain") should be sourced (Williamson 2013, ch. 1–2?).
- [ ] **B16. l. 284 says the same thing twice.** "the thing they say by uttering 'Holmes is not one of us' would be true. Plausibly, though this depends what the ontology of fictional characters is, we also say something true by saying 'Holmes is not one of us.'" The second sentence was presumably meant to be about *us*, not Romeo and Juliet. Drafting error.
- [ ] **B17. l. 308 also says the same thing twice.** "some things might not have been, and other things that are might not have been" — the second conjunct should presumably be about things that aren't but might have been.
- [ ] **B18. The actualist-∀ clause at l. 268 is malformed.** "∀x: Φx is true at a point iff Φa is true at g[x/o] for any o in the domain" — `Φa` should be `Φx`, and truth is at a point *relative to* an assignment, not at an assignment.
- [ ] **B19. l. 186: "incomplete" is the wrong word.** The worry isn't that the system is incomplete, it's that the constraint set isn't closed under taking converses.
- [ ] **B20. l. 190: "the sets of consistent sentences" → "maximal consistent sets".** And it's worth flagging, as the referee does in his footnote 1, that your Rᵢ (defined off the satisfaction relation) is not quite Holliday's R-tightness (defined off the box operation on propositions), even though the objection lands against both.

---

## The §2 proof — mostly good news

I worked through the construction and I think **the main result is sound**. The frame does satisfy UpR, RDown and RRef++ (so A1/A2 don't threaten it), (Splitting) is valid on it, and the Kripke argument goes through. But:

- [ ] **B21. The minimality step is doing no work (l. 244).** "Among those s_y^R at which p is true, consider the ones where |s_y| is minimal" — the argument that follows works for *any* right-handed point at which p is true. Either drop it or say what it's for.
- [ ] **B22. L(F) is defined wrongly (l. 198).** "the set of sentences true at all points in all models definable on **some** member of F" — should be *every* member; L(F) is the intersection, not the union.
- [ ] **B23. Nothing in the L/ML notation is relativised to a language.** The whole point of the result is that it holds for the infinitary language and is open for the finitary one, so `L(F)` and `ML(F)` need a language subscript, and the abstract's "some logics definable on Humberstone frames are not definable on Kripke frames" needs the qualifier.
- [ ] **B24. The infinitary language is never defined precisely.** l. 94 says ⋁ "forms a new sentence out of any countable set of sentences not containing ⋁". Give the inductive definition, say whether ⋁-formulas can be embedded under ¬/∧/∨/□ (Splitting requires that they can), and justify both the no-nesting restriction and the countability restriction.
- [ ] **B25. Say that the [⋁] clause collapses to the obvious one on Kripke frames.** The third claim (l. 248) tacitly assumes this.
- [ ] **B26. Say how many modal operators the language has.** §1 (l. 148) says "a plurality"; §2 needs countably many indexed by ℕ plus one more. State it.
- [ ] **B27. Notation slips in the proof (ll. 242–244).** `s_y^R ⊕ ⟨0⟩^R` should be `(s_y ⊕ ⟨0⟩)^R` — ⊕ concatenates sequences, not handed points. "there are right-handed points such that p is true at y" leaves y unbound. And the ◇→ conclusion at the 0-case is missing its parenthesis: `◇→p ∧ ¬◇ᵢ←T` should be `◇→(p ∧ ¬◇ᵢ←T)`.
- [ ] **B28. State whether the result answers Holliday's question or an analogue of it.** Also whether ML(K) ⊆ ML(H) ⊆ ML(FP) still holds in the infinitary language, since the sandwich is what licenses "⊊" at l. 250.
- [ ] **B29. ll. 200–202 repeat themselves.** "at least one of those inclusions is strict, it isn't clear which one" then "at least the first inclusion is strict" two sentences after the same content.

---

## §4 — the port from `new-work`

The material is in three places: `new-work.qmd` ll. 174–191 (R-Win, Holliday's functionality constraint, the `fig-simple-frame` diagram and its two footnotes), `_modal-notes.md` App. A + App. B (the constraint list and the `[□→]` clause), and `_conditionals-notes.md` (the derivations). Yes, this is a big improvement, and it buys more than you may have counted on.

### What the port fixes outright

- [ ] **P1. The CEM constraint, with a better diagnosis than the referee's.** Replace `|f(A,x)| ≤ 1` with the version at `_modal-notes.md` l. 41: *either f(A,x) = ∅, or ∃y: f(A,x) = {z : z ⩾ y}*. The referee's countermodel is then blocked because it violates **fDown** — his f(A,x) = {x} is not upward closed, since y₁, y₂ ⩾ x are A-possibilities outside it. But the sharper point is the one in `_conditionals-notes.md` ¶7, and it should go in the paper: **|f(A,x)| ≤ 1 together with upward closure forces the selected possibility to have no proper refinements — i.e. to be a world.** The old constraint didn't just fail to deliver CEM; it silently collapsed possibilities back into worlds, which destroys the two-spheres treatment the constraint was introduced to support. That's a much better paragraph than a correction.
- [ ] **P2. The missing truth clause.** `_modal-notes.md` l. 64: ⊨ₓ A □→ B iff ∀y ∈ f(A,x): ⊨_y B. Drop it in.
- [ ] **P3. Referee's footnote 2, discharged.** The three frame conditions on f (**Upf**, **fDown**, **fRef+++**) plus the persistence and refinability derivations are already written out at `_conditionals-notes.md` ll. 21–31. Port the verification, don't just assert it.
- [ ] **P4. The two-spheres story gets *better*, not just repaired.** Under the revised CEM, f(*one of them is heavier*, x) is a cone over an incomplete possibility that settles the disjunction without settling either disjunct — which is exactly the verdict you wanted, and now it falls out of the constraint rather than being asserted alongside it.

### Two wins I don't think the current draft notices

- [ ] **P5. Infinite Conjunction comes out valid for free.** With f(A,x) a cone over y₀ and conjunction's clause pointwise, C_i true at y₀ for every i gives ⋀C_i true at y₀. So the principle Lewis has to give up is validated by your models automatically. **But**: the language currently has infinitary *disjunction* only (§1). You'd need to add infinitary conjunction and check persistence/refinability for it — both are easy (refinability follows from refinability of a failing conjunct), but they need stating.
- [ ] **P6. Antecedent Substitution comes out valid for free too — provided f is typed over propositions rather than formulas.** If classically equivalent A and B have the same truth set, then f(⟦A⟧,x) = f(⟦B⟧,x) and the principle is immediate. This makes the typing fix (old B8) load-bearing rather than pedantic: `_modal-notes.md` still writes `f(A,x) ⊆ A` and `x ∈ A`, mixing formulas and sets. Fix it during the port.
- [ ] Together P5 and P6 mean §4 would actually deliver its advertised result: of Fine's three principles, yours validates two and refutes the third. Right now the paper claims that and shows none of it.

### What the port does *not* fix

- [ ] **P7. The Disjunction countermodel (A5) still has to be built** — but it's now a bounded exercise. You need f(A∨B,x) a cone over some y₀ making A∨B true and neither disjunct, with C true at the roots of f(A,x) and f(B,x) but not at y₀. The fiddly part is that **fRef+++** demands a refinement x′ of x with f(A∨B,x′) = the cone over y′, for *every* y′ in f(A∨B,x), so f has to be defined at a fair number of points. Finite, but plan for a diagram.
- [ ] **P8. The f-vs-S_w switch (old B9) is untouched.** ll. 399–411 still argue in terms of a family of similarity relations S_w that the semantics never introduces. If anything the port makes this worse, since the constraints are now stated carefully on f. Either derive S_w from f or drop the S_w talk.
- [ ] **P9. Centering needs strengthening or a proof.** MP/Centering (x ∈ f(A,x) when x ∈ ⟦A⟧) plus the revised CEM only forces the cone's root y₀ to be *some* coarsening of x, not x itself — so f(A,x) can contain possibilities that don't refine x. Either strengthen to "if x ∈ ⟦A⟧ then f(A,x) = {z : z ⩾ x}" or show the other constraints already force it.

### Care needed in the port

- [ ] **P10. The two documents use different names for the same things, and one different thing under a similar name.** HoPF has MP/ID/CEM/AB (three quoted from Bacon); `_modal-notes.md` renames them Centering/Truth/CEM/Nearness. Keep Bacon's names or flag the change, and re-check the existing footnote about Bacon not endorsing AB in this form.
- [ ] **P11. `fRef+++` is stated two different ways.** `_conditionals-notes.md` l. 29 gives the weak form (y stays in f(A,x″) for all x″ ⩾ x′); `_modal-notes.md` l. 59 gives the strong form (f(A,x′) is *exactly* the cone over y′). The strong form is what CEM needs. Use it, and don't let the weak form get ported by accident.
- [ ] **P12. `fRef+++` is named after a condition the paper may be abandoning.** If A2 goes through and HoPF switches to R-Win, "fRef+++" is named for the wrong parent. Rename in step with §1.
- [ ] **P13. Check the transcription of Holliday's functionality constraint** (`new-work.qmd` l. 187, cited to Holliday p. 229). As written, `∀z (x' \geq z → …)` has the inequality pointing the opposite way from every other `∃x′ ⩾ x ∀z ⩾ x′` pattern in both documents, and R doesn't appear anywhere in the consequent — which can't be right for a frame condition on R. The `\geq`/`\geqslant` mix in that one line suggests it was typed fast. Verify before porting.
- [ ] **P14. Port Standefer's terminological caution too.** `new-work.qmd` l. 92 fn already notes that calling these logics "functional" makes sense for worlds but is misleading for possibility frames. That caveat matters more in HoPF, where the whole point is that CEM doesn't require a unique nearest anything.
- [ ] **P15. Promote `new-work.qmd`'s l. 191 footnote to text.** "A similar construction shows that we can add a counterfactual that validates Conditional Excluded Middle without assuming that for each possibility x and possibly true proposition Φ, there is a unique nearest possibility where Φ is true" — that is the thesis of the whole port, and it is currently a footnote to a figure.
- [ ] **P16. Decide the division of labour between the two papers, explicitly.** `new-work.qmd` l. 129 fn defers counterfactuals "to another day", and l. 164 already cites `@WeathersonHoPF` as the paper that "applies possibility frame semantics to a puzzle about counterfactuals". If HoPF absorbs the conditional semantics, both of those need rewriting, and `new-work` should cite HoPF for the machinery rather than restating it.
- [ ] **P17. The `fig-simple-frame` tikz diagram ports directly** and would do a lot of work in HoPF §4 — it's the clearest available illustration of "functional without being a function". Note it's an R-diagram, not an f-diagram, so it needs relabelling.

## Cutting §3 — consequences and salvage

Decision taken: cut *Quantifiers and Necessitism*. Doing so retires B1, B4, B5, B6, B13, B14, B15, B16, B17, B18, D14, F5 and F7, and answers the referee's substantive point #2. What follows is what the cut *doesn't* do by itself.

- [x] **X1. Decided: keep §1's Quantifiers subsection and give it a job in §4.** See the Q-items below.
- [ ] **X3. Salvage the Romeo/Juliet argument (ll. 272–274) into §1.** If ∀ ranges only over the possibility's own domain then `∀x(x = Romeo ∨ x = Juliet)` is true at ⟨*Romeo loves Juliet*⟩, and ∀-Elim gives Mercutio = Romeo ∨ Mercutio = Juliet. That's the actual motivation for the possibilist clause and it belongs beside the clause, not three sections later. (Fix the unclosed `$` and "Elimitation" on the way.)
- [ ] **X4. Salvage the diagonal-proposition observation (l. 288) into §4.** "We cannot find a proposition for arbitrary sets of possibilities" is now load-bearing: it's why f must be typed over propositions rather than formulas, which is what makes Antecedent Substitution fall out (P6). Two sentences, relocated.
- [ ] **X5. Rewrite the abstract and the intro's self-description.** Post-cut the paper is: possibility semantics exposition → one theorem about infinitary logics → conditionals. The abstract's "applications, including to conditionals, vagueness, and fiction" should become just conditionals, or vagueness and fiction should be explicitly flagged as gestures in the conclusion. Same for l. 60.
- [ ] **X6. The cut aligns HoPF with how `new-work.qmd` already cites it.** l. 164 there describes HoPF as the paper that "applies possibility frame semantics to a puzzle about counterfactuals" — which post-cut is exactly right. No change needed there, but it's a good sign the cut is the natural shape.
- [ ] **X7. Park §3 somewhere with a note on what it would need.** The honest version is a separate paper on quantified possibility semantics, with Harrison-Trainor's actualist quantifiers as the foil and second-order quantification as the actual target — which is what §3 twice concedes it needs and doesn't have. B5 (does the 𝐔/`I@` move escape the refinability problem?), B6 (Persistence for Names makes `@` rigid, which is the wrong behaviour for an indexical) and B14 (the proof system is never stated or shown sound) are the three things that would have to be settled first.
- [ ] **X8. Response letter: say the cut is a cut.** The referee liked the paper and didn't ask for this. Worth one paragraph noting that his point #2 was well taken and that rather than patch the argument you concluded the section was promising more than the paper's machinery could deliver.

## Q. Quantified counterfactuals (the new §4 subsection)

This is what keeps §1's first-order material alive after the §3 cut. It's also genuinely new: Humberstone doesn't do it, Harrison-Trainor has no conditionals, Bacon and Fine aren't in a possibility framework.

- [ ] **Q1. State the clause with an assignment.** ⊨ₓ^g A □→ B iff ∀y ∈ f(⟦A⟧^g, x): ⊨_y^g B. Note that when A has free variables ⟦A⟧ is g-relative, so f's first argument is a g-relative proposition. Say so explicitly.
- [ ] **Q2. The headline question: do `A □→ ∀xφ(x)` and `∀x (A □→ φ(x))` come apart?** This is the l. 349 footnote, promoted. Working it through under the revised CEM:
  - `A □→ ∀xφ` at x reduces, by persistence, to `∀xφ` at y₀, the root of f(A,x) — i.e. ∀z ⩾ y₀ ∀o ∈ D(z): φ(o) at z.
  - `∀x (A □→ φ(x))` at x is ∀y ⩾ x ∀o ∈ D(y): φ(o) at the root of f(A,y).
  These are not obviously the same, because the second takes f afresh at each refinement of x, and **Upf** only tells you the roots climb (y ⩾ x ⟹ root of f(A,y) ⩾ y₀). Work out whether they coincide, and if not, which direction fails.
- [ ] **Q3. Why this is the interesting case, and worth saying in the paper.** Infinite Conjunction is valid for free (P5) because f picks out a single cone and conjunction is evaluated *pointwise* at the root. But the universal quantifier's clause looks *forward* along refinements rather than evaluating pointwise. So ∀ is not simply an infinite conjunction here, and the Limit Assumption phenomenon can survive in the quantified case even though it's been eliminated in the infinitary-conjunction case. If that's right it's a nice result and the natural payoff of keeping §1's quantifiers.
- [ ] **Q4. Settle P9 first — Q2 depends on it.** If the root y₀ of f(A,x) need not refine x, then D(y₀) need not include D(x), and the two sides of Q2 are quantifying over different domains for reasons that have nothing to do with the Limit Assumption. Pin down Centering before doing the ∀ calculation or the result will be an artefact.
- [ ] **Q5. Restate Bernadete's case with ∃ instead of infinitary disjunction.** "He would be killed by some god" is naturally existential. Worth checking whether the quantified version of the puzzle behaves the same way as the infinitary one on your semantics — if it does, that's confirmation; if it doesn't, that's the more interesting finding.
- [ ] **Q6. Caution: this may partly re-import the problem §3 was cut for.** "If A, then all the actual F's would be G" needs some way of restricting a possibilist quantifier to a possibility — which is exactly what §3's 𝐔 / `Ix@` machinery was for, and what B5/B6 say doesn't work yet. Either keep the quantified-counterfactual discussion to unrestricted ∀ (where the issue doesn't arise), or accept that a version of the §3 problem comes back. Decide this *before* drafting, not after.

## O. The finitary result in `blog/possibility-frames/open-question.qmd`

**I think it works.** I checked the frame conditions and the validity argument line by line and found no gap. If it holds up, it settles Holliday's question outright, and it makes §2's infinitary theorem a corollary rather than the paper's main result. That is a substantially better paper, and it changes what the response letter says.

What I verified:

- All five relations (R_∀, R_→, R_←, R_-, R_⊊) satisfy **UpR**, **RDown** and **RRef++**. Your proofs are right; the R_→ **UpR** argument is more roundabout than it needs to be (see O4).
- The frame also satisfies **R-Win**, in both directions, for all five relations — so this survives the A2 switch. The R_← case is the only one that takes any work, and it goes through because a refinement of the target can always branch away from `[x]`.
- The five-step calculation of where α is true is correct, including that α is false at every string (R_- relates only codes) and that ¬α is therefore true at every string.
- ¬◇_→α at x₁ and at *all* refinements of x₁ — I checked the four sub-cases (`[y]` a proper initial segment of x, `[y] = x`, `[y] = x₁`, `[y]` strictly between x₁ and z, and z ⊏ `[y]`). All fail for the right reason: any candidate w either has a p-true proper initial segment or *is* one, contradicting x's initial-point status.
- "If p is true at some string, it is true at some initial point" — fine, and it depends on strings being *finite*. Worth one clause in the text, since it's the only place finiteness is doing work.
- The Kripke half is correct. Resetting V(p) to a singleton doesn't disturb the antecedent, and the two conjuncts of the consequent then demand ◇_→α and ¬◇_→α at the same world.

Things to fix before it goes in the paper:

- [ ] **O1. The bullets at ll. 92–96 say "if" where the proof needs "iff".** The x₁ argument uses the right-to-left direction of bullet 5 essentially. Make them biconditionals.
- [ ] **O2. l. 100 is missing its predicate.** "hence both p ∧ ◇_→α and p ∧ ¬◇_→α" — are true somewhere, presumably.
- [ ] **O3. Say explicitly that α and (Split) are finitary.** That's the entire point relative to HoPF §2, and the blog never says it, because in blog context it didn't need to.
- [ ] **O4. Tighten the R_→ UpR proof (l. 108).** "Imagine working through all the coarsenings sequentially" can be one line: if `[y]` is an initial segment of x′ and x is an initial segment of x′, then x and `[y]` are both initial segments of x′ and hence comparable.
- [ ] **O5. Note that admissible valuations are constrained.** Refinability rules out valuations like "all strings of length ⩾ 1" (the empty string then has no p-free branch). Doesn't affect the proof — you only ever need *some* admissible V — but a referee will want to see you've noticed.
- [ ] **O6. Verify the problem number.** The blog says **Problem 8.13**; HoPF l. 198 says "§8.2 raises an interesting question". Both may be right, but they should agree in print. Holliday's Remark 2.2 / fn 2 states the question directly — "It is not known (at least to this author) whether Humberstone's original frames for possibility semantics are more general than Kripke frames" — which is a better thing to quote than a section reference.
- [ ] **O7. Check pagination.** The arXiv version has §2.5 on p. 32 and App. B.1 on p. 142; the AJL version runs pp. 44–288. HoPF's page cites (62, 95, 271–2) are presumably AJL, but you're now citing across a blog post, a paper, and a referee report that all use different anchors. This is why F2 matters.
- [ ] **O8. Nobody appears to have published a solution.** I searched; nothing since the blog post went up in June. Worth a fresher check before submitting, but as of now it looks unclaimed.

Structural consequences if it goes in:

- [ ] **O9. §2 gets rewritten around the finitary result**, with the infinitary theorem demoted to a remark or dropped. The abstract's claim becomes "answers a question of Holliday's", which is a much stronger and much more checkable claim than the current one.
- [ ] **O10. This orphans §1's infinitary-disjunction subsection**, exactly as the §3 cut threatened to orphan the quantifiers. **But P5 rescues it**: §4 needs infinitary conjunction for Infinite Conjunction. So the infinitary material stops being the engine of the theorem and becomes part of the conditionals story — which is where Fine's puzzle actually needs it. Move it, don't cut it.
- [ ] **O11. Decide: does the result go in HoPF or stand alone?** It's clean and self-contained enough to be its own note. But if it stands alone, HoPF is left with no live technical contribution, since its current one is superseded. I'd put it in HoPF.
- [ ] **O12. Re-check the whole thing once more before it's load-bearing.** I've gone through it carefully and believe it, but a result that settles a published open question deserves a second reader who isn't me — and ideally Holliday himself.

## C. Structural / framing

- [ ] **C1. Decide what the paper is.** The referee read it as an excellent *introduction* with a nice result attached. As it stands it's three papers: an exposition of possibility semantics, one novel theorem, and two speculative applications that (per section B) contain errors and IOUs. Options: split; or demote §§3–4 to explicitly labelled sketches; or do the work in B1–B20.
- [ ] **C2. The abstract oversells.** It promises "proves some results" (there is one) and applications "to conditionals, vagueness, and fiction". Vagueness gets one clause in the conclusion; fiction gets a paragraph. Align the abstract with the contents, or write the missing sections.
- [ ] **C3. The intro's self-description doesn't match the paper.** l. 60 says the paper will "make some notes about its logic, and end with a survey of its possible applications". §§3–4 are sustained arguments, not a survey.
- [ ] **C4. Count the IOUs.** Second-order quantification is deferred at l. 302 *and* l. 312; higher-order at l. 345; the Disjunction-rarity claim has no proof at l. 411; vagueness and fiction are both deferred in the conclusion. That's six unpaid debts in a paper of this length, and two of them (the second-order ones) are conceded to be decisive against the section's own conclusion.
- [ ] **C5. No proof system or completeness result anywhere.** Fine for §2, which is about frame-determined logics, but §3 needs one (B14) and a reader will expect at least a remark on what's known (Humberstone 1981, Harrison-Trainor 2019, Holliday).

---

## D. Presentation and prose

- [ ] **D1. l. 88: "refinement becomes the claim that…" → "refinability".**
- [ ] **D2. l. 88: "the sequent Γ entails A" is garbled.** Either a sequent or an entailment claim, not both.
- [ ] **D3. l. 107: "V assigns to each name c_i and each x either a designated element … or is undefined at x"** — non-parallel; "either assigns … or is undefined".
- [ ] **D4. l. 125: Refinability for predicate extensions doesn't say which objects range over.** If o ∉ D(x) the antecedent is satisfied trivially; say whether the condition is restricted to o ∈ D(x).
- [ ] **D5. Notation inconsistency: `\wp(W)` (l. 74) vs `\mathcal{P}(W)` (l. 329)** — and `\mathcal{P}` is already the set of propositional variables (l. 72). Three-way collision.
- [ ] **D6. `[◇ᵢ]~Official~` markdown subscripts in prose vs `_{\text{Official}}` in the display (ll. 169–174).** Pick one. Also the punctuation at the ends of those two lines is swapped (`.` then `;`).
- [ ] **D7. l. 159 uses markdown `*y*` where math `$y$` is used everywhere else.**
- [ ] **D8. Comma splices throughout.** ll. 192, 200, 202, 411 at least.
- [ ] **D9. l. 280: "A special predicate E is satisfied only by…" → "A special predicate E that is satisfied…".**
- [ ] **D10. l. 148 footnote: give Humberstone's original names for the three conditions**, since readers coming from *The Connectives* will need them.
- [ ] **D11. ll. 369–370: explain the 2k.** Why God₂ₖ rather than God_{k+1}? And note that (@latergods) is trivially true because God_k is among God₁…God₂ₖ — readers will stumble there.
- [ ] **D12. Mixed straight and curly apostrophes** (ll. 274, 276 have curly; elsewhere straight).
- [ ] **D13. Inconsistent first-name-plus-citation style.** "Jeremy @Goodmanms", "Max @Black1952a", "Wesley @Holliday2025", "Brian @Embry2014" vs bare "@Lewis1973a", "@Fine2023", "@Humberstone2011". Pick a rule.
- [ ] **D14. l. 310: `$\exists x (x = \textit{Brian})$`** — names were introduced as c₁, c₂, …; italicised English names appear here and at l. 274 (*Romeo*, *Juliet*). Fine if flagged, but flag it.

---

## E. Quarto / build

- [ ] **E1. `\ref{Splitting}` and `\textsc{Splitting}` render literally in the HTML.** I confirmed this in `_site/posts/possibility-frames/HoPF.html` — five occurrences of the raw `ref{Splitting}` string. Convert the `equation`/`\tag`/`\label`/`\ref` machinery to Quarto's `$$…$$ {#eq-splitting}` + `@eq-splitting`.
- [ ] **E2. The unclosed `$` at l. 274** breaks math rendering from that point in the paragraph. (Also listed as A7.)
- [ ] **E3. `Let's introduce a new name @ for the actual possibility` (l. 286)** — a bare `@` in Quarto prose is a citation trigger. Wrap it: `` `@` `` or `$@$`.
- [ ] **E4. The draft date is hardcoded in two places** (`include-after-body` and `\cehead`, ll. 46 and 55) and disagrees with the `date:` field (l. 5: March 1 vs Feb 28). Generate it, or at least sync it.
- [ ] **E5. Absolute bibliography path** (l. 23) — breaks on any other machine, and for co-authors/editors. Use a relative path.
- [ ] **E6. Check `\DeclareSymbolFont{symbolsC}{U}{txsyc}{m}{n}` under xelatex** (l. 56) — txfonts symbol fonts aren't always available; if the `□→` glyph silently falls back you'll want to know.
- [ ] **E7. The `align*` proof display at ll. 258–264** uses `&&` alignment with line numbers in math mode; it will set badly in both formats. Consider a table or a proper proof environment.
- [ ] **E8. Stray `\\` on the single-line `align*` at l. 165.**
- [ ] **E9. There is a hand-maintained `HoPF.tex` next to the `.qmd`.** Make sure it isn't a stale second source of truth.
- [x] **E10. Notes files need a leading underscore** or Quarto compiles them into the directory-wide page. This file is now `_HoPF-revision-todo.md`. (Applies to anything else dropped in these folders.)

---

## F. Citations and bibliography

- [ ] **F1. "Bernadete" is misspelled — it's José *Benardete*.** Wrong in the text (ll. 345, 411) and in the `.bib` (key `Bernadete1964`, author field `Jose Bernadete`). Also add the accent on *José*, and drop the redundant `booktitle` field duplicating `title`.
- [ ] **F2. Normalise the Holliday citations.** You cite by page (271–2, 62, 95) and by section (§8.2, §2.5) in the same paper. The referee cites by numbered result (Prop. 2.30, Fact 2.38, Def. 4.32.1, Lemma 4.34.4, Fact B.1). Since it's a 245-page article, numbered results are far more useful than page numbers — and it lets you check that [62] and [§8.2] really are pointing where you think.
- [ ] **F3. l. 60 mentions "From Worlds to Possibilities" and *The Connectives* §6.44 with no citations attached.** Add @Humberstone1981a and @Humberstone2011 at first mention.
- [ ] **F4. Check @Humberstone2011 [900] for "refinability"** and the other *Connectives* page cites (1008–13, 1011, 1014–5, 1015, 1016, 1016–22, 1025–6) — that's a lot of precise page references to verify.
- [ ] **F5. @Davies1980 is Davies *and Humberstone*.** Worth naming Humberstone in the text at l. 288, given he's the paper's protagonist.
- [ ] **F6. @Goodmanms is a 2018 manuscript** ("Consequences of Conditional Excluded Middle"). Check whether it's been published in the intervening years.
- [ ] **F7. `Williamson2013book` has no `year` field**, only `date = {2013-03}`. Check it renders.
- [ ] **F8. `CarianiGoldstein2020` has a malformed DOI** (`doi.org/10.1111/...` rather than `10.1111/...`).
- [ ] **F9. The Conan Doyle citation is to a 1995 Project Gutenberg file for an 1887 text.** Fine, but consider giving the original date.

---

## Suggested order of work

1. **O12 first, before anything else is built on it.** Get the finitary proof checked by someone other than me. Everything below reshuffles depending on whether it holds.
2. **A1/A2.** Reconcile §1's frame condition with `_modal-notes.md`. Fixes the referee's main complaint and determines what §4's f-constraints get called. Both the §2 frame and the open-question frame satisfy R-Win, so nothing downstream breaks.
3. **O9–O11.** Rebuild §2 around the finitary result, move the infinitary material to §4.
4. **The port, P1–P6.** Mostly transcription. Closes A4, A6, the referee's fn 2, and old B10/B11, and turns §4 from a section that asserts a trilemma resolution into one that demonstrates it.
5. **P7–P9**, then **Q1–Q6.** P7 (the Disjunction countermodel) and Q2 are the only genuinely new work in the paper. Settle P9 before Q2.
6. **The §3 cut, X3–X8.** Do the salvage before deleting anything.
7. B21–B29 (§2 cleanup) — check which survive the O9 rewrite. D/E/F are mechanical; the cut retires several, so do it first.

**Resulting shape:** possibility semantics, propositional through first-order → an answer to Holliday's question, finitarily → conditionals, on the ported selection-function semantics, with infinitary conjunction and quantifiers both earning their keep. Three referee points answered by the port, one by the R-Win switch, one by the cut — and a stronger central theorem than the version he reviewed.
