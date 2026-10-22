# Advisor memo, round 2: three candidates on multiple guesses

## 0. Bottom line

| | Verdict | Ceiling for a specialist | Biggest risk |
|---|---|---|---|
| **A. "Where to look"** | **FLAWED** | Expected | The 1/n rule is Levi's (1967) rule at maximal boldness. Dorst & Mandelkern (D&M) quote the formula in fn 13. Quillien et al. already fitted a threshold model at θ = 3, and it lost. Your empirical edge comes from not applying the study's exclusions. |
| **B. Pairwise coherence** | **FLAWED** as a positive proposal; the payoff is **EXPECTED** | Interesting at best | Your own sequence data refute it: the 60-ticket problem comes back as "So who will win?" The formal type (k-wise consistency) is old. The common-ground payoff is close to Incurvati & Schlöder (2019) and probably Ninan (2026). |
| **C. Asking again** | **EXPECTED** | Expected | The human half is Icard (2016) plus Koriat's (2012) "self-consistency model". The language-model half is the stated rationale of Wang et al. and of minimum-Bayes-risk (MBR) decoding. Calling "the guess" a property of a distribution is a stipulation. |

**My choice: none of the three as written.** In the vicinity of conversations with multiple guesses there is one thing I would consider: a re-scoped descendant of B, which I call B′ (§4). It should be written only after you pass a short gate: read Ninan 2026 and Mackenzie 1987 first. If either already says what B′ would say, change topic. This is the second round in which each mechanism you proposed turned out to be a known formula from a neighbouring field. That is evidence about the topic, not only about the ideas.

---

## 1. Candidate A: FLAWED

### 1.1 Priority: the rule already exists, twice

**(a) Levi 1967.**
- D&M fn 13 gives Levi's expected answer-value as **P(p) − [p]·q/n**, where q ∈ (0, 1] is "boldness" and [p] is the number of cells consistent with p. In the same section they call Levi "the closest precedent for our approach".
- Set q = 1 and you have your objective. Your expected-checks formula, E = [(n + k + 1) − n·P(G)]/2 (I checked the algebra), is minimised exactly when P(G) − k/n is maximised. So "include a cell iff p_i > 1/n" is Levi's rule at maximal boldness.
- D&M also note that Levi's account "in fact derives many of those constraints" (Filtering and the rest). So "parameter-free, entails Filtering, Improbable Guessing and ties" is not new either.
- What is new is at most a **search-cost interpretation of Levi's q = 1**. That is a footnote, not a paper.

**(b) Quillien, Bramley & Lucas 2025 (Cognitive Psychology 159).**
- §3.1 and App. A.4: a "threshold model": include a colour iff it has at least θ balls, after α-distortion. Fn 14: "it occurred to us as a salient alternative hypothesis when we piloted the task ourselves."
- Table 3: the best-fitting **θ = 3**, i.e. the average number of balls per colour (12/4), with α = 3.41.
- Table 2: it fit worst of the substantive models. AIC: threshold 2388, trade-off 1960, compression 1676. Their diagnosis: it "predict[s] that almost all participants will select the same guess", and it does not improve with per-participant thresholds.
- Your own observation that the 1/n rule is the γ → 1 limit of their compression model completes the picture. The rule sits inside their model space, at the edge they reject.

**(c) Other pre-emptions.**
- "Informativity is instrumental, the value of directing the hearer":
  - van Rooij 2003 (L&P 26) and Benz & van Rooij 2007: answer value relative to the asker's decision problem.
  - D&M fn 12 and §4.2 consider credence-change measures of informativity and reject them.
  - Linnemann & Azhar (PPR 2025) deliberately leave such "external values" unspecified.
- "With feedback, name answers in decreasing probability" is Shannon 1951 and Massey 1994 (guess-until-correct). Diaconis, Graham & Spiro 2022 do not threaten this: their sub-optimality of greedy guessing concerns guessing a whole deck with repeated values, not a single unknown.
- "Budget b → top b" is top-K set prediction. Lorieul, Joly & Shasha (arXiv 2021) contrast top-K with adaptive average-K; Mortier et al. 2021 cover set-valued prediction with utilities.
- "Thinking inherits pragmatic encroachment":
  - D&M already make J "very flexible … as you switch amongst questions" (§3.3).
  - Hoek's "Questions in Action" (JPhil 2022) already ties the operative question to the agent's practical problem.

