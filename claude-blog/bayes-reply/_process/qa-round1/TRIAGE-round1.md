# Step 5 triage: Q&A round 1 on draft-v1 (2026-10-23)

## Outcome: restructure (v2), then a smaller second Q&A round
Nobody broke the core result. The pointwise dominance of conditionalization under sharp two-sided margins survives every contribution. But the framing and conclusion need rebuilding, for three reasons:
- The generality of the Proposition was overstated (02).
- The conservative "edge-discounting" rules that the draft offered as the non-absurd option are themselves dominated (01). For E = K theorists the pure rules are unstable (03), and the higher-order story is not as the draft says (07).
- Horn (iii) of the trilemma largely collapses into horn (ii) (04), and the dichotomy behind the Observation is really about *slack* beyond tracking error (04, 05).

Changes of this size warrant a second round on v2.

## Incorporate

1. **General Proposition (02).** For every strictly proper score A that is additive and continuous (Predd et al. 2009), and for the simple log score, there is a globally evidentially constant (GEC) rule f_A dominating conditionalization on two-sided learning. The rule is the A-projection (Bregman) of π(·|p) onto credences concentrated on int p. Pythagorean form: A(f_A(p), s) − A(π(·|p), s) ≥ D_A(f_A(p), π(·|p)) > 0 for s ∈ int p.
   - Log case: π(·|int p). Brier case: add the rim's mass equally to the interior states (Euclidean projection).
   - Say that the dominating rule depends on the score (as in Joyce); that conditionalization is dominated does not.
   - Hypotheses: finite S, a known reflexive relation, E(s) ⊇ R(s); regularity only for strictness.
   - Margins need a known positive width. As the grid is refined with R fixed at adjacency, the gain → 0.
   - Fix the "lower-dimensional" claim: it must require that some proposition with a nonempty rim gets positive weight.

