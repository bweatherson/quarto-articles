# claude-blog: What This Directory Is and How Papers Are Judged

## The project

Each subdirectory here is a philosophy paper written by Claude, as a Quarto document in the same format as the papers in `posts/`. The papers are in-house: nothing in this directory is linked from any public page, and nothing here should be added to the index or any other public-facing file. Writing-style constraints that apply elsewhere in the repository do not apply here; the papers should read as Claude's own work, not as an imitation of anyone else's.

Each paper directory contains the `.qmd`, its `.bib`, a `_NOTES.md` recording how the paper was produced (sources read, checks run, dead ends, human input), and the screening reports (`_screening-report-vN.md`) written against the standard below. Supporting code (searches, numerical checks, proof-assistant developments) lives alongside. Keep the notes current: they are the record of what was done, and they will be needed if the paper goes anywhere.

Feedback on the papers should be honest. Do not call something good unless it is.

## The standard

Every draft is screened as a generalist philosophy journal would screen a new submission, and gets one of four verdicts. There is no target distribution.

1. **NOT READY** (a journal's desk reject). The paper has one or more of the problems listed under Screening Criteria below, serious enough that expert review would not be productive.
2. **PASS** (a journal's pass to an area editor). The paper has a substantive positive contribution that you can name in one sentence, but you cannot fully assess its quality or fit without sub-area familiarity. "Competent and well-written" is not a positive contribution. PASS means the paper has plausibly cleared the bar; it does not mean the question has been deferred.
3. **PASS, FORMAL** (a journal's referral to an editor with formal competence). The paper clears the bar and its central argument is formal, so the full assessment has to engage the formal work directly. Concrete triggers: the central argument uses probability axioms, decision rules, modal or other logics, axiomatic ethics, formal semantics with a probabilistic or game-theoretic core, mechanism design, social choice, or model-based explanation of group-level behaviour. Generic "this touches epistemology" does not qualify; the paper has to actually *do* the formal work.
4. **STRONG** (a journal's direct send to referees). The paper is clearly strong enough that you would be surprised if expert readers recommended rejection.

The working target for a paper in this directory is that it would not be NOT READY under a hostile reading, and that the verdict survives at least two independent screenings of the final text.

## Calibration notes

**Why these notes exist.** Screening that promotes papers because they *have virtues*, rather than because they *lack decisive flaws*, lets through far too much. A paper with a clever idea and an unanswered objection its author could see is not ready, however clever the idea. That is the lesson to keep.

To stay calibrated:

- **Default stance is skepticism.** Actively look for reasons to fail the paper before considering whether to pass it. Most papers written for a generalist audience are too narrow, too reactive, or too incremental for one. That is not a criticism of the paper; it may be fine for a specialist venue.
- **Ask the right question.** Read each paper asking "Has the author given me a concrete positive reason, something I could state in a single substantive sentence, to send this to expert readers?" Not "is there anything wrong with this?" but "is there something specific that's right?" If the best answer is "it's competent," the answer is NOT READY.
- **Don't praise table-stakes.** Clear writing, organized structure, competent engagement with the relevant literature, engaging real cases, addressing the obvious objection: these are entry requirements, not reasons to pass. If the only positive things you can say about a paper are that it meets the minimum bar, that is grounds for NOT READY. The same applies to "the topic is broadly interesting": if the paper's *execution* doesn't deliver a substantive contribution, the topic doesn't save it.
- **Stop passing the buck.** If your report contains phrases like "an expert should weigh," "turns on whether," "depends on closer reading," or "a specialist's judgment is appropriate," rewrite. The call is yours to make. If you have identified a critical problem, let it count toward NOT READY. PASS is for cases where you genuinely cannot resolve the question of substance without sub-area familiarity, not for cases where you have identified a problem and are uncertain whether it is decisive.
- **Generalist appeal is the hardest bar.** Ask: "Would a philosopher outside this subfield find the *problem itself* interesting, even if they wouldn't follow every technical detail?" That is the right question, not "would every philosopher read this?" Papers about important questions (free will, the nature of knowledge, what we owe each other, the limits of logic) have generalist appeal even when the treatment is technical. Papers whose interest depends on caring about a specific recent exchange do not. The test is whether the *question* is broad, not whether the *answer* is accessible to everyone. If you find yourself writing "generalist appeal is borderline," that is itself a strike against passing; the paper has not made the case.
- **"About a problem, not a literature" is strict, but not infinitely so.** If the paper's introduction frames its contribution as "X argues P, Y argues Q, I argue R," that is a literature paper. A problem paper starts from a philosophical puzzle that would exist even if nobody had written about it recently. But a paper can engage closely with recent work and still be problem-driven. The question is whether the recent work is the *occasion* for the paper's argument (fine) or the *subject* of it (not fine).
- **The central test: could the author have seen it?** Fail the paper when the decisive flaw is one a careful author could have seen before finishing, and especially when the paper itself raises the problem and defers it (to a footnote, to "beyond the scope", to future work), or when the paper's own examples, tests or concessions undercut its thesis. Pass it when the remaining problems are ones that only an expert reader in the sub-area would find. Nobody should be doing editorial service for a paper its author has not finished; papers with the first kind of flaw tend to come back with the flagged problem addressed in a few paragraphs and not resolved. Papers with the second kind of flaw are what expert reading is for.
- **Borderline = no concrete fault, only uncertainty about contribution magnitude.** If you can articulate a specific failure (literature-driven framing, incrementality over the author's own prior work, footnote-deferred handling of a major objection, thesis deferred to future work, generalist appeal contingent on caring about a specific exchange, "can be used" / "is compatible with" as the central claim) that is grounds for NOT READY, not PASS. PASS is reserved for cases where you cannot tell whether the paper's contribution is substantive without sub-area familiarity, *and* you cannot point to a concrete failure that would settle it.
- **STRONG is rare.** Most good papers are PASS, not STRONG.
- **A formal paper is not exempt from any of this.** A correct theorem, a verified counterexample, or a clean model is a reason to look closely, not a reason to pass. The paper still has to say what the result shows about a philosophical question, in words a reader outside the subfield can assess, and that claim is what gets screened. "We prove that…" is a method, not a thesis.

## Screening criteria

These are the things to look for when deciding among the four verdicts. A paper that clearly fails on any one of these should normally be NOT READY; borderline cases should be PASS only under the conditions above.

1. **Positive contribution.** The paper should advance a substantive thesis of its own. Papers that are primarily commentary on, or replies to, a small existing literature are NOT READY.
2. **About a problem, not a literature.** The paper should address a philosophical problem, not a bug or gap in a narrow recent debate. (History of philosophy is fine; the qualifier is "recent." Engaging closely with historical texts or arguments is not the same as responding to a recent exchange.)
3. **Generalist appeal.** The paper should be interesting to a reasonably wide range of academic philosophers, not only to specialists deep in one debate. If a paper's interest depends on caring about the fine-grained details of a specific exchange, it belongs at a specialist venue.
4. **No obvious unanswered objections.** If a major, well-known objection to the paper's thesis is not addressed, the paper is not ready.
5. **Length justified by achievement.** A paper that is long relative to what it accomplishes (especially over 10k words) should be flagged. Sharp trigger: papers over 10k whose central thesis can be paraphrased as "X can be Y" or "X is compatible with Y" or "X may help to Z" rather than "X is Y" are NOT READY by default. The bar to escape is that the conditional or compatibility result is itself surprising. Modesty signals ("future work will show," "this paper merely argues that," deferring the substantive payoff to a later section that never arrives) compound the length problem.
6. **Clarity and citations.** Unclear writing or obviously inadequate engagement with the relevant literature is grounds for NOT READY. Sharp trigger: bibliographies under 25 items for a paper engaging a contemporary debate are a strong NOT READY signal; the paper should be doing more than reacting to its own slim reading list. Heavy self-citation where the central thesis is from the author's prior work (with the new paper offering an extension or application rather than a substantively new claim) is also a NOT READY signal under Criterion 1.
7. **Accuracy.** Every quotation must match its source verbatim, every attribution must be one the cited author would accept, and every claim about what a cited work does or does not establish must have been checked against the work itself, not against a summary or a memory of it. A paper whose central claim depends on a characterisation of a source that has not been read in full is not ready. Bibliographic data should be verified against a registry (Crossref or the publisher) before a draft is called final.

## Priority and antecedents

A paper written by a language model is at particular risk of presenting as new an idea that exists in the literature under another name, or a model that someone has already written down for a different purpose. Before a draft is called final, for each idea the paper presents as its own, search for antecedents, read the closest candidates in full rather than by abstract, and state in the paper what the closest prior work is and exactly what the paper adds to it. If the search turns up a near relative, that is not a reason to hide it; a paper that locates itself precisely relative to its nearest predecessor is stronger than one that appears to be unaware of it, and a reader who knows the predecessor will notice either way. Record the search in `_NOTES.md`.

## Report format

### For all verdicts: header

- Paper title
- Word count
- Thesis summary (2-3 sentences max)
- **Verdict:** NOT READY / PASS / PASS, FORMAL / STRONG

### For PASS: brief note

After the header, write a short paragraph (100-200 words) explaining why the paper is not an obvious fail and what an expert reader should pay attention to when assessing it. That is all that is needed.

### For NOT READY, PASS FORMAL, and STRONG: full report

The report should be a focused ~800-1000 word critical evaluation structured as follows:

#### Deal-breakers (only if present)
Skip this section entirely if there are no problems. Don't write "PASS" for each criterion. Flag only failures against the Screening Criteria above.

#### Key strengths (3-5 bullets max)
Most important positive features with brief evidence.

#### Key weaknesses (3-5 bullets max)
Most significant problems with brief evidence.

#### Critical issues for revision (if applicable)
Priority items the author must address (3-5 max, numbered). Skip for NOT READY.

## Guidelines for reports

- Make each point once, in the most relevant section. If you find yourself writing "as mentioned above," delete and consolidate.
- Only mention something if it affects the verdict. Don't note that the paper is a reasonable length, is well-formatted, or has proper citations; only flag these if they're problems.
- **Don't praise table-stakes in the PASS brief.** "The writing is clear," "the literature engagement is competent," "the structure is orderly," "the case studies are real": these are not reasons to pass, they are the minimum to escape NOT READY on Criterion 6. If you find yourself listing these as reasons not to fail the paper, ask whether you can name a concrete positive contribution instead. If you cannot, the verdict should be NOT READY.
- Don't restate the paper's argument after the thesis summary, and don't repeat the same criticism across Weaknesses and Revision Priorities (put the diagnosis in Weaknesses, the fix in Revision Priorities).
- Note overall quality of literature engagement and key gaps only; don't catalogue every work cited.
- The screening is of the paper as written, by a reader who has not seen it being produced. Where possible, have the screening done by a fresh context that has not seen the drafting, and screen the final text, not the penultimate one.
