Phase 1 was written after reading only round3/pretest-question.md. I opened no other file in guessing-paper/ and did no web search. Caveat: the task brief I was given already named the candidate's mechanism ("comparative trigger: answer-value loss against retraction cost"; "sister polar questions do not bank one another"). So Phase 1 is not fully blind, and I flag below where that matters.

# PHASE 1 (blind to the candidate file)

## 0. Problems with the stimuli, noted before theorising

- **D3/D4 do not match.** D3 ends with "no" to #60. D4 says "#60" is "the only answer consistent with all B's earlier answers". That is true only if D4 branches off after #59. If the line includes #60, then no answer is consistent with all of B's earlier answers, and D4 collapses into D5. The paper must say which it means, because the two readings test different things.
- **D1 vs D5 is the core contrast.** The same "no" to Yale is kept in D1 ("Harvard") and dropped in D5 ("Yale … I know I said no").
- **D3 is the preface/lottery case in dialogue form.** The real question is whether its "no banking" holds when n is small. I predict that "no, no, no" in a three-ticket raffle, and the *fourth* "no" in D5 itself, are marked. If so, non-banking in D3 comes from large n or diffuse conflict. It is not a property of sister polar questions.
- **Unfiltered answers are often fine.** "Harvard" (D1) is not a filtered answer to "where?", and Fang's conjunction (D7) is not a filtered answer to the joint question, yet both are fine. Sequential answering routinely produces overall states that are not filtered. The theory has to allow that, within limits.

## (a) What a competent specialist would propose first (probabilities sum to 1)

