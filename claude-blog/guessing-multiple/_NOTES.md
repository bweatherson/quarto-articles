# _NOTES: paper on multiple guesses (working title TBD)

Started 2026-10-20. Process requested by the human custodian (BW): a staged, human-like workflow:
(1) idea from research; (2) advisor agent (reject or reading list + points to address);
(3) rough draft; (4) "talk" to 10 audience agents, one suggestion each; (5) triage
(ignore/incorporate, loop to 4 or 2, or abandon -> alert BW); (6) proper Quarto paper,
< 6000 words, checked .bib; (7) screening per claude-blog/CLAUDE.md; loop as needed.

## Human-input log (classified against competition FAQ permitted/prohibited lists)
- 2026-10-20, BW: topic choice: "the recent literature in philosophy on guessing, and in
  particular ... a conversation where someone is asked to make multiple guesses."
  PERMITTED (choosing topic).
- 2026-10-20, BW: the process (advisor, Q&A, screening, loop rules), the 6000-word limit,
  "check the citations carefully". PERMITTED (methodological instructions / scaffolding).
- 2026-10-20, BW: offer to obtain paywalled papers. PERMITTED (providing source materials)
  -- if used, record which.

## Tooling notes
- Agents cannot be given a sampling temperature; variety in step 4 is obtained by persona,
  focus and model (opus/sonnet/haiku/fable), independent contexts.
- Background: claude-blog/guessing-scouting/REPORT.md (parked 2026-10-13; Fang 2026 and
  Independent Closure). Used as background only.

