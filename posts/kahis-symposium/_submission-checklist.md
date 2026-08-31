# Pre-submission checklist (second pass)

Mechanical checks that already pass: every citation key in both files resolves against brian-quarto.bib; every @sec-/@tbl- cross-reference has a matching label; the précis/reply dominance tension is now reconciled by the footnote in the odds section (checked: it does square the two texts); précis typos from the first pass are all fixed.

## Fix before sending (small, definite)

- [X] reply 52: "in the vicinity of what this word gets picked out" → "in the vicinity of what this word picks out"
- [X] reply 86 (invalidity paragraph): "just that that *p* is among" — doubled "that"
- [X] reply 98: "I'll end with McGrath's last point" — it's his *second* point (the running order is 3, 1, 4, 2). Say "with one more of McGrath's points" or name it ("with his discussion of odds and stakes")
- [X] reply 104: "knoweldge loss"
- [X] reply 131: "desscribe"
- [X] reply 169: "McGrath's comments here puts him" → "put him"

## Accuracy checks (verify, then fix or leave)

- [X] **The Confession footnote (reply 145) may misstate her.** Her fn 3 ("Confession. This needn't be so bad?") is attached to the claim that S *shouldn't reason from p to evidential probability 1* — so the most natural reading is that she's confessing the *banned reasoning* might be OK (flirting with the other horn of McGrath's dilemma), not that the *knowledge-loss results* might be OK, which is what your footnote says. Reread her footnote in context and reword to match — or make the footnote note the ambiguity and claim her for your side explicitly.
- [X] Same footnote: "footnote 3" is fragile — her piece is a dated draft and footnote numbers can shift in production. "In a footnote" is safer.
- [X] "the murderous Morse" (reply 161) — still unverified that Friedman's detective in "Inquiry and Belief" is named Morse.
- [X] "@Friedman2019b 85" (reply 161) — page for "First, checking is inquiring" checked against the preprint only (p. 3 there); confirm 85 against the published version.
- [X] reply 124, Anisa's hypothetical speech: "I could take either sentence" then "Guess my only option is red" — the hypothetical claim (permissibility of either) and the conclusion (red is the *only* option) talk past each other slightly. Consider "either play would be rational" / "Guess it's red."
- [X] reply 126: "This case shows that even hypothetical stakes matter for knowledge" — "stakes" is the word the odds section spends two paragraphs demoting. "Hypothetical choices" or "hypothetical interests" avoids handing a reviewer the juxtaposition.
- [X] reply 124: Anisa enters unintroduced (the reply's own red-blue description never names the player). Fine if the reply is typeset after Friedman's piece, which it will be — but a two-word gloss ("Friedman's Anisa") is cheap insurance.

## Length (reply is ~4,550 words of body against a ~3,000 target)

Trim candidates, in order of how little they'd be missed:

- [ ] reply 50–52: the flashlight/archives paragraph and the "two bigger questions" paragraph overlap with the synthesis paragraph at 54 — merging 50 and 52 saves ~120 words without losing a move
- [ ] reply 94: first two sentences restate the conclusion of 92; the paragraph could open at "Put another way, Das's real point was about individuation" (~70 words)
- [ ] reply 161: of the four reasons checking is inquiry, the third ("same movements") is the weakest and the fourth is inside-baseball plus a footnote; the appeal to Friedman plus the flashlight case carry the point (~80 words + footnote)
- [ ] reply 171: the closing paragraph re-derives what the section opener already said; could be halved (~60 words)
- [ ] reply 86: last sentence ("There are tricky questions here...") is a hedge the paragraph survives without (~35 words)

That's ~400 words of low-cost trimming; if the editors' limit is hard, the next candidate is compressing the two-paragraph constitutive coin/ebook discussion (92) into one, but that costs real content.

## Before rendering/sending

- [ ] Render both PDF and HTML and check: the ($\star$) tag displays in both; the grid table (167) fits the PDF text width; "Miščević" survives the PDF engine
- [ ] When flipping draft to false / publishing: run a full `quarto render` at the project root (single-file renders no longer refresh the blog index)
- [ ] draft: true is still set in both YAML headers — flip when appropriate
- [ ] The reply cites the précis (odds footnote) and the précis is cited nowhere in the bibliography — fine for a symposium, but confirm the journal wants cross-references between the two pieces handled this way

## Consciously skipped (recorded so future-you knows it was deliberate)

Understanding cases sentence; "why keep the probability extension" coda; Lewis in the bottom-left cell; précis principle footnote (line 68); "two phenomena unified one level up" sentence; MacFarlane/assessment-sensitivity footnote; McGrath's completed-games variant and iterated bets; Friedman's shelved question about alethic criticism.
