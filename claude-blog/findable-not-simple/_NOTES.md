# Notes: Findable, Not Simple

## What the paper claims

One sentence: the premise induction needs from the world is that its regularities be findable by feasible methods, not that they be short; the two come apart under standard cryptographic assumptions, so the Solomonoff/Occam/Kelly justifications carry a contingent findability premise (stated exactly, for the class of feasible laws, as the negation of the existence of one-way functions), and feasible credences cannot be more accurate than a coin flip where it fails while the ideal credence is nearly perfect (Proposition 3).

Word count (title + abstract + body + footnotes, pandoc plain text with citeproc, bibliography suppressed, section cross-references expanded): 5,489. TeX in the displayed formulas is counted token by token, so the true count is slightly lower. There are no footnotes.

## Formal claims and what is conditional

- Prop 1 (unbounded inquirer, m = k + c): unconditional; a counting argument.
- Prop 2 (no feasible distinguisher): this is the definition of a pseudorandom generator; conditional on one-way functions (equivalent by HILL 1999). Stated as the assumption, not as my result.
- Prop 3 (feasible credences have Brier inaccuracy >= 1/4 - negl; ideal <= 2^-c): mine; follows from Prop 2. The algebraic identity B = 1/2 - E_U[c(1-c)] - Delta + delta/2 was checked numerically on random finite distributions (5 random cases, exact agreement to 1e-12). The remaining steps are by hand. A randomised credence procedure is covered because the two tests (accept w.p. c, accept w.p. c^2) are run on a single run of the procedure.
- The dichotomy in section 6 (findability for every feasible law, on average over the law's randomness, iff no one-way functions) is Impagliazzo-Levin 1990 as reported by Liu-Pass 2020 (I read Liu-Pass's description, not the 1990 paper). The paper credits it to them and claims only the reading.
- Constants for the (dropped) approximate-posterior corollary: within 0.3 on 7/8 of each hypothesis's mass with c >= 3 gives advantage >= 5/8. Not in the paper because Prop 3 is stronger.

## Checks run (code: findable_demo.py; results: findable_demo_results.json; log: findable_demo_log.txt)

Full run, seed 20261012, about 560 s. All numbers in the paper come from this run.
- Brute force over a d-bit seed (SHA-256 counter mode as stand-in PRG), d = 12..24 step 2: seed recovered in every trial (3-6 trials per d); full-scan time 0.002, 0.01, 0.04, 0.175, 0.655, 2.58, 10.57 s; no false match in the chance world. The "five years" for a 48-bit seed is 10.57 s x 2^24, an extrapolation.
- False-match rate vs data length at d = 12 (3,000 random chance strings per n): 0.229, 0.054, 0.013, 0.0033, 0.001 at n = 14..22 against 2^(d-n) = 0.25, 0.0625, 0.0156, 0.0039, 0.00098.
- Learners (logistic regression, gradient boosting, MLP 128-64, predicting the next bit from the previous 48; 200,000 bits, 80/20 split; test n = 39,991): hash d = 24: 0.501, 0.501, 0.500; uniform random: 0.499, 0.500, 0.501; LFSR L = 24 (48-bit seed) with 3/5/7/11/15 taps: logreg 0.50 throughout, gboost 1.00/0.69/0.60/0.51/0.60, MLP 1.00 throughout.
- Berlekamp-Massey: L = 12, 20, 64, 256, 1024 recovered from 2L bits, exact prediction of the next 2000 bits in every case, 0.001 to 0.32 s. For L = 12 and 1024 the recovered linear complexity was below L (8 and 1020): a random register can have lower linear complexity than its state size.
- Geffe: L = 8..16 all recovered; work 3*2^L against 2^(3L) (L = 16: 196,608 against 2.8e14).

None of this proves anything about pseudorandom generators; SHA-256 in counter mode is not a proven PRG.

## Surprises and changes of mind

- I expected generic learners to fail on LFSR streams. They did not: the MLP learns even dense 15-tap parities from a 48-bit window with 160,000 training bits, and gradient boosting learns sparse ones. The paper reports this and draws the moral that findability is relative to the method class. Logistic regression fails, as expected for parities.
- A draft sentence said simplicity is "not the premise at all"; it was cut back after a read-through, since simplicity still governs sample complexity, which the paper now says.
- Read-through fixes: a draft said chaotic systems have "nearby states with nearby futures" (wrong: sensitive dependence); corrected to a smooth one-step law. Added the point that experiment (adaptive queries) does not escape the barrier, via pseudorandom function families, and the point that indirect evidence works by importing side information.

## Sources: what was read and how