1. **Commitment store plus belief revision with a plausibility trigger (.30).** Guesses enter a Hamblin, Farkas & Bruce or Walton & Krabbe commitment store as weak, retractable commitments ("concessions"). Later questions are answered as filtered answers given the store (D1, D2, D6). Revision uses AGM or Levi contraction, with entrenchment given by credence. Inconsistency alone cannot be the trigger: in D4 (branch after #59) the store is consistent and plain conditioning yields "#60". So the paper adds an *absolute* trigger: revise when P(∧store), or P(answer | store) relative to the field, falls below a threshold.
2. **Decision-theoretic trade-off: the comparative trigger (.25).** Extend Dorst & Mandelkern's J-value. Choose the next answer to maximise expected answer value minus a cost for contradicting earlier guesses. If the cost is small, keep the guesses (D1: Harvard .28 vs Yale .30). If it is large, retract (D4: #60 .01 vs A .40). If no answer is consistent, retraction is forced, and since every answer then costs one retraction the cost cancels and the best answer wins (D5). This is the obvious extension of a framework that is already decision-theoretic. (Contamination: I knew from the brief that this is the candidate. I would still rank it top-two.)
3. **Question-relativity or fragmentation (.20).** Following Holguín, Yalcin 2018 and Elga & Rayo, guesses are indexed to questions. A follow-up that refines the earlier question, or is marked by "so" or "then", inherits the earlier answer. Sister questions are separate fragments, which gives D3. Reopening the super-question ("So who?") prompts a fresh guess from the credences, which gives D4 and D5. This view handles D3 well, but must explain why D1's "So where?" inherits and D4's "So who?" does not.
4. **Conditional questions, supposition and charity (.15).** On Isaacs & Rawlins, "So where?" is a conditional question asked under the supposition of B's last answer. The supposition is taken up unless doing so makes the question absurd (D4) or empty (D5), in which case the hearer accommodates an all-things-considered reading. The polar questions in D3 are a list, not nested suppositions. On this view the work is done by how A's question is interpreted, not by B's commitments.
5. **Probabilistic contents or hedging (.10).** Following Moss, Yalcin and Swanson, polar "no"s are tacitly "probably not" and so do not agglomerate (D3). Conditioning in D1 comes from "so". The view struggles with "I know I said no", which treats the earlier "no" as a flat commitment.

## (b) My own best theory: graded persistence with a conflict cost

- **Base.** Each guess is a defeasible commitment indexed to its question Q_r. A later answer *a* **undermines** an earlier guess *r* relative to a set S of other live commitments iff, conditional on a ∧ ∧S, *r* is no longer a filtered answer to Q_r.
  - D2: "gun" undermines "butler" with S = ∅, since P(butler | gun) = .25.
  - D6: "Germany" undermines "London" with S = ∅.
- **Cost.** Undermining is allowed but costs something. The cost **falls with the size of the smallest S** that does the undermining.
  - With S = ∅ (direct contradiction or one-step undermining), the conflict can be located. It is costly and must be *marked* ("I know I said no", "actually").
  - If only the conjunction of many guesses undermines, the conflict is *diffuse*: cheap, unmarked, and preface-like.
  - The inconsistency-measure literature has a ready-made decay: Hunter & Konieczny's MI-based measures weight each minimal inconsistent set M by 1/|M|.
- **Choice.** The speaker picks the answer with the highest answer value (D&M J-value) net of conflict cost.
- **D3.** "No" to #60 undermines earlier answers only together with about 59 others. The conflict is diffuse, so the answer is unmarked.
- **D4** (branch after #59). "#60" undermines nothing but is worth about .01. "A" costs one located, marked retraction and is worth .40. Keeping ¬A and dropping the diffuse "no"s gives "one of the others, no idea which", which is coherent but nearly uninformative. With moderate J, "A" wins, and the marking ("I know I said no") is predicted because the conflict is located.
- **D5.** Every candidate answer directly contradicts exactly one "no". The cost is constant across answers, so the unconditionally best answer wins (Yale), marked.
- **Predictions that separate this view from "sister polar questions don't bank":**
  - three-ticket "no, no, no" is marked;
  - the fourth "no" in D5 is marked;
  - a 1,000-ticket version of D3 is even more comfortable than the 61-ticket version.
- **Remaining weakness.** There are two free parameters: the exchange rate λ and the decay of cost with |S|. Structurally, my view is a refinement of family 2. That is why I count family 2 as predictable.

## (c) Literature such a paper must engage (from memory; uncertain items flagged)

(After Phase 2 this list was shortened for length by deleting items only. Nothing was added or changed.)

- **Guessing and weak attitudes.**
  - Holguín 2022, "Thinking, guessing, and believing" (*Phil Imprint*): believing is guessing at the finest question entertained. D6 is from §9.2.
  - Dorst & Mandelkern 2022, "Good guesses" (*PPR*): J-value and filtering.
  - Mandelkern & Dorst, "Assertion is weak" (*Phil Imprint*, c. 2022).
  - Goodman & Holguín 2023, "Thinking and being sure" (*PPR*).
  - Hawthorne, Rothschild & Spectre 2016, "Belief is weak" (*Phil Studies*).
  - Fang 2026, Teague 2024 and Pearson 2025: **I do not reliably recall their theses.** I infer only from D7 that Fang uses conjunctive "think" reports against filtering at the joint question.
- **Question-sensitive and fragmented belief.**
  - Yalcin 2018, "Belief as question-sensitive" (*PPR*).
  - Hoek on question-relative belief (memory uncertain).
  - Elga & Rayo 2021 on fragmentation.
  - Leitgeb 2014/2017, the stability theory: partition-relative belief, and his treatment of the lottery.
  - Lin & Kelly 2012: odds-threshold acceptance that tracks conditioning. This is a direct precursor of filtering *and* of revision.
  - Weatherson 2005 and 2012, and *Knowledge: A Human Interest Story* (2024): belief as conditioning not changing one's answers to relevant questions. D1 shows that a "no" guess fails this test.
- **Belief revision and epistemic decision theory.**
  - AGM 1985; Gärdenfors 1988.
  - Levi 1967, *Gambling with Truth*. D&M's J descends from Levi's caution index q. Levi 1991, *The Fixation of Belief and Its Undoing*: contraction minimises loss of informational value, which is close to any comparative trigger.
- **Preface and lottery.** Makinson 1965; Christensen 2004; Kyburg; Hawthorne 2004. Inconsistency measures: Knight 2002; Hunter & Konieczny 2008/2010.
- **Commitment-based dialogue.**
  - Hamblin 1970/1971, commitment stores with withdrawal.
  - Mackenzie's DC system (1979, *JPL*, "Question-begging in non-cumulative systems"; later "Four dialogue systems", *Studia Logica* c. 1990). **I cannot place a specific Mackenzie 1987 item.**
  - Walton & Krabbe 1995, *Commitment in Dialogue*: concessions vs assertions, and retraction rules. This is the closest prior model of "cheaply retractable" commitments.
  - Krifka 2014/2015, commitment spaces and denegation; Cohen & Krifka 2014.
  - Farkas & Bruce 2010; Farkas & Roelofsen 2017; Gunlogson 2008; Malamud & Stephenson 2015 (tentative/projected commitments).
- **Weak assertion as a speech act.**
  - Incurvati & Schlöder 2017 ("Weak rejection"), 2019 ("Weak assertion"), 2022 ("Epistemic multilateral logic"), and *Reasoning with Attitude* (2023). Weak assertions do not agglomerate.
  - Vanderveken 1990 (guess as an assertive of weaker degree of strength); Benton & van Elswyk 2020 on hedged assertion; Marsili on graded assertion and commitment.
- **Retraction.**
  - MacFarlane 2014; von Fintel & Gillies 2008; Knobe & Yalcin 2014; Beddor & Egan 2018 (QUD-sensitive retraction); Khoo 2015; Marques 2018; Caponetto 2020; Kneer 2021 (experimental).
  - Clift 2001 on "actually" as self-repair, and Schegloff, Jefferson & Sacks 1977 on self-repair. These bear on the "I know I said no" and "Yale, actually" markers.
  - **Ninan 2026: I do not know it.** I know Ninan's work on assertion about the future and on relational content, but not a 2026 paper on retraction or guessing.

---

# PHASE 2 (after reading candidate-thesis.md and advisor reports v1 and v2; no web)

## 1. Predictability: PREDICTED

"Priced commitment" is my family 2, ranked second at .25, and my theory (b) refines it. Advisor 1 (§3.1) already said greedy conditioning needs "commitment, retraction costs, or Bratman-style non-reconsideration". Advisor 2 (§4, item 4) then proposed exactly this trigger. The candidate is B′ with a cost label. Structurally it is Levi's 1991 value-priced contraction plus Walton & Krabbe's retractable concessions. The mechanism will read as expected.

## 2. Soundness

**Worked numbers.** I use V(p) = P(p) − |p|/n (Levi at q = 1, D&M fn 13). Losses from conforming:

| Case | Loss | Result |
|---|---|---|
| D1 | .02 | conform |
| D2 | .05 against the fresh *joint* answer, .20 against the fresh *marginal* "gun" | conform |
| D4 | .39 | retract |
| D5 | no conforming answer exists | forced retraction; cost is equal across answers, so Yale wins |

So the cost lies somewhere in (.02–.20, .39), and the thesis does not say which baseline "loss" is measured against.

**Variant (Yale .30, Harvard .10, Stanford .10, fifty at about .01).** Neither answer is right.
- "Harvard" ties Stanford, so it is not a filtered guess, whether or not you condition on ¬Yale.
- The conforming guess is "Harvard or Stanford" (V ≈ .16). The fresh guess is "Yale" (≈ .28). Loss ≈ .12.
- My judgement: "Harvard or Stanford, I'd guess" is natural; "Yale, actually" is a marked but available correction.
- The candidate can fit this (cost > .12) but cannot predict it.

**Measurability.** "Hearer's uptake and coordination" is real content. But D1–D7 hold uptake constant (an anaphoric "So"), so on these data the cost is a constant fitted to the window above. There are also two further free choices: the exchange rate between epistemic and practical units, and the baseline. To make it measurable, vary uptake:
- A has visibly acted on "not Yale", versus has not;
- a third party who never heard the "no" asks.

If judgements do not move, the price is a free parameter.

**Sister polar questions: no version of the binary claim survives.**
- **Not banking** predicts that three-ticket "No. No. No." is fine. It is bad, and advisor 2 records that the author conceded this.
- **Banking with a priced conflict** predicts that D3's "no" at #60 is a *marked* retraction (loss .98). D3 says it is unmarked.
- **Uptake cannot separate the two cases,** since A simply moves on in both. What separates them is the size of the minimal conflict set (2 against 60): how diffuse the speaker's inconsistency is. That is a fact about the speaker, not the hearer.
- **So the hardest contrast is decided by a factor the thesis does not name.** Repair: grade the cost by how *locatable* the conflict is (Phase 1(b); Hunter–Konieczny 1/|M|). This also predicts when "I know I said no" is required.

**Further defects.**
- D3's critical turn is "No, *probably not*". By the candidate's own taxonomy, a credence report creates no commitment, so the hedge alone may explain D3. Test with a bare "No."
- D4 has a third option: keep ¬A, drop the diffuse "no"s, and say "not A; no idea which". Retraction is therefore a choice of *which* commitments to drop (AGM/Levi), and "conform iff loss < cost" underspecifies it.
- D6 is predicted fine if "Germany, actually…" is marked and the loss is large. Check Holguín's numbers.

## 3. More than a reply to Fang?

Potentially. Its real home is the debate over what a weak answer adds to the common ground and whether assertion is weak. The relevant work: M&D, HRS, Goodman & Holguín, Incurvati & Schlöder, Farkas & Bruce, Malamud & Stephenson, and the retraction literature.

It would change that debate if it showed either of two things:
- **(a)** Cross-turn coherence is *owed to a hearer*, not a norm on thinking. That would cut against Holguín, G&H, Teague and Fang, who all treat closure as attitudinal.
- **(b)** Guessing and asserting differ in retraction profile as speech acts.

At present it shows neither.
- On (a), the uptake manipulation has not been run.
- On (b), every retracted item in D3–D5 is a bare "No", which is assertoric in form. If anything, the data show that assertions retract faultlessly here, which supports M&D rather than "weak attitude, strong act".

**Priority.** Ninan 2026, "The Strength of Assertion", classifies declaratives by how they are elicited and what they add to the common ground (per its abstract). It may already contain the attitude/act corollary. Mackenzie 1987, "I guess", may already define a guess move with retraction rules. Advisor 2's gate appears still open.

## 4. Verdict: PURSUE WITH CHANGES (narrowly; otherwise DROP)

1. **Pass the Ninan/Mackenzie gate.** If either gives guesses a hearer-directed retractable commitment, DROP.
2. **Demote the comparative trigger** to mechanism and cite Levi 1991 and Bratman 1992. It is predicted, so it cannot be the thesis.
3. **Make hearer-relativity the thesis and test it:** uptake, a new hearer, and reliance acted on, with credences fixed. If nothing moves, DROP.
4. **Replace "sister polars don't bank"** with a graded conflict cost based on locatability. It must get D3 unmarked, the three-ticket case marked, and predict when retraction must be marked.
5. **Fix the free choices** (the baseline for loss and the exchange rate), and treat retraction as choosing which commitments to give up.
6. **Drop the guess/assertion asymmetry or test it** with minimal pairs: "I'd guess not" / "He won't" / "He definitely won't", each followed by a retraction. Remove the hedges from the critical turns.
7. **Repair the stimuli:** the D3/D4 branch point, ties in variants, the fourth "no" in D5, and the Latif numbers.

**Best one-sentence thesis.** A guess binds its author's later guesses not as a norm on her attitudes but as a defeasible commitment to the hearer who builds on it, which grows with that reliance and yields, by a faultless retraction that is marked only when the conflict can be located, whenever honouring it would cost more answer-value than the reliance is worth.