### 1.2 The empirical claim fails on the published sample

Your fits use all **100 sessions × 14 urns**. That includes participants who failed the attention checks and the attention-check urn [6,6,0,0] itself. The paper analyses **64 participants × 13 urns**: 98 recruited, 34 excluded.

I re-applied the paper's two exclusions: the two requested colours in the instructions trial, and no absent colour in the last trial. I also dropped the attention urn. That left 66 participants and 858 trials, close to their 64. My compression fit (β ≈ 56, γ ≈ 1.93, α ≈ 1.09) is close to their published 46.8 / 1.99 / 1.14, so the cleaning is about right.

| Model (cleaned data) | Params | NLL | AIC |
|---|---|---|---|
| Search / 1/n rule | 1 | 944.5 | 1891.0 |
| Search + α | 2 | 941.5 | 1886.9 |
| Search + "name the top colour" mixture | 3 | 939.3 | 1884.6 |
| Compression | 3 | **856.9** | **1719.7** |
| Compression + top-colour mixture | 5 | 847.5 | 1705.0 |

- Compression beats the search rule by about 88 log-likelihood units (ΔAIC ≈ 170).
- The mixture advantage reported in your memo (search+mixture 1546 against compression 1558) came from the inattentive participants. After cleaning, the "45% name the single best" type mostly disappears.
- The fitted γ ≈ 2 is far from the γ → 1 limit where the search rule lives.

Where the search rule loses: 68 of the 88 units come from the **flat urn [3,3,3,3]**. There, 67% name all four colours, while the search rule is indifferent among all 15 guesses. On the other 12 urns, compression is still about 20 units ahead (ΔAIC ≈ 35 even after the parameter penalty).

The flat urn is not a technicality. It shows that guesses also communicate the speaker's uncertainty ("could be any of them"). A pure search-direction account cannot represent that.

Also correct the descriptive numbers. Cleaned three-ball splits:

| Urn | Splits (cleaned) |
|---|---|
| [7,3,1,1] | 59 / 41 |
| [6,3,2,1] | 50 [6] / 44 [6,3] / 5 [6,3,2] |
| [5,3,2,2] | 35 [5] / 59 [5,3] |

Inclusion of a four-ball colour: [6,4,1,1] 68%; [5,4,2,1] 82%.

My scripts:
- /tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/scripts/refit.py
- /tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/scripts/perurn.py

Both run as `python3 -I <script> <path to study2.json>`.

### 1.3 The derivation rests on two arbitrary assumptions

1. **The message is an unordered set, and the searcher checks it in random order.** Allow an ordered message, as speakers actually give one ("Yale or Harvard, probably Yale"). Then the cost-minimising message is the full ranking, and the threshold disappears.
2. **The searcher checks unnamed cells uniformly.** The 1/n is just the hearer's uniform prior. Give the hearer a non-uniform prior and the rule becomes "name what you think likelier than the hearer does". That is a degenerate case of the KL/compression model, not a rival to it.

Separately, "Optionality = uncertainty about the hearer's budget" is a non sequitur. A credence over budgets yields one expected-optimal k, not a permission to choose any k.

**Ceiling: expected. Salvage:** at most one footnote, giving the search-cost reading of Levi's q = 1.

---

## 2. Candidate B: FLAWED, with an EXPECTED payoff

### 2.1 The principle fails on its own data

**The 60-ticket problem comes back.** Your thesis filters each guess on the question as narrowed by removing every cell that contradicts some earlier guess.
- Ticket case: "A? — No. #1? — No. … #59? — No. *So who will win?*" Narrowing removes A and #1–#59, so the view mandates "#60" (probability .01 against .40 for A).
- Latif case: "Yale? No. Harvard? No. Stanford? No. NYU? No. *So where?*" The narrowed question is **empty**, so no answer is permissible.
- The natural reply in both is a retraction: "Well, A, I suppose. I know I said no."

**Pairwise narrowing coincides with context-set narrowing whenever the later question is fine enough to settle the earlier ones.**
- B diverges from the Stalnaker–Roberts view only when the later question is coarse or polar. Those are cases (4)–(5).
- So B's distinctive content reduces to non-agglomeration across sister polar questions. That is already in:
  - Holguín's lottery diagnosis (2022, §8.2);
  - Mandelkern & Dorst's preface variant ("Assertion is weak", §3.1.1, the 98-RSVP case).