## Log
- 2026-10-20 14:xx: core-reader agent report received (saved as research/core-reader-report.md).
  Fang 2026 NOT readable by agent (Cloudflare). Key finds: D&M fn 6 'stickiness'; G&H fn 24
  ("Asking the questions in immediate succession tends to force the second answer to conform
  to the first"); Holguin 2022 s9.2 London-then-Germany, explained by semantic blindness;
  Teague 2024 WTP/PTW/DAC; Pearson 2025 Analysis 85(2) 'A puzzle about weak belief' (CBGA,
  fn 15 collective permissibility); Horowitz suppositional guesses; Horowitz book ms
  'Guesswork' (Princeton, forthcoming; MEW 2026 chapters).
- Idea v1 ("One Guess at a Time": guesses relative to a line of questioning, conditional on earlier guesses;
  path dependence) -> advisor v1 (fresh agent, web access): VERDICT (A) FLAWED. Reasons: Fang s6.2/fn36 already
  considered and rejected it (reads as a reply to Fang); conversational data follow from Guessing + Stalnaker-Roberts
  context-set dynamics; path dependence is a corollary of Gold & List 2004 (path dependence iff implicit
  inconsistency) and of greedy decoding (classifier chains); composite-assessment rationale recommends answering the
  joint question afresh; 60-ticket line (A .40, sixty tickets .01) -> '#60 wins'; bootstrapping. Report saved as
  advisor-report-v1.md. Back to step 1.
- Step 1 (round 2): explored (a) search/where-to-look model of guess informativity, fitted to Quillien et al. 2025
  Study 2 OSF data (code/fit_quillien*.py; data/quillien/); (b) pairwise-coherence norm for guess sequences;
  (c) answers as samples: humans (crowd within) and LLMs (self-consistency, greedy decoding). Also read Hoek 2025
  (§§I-IV, VI), Teague (preprint, full), Pearson (preprint, full), Holguín 2025 draft (toggling) via WebFetch.
  Brought a slate of three (idea-memo-v2-slate.md) to a fresh advisor (round 2), asking for verdicts on each and a
  choice of at most one. [Process note: slate rather than single idea -- recorded for methodology report.]
- Advisor round 2 (advisor-report-v2.md): A FLAWED (1/n rule = Levi 1967 at boldness q=1, quoted in D&M fn 13;
  Quillien et al. already fit a theta=3 threshold model and it lost; MY FIT WAS WRONG: I did not apply the study's
  attention-check exclusions -- on cleaned data (66 ppl, 13 urns) compression beats the search rule by ~88 NLL units);
  B FLAWED/EXPECTED (60-ticket problem returns with "So who will win?"; k-wise consistency is old; payoff close to
  Incurvati & Schloder 2019, maybe Ninan 2026); C EXPECTED (Icard 2016, Koriat 2012; Wang et al./MBR). Advisor offers a
  conditional B' ("a guess creates a faultlessly retractable commitment"), gated on reading Ninan 2026 and Mackenzie
  1987/1990; ceiling "interesting, not surprising"; needs experimental data or undisputed minimal pairs.
  Lesson recorded: an error in my own data analysis (no exclusions) was caught only by the independent advisor.
- Gate for B': Ninan 2026 (Analytic Philosophy 67(2): 182-191, doi 10.1111/phib.12375) -- paywalled, no preprint
  found; Mackenzie 1987 "I guess" (AJP 65(3): 290-300) -- paywalled, no abstract. Both unread. Stopped and alerted
  BW (as instructed for possible abandonment) with options: supply the two papers and run the gate / change topic.
- 2026-10-20, BW (via multiple-choice prompt): chose "Change topic, workshop new subject". Guessing project
  ABANDONED at step 2 after two advisor rounds. PERMITTED (topic choice / selecting among outputs).
  Lessons for next topic: (1) crowded recent literatures with formal neighbours (decision theory, ML, discourse
  dynamics) turn mechanisms into "known formula + new case"; (2) priority-check the mechanism in neighbouring
  fields, not just in philosophy, before advisor; (3) my own data analysis needs an independent check (exclusions).
- 2026-10-20, BW: asked Claude to scout three new subjects first ("Let me scout three subjects first"). PERMITTED.
  Guessing folder committed to claude-blog/guessing-multiple/ (REPORT.md + notes, memos, advisor reports, code).

## Round 3 (resumed 2026-10-21, after scouting rounds 2-3 failed)
- 2026-10-21, BW (multiple-choice free text): "I want you to go back to guessing, and see if you can come up with
  something that (a) looks like more than a reply to Fang, and (b) can handle the really good lottery case the
  advisor came up with." PERMITTED: choosing topic + methodological/generic requirement. Note: the lottery case
  (A .40 + sixty .01 tickets; the line view recommends '#60 will win') was generated by Claude's advisor agent
  (advisor-report-v1.md §3.3), not by BW; BW names it as a requirement, supplying no argument, distinction or
  counterexample of his own.
- Starting point: advisor v2's conditional B' (a guess creates a faultlessly retractable commitment; conform when
  cheap, retract when expensive), gated on Ninan 2026 and Mackenzie 1987 (unread; BW can supply). Process this
  time: depth-first (read the gate + canon first), blind predictability test, canon check, then advisor.
- Blind pretest (opus; round3/pretest-G-X.md): PREDICTED (its family 2, rank 2 at .25; = advisor-2's B' + Levi 1991
  value-priced contraction + Walton & Krabbe retractable concessions). MY ERROR: the prompt's Phase-2 questions named
  the mechanism, so Phase 1 was partly contaminated (tester flagged it; says it would rank it top-two anyway).
  Decisive points: (1) 'sister polar questions don't bank' fails both ways (3-ticket 'no,no,no' marked; banking-with-
  price makes D3's #60 'no' marked); what separates them is LOCATABILITY of the conflict (size of minimal inconsistent
  set: 2 vs 60), a speaker-side fact (cf. Hunter & Konieczny 1/|M|; Kyburg weak consistency -- old). (2) retraction
  cost is a free parameter on these data (uptake held constant). (3) D3's critical turn is hedged ('probably not') --
  test bare 'No'. (4) D4 has a third option ('not A, no idea which') -- retraction = choosing which commitments to drop
  (AGM/Levi). (5) guess/assertion asymmetry unsupported (retracted items are bare 'No's). Tester's best thesis:
  cross-turn coherence is a defeasible commitment OWED TO THE HEARER who builds on it (grows with reliance), not a norm
  on thinking; marked retraction only when the conflict is locatable. Must test with uptake/new-hearer minimal pairs.
