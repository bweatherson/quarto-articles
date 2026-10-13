# Scouting report: Fang, "Guessing and Its Limits" (PPR 112(3), 2026) and the papers it cites

Date: 2026-10-13. Task: starting from Fang's paper and working back through its references, find a question for which a novel answer could be defended in a paper. Outcome: **no candidate judged SURPRISING; the project was parked.** This folder records what was found so it can be picked up again.

Status of the evidence: the three scout reports in `scout-reports/` were written by reader agents, several of whom lost page-level locations after context compaction, and none of whom read everything on their list. Quotations are not citable until checked. The code in `code/` was run by the scout and the main results (below) were reproduced from its output, but I have not re-run it.

## 1. Fang's paper in brief
- Target: **Guessing** (Holguín 2022; Dorst & Mandelkern 2022): given a question Q (a partition), you may believe p iff p is a union of the k most probable cells of Q (Weakness, Question-Sensitivity, Optionality, Filtering).
- **Independent Closure**: if you may believe q given Q and r given R, with Q and R probabilistically independent, you may believe q∧r given the product question QR.
- **Filtering Failure** (Prop. 2): the rectangle q×r is generally not an upper set in the joint probability order, so Guessing forbids a conjunction it should allow. Example: races {A,B,C}, {D..H}; "(A,D) or (A,E)" omits the more probable (B,D).
- Responses considered and rejected: add "Conjunctive Filtering" (undesirable by the naturalness challenge, §4); reject Independent Closure by Lottery/Coinflip analogues (fails because the questions are not independent, or because the all-heads answer is the modal cell; §5); appeal to question-shifts (§6.2). §7: belief camp vs credence camp; extends to Carter & Hawthorne's normality.
- Fang's references (54) are in `code/fang_references_crossref.json` (Crossref).

## 2. What the reading established
**Which belief rules satisfy cross-question closure?** (scout_normality; code `ic.py`, `search.py`)
- *Mass/rank rules* fail the belief form of closure (the region believed on QR must lie inside the product of the regions believed on Q and R): Goodman & Salow's rule, Carter & Hawthorne's Def. 3, Leitgeb's stability theory, Guessing. Clean example: Q = R = (.85, .10, .05), t = .9; each believes {1,2}; the rectangle has mass .9025, but the region on QR includes (1,3), (3,1) (mass .0425 each) and excludes (2,2) (mass .01). Random draws: failures in about 26%; exhaustive search over multiples of 1/20: the first failing case is Q = (17,2,1)/20, R = (16,3,1)/20, t = 9/10.
- *Ratio/margin rules* (believe the cells within a fixed ratio of the most probable; cf. Lin & Kelly) pass: 0 failures in 20,000 draws. Log-ratios add across independent factors.
- Leitgeb: the rectangle of two stable sets is stable on the product only if the probabilities are high enough (.9/.1 yes; .7/.3 and .6/.4 no).
- *Trilemma* (question-sensitive ordering, a THRESHOLD floor on the believed region's probability, cross-question closure): two regions each with mass ≥ t have product mass about t² < t. G&S and Leitgeb keep THRESHOLD and give up cross-question closure. This is the lottery paradox structure.
- Goodman & Salow, Leitgeb and Carter & Hawthorne deny cross-question closure on purpose (contextualism about the live question). Fang's "the problem extends" is formally right but is a feature for them.
- A probable slip in the Carter & Hawthorne preprint (Fact 1 counter-model range) is noted in scout_normality; the published version may differ. Unchecked.

**Question-sensitive theories and coherence across questions** (scout_questions)
- No source fixes a view on QR from views on Q and R. Yalcin has none; Hoek says "Yalcin posits no such constraints" (OUP chapter, fn. 9). Hoek's principles run downward (Harmonic Parts, Closure under Parthood); Partial Adjunction is limited to nested questions. Beddor & Goldstein get agglomeration by stipulating one global decision problem. For Hoek, failures of Independent Closure are a feature.
- Gap noted by the scout: no one has a positive account of what coherence across questions requires short of closure.

**The Guessing cluster itself** (scout_guessing)
- Holguín's Best Guess Account assumes one operative question at a time. Rothschild 2020 treats closure of "believe" as "a basic datum of natural language inference" and never mentions question-relativity. Teague 2024 (Divide and Conquer; Part-to-whole is closure-like) and Pearson 2024 (Conditional Weakness vs Closure; fn. 15 on collective permissibility) are close neighbours and both cite Hoek. Linnemann & Azhar 2024 (Pareto front of accuracy and informativity; variance addition for composite estimates) and Skipper 2023 (log-specificity; its additivity over independent questions may help Fang's opponents) change the value function.

