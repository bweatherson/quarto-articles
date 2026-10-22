# Advisor report, round 3: "Guesses That Stand"

## 0. Verdict: (A) FLAWED

There is one decisive problem. Standing gets the memo's own core datum wrong as soon as the elimination runs two steps. This happens with the published Latif numbers and under every guessing norm in play. The repairs available run back into the line view, which revives the raffle, or into the priced view, which the blind pretest judged PREDICTED.

Even if the problem were fixed, the ceiling is the canon check's "interesting, not surprising". The thesis would read as Fang's §4 moved to use, plus Lin & Kelly's exception clause, plus a Rescher–Manor fall-back.

My recommendation is to abandon the guessing topic (§5).

Both scripts reproduce every row of the memo's §3 table. My tests (importing them): /tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/adv3/tests.py and /tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/adv3/group.py.

---

## 1. Soundness

### 1.1 The §3 derivations are arithmetically right

With D&M Filtering and Latif at .38/.30/.20/.12 the outputs are as follows:
- **Single guesses.** D1 gives Harvard, fn 6 gives "yes", Clue gives knife, Bond gives UK.
- **Four "no"s to Latif.** The unique largest hereditarily standing subset is {¬H, ¬S, ¬N}, which gives Yale.
- **Raffle.** The set stands iff k ≤ 20. At k = 21 there is a tie. From k = 22 the unique largest subset drops ¬A.
- **Tournament.** Fang's pair {A, D∨E} does not stand.

A single permissible guess always stands, so all the theory's content lies in multi-guess sets. That is where I tested it.

### 1.2 The decisive counterexample: two eliminations

Use D&M's published numbers.

> A: Do you think Latif will go to Yale? — B: No, I don't think so.
> A: Harvard? — B: No, I don't think so either.
> A: So where do you think he'll go?
> B1: Stanford, I guess.
> B2: Well, Yale, I suppose. I know I said no.
> B3: Well, Harvard, I suppose. I know I said no.

B1 is the natural continuation; B3 is bizarre. R predicts the reverse.

- **{¬Y, ¬H} does not stand.** Its conjunction S∨N (.32) is beaten at the join {Y, H, S∨N} by Yale (.38). So "Stanford" (P(S | ¬Y¬H) = .63) cannot be reached by continuing, and it is not a fresh answer either: the fresh answer is Yale.
- **The fall-back is a cardinality tie between {¬Y} and {¬H}.** {¬Y} yields Harvard, flagged; {¬H} yields Yale, flagged. R therefore licenses B2 and B3 and forbids B1.

**This does not depend on whether "Harvard?" is a sister question or a continuation.**
- As a sister question, the "no" is fresh (.70).
- As a continuation from {¬Y}, the "no" is R's own output, since H (.30) loses to S∨N (.32) within ¬Y.
- So **R's continuation operation does not preserve standing.** A licensed continuation from a standing set yields a set that cannot be continued from at the very next turn.

The cleaner numbers Y .40 / H .24 / S .20 / N .16 give the same result: P(H | ¬Y) = .40, and S∨N (.36) loses to Y (.40).

**Robustness.** Any J-optimal answer is filtered, and cogency is stricter, so S∨N fails on all three norms.

