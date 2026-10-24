# Advisor report v1: reply to Blumberg & Holguín, "Fictional Reality"

Read: all briefing files; B&H in full; Williams & Woodward (W&W) MS §§4–6. Closed access: Khoo 2026; Lee 2024.

---

## 1. Verdict: **(B) PROMISING**, but not as the memo stands

Two of the four parts fail as stated: the revelation dilemma (part 3) and the reconciliation (part 4).

The core (part 1) is the predicted reply: W&W's evidentialism made semantic. On its own it is (C).

What justifies drafting:
- **Absorption (part 2).** It does more than the memo claims.
- **The sequel argument (§2.3).** A repaired part 3, which turns B&H's own machinery and method against them.

**When to stop.** Downgrade to (C) and stop if either of these happens:
- the sequel argument proves to be in print;
- B&H's path-dependent repair proves cheap.

## 2. Soundness

### 2.1 Story-relative semantics

The semantics delivers the table and (28), but only with three specifics.

**(a) The shift must be pointwise and world-relative.**
- Define s⊕f = ⋃_{w∈s} Img(w, P-Fic_{f,w}), weighted by in-story chance or typicality.
- If the state is revised by the actual P-Fic, a non-reader "knows" Holmes lives on Baker Street.

**(b) The semantics must be bilateral.** Support and rejection must both pass through f:
- s ⊨⁺ f:φ iff s⊕f ⊨⁺ φ;
- s ⊨⁻ f:φ iff s⊕f ⊨⁻ φ.

Why ordinary negation will not do:
- With ordinary support-negation, "No character passed the test" (42b) is supported whenever it is open whether anyone passed. The Higginbotham pair then separates.
- With the bilateral clauses, Scopelessness is a theorem and FEM (f:p ∨ f:¬p) is unsupported.

**This is the paper's best technical point: Scopelessness needs a single point of evaluation, not a single world.**
- B&H's derivation of Uniqueness (fnn. 41–42) needs two things:
  - Boolean negation over the worlds in Fic;
  - the step from ¬A ⊨ B to ⊨ A∨B.
- Neither holds in a support logic.
- This also answers fn. 35 on principle. There is no □f for the negation lexicalised in "whether" to scope under.

**(c) f: commutes with ¬ and ∧, but not with ∨.**
- So bare disjunctions are scope-ambiguous. The wide reading makes "Either it landed heads or tails" fine.
- Two kinds of sentence are predicted to have only the weak reading:
  - mixed internal/external disjunctions;
  - de re existentials ("there's a particular way it landed").

**The table, given (a)–(c).**
- Know, sure, know-whether: ✗.
- Think and doubt: use Holguín 2022's answer-relative "think", which is B&H's own, not "high credence or best guess".
- Credence: the shifted measure.
- Wonder: the question is open in the shifted state.
- Wish: ✗, because ¬p is unsupported. (20) is ✓, because "the coin was flipped" is supported.
- Hope: ✓.

Each verb keeps its ordinary entry (Heim 1992; von Fintel 1999; Blumberg & Hawthorne 2022), applied to one shifted state. No stipulation is needed.

**The escape from §7.2 works, and W&W got there first.** W&W §4 (MS p. 15) already gives B&H's §7.2 argument, uncredited by B&H:
- King of France (KoF);
- the repugnant conjunction.

Present W&W and B&H as taking one argument against gaps in opposite directions.

**Three smaller points.**
- **The KoF flip** discriminates only against undefinedness (B&H can read "he'd be happy" as a counterfactual fact). Use it for positioning.
- **Blumberg & Strohminger are an ally.** Their "#Bill believes that Juliet died, but he hopes that she survived" shows hope about fiction is constrained by ordinary belief about the fiction, as the state view says.
- **Anomalous suspense** hits B&H's hope condition equally. Footnote it as a shared problem.

### 2.2 Absorption