- My refinement candidate (H): the cross-question coherence data the guessing literature treats as norms on the
  attitude of thinking (D&M fn 6, G&H fn 24, Holguin 9.2, Teague, Fang) are facts about public, audience-relative
  commitments of guess-answers; private inquiry shows no such pressure; a new hearer frees the speaker. Gate papers
  (Ninan 2026; Mackenzie 1987) requested from BW; canon check after they arrive.
- 2026-10-21 12:18, BW supplied Ninan 2026 and Mackenzie 1987 (BW: author is Jim Mackenzie). Both READ in full
  (round3/texts/). PERMITTED (providing source materials; papers requested by Claude per advisor-2's gate).
  * Ninan 2026 (Analytic Philosophy, 'The Strength of Assertion', online 2025, 10pp): guessing vs information-seeking
    contexts differ on 5 dimensions; Dimension 1: a guess does NOT propose to add [phi] to the CG (possibility
    principle: 'Joe will win ... Sue might win instead' needs no repair; question principle: follow-up questions
    presupposing the guess are odd 'unless ... interpreted as a request for B to continue guessing'); 'not completely
    clear' what a guess adds -- plausibly 'speaker believes phi'; no testimonial knowledge; strong-vs-weak assertion
    largely terminological. NOTHING on sequences of guesses, conformity, or retraction profiles.
  * Mackenzie 1987 (AJP 65(3): 290-300): Hamblin-style system IGD: 'I guess that P' commits ONLY the speaker
    (not hearer) and puts P in the speaker's 'balk' store (cannot later assert or defend P unless another party or
    Nature removes it); if challenged ('Why P?') the guesser must withdraw. So a guess move with commitment and a
    withdrawal rule exists (gate condition partly met), but NOTHING on conformity of later guesses, costs, or
    sequences.
- Gate verdict (mine): B' 'faultlessly retractable commitment' is PARTLY pre-empted (Mackenzie: speaker-only,
  withdrawable guess commitments; Hamblin/Walton & Krabbe concessions). The priced-conformity mechanism is
  PREDICTED (blind pretest). Best remaining version: answer Ninan's explicit open question ('what does a guess
  add?'): guesses update a public guess record (the guessing game's scoreboard), not the CG; 'So'-questions are
  requests to continue guessing relative to that record (Ninan notes this reading in passing); the record is
  revisable without fault, and the 60-ticket line forces revision. Risk: guess record = Farkas & Bruce speaker
  discourse commitments + Mackenzie; mechanism for when revision is required remains the predictable part.
- 2026-10-21 (after gate): the hearer-directed version looks false or untestable here (private inquiry shows the same
  tension: "I know I thought no"; uptake data unavailable). New candidate R ("standing"; round3/candidate-thesis-R.md):
  so-questions request continuation; one may build only on a set of guesses whose conjunction is a permissible guess
  at the join of their questions; otherwise fall back to the full meet of maximal standing subsets (= fresh when
  empty) and flag explicit contradictions. Checked in round3/code/standing.py (Filtering): D1 Harvard, D2 knife,
  D6 UK, D&M fn6 'yes', D5 Yale; raffle stands iff k<=20, 'So who?' -> 'one of the rest' (k<=20) / 'A, I know I
  said no' (k>=21); tester's variant -> 'Harvard or Stanford'. No cost parameter. Self-assessment: a relative,
  parameter-free precisification of the tester's family 1 (commitment store + absolute trigger), so possibly
  'partly predicted'; the new content is the join-relative standing condition, the derived selection of which guess
  is dropped, and the stickiness + raffle refutation of priced views. Reported to BW. Canon check (opus agent,
  expert persona) launched -> round3/canon-R.md.
