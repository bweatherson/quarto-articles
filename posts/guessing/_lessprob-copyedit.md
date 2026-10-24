# Copyedit comments: "Guessing the Less Probable"

Line numbers refer to `lessprob.qmd` as of 23 October 2026. Every quoted phrase was checked against the file.

## Summary

- Errors: 13
- Suggestions: 11
- Borderline (listed for your call, default drop): 6
- Sections with comments: introduction, §1 Guess the Order, §2 Follow Up Guesses, §3 Guesses with Incoming Information
- Body word count: about 3,000

## Errors (apply as tracked changes)

- Line 30, principle: "that answer is appropriate iff it is the most probable answer, given your credences, to the question" → "that answer is appropriate iff it is the most probable answer, given one's credences, to the question". The principle opens with "one"; "your" switches person mid-sentence.
- Line 32, introduction: "Matthias" → "Mattias". Skipper's first name has no h.
- Line 110, §1: "a simple four team league" → "a simple four-team league". Compound modifier before a noun.
- Line 120, §1 (footnote): "`Home team' here is just the first listed team." → "'Home team' here is just the first listed team." The LaTeX-style opening quote prints as a literal backtick in both the HTML and the PDF.
- Line 162, §1: "is that guesser cares about" → "is that the guesser cares about". Missing article.
- Lines 228–231, §2: "Host: Who will win this group?" The four dialogue lines are consecutive `>` lines, so they render as one run-on paragraph. End each of the first three lines with a backslash, or put a `>` line between them.
- Line 263, §2: "if it is a structure guess" → "if it is a structured guess".
- Line 267, §2: "one thing in general that expert could do" → "one thing in general that the expert could do". Missing article.
- Line 275, §3: "Three of them, N, O and P are very good" → "Three of them, N, O and P, are very good". The appositive needs a closing comma.
- Line 275, §3: "if it hits the track will be" → "if it hits, the track will be". Without the comma the clause reads as "hits the track" on first pass.
- Line 275, §3: "O is a flat-track bully; able to sprint" → "O is a flat-track bully, able to sprint"; and "P is a mudlark; able to churn" → "P is a mudlark, able to churn". A semicolon needs an independent clause on both sides.
- Line 315, §3: "and they say (5)" → "and they say (5)." The sentence has no closing period.
- Line 319, §3: "In context where it is obvious" → "In a context where it is obvious". Missing article.

## Suggestions (send as comments)

### §1. Guess the Order

- **Find: "there are 20! combinations"** — word choice. A combination is an unordered selection, so there is exactly one combination of all 20 teams; the 20! things are orderings. → "there are 20! possible orders". (Line 265 already says "20! orderings".)
- **Find: "If the absolute value of that is less than 1.2"** — pronoun. "That" picks up the nearest noun, the noise term, but the draw rule applies to the quality difference plus the noise. A reader following the model will apply the threshold to the wrong quantity. The same goes for "it's" in the next sentence. → "If the absolute value of the result is less than 1.2, the game is a draw. Otherwise, if the result is positive the home team wins, and if it is negative the away team wins."
- **Find: "We can also ask whether the actual order of the teams matches"** — sentence. "The actual order of the teams" reads as the order of all four, but the measure being introduced is pairwise. → "For each pair, we can also ask whether the actual order of those two teams matches the order the expert predicted for them."
- **Find: "(For example, when asked to guess who will win the group, when it is best to say"** — sentence. The parenthesis has no main verb: it is two "when" clauses with nothing for them to modify. → "(For example, when asked to guess who will win the group, when is it best to say A, and when is it best to say something less committal like A or B?)"
- **Find: "anything that g entails with the same subject-matter"** — precision. A conjunct does not have the *same* subject-matter as the conjunction; its subject-matter is part of the conjunction's. As worded, the principle excludes the conjunct-to-conjunction case it is meant to license, and the pair orderings with it. → "anything that g entails whose subject-matter is part of g's".

### §2. Follow Up Guesses

