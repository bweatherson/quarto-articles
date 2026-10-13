# Notes: The Oracle Never Says Yes

## Human input
The only human input: a request for a paper on "philosophical questions about inquiry", and the information that it would be screened by an agent. No input on content.

## What the paper claims (after correction)
Original brief: counts are fixed by the hypothesis class, not oracle quality. Corrected: the *worst-case* count is class-fixed; a particular oracle can do much better (random counterexamples: ~ln n vs n-1 adversarial for single-feature analyses). Certification is always relative to a class (Kelly). The learning-theory results (Angluin, Littlestone, Hanneke-Livni-Moran) are not new; the paper's additions are interpretive (see "Closest prior work").

## Sources and how read
Downloaded and read (full text, with varying care; I cannot certify line-by-line reading of every one): Angluin 1988; Littlestone 1988; Weatherson 2003; Chalmers 2015; Plato Meno and Theaetetus; Mill, Logic (relevant chapters); Gettier 1963. Freivogel (Synthese 2023) downloaded, not cited.
Read in part: Hanneke-Livni-Moran 2021 (main theorems and definitions; not all proofs). SEP entries on analysis, formal learning theory, concepts (consulted, not cited).
NOT read in full / abstract or secondary only: Zagzebski 1994 (PDF-only, text extraction failed; characterised from the standard account and abstract -- the paper's description of her recipe should be checked); Kelly 1996, Kelly-Schulte-Juhl 1997, Kelly 2007, Gold 1967 (abstracts/SEP summaries only); Vlastos 1982 (Crossref shows a 4-page piece; read only its bibliographic record); Weinberg-Nichols-Stich, Turri et al. (abstracts); Williamson 2000 and Shope 1983 (not read for this paper; cited for well-known positions); Glymour-Kelly "Thoroughly Modern Meno" (could not locate or read; mentioned in the text as unread).
Bibliography: 19 entries, fewer than the ~25 asked for; not padded.

## Checks run (code in this directory)
- exact_tables.py / exact_results.txt: exact minimax refutation counts (proper and improper) on named small classes and 145 random classes. Improper == Littlestone dimension in all; proper >= max(Ldim, K*-1) in all; proper <= Ldim*K never violated; max proper/Ldim ratio observed 2.0. (K* computed by my own irredundant-cover search; qlib.py.)
- sim_oracles.py / sim_results.txt: single-feature analyses to n=1024 (proper adversarial n-1, improper adversarial floor(log2 n), random ~ ln n-ish), monotone conjunctions (adversarial = number of wrongly included features, random much smaller), unrestricted Boolean (2^n adversarial). A first run failed an assertion because the adversary's target was randomised rather than the last survivor; fixed.
- probes.py: single-flip probes find a conjunction's relevant features in n queries and fail on a two-term DNF (masking).
- Not run: a tripwire demo and twin-pair demo (the text states the tripwire bound by argument, backed only by the conjunction simulation). The paper says only what the code shows.

## Dead ends / changes of mind
- Replaying JTB->Gettier as a feature encoding: dropped; any encoding is arbitrary, so numbers would be artefacts. The paper says so.
- First K* implementation (3^m enumeration) too slow; replaced.
- Early version of the thesis ("counts depend on class, not oracle") is false as stated; corrected above.
- A K* example in the first draft used n+1 cases; the minimal set is n cases (fixed).
- Brief said Freivogel 2024; Crossref says Synthese 202 (2023). Not used.

## Closest prior work and the addition
Closest: Angluin 1988 (equivalence queries, proper/improper), Littlestone 1988, HLM 2021 (proper bounds via dual Helly number), Kelly (learning-theoretic epistemology; refutability; Ockham efficiency), Weatherson 2003 (counterexamples and simplicity). Possible unread near relative: Glymour & Kelly, "Thoroughly Modern Meno".
Addition (all interpretive, no new theorem): (1) K* read as largest minimal set of jointly intolerable verdicts and as the certificate size for refuting a vocabulary; (2) proper/improper contrast applied to the demand for a definition, and community-as-ensemble; (3) what the Gettier sequence's length does and does not show; (4) stopping rule must come from a class restriction (tripwire). I did not find (1)-(4) stated, but the search is incomplete.

## Limitations of the antecedent search
The shared web-search budget was exhausted during the work, so priority search was limited to the named candidates and Crossref/arXiv lookups. No literature search for prior applications of learning-from-queries to conceptual analysis was done beyond that. This must be redone before the paper goes anywhere.