**The equivalence is correct, and nearly definitional.**
- Cr(□f p) = Cr{w : s(P-Fic_{f,w}, w) ∈ p}. That is Stalnaker-imaged credence (Lewis 1976).
- Averaged over chance-guided uncertainty about selections, it equals general imaging (Gärdenfors 1982).
- B&H's "doxastic indifference" (§8.2) is that chance link.
- Given that selections are unknowable, the qualitative rows coincide too.

**Mixed and cross-fiction credences coincide only with tuple states.**
- Use an independent product for unrelated fictions and an identity coupling for nested ones.
- Say this, or B&H will cite "it's ¼ likely both coins landed heads".

**Citations.** Schulz 2017 supplies the selection–chance link. Check Bacon 2015 before citing it for this, since it concerns indicatives.

**What the memo misses: absorption also disposes of §9.**
- The fiction/counterfactual parallel is predicted by *any* view on which attitudes toward fiction are relative to a supposition, whatever counterfactuals are.
- So the parallel gives no support to the Principal Reality Principle (PRP).
- Neutrality on counterfactuals is thereby earned.

**What B&H might press.**
- de re existentials;
- explicit FEM, which they disown in §2;
- "One of you is right; we just can't know which".

Only the last is a usable datum, and it is contested.

### 2.3 The revelation dilemma

**The facts.**
- TVLine's recap of the NCIS: LA season 10 finale (19 May 2019) says Harm "passed up a JAG position in London to go with Mac to San Diego".
- Wikipedia says Mac "won the coin toss".
- "Tails" holds only on B&H's mapping. I could not verify that the episode fixes heads or tails.

**As stated, the dilemma is unsound, for five reasons.**
1. B&H stipulate, "perhaps counterfactually", that the writers "never thought about the events of JAG again" (§6). Their case is a closed hypothetical, so fn. 27 offers a gotcha, not an argument.
2. Horn 1 misreads §11.3. By default, talk targets the *most recent* version. So the pre-2019 attitudes concern the world selected in 2005, not future canon.
3. Horn 2 fails because B&H can deny that continuations purport to describe an earlier version's world. "Got it wrong" and "retcon" track principal truths (Lee 2024).
4. "Reveal" presupposes a pre-existing fact, which the state view denies. The word cuts against both views.
5. Continuation-authority is true, but B&H can accept it, so it does not discriminate.

**The kernel worth keeping: the sequel argument.**

*What B&H concede.* In §11.3, versions' truths "whether principal or otherwise" can "come quite dramatically apart". But B&H consider only non-monotonic revision. Take consistent extension instead.

*The formal point.*
- Let A = P-Fic(original) and B ⊂ A = P-Fic(extension).
- Stalnaker's 1968 constraint gives s(B,@) = s(A,@) iff s(A,@) ∈ B.
- For a rich sequel that has probability ≈ 0. Otherwise s(B,@) is unconstrained by s(A,@).
- So the two works agree only by chance on every question both leave open.

*Both of B&H's options inherit this.*
- **Versions.** *A Study in Scarlet* and the Holmes canon almost certainly disagree on countless details of the day Holmes met Watson.
- **Time-indexing.** Each new story almost certainly rewrote unaddressed details of *A Study in Scarlet*.

*B&H's own credence method then delivers an absurdity:*

> "It's .5 likely that 'A Scandal in Bohemia' changed whether Holmes ate eggs the morning he met Watson."

On the state view, an extension refines the state, so nothing open changes.

*B&H's repair, and its costs.* They can select the new world from the old one: s(B, s(A,@)). Two costs follow:
- Fictional truth stops being counterfactual truth at @, so §9.3's answer to "why this world?" goes.
- Non-principal truth comes to depend on the route of publication (serialisation, instalments).

This discriminating argument is mine, not the memo's; verify it against the serial-fiction literature: McGonigal 2013, Caplan 2014, Walters 2015, Lee 2024.

### 2.4 The reconciliation

It fails, whatever Khoo's §4 says.

**Oppy & Raivars (O&R).**
- Their point about wonder is a general epistemic principle (no rational wonder where finding out is impossible in principle), not an external reading.
- Their glosses on credence and hope are informal versions of the state view itself:
  - "in any extension of JAG… credence 0.5";
  - a preference "for extensions of JAG according to which Bud's coin lands heads".