**Diagnosis.** Standing judges the conjunction against *unconditional* probabilities at the join. Elimination chains, the paradigm "so" dialogues (Twenty Questions, Teague's DAC), push the conjunction below the eliminated favourite within two steps. The raffle and Latif thresholds are the same condition, and intuition draws no line there.

### 1.3 Why the repairs fail

1. **Judge continued guesses conditionally on their base.** Chains of continuations then always stand, and this is the line view. Explicit "so"-chains in the raffle ("So #1, then?" … "So who?") then deliver "#60". The sister-question version of the Latif case still forbids "Stanford", because there the "no"s are fresh.
2. **Read "So where?" as a conditional question** ("if not Yale or Harvard, where?", Isaacs & Rawlins). That gives Stanford without standing. But the same reading is available in the raffle and gives "#60". To block it you need a graded absurdity condition.
3. **Add a threshold**, e.g. continue iff the conjunction is at least t times the best excluded cell. Any t in roughly (.03, .84) separates Latif from the raffle at k = 59. That is a parameter, and it is the family the pretest judged PREDICTED (Levi 1991 contraction priced by informational value; locatability à la Hunter–Konieczny).
4. **Bite the bullet.** You would then have to say that B3 is acceptable and B1 is not. No judge will accept that.

What separates Latif-after-two-"no"s, where continuing is fine, from the raffle at k = 59, where it is absurd, is *graded*. In probability: Stanford .20 against Yale .38, but #60 .01 against A .40. In size of conflict set: 2 against 60. Standing is binary and parameter-free, which was its selling point, and that is exactly why it cuts in the wrong place.

### 1.4 Fang fn 36 and the 452-entrant case: the rescue rides on a single-cell guess

The rescue does go through for Fang's own cases, and for a principled reason:
- Under independence, building on a *single-cell* guess q and using Optionality to take the top-k cells within q yields q × (the top-k answer to R).
- That is exactly the conjunction.
- So "A vs D or A vs E" comes from {A} alone, and "A1 vs B1 or B2" from {A1} alone. No reclassification is needed there.

The rescue does not generalise. Take standing.py's own tournament with the guesses "A or B" and "D or E", then "So who'll be in the final?". The natural answer is "A or B against D or E".
- **The pair does not stand.** The conjunction contains BE (.077) but omits AF (.081).
- **Building on "A or B" alone fails.** AF (.081) is excluded and beats BE.
- **Building on "D or E" alone fails.** CD (.08) is excluded and beats BE.

So the conjunctive answer is unavailable from every standing subset. R must call it a report, which is the move Fang rejects in §6.2 ("would come close to denying any inter-question principle at all"). The memo's claim of success "without ad hoc reclassification" holds only for single-cell first guesses. Fang's phenomenon, that conjunctive reports sound fine, is not restricted that way.

### 1.5 The fall-back

1. **Cardinality is sensitive to how questions are cut.** "No" to A plus 22 separate "no"s gives a unique fall-back: drop ¬A, answer "A". "No" to A plus a single "no" to "Will one of #1–#22 win?" covers the same content and has the same conjunction (.38 < .40), yet it gives a 1–1 tie: either "A", or "one of the sixty small tickets". Base-revision theorists (Hansson) defend sensitivity to how the base is written. The paper would need that defence, and it cannot simply appeal to "minimal mutilation".
2. **The appeal to Optionality fails.** Optionality's permitted answers are nested top-k sets; incompatible answers arise only under exact credal ties. R's ties license *incompatible complete answers of different probabilities*:
   - Harvard (.30) or Yale (.38) in §1.2;
   - Cat, Fox or Hen (.22, .26, .24) in the canon check's six-animal case, which I re-ran under hereditary standing.

   No existing guessing norm permits that.
3. **Heredity is a technical patch.** It was added so that the fall-back is well defined after the canon check's counterexample. Nothing independently motivates it, and it makes standing a condition on 2ⁿ subsets.

### 1.6 The raffle switch point

R's distinctive raffle predictions sit at 20 < k < 22, and in the claim that "one of the remaining 60−k" is unavailable for every k ≥ 21. Intuition there is flat or graded. At k = 30, "Well, one of the other thirty, I guess" is not bad. At the extreme (k = 59), where intuition is sharp, the priced view, the locatability view and a plain "continue unless absurd" pragmatics all say "A". So the raffle does not favour standing over its rivals.

### 1.7 The three-ticket auxiliary is not principled

1. **It presupposes joint elimination.** "The only cell left open" assumes that the earlier sister "no"s jointly eliminate cells, which is the joint use R denies sister answers.
2. **Salience is a free parameter.** With 3 tickets the elimination is salient; with 10 or 61 it is not. Nothing sets the cut.
3. **The flagging rule does not yield the memo's own Salience prediction.** Take a salient "And the last one?" in the raffle. R continues from the fall-back {¬#1…¬#59} and answers "no". That "no" contradicts no *single* explicit guess, so the stated rule ("any explicit earlier guess that the answer contradicts") does not flag it. Bare "No" is then predicted fine, contrary to §5. You need flagging defined over base ∧ answer.

### 1.8 QUD persistence

The memo is right that bare persistence of the coarse polar QUD cannot produce "Harvard". But that target is a one-line conjecture in a D&M footnote. The serious rivals all deliver coarse-to-fine conformity:
- Roberts-style strategies with common-ground update;
- Ninan's "request to continue guessing", which R itself adopts;
- conditional questions.

So this is a correct point against a straw rival. The real discriminator is the raffle, which does not favour R (§1.6).

### 1.9 Smaller accuracy points (bar item 7)

- **Ninan's open question.** "Answering Ninan's open question" overstates. Ninan gives a tentative answer: "It's not completely clear, but it is plausible that such utterances are proposals to add to the common ground the proposition that the speaker believes [ϕ]c" (p. 5). R's "something a later request can continue from" is compatible with that answer and does not compete with it. The Gavriil passage (p. 4) is accurately described.
- **D&M fn 6.** The claim that the fn 6 follow-up is "So"-marked comes from the canon check. The core reader's extract did not show it. Verify it against the PDF.
- **Teague.** "WTP/PTW hold for continued answers by construction" is trivial. The solitary-inquiry extension ("self-posed follow-ups work the same way") is asserted, not argued.
- **Order prediction.** This is Gold & List path dependence; say so.

---

## 2. Contribution

**In one sentence:** guesses may jointly serve as the basis for further guessing only if every subset's conjunction is a permissible guess at the join of the questions answered; otherwise one continues from a largest such subset and flags what one contradicts.

**Against bar items 1–3.** The hostile summary is accurate:
- Fang §4's Conjunctive Filtering moved from holding to use;
- D&M's "reason within your guess" (p. 34) and Ninan's "continue guessing";
- the exception clause to Lin & Kelly's pooling impossibility;
- Rescher–Manor/Benferhat maximal subsets for the fall-back.

Partition-relative closure theorists (Leitgeb, Lin & Kelly) would give standing as the first answer to "when can question-relative acceptances be pooled?". The payoffs are footnotes and puzzles from five recent papers.
- **Bar 1:** a nominal pass; the work is mainly reply.
- **Bar 2 (philosophical problem, not a narrow bug):** fails.
- **Bar 3 (generalist appeal):** fails.

**The candidate framings:**
- **Reasoning from attitudes that do not agglomerate.** The general slogan ("closure governs use, not possession") belongs to Foley, Kyburg and Cohen. The only new layer is the question-relative join, which is internal to guessing, and §1.2 shows it misfires in its home domain. Selling this framing would not be honest.
- **Working hypotheses in inquiry.** This would need Bratman, Cohen on premising, Friedman on inquiry, and Staffel on transitional attitudes. R's machinery is about polar-question dialogues and has no account of solitary inquiry. Not honest either.
- **The lottery and preface family.** The raffle is a lottery in dialogue form. It adds an instance; it does not offer a new view of the family.

---

## 3. The custodian's two requirements

**(a) More than a reply to Fang?** Somewhat more than round 1, since Ninan and D&M p. 34 supply a frame. But its tests are Fang's fn 36, Teague's puzzle, and D&M and G&H footnotes, so a referee will place it inside the 2022–2026 guessing debate. **Not met.**

**(b) Does it handle the raffle well?** It gets the extreme right (k = 59: "A, I know I said no") without a cost parameter, which is its best feature. But:
- its distinctive raffle predictions sit where intuition is silent (§1.6);
- the condition that blocks "#60" also blocks "Stanford" after two Latif "no"s (§1.2).

Handling the raffle by a mechanism that breaks the simplest elimination chain is not handling it well. **Not met.**

---

## 4. Nearby variants

I see none that is worth a round.
1. **Graded standing** (a threshold or a locatability cost). This is the pretest's PREDICTED family.
2. **Standing plus conditional questions.** The raffle comes back unless a graded absurdity condition is added, which is variant 1 again.
3. **A "dilemma for joint use" note.** The argument would be that any binary, parameter-free condition fails either elimination chains or the raffle, so joint use of guesses needs a graded trigger. That is true and easy to show from §1.2–1.3. It is a negative result inside the same narrow debate, and its conclusion supports the predicted view. It would be a footnote-sized observation.
4. **Experimental work.** Only data (Knobe–Yalcin-style judgements on elimination chains, raffle length, flagging) would be unpredicted, and this format cannot supply them.

**Abandon the guessing topic.** This is the third round in which the mechanism resolved into known parts:
- Round 1: Stalnaker–Roberts dynamics; Gold & List path dependence; greedy decoding.
- Round 2: Levi's boldness and Quillien et al.; k-wise consistency; Icard and Koriat; then Levi 1991 contraction and Walton–Krabbe concessions.
- Round 3: Fang §4, Lin & Kelly, and Rescher–Manor.

The reason is structural: the dialogue data are graded. A parameter-free rule is novel but wrong (§1.2); a parameter-laden rule fits but is predictable.

---

## 5. Screening prediction

**NOT READY.**

Assume a well-executed version with an honest neighbour map and 25+ references.
- **Item 4 (major objection unanswered).** A referee who knows the area will run a two-step elimination within minutes, because it is the obvious first test of any condition on joint use. Finding "Stanford" forbidden and "Harvard, I know I said no" licensed is fatal.
- **Item 4 again.** The disjunctive fn-36 case forces the report/answer reclassification that Fang rejected.
- **Items 2 and 3, even with those fixed.** The paper solves a problem that exists only inside the recent guessing literature: which of my question-relative guesses can I build on jointly. Its closest neighbours (Fang, Lin & Kelly, Foley/Kyburg) make the main condition look like the default answer.
- **Item 1, at the margin.** The paper reads mainly as a reply to Fang 2026, Teague 2024 and D&M's footnotes.
- **Item 7.** The Ninan framing would need toning down.

Best estimate: desk rejection for narrowness and an unanswered counterexample.

*Checked:* Ninan 2026 local text, pp. 3–5. Lin & Kelly, Leitgeb, Foley, Cohen and D&M p. 34 are taken from the canon check, not re-read; the verdict does not depend on them.
