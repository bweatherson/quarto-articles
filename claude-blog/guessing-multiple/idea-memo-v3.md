# Idea memo v3 (round 3): "Guesses That Stand" (working title)

Written after the Ninan/Mackenzie gate and an Opus canon check (round3/canon-R.md: PARTLY ANTICIPATED, not dead). Earlier rounds failed (advisor v1: line view flawed; advisor v2: slate flawed/expected). The human custodian asked for a guessing paper that (a) is more than a reply to Fang 2026 and (b) handles advisor-1's raffle case.

## 1. The problem
In conversation and in inquiry we take our best guesses and continue from them:
- "If not Yale, where?"
- "Suppose the butler did it: with what?"

Dorst & Mandelkern (2022, concluding section) make this the point of guessing: you reason within your guess.

Guesses, though, are question-relative and do not agglomerate (D&M; Holguín 2022; Fang 2026; Lin & Kelly 2012 for acceptance generally). So we cannot continue from everything we have guessed. **Which guesses can we continue from, jointly?**

Two easy answers fail.

**(i) Continue from all of them: the line view, or adding guessed contents to the common ground.**
- Advisor-1's raffle. Ticket A has .40 and sixty tickets have .01 each. The speaker answers "no" to "Will A win?" and then to each of #1–#59.
- Continuing from all the no's recommends "#60 will win", at probability .01.
- Speakers say "No, probably not". Asked "So who will win?", they say "Well, A, I suppose. I know I said no."

**(ii) Continue from none: every answer is fresh.** This cannot explain the documented conformity of follow-ups:
- D&M fn 6, where the follow-up is itself "So"-marked: "Yale" to "where?", then "yes" to "So, do you think he'll go to Yale?";
- Goodman & Holguín fn 24: answering "in immediate succession tends to force the second answer to conform to the first";
- Holguín 2022 §9.2: "London" then "Germany" is "rather strange", and the audience would infer one thinks London is in Germany;
- Latif: "No" to Yale, then "So where?" gets "Harvard";
- Clue: "The butler", then "With what?" gets "The knife".

## 2. Thesis
**1. Continuation.** A follow-up question in a guessing context ("So where?", "With what?", "Then is it #60?") asks the guesser to continue guessing from guesses already made. Ninan 2026 uses this description for one case. To honour the request, the guesser answers the new question within the conjunction of those guesses. Self-posed follow-ups in solitary inquiry work the same way.

**2. Standing.**
- A set of guesses *stands* iff, for each of its non-empty subsets, the conjunction of that subset's members is a permissible guess (D&M Filtering) at the join of the questions those members answered.
- The condition is hereditary. Without that, a set can stand while a subset does not (the canon check found a counterexample to the first formulation).
- One can continue only from a set that stands.

**3. Falling back.**
- If the guesses a request points to do not stand, the guesser continues from a largest subset that stands. That is minimal mutilation: give up as few guesses as possible.
- Where several largest subsets tie, any of them may be used. This matches the permissiveness guessing already has (D&M's Optionality).
- Any explicit earlier guess that the answer contradicts is flagged ("I know I said no").
- An unflagged answer to a follow-up is heard as continued. That is why "London… Germany" makes the audience think London is in Germany.

**4. Holding versus using.** Guesses that fail to stand are not retracted. They remain one's guesses at their own questions, and they can be reported (Fang's conjunctive report). What fails is the licence to use them together.

**5. Sister questions.** Polar questions in a list, not "so"-marked, are answered afresh. A polar question about the only cell left open is heard as a request to continue when the elimination is salient.