- They are partial precursors and must be credited.

**Khoo.**
- Only his fn. 29 is known.
- His §4's "related, but slightly different, theory" of incomplete fictions could pre-empt the state view, or could deny its data.

**Even if correct**, "each side hears a different reading" is weak unless it predicts a flip. For example, the critics' ✗ should become ✓ under "Going by the show, how likely…?".

## 3. Contribution

**In one sentence.** B&H's attitude data and Scopelessness are what attitudes evaluated against a single story-state (not a single world) predict, and since Lewis's imaging equivalence makes the hypotheses attitude-indistinguishable, the data support neither FEM nor fictional truth as counterfactual truth; the views part only over how fictions grow, where the unique-world view implies that consistent sequels almost certainly rewrite the original's open details.

**Is it enough beyond W&W, O&R and Khoo?**
- With the sequel argument, yes, for a strong reply.
- With absorption alone, no. That yields parity plus a predictable alternative, which is (C).

**Structure.**
- **Lead with:** part 2, entered through B&H's route from (28) to Scopelessness, with a bilateral part 1 as the vehicle.
- **Replace:** part 3, with the sequel argument.
- **Cut:**
  - part 4, to one paragraph among the objections;
  - the data-hygiene points (*The Breakfast Club* essay, Sam's Appendix B, Deckard), to one footnote at most. B&H can swap in better examples, and judges read such points as point-scoring.

## 4. The decisive objection

**What B&H will say.** "Empirical equivalence favours *us*. We get your predictions with:
- classical logic;
- Hintikkan attitudes;
- a Boolean □f.

You buy them with a bespoke non-classical semantics. Our arbitrary facts are the price Stalnakerian counterfactuals already pay (Stalnaker 1980; Schulz; Goodman), and you have not rejected those. The PRP is the natural bridge."

**How the paper should meet it.**
1. **The non-classicality is not bespoke.** It is the familiar logic of information-sensitive discourse (Yalcin 2007; homogeneity and trivalent conditionals). It preserves the classical-looking validities of bare talk:
   - f:(p∨¬p);
   - Scopelessness;
   - the Higginbotham pair.
2. **Grant CEM for counterfactuals.** Absorption explains the parallel without the PRP.
3. **The price differs.**
   - Counterfactual facts are fixed.
   - Under the PRP, fictional facts are either reshuffled by every consistent act of authorship, or they depend on the path of publication.
   - That cost is specific to fiction, and it is derived from B&H's own machinery and method.

## 5. Reading list, points and outline

### Reading list (12 items)

| # | Item | Status |
|---|---|---|
| 1 | W&W 2021, PPR 102(2): 423–38, §§4–6 beside B&H §7.2. Quote the published version (green OA: philpapers WILTCR-14). | Must-read in full |
| 2 | Khoo 2026, Phil Studies 183: 1179–1215, §4. **Closed access: BW to supply.** Draft nothing on rivals before reading it. | Must-read in full |
| 3 | Lee 2024, BJA 64(4): 669–86. **Closed access: BW to supply.** | Must-read in full |
| 4 | McGonigal 2013 (BJA 53: 165–79); Caplan 2014; Walters 2015 (BJA 55: 323–41) | Skim |
| 5 | Moss 2013, PPR 87: 251–78 | Must-read in full |
| 6 | Lewis 1976, imaging section | Skim |
| 7 | Gärdenfors 1982 | Skim |
| 8 | Schulz 2017, ch. 6 | Skim |
| 9 | Stalnaker 1968, selection constraints | Skim |
| 10 | Yalcin 2007; Križ 2015 or Cantwell 2008 (closest prior work for "Scopelessness without Uniqueness") | Skim |
| 11 | Blumberg & Strohminger 2025, Analysis 85(1): 3–16 (OA at OUP) | Must-read in full |
| 12 | Oppy & Raivars 2026 | Skim |

### Points the draft must address

1. Name W&W as the precursor on page 1, and state the additions:
   - ordinary verbs;
   - a semantics;
   - engagement with FEM.
2. Credit O&R's informal "extensions" readings.
3. State the pointwise, world-relative shift and the bilateral clauses.
4. Prove Scopelessness, show that FEM fails, and pinpoint the failing step in fnn. 41–42.
5. Derive all eight rows, (20) and (28) from ordinary entries, and answer fn. 35.
6. Give honest judgements on (42), mixed disjunctions and de re existentials.
7. State absorption as a lemma. Specify tuple states and couplings. Apply it to §9 as well as §8.
8. Present the sequel argument formally against both §11.3 options. Quote "whether principal or otherwise". Give the credence datum.
9. Pre-empt the path-dependent repair, and the reply that "agree/differ talk tracks principal truths". §11.3 itself uses version-relative talk for non-principal truths.
10. Use the KoF flip against undefinedness only. Treat suspense as a shared problem. Cite Blumberg & Strohminger as an ally.
11. On JAG:
    - acknowledge the "perhaps counterfactually" stipulation;
    - use NCIS: LA only as an illustration;
    - do not assert "tails" unverified.
12. Test "One of you is right; we can't know which" in one paragraph.
13. For each novelty, name the closest prior work:
    - Yalcin and Križ for bilateral shifting;
    - Lewis and Schulz for absorption;
    - Lee and McGonigal for the sequel argument.
14. Quote the published *Philosophical Review* text (green OA: philpapers BLUFRG).

### Outline (target 5,600 words)

1. **Introduction** (500 words): Lewis's question, B&H's answer, the thesis, the precursors.
2. **The argument for fictional reality** (650 words): data; (28) to Scopelessness to Uniqueness; the PRP.
3. **Story-states: Scopelessness without a world** (1,300 words).
4. **Absorption: why attitudes cannot decide** (900 words): against §8 and §9.
5. **Growing stories** (1,300 words): the sequel argument; the repair and its costs.
6. **Objections** (650 words): classical conservatism; "one of you is right"; Khoo and O&R; suspense.
7. **Conclusion** (300 words): stability under growth, not attitudes, diagnoses factuality.

## 6. Screening

**Where a well-executed version stands.**
- **Criteria 4–7:** it clears them.
  - The main objection has an answer.
  - About 5,600 words is justified.
  - 30–40 references arise naturally.
  - Accuracy is achievable if the quotes and the JAG facts are checked.
- **Criteria 1–3:** it is exposed. A screener sees a reply to a 2025 paper whose most visible thesis is predictable and was anticipated by W&W.

**Prediction.**
- At a generalist journal, more likely than not desk-rejected as a specialist reply. I put the chance of review at about 35%.
- At BJA, Phil Studies or Ergo, it would probably go to review, with a fair chance of a revise-and-resubmit.

**What would most improve its chances: make the sequel argument the general headline.**
- The thesis: any unique-world completion of content fixed by a *growing source* must either reshuffle unaddressed facts at each consistent addition, or make them depend on the path of growth.
- It plausibly extends to the CEM-based completions of fictionalism in Woodward 2011a, which B&H's fn. 57 endorse in spirit. Check this before claiming it.
- Frame and title the paper around Lewis's question, with B&H as the strongest recent case for his "absurd" view, not as "a reply to B&H".

---

*Sources:* [TVLine](https://tvline.com/2019/05/19/ncis-los-angeles-recap-season-10-finale-jag-reunion-harm-mac/); [Wikipedia JAG characters](https://en.wikipedia.org/wiki/List_of_JAG_characters); [Wikipedia JAG s10](https://en.wikipedia.org/wiki/JAG_season_10); [W&W MS](https://eprints.whiterose.ac.uk/148676/); [B&S](https://academic.oup.com/analysis/article/85/1/3/7615345); [Lee](https://pure.skku.edu/en/publications/retroactive-continuity-and-fictional-facts/); [Walters](https://eprints.soton.ac.uk/371947).