Read as full text in hand (arXiv/author PDF converted to text), claims in the paper limited to the passages named:
- Aaronson 2013 (arXiv v3, 2011 text; the published chapter has the same title; section number 7.1 is from the arXiv text): read the introduction and section 7 (7.1, 7.2); the rest skimmed. Used only for the 7.1 claims (PRF learning impossible given PRGs; PAC theorem silent on finding the hypothesis).
- Aaronson 2005 (quant-ph/0502072): read the NP Hardness Assumption passage and its setting; used for one sentence.
- Eagle 2005 (journal PDF): read the abstract, section 4.2 and section 6 (the rejection of the pseudo/genuine split, "randomness by design"). Not read end to end.
- Barrett and Huttegger 2020 (philsci-archive preprint dated 20 Aug 2019): read the abstract and introduction; claims limited to those. The published version could differ.
- Kearns and Valiant 1994: introduction only (JACM text); claims limited to it (cryptographic hardness of learning; relation to GGM).
- Werndl, "Determinism and Indeterminism" (preprint of the Handbook chapter): read the abstract, contents, section 2.2-2.3 passages on finite-precision observational equivalence and indirect evidence. Laudan and Leplin are mentioned only as Werndl reports them; Laudan and Leplin not read.
- Rathmanner and Hutter 2011 (arXiv): read section 9.1 and the passages with the error bounds (K(mu) ln 2 + O(1)) and incomputability. Not read end to end.
- Garrabrant et al. (arXiv v5): read the abstract, the definition of pseudorandom sequences (4.4.1) and Theorem 4.4.2, and the exploitation criterion.
- Liu and Pass 2020 (arXiv 2009.11514): read the abstract and introduction, including the report of Impagliazzo-Levin universal extrapolation.
- Nanashima 2021 (PMLR PDF, first 8 pages: abstract and introduction); claims limited to the heurPAC dichotomy as stated there and the remark that hard-to-learn "random" concepts seem empirically rare. Pages 1-43 per the PMLR header.
- Daniely, Linial, Shalev-Shwartz 2014 (arXiv 1311.2272): abstract and introduction; used for one clause about improper learning hardness being established under average-case assumptions.
- Shalev-Shwartz, Shamir, Shammah 2017 (arXiv 1703.07950): read the parity sections; used for the statistical-query/gradient failure on parities.
- Lin, Tegmark, Rolnick 2017 (arXiv 1608.08225): abstract and introduction; used for the statement that the paper is about expressibility and efficiency, not learnability.
- Harlow and Hayden 2013 (arXiv 1301.4504): abstract, introduction, and the decoding-time passages.
- Schmidhuber, Algorithmic Theories of Everything (quant-ph/0011122): abstract, introduction, Example 1.1 and the section 7.5 claim that apparent randomness reflects short and fast pseudorandom generators. Not read end to end.
- Peirce, "A Neglected Argument for the Reality of God" (Wikisource transcription of the 1908 Hibbert Journal text): read the passage containing "the more facile and natural". The bib entry has no volume or pages because I could not verify them against a registry; add them before any submission.
- Stanford, SEP "Underdetermination of Scientific Theory" (rev. 4 April 2023): read the introduction and the sections on holist/contrastive and transient/permanent underdetermination.
- Kelly 2007, Herrmann 2020, Sterkenburg 2016: read as publisher HTML full text through a library proxy (about 40-53k characters each as extracted). The paper's characterisations are limited to: Kelly's cost measure (errors, retractions, times) and optimality claim; Herrmann on the PAC Occam theorem (Occam algorithm, similarity condition, anti-Occam theorem); Sterkenburg on effectiveness vs simplicity and on effectiveness being more naturally a constraint on our capacities.

Abstract only (claims in the paper are correspondingly thin):
- Kelly, Schulte, Juhl 1997 (cited next to Kelly 2007 for the same general point); Joyce 1998 (cited only as "accuracy-based arguments for probabilism").

Not read; cited only for a method or a definition, with no claim about their content beyond that:
- Massey 1969 (Berlekamp-Massey algorithm; the algorithm itself was implemented and tested, but the paper was not read; I could not obtain even the abstract).
- Valiant 1984 and Blumer et al. 1987: characterised only through Herrmann's presentation (and Aaronson's), as the paper's text says ("see Herrmann 2020").
- Goldreich, Goldwasser, Micali 1986; Blum and Micali 1984; Impagliazzo and Levin 1990: characterised only through Kearns-Valiant/Aaronson (GGM), the standard definition (Blum-Micali), and Liu-Pass's report (IL90). Hastad et al. 1999: only the equivalence stated in the abstract.