## 3. Candidate questions considered (all judged unpromising)
| # | Candidate | Verdict |
|---|---|---|
| 1 | Reply-type: Guessing on a composite question should filter by coordinatewise **dominance** (include a cell only if you include every cell that is at least as probable in every coordinate), not by joint probability. Conjunctions of filtered answers are then exactly the permitted down-sets; reduces to Filtering for one question; permits "(A,D) or (A,E)" since (B,D) and (A,E) are incomparable. | A real but likely EXPECTED reply to Fang; priority unchecked (neither Fang's §4-6 nor the follow-up literature was searched for this move). Not derivable from Dorst & Mandelkern's expected-value maximisation, so needs independent motivation. |
| 2 | The closure "datum" for "believe" (Rothschild, Hawthorne et al.) is a question-shift datum: it holds only when the conjunction is a top cell of the salient question. | Fits the successful type (assumption in one literature challenged by a principle from another). No tested minimal pair; main risk is silent accommodation. Closest to promising. |
| 3 | What is weak belief for? (plan-region selection vs best guess) | Overlaps Beddor 2024 (settling) and Goodman & Holguín (Deciding). Likely a repackaging. |
| 4 | Permissibility of guesses is collective, not distributive (Pearson fn. 15, die cases). | Reply to a recent exchange; high risk. |
| 5 | Conjunctive guessing is estimation under propagated uncertainty (Fermi estimates, variance addition). | Known formula applied to a new case; EXPECTED. |
| 6 | Cross-question closure holds exactly for margin (ratio) rules; characterisation. | Known formula (Lin & Kelly) plus a reply to Fang. Drop. |
| 7 | Trilemma of THRESHOLD, question-sensitivity, cross-question closure. | Lottery-paradox structure; accepted by the authors already. Drop. |
| 8 | Guessing violates Hoek's Harmonic Parts. | Probably Fang's own Closure under Parthood. Drop. |
| 9 | Apparent failure of Independent Closure is an artefact of the decoder in Quillien et al.'s lossy-encoding model. | Closest to a new idea, but a known formula (KL additivity) applied to a new case. |
| 10 | Dorst's per-proposition thresholds and question-sensitive views are the same move (comparative). | Survey; EXPECTED. |

## 4. Why parked
The cluster is a tight formal literature whose open problems are mostly replies to one another; the pattern from the earlier inquiry drafts (reply to a recent exchange, or known formula plus application, ends up EXPECTED) applies. Candidate 2 is the most generalist-friendly but lacks a tested minimal pair.

## 5. If this is picked up again
- Check priority for the dominance-filter move (candidate 1): search for follow-ups to Fang and for "product order" or "pareto" treatments of multi-question guessing; read Fang §4–6 and her footnotes (not captured).
- Read what was not read: Clarke 2022, Yablo (Aboutness), Quillien & Lucas 2022, Linnemann 2025, Hoek's OUP chapter pp. 39–44, Goodman & Salow's Phil Review paper (the scouts used the EPTCS versions), Hong 2023 beyond §2.1, Weatherson 2005 (cited by Fang; how she uses it is unknown).
- Unexplored directions from Fang's reference list: Foley (Lockean thesis), Kyburg 1961, Sturgeon (Reason and the Grain of Belief), White (permissivism), Williamson (Expansive Epistemology), Horowitz (Epistemic Consequentialism).
- Verify every quotation in the scout reports against the sources before any use.