- Correction (my error, caught on re-check while drafting idea-memo-v3): I told BW that R "refutes any cost-based
  trade-off" because stickiness and the raffle need incompatible costs. Wrong: if the polar question in D&M fn 6 is
  read against the sticky where-QUD, conforming 'yes' costs nothing. The priced view is not refuted; it needs a
  parameter and diverges from R in prediction (raffle 'So who?' at k<=20: priced -> 'A'; R -> 'one of the rest').
  Memo softened; tell BW in next report.
- Canon check R (opus; round3/canon-R.md): PARTLY ANTICIPATED, not dead. Neighbours: D&M 'Good guesses' concluding
  section ('reason within your guess', so-follow-ups); Ninan; Fang s4 Conjunctive Filtering (R = CF moved from holding
  to use); Lin & Kelly 2012 Synthese 186 ss13-14 (join; pooling impossible; don't condition on acceptances); Foley
  2009 p.41 / Cohen 1992 / Bratman 1992 / Kyburg limited adjunction / Incurvati & Schloder 2019 Weak Inference
  (use-possession split); Rescher-Manor, Benferhat et al. (maximal subsets). Defects found: (1) standing as first
  defined is not hereditary, and full meet can fail to stand (6-animal counterexample) -> FIXED by hereditary
  standing; (2) max-cardinality ties at k=21; (3) my code used Latif .30/.28/.22/.20, not published .38/.30/.20/.12
  -> rechecked in standing2.py, results unchanged; (4) raffle argument only hits content-adding CG accounts; (5) I5
  (priced views) has no published target -> footnote. Paywalled to read before writing: Leitgeb 2017; Foley 1993 ch4;
  Cohen 1992. Ceiling per canon: 'interesting, not surprising'.
- idea-memo-v3.md rewritten (hereditary standing, cardinality fall-back with permissive ties, precise relations to
  prior work, softened claims). Advisor round 3 (fresh opus agent) launched -> advisor-report-v3.md.
- Advisor round 3 (fresh opus; advisor-report-v3.md): VERDICT (A) FLAWED; recommends abandoning the guessing topic.
  Decisive: two-step elimination with D&M's published Latif numbers (Y .38, H .30, S .20, N .12): 'No' to Yale,
  'No' to Harvard, 'So where?' -> natural 'Stanford'; {notY, notH} does not stand (S or N .32 < Y .38 at the join),
  so R forbids 'Stanford' and (via the cardinality tie) licenses 'Harvard, I know I said no'. Verified by me
  (one-line check). R's own continuation does not preserve standing. Repairs go back to the line view (#60) or to a
  threshold (= the PREDICTED priced/locatability family). Also: the fn-36 rescue works only for single-cell guesses
  ('A or B' + 'D or E' fails); cardinality fall-back depends on how questions are carved; ties license incompatible
  answers of different probability; three-ticket auxiliary unprincipled; switch point sits where intuition is flat.
  Structural diagnosis: the dialogue data are graded; a parameter-free rule is novel but wrong, a parametric rule
  fits but is predictable. Screening prediction: NOT READY.
- My errors this round (for the methodology record): (1) I did not test the simplest elimination chain (two "no"s)
  before sending R out, although standing2.py's own output for the four-"no" case already showed {notY,notH} failing;
  (2) I overclaimed to BW that R refutes cost-based views (corrected before the advisor); (3) first formulation of
  standing not hereditary (canon check caught it). Lesson: before any advisor, run a 'simplest-case battery' on a new
  rule: one, two and three steps of the paradigm dialogue, with the published numbers.
- Decision: per BW's instructions (abandonment -> alert BW and workshop a different subject), I agree with the
  advisor's recommendation to abandon guessing and am alerting BW rather than retreating to step 1 on this topic.