Considered and dropped because I could not read them: Yao 1982, Gaifman 2004, Hacking 1967, Garber, Dennett, Simon 1962, Laudan and Leplin 1991, Wolpert, Impagliazzo 1995, Brier 1950. The bibliography has 29 items; about 17 were read in the sense above, the rest are as listed.

Bibliographic data for all DOI-bearing entries were checked against Crossref (the records are in the script directory of the scratchpad, not shipped). Not registry-verified: Peirce 1908 (no volume/pages given), Nanashima 2021 (pages from the PMLR header), Valiant 1984 and Blumer et al. 1987 (from Herrmann's reproduction and memory), the arXiv-only items (Garrabrant, Schmidhuber, Shalev-Shwartz et al.), SEP entry. Werndl's chapter: Crossref gives 2015 (online); the print volume is 2016.

## Antecedent search

Closest prior work and what this paper adds:
- Aaronson 2013, section 7.1 and Kearns-Valiant 1994: the impossibility of feasibly learning pseudorandom functions even with unlimited data, with the philosophical remark that induction can fail for computational reasons. The paper does not claim it. It adds: the claim that each of the three standard justifications (Solomonoff, PAC-Occam, Kelly) contains a findability clause; the accuracy result (Prop 3) and the dilemma for the Bayesian "gold standard" reply; the exact statement of the premise via Impagliazzo-Levin/Liu-Pass and the resulting dichotomy; the candidate-supply answer to abduction; the partial-credit criterion with measurements.
- Barrett and Huttegger 2020; Eagle 2005: resource-relative underdetermination of randomness. Acknowledged in the text. The paper's version is about law vs chance for finite data and ties it to the third kind of underdetermination.
- Peirce 1908: "facile and natural". Acknowledged as nearest ancestor.
- Sterkenburg 2016, Herrmann 2020: effectiveness/similarity rather than simplicity. Acknowledged; the paper's step is from effectiveness to feasibility.
- Garrabrant et al. 2016: credences relative to bounded traders. Acknowledged; used as the formal model of the recommended move.
- Schmidhuber 2000: resource-based priors. Contrasted (fast to run vs fast to find).
- Liu-Pass 2020, Impagliazzo-Levin 1990, Nanashima 2021: equivalence theorems and dichotomy. Credited, not claimed.

Search tools: Crossref queries, arXiv API, WebFetch/curl to known URLs, a browser through a library proxy for publisher HTML. The web search tool's budget was exhausted early in the session, so the antecedent search was by title/author queries to Crossref and arXiv and by following citations in the papers read (Aaronson, Liu-Pass, Nanashima, Rathmanner-Hutter, Herrmann, Sterkenburg, Werndl). A systematic sweep of philosophy-of-science journals for "pseudorandom" and "underdetermination" was not possible. Gaps are likely in the philosophy of statistics and the learning-theory literature on average-case versus worst-case learnability.

An unretrieved manuscript, "Empirical equivalence and distinguishability: a computational complexity approach" (author surname Brogioli, as given to me in the brief), could not be read. It may anticipate the resource-indexed underdetermination claim (section 5, claim 1). The paper makes no priority claim against it and does not cite it; if it is available, it must be read before the paper goes anywhere, and the underdetermination section should state what it adds to it.

## Weak points I know about

1. The contribution is partly a reorganisation of known results (Aaronson, Kearns-Valiant, Impagliazzo-Levin, Sterkenburg). The new pieces are Prop 3, the dichotomy reading, the abduction count, the partial-credit criterion. A hostile screener may rate these as EXPECTED.
2. The empirical section concludes that nothing known shows nature to contain unfindable structure; the only positive content is the selection-effect point and a testable-looking prediction (graded approximations) offered as an impression.
3. The partial-credit criterion is a characterisation illustrated by three cases, not a theorem. Findability is relative to method class, as the MLP result shows.
4. Several sources were read only in part (see above). The paper's claims about them are confined to what was read, but a reader who knows them may judge the characterisations thin (Barrett-Huttegger in particular).
5. The 'chaos is findable' and 'many-body data are shorter than the law' remarks are my assessments with no citation.
6. Demonstration uses SHA-256 as a stand-in PRG and small seeds; it illustrates scaling, nothing more.

## Human input log

The human asked for a paper on philosophical questions about inquiry, and said the work would be screened by an agent. No human input on content, direction, sources, or drafting. The brief supplied the thesis to be developed, the list of objections to answer, the predecessors to locate the paper against, and the format requirements; those came from the orchestrating instruction, not from the human.

## Not done

No screening report was written (instructed not to). Not built with Quarto (not installed in the drafting environment); the .qmd was checked by building a pandoc plain-text rendering with citeproc using the local chicago-author-date.csl, which resolved all citation keys and cross-references. The paper is anonymous: no author line, no categories field.
