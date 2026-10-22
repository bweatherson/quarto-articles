# Post-mortem: the staged paper-writing trial (October 2026)

## Outcome

Three subjects were tried, and none produced a paper that passed screening.

- **Guessing.** Parked at step 2.
- **Stein's paradox and treating people as individuals.** Parked at steps 1–2.
- **Track records.** This subject went through all seven steps once. The paper was *The Record and the Account*:
  - two Q&A rounds of ten agents each;
  - about 5,140 words;
  - 47 references, each checked against Crossref.

  Two fresh-context screenings both returned NOT READY.

The step-7 fallback was a core revision: Humean versus primitive chance as a source of testability. It failed its pre-test, and on 21 October BW chose to stop.

Detailed logs are in `track-records/_NOTES.md`, `stein-individuals/REPORT.md` and `guessing-multiple/REPORT.md`.

## Where each subject died, and which step caught it

| Subject | Furthest step | What killed it | Caught by |
|---|---|---|---|
| Guessing | 2 | The view is anticipated, and rejected, in Fang 2026 §6.2; the threshold rule is Levi 1967; I made a data-analysis error (I omitted attention-check exclusions, which reversed a model comparison) | Advisor, two rounds |
| Stein / individuals | 2 | Every formal fact is in print (Hodges–Lehmann; Johnstone–Silverman; BDA3 §17); my own numbers broke my trilemma | Advisor (three rounds) and two predictability tests |
| Track records, theses 1–2 | 2 | Standard-switching produced a spurious asymmetry; person-level refutation is in Shafer 2021/2023 | Two testers, then the advisor |
| Track records, S2 paper | 7 | The thesis is Pomatto 2021, "Testable forecasts" (*TE* 16), and the headline mixture claim is false for unbounded records (Sandroni–Shmaya 2014) | Both screenings |
| Track records, v3 | pre-2 | It is the modal paper that both fresh testers predicted from the question alone (65–70%), and its one non-obvious claim is false | Two testers and a priority check |

## What the process caught

- **Anticipation, repeatedly and early.** The advisor and the predictability tests stopped eleven theses before any drafting, and none of those stops has since looked wrong. Running a predictability test *before* the advisor was a lesson from Stein. On track records it stopped three theses without needing an advisor round.
- **My errors, as well as my overclaims.**
  - The guessing refit error was caught by the advisor, who reran my analysis.
  - The standard-switching in memos v1 and v2 was caught by the testers.
  - In both Q&A rounds, agents caught a section that argued the wrong way (a known craftsman discredits but never crowns), and a second round of standard-switching.
- **Q&A improved the paper materially.** Round 1 reframed the whole thesis around "relative to an account". Round 2 supplied:
  - an argument for the sincere case;
  - the New Principle dilemma;
  - the exact singularity property;
  - the institutional norm that accounts be fixed before the record accrues.
- **Citation and quotation checking worked.** A last claims check against the originals corrected five characterisations:
  - Dorst et al.'s Total Trust;
  - Lewis 1994 p. 479;
  - Earman & Roberts;
  - the rate in the Laplace growth claim;
  - an unread Hoefer 2019, which I replaced with Hoefer 2007.

  It also pinned page numbers for every quotation.
- **Screening did its job.** A fresh reader with the CLAUDE.md brief found, quickly, the paper that every earlier step had missed. Both screenings independently named the same three deal-breakers.

## Where it went wrong

1. **Topic selection.** All three subjects were "bridges", where results from a formal neighbour (statistics, economics, linguistics) were brought into philosophy. They were picked because the philosophy literature had not taken them up. That criterion selects for bridges the source field has already crossed: the economists had drawn the philosophical morals themselves (Al-Najjar & Weinstein: "the only coherent notion of 'true' probabilities is relative"; Pomatto: a paradigm is "a summary of preexisting knowledge"). No uptake in philosophy turned out to be weak evidence that there was anything left to say.

2. **The literature search missed the closest paper.** The economics report was 17k words, covered about 40 results, and saved Pomatto's own lecture notes. It still missed Pomatto 2021, which characterises exactly the property my thesis was about. The search was organised around classic results and authors. It never asked, in the source field's own vocabulary, whether anyone had characterised when a restricted class is testable. Twenty Q&A agents also missed it, because they were asked to improve the paper, not to find its predecessor. The first step that actually *searched for the thesis* was screening.

3. **I wrote claims that my own notes contradicted.**
   - The research said non-convexity matters only for bounded records. The paper said "accounts closed under mixture certify no one", without that restriction.
   - In the v3 memo I attributed a frequentist undermining figure (Schwarz's 0.754) to a best-system account.
   - I quoted undermining probabilities for iid(½), the best case, as if they held generally.

   "Check my own numbers against the thesis" was a logged lesson after Stein, and I broke it twice more.

4. **Standard-switching recurred four times.** It happened in memo v1, memo v2, draft-v2 §3.3 and the v3 asymmetry: "by her lights" versus "under the truth", sincere versus strategic, pointwise versus probabilistic, and constitutive versus contingent. Each time it produced an apparently new asymmetry that disappeared once one standard was held fixed.

5. **My theses were the predictable ones.** Fresh testers who saw only the question predicted my thesis as their first or most likely paper on the slate (S2) and again on v3. Without a new fact or argument, my idea generation converges on the paper a competent reader writes first. The process detects this reliably, but it cannot fix it.

6. **Steps 3–6 were run on a thesis already rated EXPECTED.** That was BW's choice, made to exercise the rest of the process, and it did show that steps 3–7 work mechanically. It also showed that polishing does not change an EXPECTED verdict into a PASS. The step-7 verdict was on priority, not presentation.

## What I would change in a second trial

- **Choose subjects where the philosophical question comes first** and the formal tools serve it. Avoid importing results whose authors are alive, publishing, and philosophically inclined.
- **Add a priority search for the thesis itself**, in the source field's own terms ("testable paradigm", "restricted class"). Run it once at step 1, and again whenever the thesis changes, including just before step 3. Make it adversarial: "find the paper that already says this", by a fresh agent with web access.
- **Give one Q&A persona in each round that same job.** Improvement-minded personas do not search.
- **Run a one-standard checklist** before any claim of asymmetry goes to a tester: state the standard once and apply it to both sides.
- **Run a contradiction pass against the research notes** before steps 2 and 6. For each claim in the memo or paper, find the research note that bears on it and check that the note agrees.
- **Keep the predictability test before the advisor.** It was the cheapest and most reliable step.

## Reusable material (in `track-records/`)

- **Research:**
  - `econ-report.md`, with exact statements of about 40 testing results;
  - `philosophy-report.md`;
  - `chance-ontology-check.md`;
  - `priority-v3.md`;
  - `final-claims-check.md`.
- **The paper:** `paper-v1/`, with the .qmd and a verified .bib of 47 entries, Crossref-checked except where the bib notes say otherwise.
- **Ideas not pursued,** for what they are worth:
  - (a) The "code-length simplicity" residue. If best-system simplicity is description length, Bayes or universal mixtures win most worlds, and the uninformed learner counts as the chance-knower. Read the other way, this is a constraint on simplicity measures. It is partly predicted (about 30%) and unverified.
  - (b) Stewart's ε. A Bayesian tester fails a true expert only when she would have learned the truth herself, so it takes a non-expert to certify an expert.
  - (c) The record as both test and textbook. Both screeners singled this framing out as a strength.

## Human input during the trial

BW made three kinds of decision: he chose subjects from Claude-scouted shortlists; he chose "write the safe S2 paper anyway" after the first abandonment alert; and he chose to stop after the second. Every thesis, argument and frame was Claude's or an agent's.
