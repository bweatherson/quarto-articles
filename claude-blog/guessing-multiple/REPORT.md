# Parked: a paper on conversations with multiple guesses (2026-10-20)

Outcome: abandoned at step 2 of the staged process (idea -> advisor -> draft -> Q&A -> revise -> paper -> screening)
after two advisor rounds. BW chose to change topic. This folder records what was done so it can be picked up.

## What was tried
1. **Line-of-questioning view** (idea-memo-v1.md): each later guess is made on the supposition that earlier guesses
   are right, so guesses/weak beliefs are relative to an ordered line of questions; predicts conformity and path
   dependence. Advisor 1 (advisor-report-v1.md): flawed. Fang 2026 §6.2 and fn 36 consider and reject it; the
   conversational data follow from Stalnaker-Roberts context-set dynamics; path dependence is a corollary of Gold &
   List 2004 and of greedy (chain) decoding; the composite-assessment rationale recommends answering the joint
   question afresh; a 60-ticket line (A .40, sixty tickets .01) makes it recommend "#60 will win".
2. **Slate of three** (idea-memo-v2-slate.md). Advisor 2 (advisor-report-v2.md):
   - *Guesses as search instructions* (name every answer likelier than 1/n): FLAWED. It is Levi 1967 at boldness
     q = 1 (quoted in Dorst & Mandelkern fn 13); Quillien et al. 2025 already fit a threshold model at theta = 3 and it
     lost. My refit of their Study 2 data omitted the attention-check exclusions; on cleaned data the compression model
     wins by ~88 NLL units (code/refit.py, code/perurn.py are the advisor's corrected scripts).
   - *Pairwise coherence of guess sequences*: FLAWED/EXPECTED (60-ticket problem returns with "So who will win?";
     k-wise consistency is Kyburg/preservationist; payoff close to Incurvati & Schlöder 2019).
   - *A guess as a property of an answer distribution* (humans, LLMs): EXPECTED (Icard 2016; Koriat 2012;
     self-consistency = MBR decoding).
   - Conditional suggestion B': a guess creates a faultlessly retractable commitment (conform when cheap, retract
     when costly). Gated on Ninan 2026 (Analytic Philosophy 67(2)) and Mackenzie 1987 "I guess" (AJP 65(3)), both
     paywalled and unread. Ceiling "interesting, not surprising"; needs experimental data.

## Data points that seemed genuinely new to the literature (per advisor 1)
"Will Latif go to Yale? No. So where? Harvard." (unfiltered on the where-question); "Who did it? The butler. With
what? The knife, then."; unmarked "No" through a raffle line; the two orders of the murder case.

## Reading done (notes in research/)
Fang 2026 (full, incl. footnotes); Teague 2024 (preprint, full); Pearson 2025 (preprint, full); Hoek 2025 (§§I-IV, VI);
Holguín 2022 and Goodman & Holguín 2023 (assistant, full); Horowitz 2016 draft (assistant); Dorst & Mandelkern 2022
(assistant, extracts); Holguín 2025 draft on toggling (WebFetch extracts); Quillien, Bramley & Lucas 2025 (partial) and
their OSF data. bibliography-report.md: 60 Crossref-checked items on guessing (2015-2026).

## Lessons for the next topic
- In a crowded recent literature with formal neighbours, check each mechanism against neighbouring fields (decision
  theory, ML, discourse dynamics, social choice) before calling it new.
- Independent checks catch errors in one's own analyses (the exclusions mistake).

## Round 3 (2026-10-21): "standing" -- abandoned at step 2
BW asked for a return to guessing meeting two requirements: more than a reply to Fang; handle advisor-1's raffle.
- **Gate.** Ninan 2026 and Mackenzie 1987, supplied by BW, did not pre-empt the project.
- **Blind pretest.** The "priced commitment" version was judged PREDICTED.
- **New candidate R.** Guesses can be continued from only when they "stand": the conjunction is a permissible guess at the join of their questions, hereditarily, with a cardinality fall-back.
- **Canon check.** PARTLY ANTICIPATED: Fang s4, D&M "reason within your guess", Lin & Kelly 2012, Foley/Cohen, Rescher-Manor.
- **Advisor 3.** FLAWED, on a two-step Latif elimination: R forbids the natural "Stanford". The advisor recommends abandoning the topic: the data are graded, so a parameter-free rule is wrong and a graded one is predictable.
- Files are in round3/ plus idea-memo-v3.md and advisor-report-v3.md.