**The knife datum.** "With what?" after "the butler" gets "the knife, then". Pairwise narrowing does not remove "gun", which is consistent with "butler", so B predicts "gun". Fixing this requires conditional (anaphoric) answering. That is the line view advisor 1 rejected, and it reinstates the 60-ticket problem.

**The 3-ticket raffle.** You concede that "No, no, no" sounds bad there. "Few-wise" is gerrymandered unless something principled sets the number. Note that Lockean bounds do not deliver the 3-versus-10 contrast either: at 10 tickets, "no" to all ten is inconsistent, yet you judge it fine.

**Case (5) is confounded.** "Probably, yes" is a probability report, not a guess.

### 2.2 Priority for the formal type

Weakening consistency to k-wise consistency is old:
- Kyburg: weak consistency; "it takes ⌈1/ε⌉ premises to derive a contradiction" (Probabilistic Acceptance; and Kyburg 1997, JPhil 94).
- Hawthorne & Bovens 1999 (Mind): Lockean bounds on preface and lottery states.
- Preservationist paraconsistency: Schotch & Jennings; Brown 1999 (Noûs).
- Judgment aggregation (median property, Nehring & Puppe 2007): majority outcomes are never pairwise inconsistent, though they can be jointly inconsistent.
- Hoek 2025 already calls pairwise consistency among fragments "rather ad hoc".
- For guesses above 1/2, pairwise consistency comes for free. It bites only in Improbable-Guessing cases, which is exactly where the judgments are most delicate.
- Teague's WTP/PTW principles (2024) and Fang's Conjunctive Filtering (2026) already occupy the part–whole and conjunctive cases.

### 2.3 Priority for the payoff ("constraints, not premises")

- **Incurvati & Schlöder 2019** (PQ): "by weakly asserting p, one prevents not p from being added to the common ground." Their logic tracks commitments, not premises.
- **Farkas & Bruce 2010** (the table and projected set) and **Malamud & Stephenson 2015** (projected commitments for hedged declaratives) supply non-common-ground commitments.
- **Ninan 2026**, "The Strength of Assertion" (Analytic Philosophy 67(2): 182–191). Per its abstract, it distinguishes two classes of declarative that differ in "what they add to the common ground" and in how they are elicited. **I could not read the text.** It may already contain B's payoff.
- **Mackenzie 1987**, "I guess" (AJP 65: 290–300). It cites Hamblin's *Fallacies*, so it is probably a commitment-store treatment of "I guess" in dialogue. **Unread.**

### 2.4 Rhetorical risks

- B is still built on Teague's and Fang's puzzles: failure mode (c).
- It rests on felicity judgments about ten-turn dialogues: failure mode (d).
- Strong-assertion theorists (van Elswyk & Benton 2023; the Williamsonian lottery tradition) will simply deny that the flat raffle "No"s are felicitous.

**Ceiling: interesting at best. As written: flawed.**

---

## 3. Candidate C: EXPECTED

### 3.1 The human half

- **Icard 2016** (RPP 7): subjective probability is a sampling propensity. The response is the mode of R samples, which predicts "inconsistent responses to the same question". He has a "Crowd Within" section.
- **Koriat 2012** (Psych Rev 119), "the self-consistency model": answers are majority votes over sampled representations, and confidence predicts repetition.
- "The guess is the filtered top of the answer distribution" is D&M's formula applied to Icard's credences: failure mode (b).

### 3.2 The language-model half

- Wang et al. (ICLR 2023) motivate self-consistency as "marginalizing out" reasoning paths.
- Bertsch et al. 2023, "It's MBR all the way down": self-consistency is minimum-Bayes-risk decoding.
- Eikema & Aziz 2020, "inadequacy of the mode"; Kuhn et al. and Farquhar et al., semantic clustering of samples.
- **Keeling & Street 2024** (arXiv 2407.08388) already assess consistency-based credence attribution. They note a single reported judgement "is one of several judgements that could have been reported", and conclude "we lack a positive rationale" for reading credences off answer distributions.
- Herrmann & Levinstein's standards for belief representations in LLMs; Kalai et al. 2025 on guessing versus abstaining.
- "A chain of thought is a line of conditional guesses" is greedy decoding, which advisor 1 already flagged.
- I found **no** philosophy paper applying D&M or Holguín to LLM sampling. That gap exists because the content is standard machine learning, not because there is an opening.

### 3.3 Conceptual problems