- **Find: "conditional on the previous guesses being correct"** — number. There is only one previous guess (that E wins), and the next sentence calls it "the earlier guess". → "conditional on the previous guess being correct".
- **Find: "The philosophical picture here is that when asked to make a series of guesses"** — transition. Line 247 promises "a few moves", and the paragraphs present the first (E) and the second (G) as options. F is never put forward as the third option, but line 265 introduces "a fourth option" and line 267 refers to "the third". → Open this paragraph with "So the third option is to say F." 
- **Find: "There is a fourth option, which isn't quite inconsistent with the previous versions."** — word choice. "Versions" has no antecedent; the preceding paragraphs list options. → "There is a fourth option, which isn't quite inconsistent with the previous ones."
- **Find: "apart from noting it suggests that"** — pronoun. The nearest candidate for "it" is the fourth option in the previous paragraph, but the intended referent is the case as a whole. → "apart from noting that the case suggests that".

### §3. Guesses with Incoming Information

- **Find: "Finally, and this is where I'm borrowing most heavily from Moss, she might be in a situation where"** — sentence. Two main clauses ("she might be in a situation where…" and "it seems she can say…") are joined only by a comma, after a 50-word stretch of conditions. → "Finally, and this is where I'm borrowing most heavily from Moss, suppose it is common ground that there is a substantial probability both that the storm will hit and that it will pass us by, that this fact is relevant to the win probabilities, and that O is a flat-track specialist while P is a mudlark. Then it seems she can say (3) as a way of expressing what she would say more explicitly as (2) or (1)."
- **Find: "by switching a disjunct with higher probability"** — sentence. "With higher probability" can attach to "switching" (switching more probably) or to "a disjunct" (a more probable disjunct), and on neither reading is it clear what is swapped for what. → "by swapping one of its disjuncts for a more probable complete answer, namely N".

## Borderline (default drop; listed for your call)

- **Find: "They use a standard epistemic utility model to model these decisions"** (line 164) — "model … to model" within four words. → "They model these decisions with a standard epistemic utility model." *Thin because:* the repetition doesn't obscure anything.
- **Find: "This answer is not obviously optimal for similar reasons to why guessing ABDC was not obviously optimal."** (line 253) — repeated phrase in one sentence. → "This answer is not obviously optimal, for much the same reasons that ABDC was not." *Thin because:* the sentence is clear as it stands.
- **Find: "of finishing at least second"** (line 253) → "of finishing in the top two". *Thin because:* "at least second" is correct, just slightly harder to parse.
- **Find: "It's a less probable guess than guessing N"** (line 319) → "It's a less probable guess than N". *Thin because:* the extra "guessing" is redundant, not wrong.
- **Find: "seems weird enough that it permits alternative answers"** (line 32, footnote) — "it" is the most probable answer, which doesn't itself permit anything. → "seems weird enough that alternative answers become permissible". *Thin because:* the intended meaning is easy to recover.
- **Find: "talking about the upcoming seasons"** (line 108) → "talking about the upcoming season". *Thin because:* the plural may be meant to cover every year's edition.

## Note on house style

Four recurring choices, each better made once:

- **Contractions.** About 70 ("doesn't", "it's", "I'm", "Let's"). Fine for a blog post; expand them if this goes to a journal.
- **"I" and "we" in the model description.** Line 118 has "I modelled" and lines 120 and 129 have "we start", "we then simulated", "we used", "we measured". Pick one.
- **Spelling.** British throughout (generalise, modelled, randomiser, maximise) except "panelists", three times (lines 108, 133 and 135); British is "panellists".
- **Italics for answers.** Some answers are italicised (_A_ and _A or B_ on line 164, _E_ on line 247, _P_ and _ABCD_ on line 323) and others are not (ABCD, ABDC, G, F elsewhere). Choose one convention.

## Note on content (outside the copyedit, flagged because it's checkable)

Line 174 says Dorst and Mandelkern "immediately cite Yablo as a source" for verisimilitude. In their footnote 15 the verisimilitude citations are Popper, Oddie and Schoenfield; Yablo is cited separately, for intuitions about *partial truth*. That actually helps your point, since partial truth is the containment notion you want, so it may be worth rewording to say they mention partial truth, citing Yablo, alongside verisimilitude.