## 3. Derivations (round3/code/standing.py, standing2.py; D&M Filtering; Latif at the published .38/.30/.20/.12)
| Case | What stands | Answer |
|---|---|---|
| Latif: "No" to Yale, "So where?" | {¬Yale} stands | Harvard |
| D&M fn 6 | stands | "yes" |
| Clue | stands | knife |
| Bond, "London" then "Which country?" | stands | UK |
| Latif after "no" to all four | largest standing subset is {¬H, ¬S, ¬N} | Yale, flagged |
| Raffle, "no" to A and to #1–#k | stands iff k ≤ 20; for k ≥ 22 the unique largest standing subset drops ¬A; k = 21 is a tie | — |
| Raffle, "So who?" at k ≥ 22 | ¬A dropped | "A, I know I said no" |
| Raffle, "So who?" at k ≤ 20 | stands | "one of the rest" |
| Raffle, "#60" | needs a set that does not stand | never an available continuation |
| Fang's tournament, "A" and "D or E" | the pair does not stand at QR; each guess alone does | "A vs D or A vs E" (continue from one); "A vs D or B vs D" (fresh) |

Both of Fang's fn 36 answers are therefore available, and the conjunctive report is untouched. The 452-entrant variant goes the same way: continuing from "A1" alone yields "A1 against B1 or B2". Tester's variant (Yale .30, Harvard .10, Stanford .10, fifty at about .01), "So where?": "Harvard or Stanford".

## 4. What it shows
1. **Continuation over QUD persistence.** Conformity is inheritance through continuation, not a norm on guessing. Teague's WTP and PTW hold for continued answers by construction and fail for fresh ones. This replaces D&M's QUD-persistence explanation:
   - QUD persistence covers fine-to-coarse stickiness (fn 6), but not coarse-to-fine conformity ("Harvard"), where the old QUD is too coarse to answer the new question;
   - it does not cover the raffle.
2. **Against content-adding common-ground accounts.** If each guessed content entered the common ground, the raffle line would make the common ground entail #60, and the "no" to #60 would make it inconsistent. This is a new dialogue argument against content-adding accounts, which supports Ninan's Dimension 1. It does not touch accounts that add "the speaker believes φ".
3. **Answering Ninan's open question.** The question is what a guess contributes. It contributes something a later request can continue from, and the contributions can be used jointly only where they stand.
4. **Locating the existing pieces.**
   - Fang §4's Conjunctive Filtering is the right filter, moved from holding to using. That move escapes her urn objection.
   - Lin & Kelly prove that question-relative acceptances cannot be pooled across questions and conclude that one should not condition on them. Standing marks out exactly when pooling and conditioning are safe.
   - Foley 2009 and Cohen 1992 split use from possession. Standing says what the split comes to for question-relative attitudes, where the join, not the conjunction alone, is what matters.

## 5. Predictions
- **Switch.** The answer to "So who?" in the raffle switches between 20 and 22 no's.
- **Order.** After no's to all sixty small tickets first, "So will A win?" gets "yes".
- **Salience.** Bare "No" to the last of three tickets is marked; bare "No" to #60 is marked if the elimination is made salient ("And the last one?").
- **Flagging.** Fresh answers to follow-ups that are not flagged are misheard as continued.

## 6. Weak spots
1. **Novelty.** Each ingredient has a close neighbour: D&M p. 34, Ninan, Fang §4, Lin & Kelly, Foley/Cohen, and Rescher–Manor/Benferhat for falling back to maximal subsets. The contribution is the join-relative, hereditary condition on use, and the derivation of the conformity and raffle data from it. The canon check puts the ceiling at "interesting, not surprising".
2. **Data.** The judgements are intuitions. Where possible the paper relies on judgements already in print (D&M, G&H, Holguín, Fang, Ninan, advisor-1's raffle). The switch point is sharp, while intuitions will be graded.
3. **Machinery.** The fall-back adds a cardinality rule with ties. Whether continuing is optional is settled pragmatically.
4. **Three tickets.** The case relies on a salience-based auxiliary.
5. **Cost-based views.** Comparative cost views (conform iff the loss is below a retraction cost) are not refuted. They need a parameter and diverge from standing at k ≤ 20 in the raffle. No published view of that form was found, so this goes in a footnote.