- In the guessing literature, guessing is an act or attitude: D&M's three-place relation; Holguín's doxastic choice. Relocating "the guess" to a distribution is a verbal move, and judges will see it as one.
- Within a single conversation, re-asking does not sample independently:
  - Vul & Pashler's immediate second guess is worth λ ≈ 0.11 of another person's guess;
  - Icard notes that remembered answers override sampling.
  So C says little about conversations with multiple guesses.
- It also leans on Holguín's unpublished toggling draft, which is risky for accurate representation of sources.

**Ceiling: expected.** It is also a change of subject.

---

## 4. What I would pursue instead (conditional): B′, "What does a guess commit you to?"

**Gate (one day, before anything else).** Read Ninan 2026 and Mackenzie 1987, and look at Mackenzie 1990, "Four dialogue systems", for its retraction rules. Then:
- If Ninan already says elicited guesses add a revisable commitment that later guesses must respect, B′ is pre-empted. Change topic.
- If Mackenzie already defines a guess move with retraction rules, B′ is pre-empted. Change topic.

**Idea.** The one genuinely informative datum from both rounds is the **conform-or-retract** pattern:
- Speakers conform when conforming is cheap. Example: "Harvard" after "not Yale", .30 against .38.
- They faultlessly retract when it is expensive. Examples: "A, I suppose" in the 60-ticket line; "Yale" after four "No"s.
- Contrast "perhaps": Incurvati & Schlöder show its constraint is **non-cancellable** ("Perhaps X or Y will win. #In fact neither will"). A guess, by contrast, is retractable: "Yale, I'd guess. Actually, make that Harvard."

**Candidate thesis.** A guess neither adds its content to the common ground nor merely reports an opinion. It creates a **faultlessly retractable commitment**: later guesses must cohere with it unless coherence costs too much answer-value, and then the guesser retracts it. That retraction profile is what separates guessing from asserting. So "assertion is weak" is true of the attitude but not of the speech act.

**Ceiling: interesting, not surprising.** The risks are the gate and failure mode (d).

### (a) Reading list, in priority order (★ = priority/novelty must-read)

1. ★ Ninan 2026, "The Strength of Assertion". Does it already assign elicited declaratives a distinct commitment, and does it say anything about sequences or retraction?
2. ★ Mackenzie 1987, "I guess", and 1990, "Four dialogue systems". Is there a guess move in Hamblin commitment stores, and what are its retraction rules?
3. ★ Incurvati & Schlöder 2019, PQ 69: 741–770. Their constraint-not-premise model and the non-cancellability contrast.
4. Mandelkern & Dorst 2022, "Assertion is weak": fn 1, §3.1.1 (preface variants), §5.3. Check exactly what they bracket.
5. van Elswyk & Benton 2023; van Elswyk 2023, "Hedged testimony" (responsibility); van Elswyk 2024, "Hedging in Discourse" (a positional theory, where discourse position fixes function; potentially very close).
6. Krifka 2015 (SALT 25, commitment spaces, including retraction or rejection moves); Farkas & Bruce 2010; Malamud & Stephenson 2015.
7. Knobe & Yalcin 2014 (S&P 7): an experimental paradigm for retraction judgments. Use it to collect your data. Also MacFarlane 2014 on retraction, and Marques 2018 (Synthese 195).
8. Roberts 2012 and Schwarz, Strack & Mai 1991: anaphoric "so"-questions and the knife datum.
9. Data sources only, cited briefly: Teague 2024; Fang 2026 §6.2 and fn 36; Holguín 2022 §9.2; Goodman & Holguín fn 24; D&M fn 6.
10. Background, one sentence each: Gold & List 2004 (path dependence); Staffel 2025 (transitional beliefs); Jovićević 2025 (sets aside belief-contravening update).

### (b) Points to address, in priority order

1. **The gate above.**
2. **Make the 60-ticket and Latif "So who/where?" dilemma the opening.** Show that each standard account fails on one case:
   - context-set addition predicts "#60";
   - "S thinks p" reporting allows "Yale" after "not Yale";
   - uptake-based update still predicts "#60" once "So" signals uptake.
