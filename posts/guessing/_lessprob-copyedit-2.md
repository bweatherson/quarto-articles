# Copyedit comments, second pass: "Guessing the Less Probable"

Line numbers refer to `lessprob.qmd` as of 24 October 2026. Every quoted phrase was checked against the file. Items from the first pass that you chose not to take are not repeated.

## Summary

- Errors: 4
- Suggestions: 6
- Borderline (default drop): 3
- Sections with comments: introduction, §1 Guess the Order, §2 Follow Up Guesses, Conclusion
- §3 is clean.

Most of the new material is in §1, and that is where the items cluster: the new paragraphs on Condorcet ordering and expected places have left some cross-references and enumerations pointing at the wrong things.

## Errors (apply as tracked changes)

- Line 42, principle: "given one's credences, to the question" → "given one's credences, to the question." The full stop at the end of the principle has gone missing.
- Line 185, §1: "or the maximise the expected number" → "or to maximise the expected number".
- Line 185, §1 (footnote): "lower than second most probable" → "lower than second-most probable". The same footnote hyphenates "second-most probable" a line earlier.
- Line 282, §2: "or if it is a structured guess the highest expected accuracy" → "or, if it is a structured guess, the highest expected accuracy". The conditional is parenthetical and needs commas on both sides.

## Suggestions (send as comments)

### §1. Guess the Order

- **Find: "But that's a surprising guess for at least two reasons."** (line 160) — enumeration. The section now gives three reasons to prefer ABCD: mean quality (line 162), expected pairs (line 164) and expected places (line 182). Line 182 introduces the third with "Finally", but four more paragraphs follow it, the last of which also opens "Finally" (line 193). → Change line 160 to "for at least three reasons", and open line 182 with "Third, although it is very close, guessing ABCD also maximises…".
- **Find: "no matter which numbers we put in @tbl-pair-match"** (line 180) — cross-reference. The numbers a modeller chooses go in the quality table; the pair-match table is the output. → "no matter which numbers we put in @tbl-quality".
- **Find: "One team will be guessed to finish higher than another iff the probability that they finish higher is above 0.5."** (line 180) — pronoun. "They" can be read as both teams together, which makes "finish higher" meaningless. → "One team will be guessed to finish higher than another iff the probability that it finishes higher is above 0.5."
- **Find: "Here is a parallel to the arguments of the last two paragraphs."** (line 189) — cross-reference. Since the new paragraphs were added, the two paragraphs before this one are the summary (line 185) and the general claim (line 187). The arguments being paralleled are the accuracy arguments on lines 180–182. → "Here is a parallel to the accuracy arguments above."
- **Find: "(and see the references from two sentences ago)"** (line 191) — cross-reference. The references (Yablo, Fine, Berto) are now three sentences back. → "(and see the references above)".

### Conclusion

- **Find: "as many parts of the questions as they can"** (line 346) — number. The paragraph is about a single question ("When presented with a question"). → "as many parts of the question as they can".

## Borderline (default drop; listed for your call)

- **Find: "by their mean expected quality"** (line 185) → "by their mean quality", matching line 180. *Thin because:* "mean expected" is redundant, not misleading.
- **Find: "her estimate of their quality has a very high variance"** (line 126) → "her credence about their quality has a very high variance". Strictly, a distribution has a variance and an estimate does not. *Thin because:* every reader will understand it.
- **Find: "verisimilitude or partial truth. The argument"** (line 193) → "verisimilitude and partial truth. The argument". "Two reasons … verisimilitude or partial truth" lists two items with "or". *Thin because:* "or" can be read as listing alternatives.

## Note on house style

Unchanged from the first pass: about 70 contractions, and the model description still alternates between "we" (lines 132, 143) and the impersonal "this paper uses" (line 130), while elsewhere you use "I".

## Notes beyond the copyedit

- **A general claim that needs an argument (line 180).** "In this case, and indeed in any model with this structure no matter which numbers we put in…, the guess which orders the teams by their mean quality will be a Condorcet winner." It is true here: at 1,000,000 seasons every pair finishes in mean order more than half the time, and the closest pair is C above D at 0.564. But "in any model" is a stronger claim than the simulations show. Whether one team finishes above another depends on both teams' results against everyone else, not just on their own quality difference, and with unequal variances the symmetry argument is not immediate. Either add the argument or narrow the claim to this model.
- **`\newpage` on line 134.** This is raw LaTeX, so it only affects the PDF; the HTML and Typst versions ignore it. Forced page breaks usually go wrong after later edits, so it is best left until the final layout.
- **Fixed directly: the quality table was misreporting D's mean.** Your new D mean of 1.55 was shown as "1.6" because the table rounded to one decimal place. I changed that table to two decimal places.