2. **Scope: sharp margins with slack, plus the graded case (04, 05, 10).**
   - Reformulate §2 in measurement terms: reading c, tracking error e, slack m. Knowledge is [c−e−m, c+e+m] (Williamson 2013; Weatherson 2013's "appearance centred" model), so the truth lies at depth ≥ m.
   - Guess-centred models are the m = 0 case (Salow: margin = "the maximum distance between my best guess and the actual hand"). The dispute is about slack.
   - Graded or soft margins: pointwise dominance fails, but conditionalization is still expected-accuracy suboptimal unless the likelihood λ_p is flat on p (Lemma 1). The thesis has two tiers: dominance (sharp margins with slack) and expected suboptimality (graded learning with non-flat likelihood).
   - Correct the §2 classification: the W/W 2013 models are centred on the appearance a, with half-width e + m.

3. **The conservative rules and the "Absurdity" reply (01, 03, 07).** Rewrite as a new section, "What accuracy recommends".
   - **01:** the dominance standard over two-sided learning endorses only rules that give the rim zero credence; the conservative mixtures are themselves dominated. For an agent who knows her exact situation, only meta-conditionalization (or the truth rule) is undominated. Concede this.
   - **03:** for an E = K theorist the pure rules are unstable. Certainty in int E(s) is true, and safe (it is had only at interior states), so it would be knowledge, contradicting the margin principle that generated two-sidedness. Among *stable* rules, those that never make her believe more than she knows, conservative mixtures with large enough ε still strictly dominate conditionalization (concavity). So imposing stability does not restore conditionalization; it shows that the selection is being made by a non-accuracy constraint.
   - **07** (footnote): on the margin-1 clock the pure rule coincides with meta-conditionalization and satisfies Dorst's Trust, while the conservative rules fail positive access. At wider margins (immediate-neighbour interior), effacing persists for every rule in the family. Drop "neutral about whether margin models are right"; the Proposition plus Dorst points toward Salow's diagnosis.
   - **Conclusion of the section:** an accuracy-first externalist who keeps sharp slack margins is driven to credences that outrun knowledge in a way the margin picture forbids. So she should give up slack margins around the truth.

4. **Trilemma → dilemma (04).**
   - Horn (iii) (likelihood rules: Gallow, Isaacs–Russell, Easwaran–Nielsen) is conditionalization on a signal or guess in an enriched space. It is horn (ii) seen from the coarse space.
   - New conclusion: (a) a knowledge-first externalist conditionalizes on what she knows, without an accuracy vindication (Williamson; Meehan and Zhang's first option; 03: this is Williamson's home, and accuracy is "neither here nor there", p. 288). (b) An accuracy-first externalist conditionalizes on what she responds to (signal or guess), and her credences about the world are then likelihood-weighted, not conditional on what she knows.
   - Hi-TEA tries to have accuracy plus conditionalization on knowledge, and succeeds only under a weighting on which knowledge has no slack.
   - Remove the "little left for it to survive" jibe (04). Mention Williamson's Response (Inquiry 56: 77–96) on luminosity of guesses as the cost of (b). Must read it first.

5. **Global evidential constancy and the slogan (08).** Replace "GEC is not at issue".
   - The rule is GEC, but adopting it depends on knowing that one's learning is two-sided. So across agents with the same prior space who know different things about how they learn, it gives different posteriors to the same evidence. That breaks M&Z's slogan "same prior over S, same evidence about S, same posterior over S" (p. 309).
   - Reply: the cross-agent slogan *is* the coarsening-at-random assumption in normative form; Monty Hall shows that what could have been learned matters. M&Z's n. 21 (p. 311) says the opaque versions are less clear, and this paper's cases are opaque Monty Halls.
   - Two-handed Dana (pp. 320–321): if one rule must serve both hands, there is no dominance. The λ-optimal rule over her possibilities is one GEC rule, hence idempotent (Fact 6), and it is not conditionalization unless her weights are CAR.

6. **The rule-consequentialist veil (06).**
   - Replace "Grant that" with a dilemma. A veil over persons gives frequency weights, hence likelihood weighting, hence not Bayes. A veil over situations gives counting weights, hence Bayes, but only through scale-blind indifference. Its chooser must be ignorant of her learning situation, which Dana is stipulated to know.
   - Correct the representation of n. 37: M&Z call the objection "analogous to the collapse objection against rule consequentialism"; they do not themselves present Hi-TEA as RC. "Do not jaywalk" is theirs (p. 289).
   - Add Pettigrew's preceding caveat sentence.
   - Cite Hooker as M&Z do (2002, chap. 4) or 2000, consistently.

7. **Exposition (09).**
   - §4's key step as three plain steps.
   - Antecedents paragraph → footnote, keeping "What is new here" in the text.
   - Gloss "globally evidentially constant" and "coarsening at random" in the abstract.
   - List or table for the one-sided gauges.
   - One sentence on the Brier projection angle.

8. **Citations and accuracy fixes.**
   - Theorem 3.1 is Gill, van der Laan & Robins's, restated by Grünwald & Halpern.
   - Bib: protect "van der Laan".
   - "Almost never": cite GH §4.4 / Thm 4.4 / Ex. 3.3 instead of the measure-zero sentence.
   - −2.08 is Table 1's dogmatic score at 15 (Fact 3 is the comparison).
   - Verify the Gill–Grünwald quote and page.
   - Dana's prior (0.2, 0.6, 0.2) is stated in M&Z p. 300; cite it.

## Cut
- The "familiar anomalies" paragraph of §4 → one sentence or a footnote (01, 07, 09, 10).
- Most of the Dorst/Das/Schoenfield comparison paragraph → footnote.
- "Third, some numbers" → two sentences.
- The "It follows…" paragraph (now redundant with the general Proposition plus §4's three steps).

## Rejected or deferred
- **01's demand to "drop 'the dispute is no longer about weights'"**: partly accepted. Dominance over 𝒟 is weighting-free. For agents unsure whether some learning is edge-exact, the dispute is about weights, and §4's knife-edge is the weapon there. Say both.
- **05's Gaussian numbers**: use one only if space allows; the general Lemma 1 point suffices.
- **08's claim that the paper's policy "reproduces meta-conditionalization"** for Dana: only for an agent who knows she uses her right hand. The response is in item 5.
