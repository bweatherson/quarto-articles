# Candidate thesis R: "standing" (round 3, after the Ninan/Mackenzie gate)

## Setting
- A guess is a three-place relation: a person, a question Q, and an answer (a union of Q-cells). The norms are Dorst & Mandelkern's Filtering (or Holguín's cogency, or J-optimality).
- Ninan 2026: in a guessing context a guess does not propose to add its content to the common ground. A follow-up question that presupposes the guess is odd "unless … interpreted as a request for B to continue guessing".
- Mackenzie 1987: a guess commits only its maker, cannot later be defended, and is withdrawn on challenge.

## Thesis
1. **Requests to continue.** An anaphoric or "so"-marked follow-up question in a guessing context is a request to continue guessing from the guesses already made. To honour it, the guesser answers the new question as she would if those guesses were the context: her best guess at the new question given their conjunction. This is building.
2. **Standing.** A set S of guesses stands iff the conjunction of its members is itself a permissible guess at the join (the coarsest common refinement) of the questions they answered. One can build only on a set that stands.
3. **Falling back.** If the guesses a request points back to do not stand, the guesser builds only on what is common to every maximal standing subset of them (the full meet). A maximum-cardinality subset gives the same results in every case below. When nothing is common, she answers afresh.
   - Any answer that contradicts a guess she made explicitly is flagged ("I know I said no").
   - Guesses that have lost standing are not thereby retracted. They can still be reported (Fang's conjunctive report), but they cannot be built on.
4. **Sister questions.** Polar questions that are not "so"-marked are not requests to continue and are answered afresh. A "so"-marked one is answered under clauses 2–3.

## Derivations (checked with round3/code/standing.py, Filtering)
| Case | Standing | Answer |
|---|---|---|
| D1 Latif, no to Yale, "So where?" | {not-Y} stands | Harvard (conform) |
| D2 Clue, butler, "With what?" | stands | knife |
| D6 Bond, London, "Which country?" | stands | UK; "Germany" is bad |
| D&M fn 6, where = Yale, "Will he go to Yale?" | stands | "yes" (stickiness) |
| D5 Latif, all four no's, "So where?" | does not stand; maximal standing subsets {¬H,¬S,¬N}, {¬Y,¬H}, {¬Y,¬S}, {¬Y,¬N}; full meet ∅ | fresh: Yale, flagged |
| Raffle (A .40, sixty tickets at .01), no to A then to #1–#k | stands iff k ≤ 20; from k = 21 the conjunction (.39) is beaten by A (.40) | — |
| Raffle, "So who?" after k ≤ 20 | stands | "one of #(k+1)–#60" |
| Raffle, "So who?" after k ≥ 21 (including 59 or 60) | does not stand; dropping ¬A restores standing | A, flagged ("I know I said no") |
| Raffle, "#60" | building on a set that does not stand, which is never an available move | — |
| Line view | — | "#60 will win" |
| Unmarked "No" to the sister polar #60 | answered afresh | — |
| "So must it be #60?" | no building | fresh "No, honestly it's probably A" |

Tester's variant (Yale .30, Harvard .10, Stanford .10, fifty at about .01), no to Yale, "So where?": {¬Y} stands, so the answer is "Harvard or Stanford". This matches the tester's judgement, and no parameter is needed.

## What it rules out
- **The priced/comparative family.** D&M's stickiness (conforming "yes" at a loss of up to .40–.48) and the raffle (refusing to conform at a loss of .39) together leave no single retraction cost. Under R, cost does not matter; only standing does.
- **The common-ground update account of conformity** (advisor-1 §2.1). If each "no" entered the CG, then after "no" to A and to #1–#59 the CG would entail #60. "Will #60 win?" would be trivial, and "No" would be contradictory. This is a new argument for Ninan's Dimension 1.
- **Conditioning on guesses** (the line view and bootstrapping). Conditioning is licensed only from standing sets.

## Payoffs beyond Fang
- **Answers Ninan's open question** of what a guess adds: guesses go on a guess record from which the guesser can be asked to continue, and the record is usable only where it stands.
- **Dissolves Teague's puzzle.** WTP and PTW hold for built answers by construction and fail for fresh ones. Inter-question coherence is inheritance, not a norm on guessing.
- **Pearson.** Discharging a supposition (advisor-1 §3.4) is licensed exactly when the antecedent guesses stand.
- **Fang §4 Conjunctive Filtering** becomes a condition on building rather than on holding. This sidesteps her urn objection, since nothing about urn 1 has to change.
- **Slogan:** closure is a condition on use, not on possession, for attitudes that do not agglomerate.

## Sharp predictions
- **Switch point.** The answer to "So who?" switches between k = 20 and k = 21. Asked after few no's, the speaker says "one of the rest"; asked after many, she says "A, I know I said no".
- **Order.** After denying all sixty small tickets first, "Will A win?" gets "Yes" by building, because {¬#1..¬#60} stands with conjunction A.

## Known weak spots
- **Three-ticket "no, no, no".** It is marked, but R predicts no flag until an explicit contradiction. The candidate explanation is strategy-relative unhelpfulness (Roberts).
- **Choices.** The selection function and whether building is optional are both choices.
- **The guessing norm** carries J, if J-values are used.
- **Data.** These are intuitions; there is no experimental data.