3. **Get data, not just your own judgments.** Run a small acceptability-and-retraction study (Prolific, Knobe–Yalcin style), or restrict yourself to minimal pairs nobody disputes. This is failure mode (d) and it is fatal here.
4. **Specify the retraction trigger in a way that is not ad hoc.** Use the answer-value loss of conforming relative to answering fresh. Show it handles the 3-ticket versus 10-ticket contrast, or explain that contrast as a salience effect.
5. **Lottery objection from strong-assertion theorists.** Use "I don't think so" forms throughout, so the data do not presuppose weak assertion.
6. **Conditional answering ("the knife, then").** Handle it with anaphoric questions, and show that retraction blocks the 60-ticket consequence.
7. **Concede that path dependence is a Gold & List corollary.** Do not sell it.
8. **Teague and Fang.** One paragraph of corollaries. Not the frame.
9. **Accuracy.**
   - Latif numbers: D&M and Teague use 38/30/20/12. Holguín's Bond numbers are 40/20/20/20; Pearson's are 40/30/30.
   - Cite Teague's published pagination and Fang's PDF pagination.

### (c) Thesis and scope for 6,000 words

- **Thesis in one sentence**, about guessing versus asserting, not about Teague or Fang.
- **Approximate layout:**

| Section | Words |
|---|---|
| §1 The dilemma (60-ticket / Latif) | 700 |
| §2 Three accounts of what a guess adds, and how each fails | 1,500 |
| §3 Retractable commitment: conformity versus retraction | 1,500 |
| §4 Consequence for the weak/strong assertion debate | 900 |
| §5 Objections | 900 |
| Notes | 500 |

- **Cut entirely:** A and C; Independent Closure; the WTP/PTW generalisation; the formal path-dependence material; LLMs.
- **If the gate fails, change topic.** At the level of how several guesses in a conversation hang together, this topic is now squeezed from four sides: Fang and Teague; discourse dynamics (Stalnaker–Roberts and commitment spaces); Gold & List and structured prediction; and Levi, set-valued prediction and Quillien et al.

---

## 5. What I could not verify

- The full texts of Ninan 2026, Mackenzie 1987, van Elswyk & Benton 2023 and Holguín's toggling draft.
- The page and volume details I gave from memory, which should be checked before citing: Mortier et al. 2021 (DMKD 35); Kyburg 1997; Brown 1999; Nehring & Puppe 2007.
- D&M fn 13 and the Quillien et al. passages were checked against the texts (Quillien PDF saved at /tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/dl_quillien/q2025.pdf).

## Sources

- [Dorst & Mandelkern, Good Guesses (fn 13 on Levi)](https://philarchive.org/archive/DORGG)
- [Quillien, Bramley & Lucas 2025 PDF](https://www.bramleylab.ppls.ed.ac.uk/pdfs/quillien2025lossy.pdf)
- [Linnemann & Azhar preprint](https://philsci-archive.pitt.edu/23928/1/linnemann%2Bazhar_24_v6.pdf)
- [Incurvati & Schlöder, Weak Assertion](https://pure.uva.nl/ws/files/43249266/incurvati_schloeder2019.pdf)
- [Mandelkern & Dorst, Assertion is weak](https://www.mandelkern.hosting.nyu.edu/Assertion.pdf)
- [Ninan publications (abstract of "The Strength of Assertion")](https://philpeople.org/profiles/dilip-ninan/publications)
- [Mackenzie, "I guess" (record)](https://dc2.philarchive.org/rec/MACIG)
- [Kyburg, Probabilistic Acceptance](https://arxiv.org/pdf/1302.1556)
- [Hawthorne & Bovens 1999](https://www.joelvelasco.net/teaching/3865/hawthrorne%20and%20bovens%20the%20preface%20the%20lottery.pdf)
- [Keeling & Street 2024](https://arxiv.org/html/2407.08388v1)
- [Herrmann & Levinstein, Standards for Belief Representations](https://arxiv.org/pdf/2405.21030)
- [Bertsch et al., It's MBR All the Way Down](https://arxiv.org/pdf/2310.01387)
- [Kalai et al. 2025](https://arxiv.org/html/2509.04664v1)
- [Icard 2016 record](https://philarchive.org/rec/ICASPA)
- [Horowitz, Do credences model guesses?](https://dc2.philarchive.org/rec/HORDCM)
- [Mortier et al., set-valued prediction](https://arxiv.org/pdf/1906.08129)
- [Lorieul et al., average-K vs top-K](https://arxiv.org/pdf/2112.08851)
- [Diaconis, Graham & Spiro](https://arxiv.org/abs/2012.04019)
- [Malamud & Stephenson (SemDial record)](https://semdial.org/anthology/papers/Z/Z11/Z11-3014)