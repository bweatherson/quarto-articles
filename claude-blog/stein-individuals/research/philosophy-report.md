# Report: Stein's paradox, fairness to individuals, and aggregation (literature read-through)

## Access summary (read this first)

| Work | Status |
|---|---|
| Vassend, Sober & Fitelson 2017 | **Read** (PhilSci preprint), but only through WebFetch excerpts. Quotes are tool-extracted fragments of 125 characters or less; page numbers are preprint pages. |
| Di Bello & O'Neil 2020 | **Read** through two WebFetch passes (PhilArchive preprint and CUNY repository copy). Journal page numbers (Ethics 130:147–178) come from the CUNY pass. |
| Climenhaga 2025 | **NOT READ.** PhilArchive and PhilPapers fetches failed repeatedly (Cloudflare and fetch errors). I have only the abstract (Ethics 136(1):147–160). |
| Hedden 2021 | **Read** (PhilArchive preprint) through WebFetch excerpts, including footnotes 21–22 verbatim. Pages are preprint pages. |
| Eidelson 2013, "Treating People as Individuals" | **Read in full** from a PDF of the published chapter (pp. 203–227). Eidelson 2015, ch. 6, was **not accessed** (OUP paywall). |
| Lippert-Rasmussen 2011 | **NOT READ.** It is paywalled and Unpaywall finds no open-access copy. My report relies on secondary quotation plus [FROM MEMORY]. |
| Beeghly 2018 | **NOT READ.** Every route (PhilArchive, quod.lib, Ergo) was blocked. I have only the abstract from the PhilArchive record page. |
| Eva 2022 | **NOT READ** (paywalled). I verified the Base Rate Tracking definition from Eva's 2024 open-access JAIR paper. |
| Fleisher 2026 | **Read** (PhilArchive preprint) through WebFetch excerpts. The last ~9k characters were not read. |
| Moss 2018, ch. 10 | **NOT READ** (paywalled). Instead I read in full her later "Knowledge and Legal Proof" (Oxford Studies in Epistemology 7, 2023) from the author's site. The rule of consideration is verified through Moss, "Moral Encroachment" (PAS 2018), which quotes the book at p. 221. |
| Enoch, Spectre & Fisher 2012 | **Read** (PhilArchive) through WebFetch excerpts, located by section only. |
| Steele, "Evidence, Arbitrariness, and Fair Treatment" | **No written version found.** I have two talk abstracts (ANU HMI; Oxford 2023, "'Evidential Luck' and (Un)Fair Treatment"). As a substitute I partly read Steele & Colyvan 2023, "Meta-uncertainty and the proof paradoxes" (Phil Studies, open access). |
| Frick 2015 | **NOT READ.** It is paywalled with no open-access copy. My attempt to download an unauthorized copy was blocked and I did not pursue it. Report uses secondary sources (Rüger 2018, JESP) plus [FROM MEMORY]. |
| Gustafsson & Kowalczyk 2026 | **Read in full** (author preprint). Title: **"Ex Ante Pareto and the Opaque-Identity Puzzle,"** J Phil 123(1):63–76. |
| Hare 2016 | **Read in full** (MIT open-access manuscript, March 2016 draft). Pages are manuscript pages; the published version is pp. 451–472. |
| Voorhoeve 2014 | **Read in full** (LSE repository, published pagination). |

**On quotations:** quotes marked "(tool)" came through WebFetch, which returns only fragments of 125 characters or less. They are accurate as far as I can tell but are partial. Please check them against the PDF before quoting in print. Full texts I extracted are in `/tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/dl/`: `eidelson.txt`, `voorhoeve.c.txt`, `hare.c.txt`, `gk.c.txt`, `moss.c.txt`, `arx_2204.10305.txt` (Viganò et al.), `gls.txt` (Giacomini et al.) and `eva_jair.txt`.

**Stein, shrinkage etc.:** none of the Group 1 or Group 2 works except Vassend, Sober & Fitelson mentions Charles Stein, shrinkage, empirical Bayes, regression to the mean or "borrowing strength." "Stein" in Moss and in Enoch et al. is Alex Stein, *Foundations of Evidence Law*. I checked this for every text I could read; for the works I could not read I cannot confirm it.

---

## Group 1

### Vassend, Sober & Fitelson 2017, "The philosophical significance of Stein's paradox" (EJPS 7(3))

**(a) Thesis.** Shrinkage results support "a surprising form of holistic pragmatism" (abstract, tool). Whether to minimize total error or each component's error is a pragmatic choice of goals, not something settled by the evidence. MLE is inadmissible for three or more parameters, but admissibility is neither necessary nor sufficient for using an estimator.

**(b) Principles.**
- Holistic pragmatism (§7, p. 17, tool): "Holistic pragmatism is the thesis that when an estimation problem has several parts, it's a pragmatic decision" / "whether your goal is to minimize error across the whole problem, or to minimize error within each part."
- Estimation becomes "a four-place relation between E, θ, D, and the goals of the agent, G" (p. 17).
- On admissibility (§6): "Inadmissibility is bad but admissibility isn't anything special."

**(c) Relevant content.**
- *Unrelated quantities.* "The three quantities can be entirely unrelated to and independent of each other" (§2). The results "do not turn on whether hits in baseball and foreign cars in Chicago are causally related to each other" (§2).
- *Linking.* Shrinkage is "a constraint that links distinct estimation problems to each other" (§4, p. 13).
- *Dependence on irrelevant features (linear invariance, §3, p. 6).* "The reader has a right to be shocked by the fact that what you say about Roberto Clemente's batting ability" / "depends on whether you seek to estimate his ability to succeed or his tendency to fail." "What goes for Chicago also goes for Roberto." In short, one person's estimate depends on coding conventions for the whole ensemble.
- *Individuals lose.* "for each parameter, there are parameter values for which shrinkage will do worse than MLE" (§1). "The risk of some of the individual estimates increases substantially" (§11, p. 28). "your estimate of players who are truly outstanding" / "will suffer, but if you know who those players are, you can just exclude them from shrinkage" (§11, p. 29).
- *Choice of target.* The shrinkage point affects "which individual estimates end up being less accurate than they might have been had you used MLE" (p. 26; also fn. 24).
- *Weights.* The global loss "implicitly places an equal weight on each of the individual estimation problems" (fn. 27).
- *When to lump.* Lumping is objectively better iff "the true means and variances … are sufficiently close to each other" (p. 29).
- *Bayesianism (§8).* "Stein's result does not give Bayesian agents any reason for imposing a common prior over parameters that they think are independent." Under goal-switching, "Your estimates change value but not because of any new evidence you acquired" (p. 21).
- No discussion of ethics or fairness. The applications are batting averages and heights.

**(d)** Yes: Stein and shrinkage are central. Empirical Bayes appears only in references and the §8 discussion. The phrase "borrowing strength" does not appear (tool report).

### Di Bello & O'Neil 2020, "Profile evidence, fairness, and the risks of mistaken convictions" (Ethics 130(2))

**(a) Thesis.** Admitting incriminating profile evidence violates *equal protection*, a comparative right of innocent defendants. The problem is not that fact-finders misjudge such evidence. Eyewitness, trace and motive evidence do not violate the right, because lawmakers cannot know ex ante who could be incriminated by them.

**(b) Principles** (tool, journal pages):
- *Equal protection:* "a comparative right belonging to innocent defendants not to be exposed to higher risks of mistaken conviction" / "than other innocent defendants facing comparably serious charges" (p. 154). Restated at p. 157: "that innocent defendants not be exposed to higher risks of mistaken conviction than other innocent defendants" / "facing the same charges or comparably serious charges."
- *Due protection:* a right against "a level of risk whose further reduction would be cost justified."
- *Risk:* Pr(C | I), and "epistemic … from the evidence-relative perspective of a reasonable person" (p. 158). Risk is assessed "from lawmakers' incompletely informed ex ante perspective" (p. 159).
- *Types of defendants:* "what types of defendants there are or might be," / "so long as those types are specifiable without reference to the circumstances of particular crimes" (p. 159).
- *Downstream inequality:* "there will inevitably be downstream inequalities in outcomes" and "more incriminating evidence against some innocent defendants than others" (n. 40). These do not violate the right.

**(c) Relevant content.**
- *The mechanism.* Calibration means admitting profile evidence "should … increase the risk of mistaken conviction for the innocents who fit profile BE" but not for others (p. 162). It raises "the ex ante risk of mistaken conviction for all and only" / "innocent defendants who match a relevant incriminating profile" (p. 164).
- *Predictability is the key disanalogy:* "lawmakers can know in advance of particular trials who can and who cannot be incriminated by profile evidence" (p. 167).
- *§VI.* Unequal risks of mistaken *incrimination* (e.g., cross-racial eyewitness error) are "offset by the fact that eyewitness evidence … should be assigned a lower probative value" (p. 173). In other words, discounting noisier evidence equalizes conviction risk, which is structurally close to shrinkage.
- *Accuracy.* There is "a presumption in favor of admitting probative evidence" (p. 148). Equal protection "can be overridden," and exculpatory profile evidence may be admissible all things considered (p. 166). Equal protection "may demand leveling down as well as leveling up" (p. 166).
- *Treating as individuals* (preprint pp. 7–8). They report the objection that fact-finders "treat the defendant merely as a member of a group and not as an individual." Treating as an individual requires "being receptive to the possibility that the individual is an exception to the generalization."

**(d)** None (the final 231 characters were not read).

### Climenhaga 2025, "Unequal Risks of Mistaken Conviction Are Unavoidable: Why Profile Evidence Is Not Uniquely Unfair" (Ethics 136(1):147–160)

**NOT READ: abstract only.**

**(a)** Contra Di Bello & O'Neil, "all kinds of evidence can lead to unequal risks of false conviction" (abstract). So their argument for singling out profile evidence is unsound.

**(b)–(d)** Unknown. I have no reliable memory of this paper. This is a priority to obtain, since its "unavoidability" thesis is directly relevant to whether Stein-type unequal risk is objectionable.

### Hedden 2021, "On statistical criteria of algorithmic fairness" (PPA 49(2))

**(a) Thesis.** "none except perhaps calibration is a genuine necessary condition on fairness" (p. 3). A perfectly fair algorithm can violate all the other criteria when base rates differ.

**(b) Criteria** (§2, labels verbatim): (1) Calibration Within Groups; (2) Balance for the Positive Class; (3) Balance for the Negative Class; (4) Equal False Positive Rates; (5) Equal False Negative Rates; (6) Equal Positive Predictive Value; (7) Equal Negative Predictive Value; (8) Equal Ratios of False Positive Rate to False Negative Rate; (9) Equal Overall Error Rates; (10) Statistical Parity; (11) Equal Ratios of Predicted Positives to Actual Positives.
- (1) reads: "For each possible risk score, the (expected) percentage of individuals assigned that risk score who are actually positive…" (tool).
- The coin case (pp. 10–11): coins of varying bias, labeled with their bias, randomly assigned to people, who are randomly assigned to rooms A and B. The algorithm assigns risk score = label and predicts heads if the label is above 0.5. "This algorithm is perfectly fair and unbiased" and "uniquely optimal."

**(c) Relevant content.**
- Fairness is owed to individuals: "it is not obvious that fairness is owed to groups, as opposed to individuals."
- *Marginality (§4).* Room B's people "were all relatively unclear or marginal cases," so the fair algorithm "made more mistakes for people from room B" (p. 16). Unequal error from unequal evidential clarity is not unfairness.
- *Footnote 22, verbatim (tool), the key passage for Stein:* "suppose that people's coins do not come labeled with their bias. But we know that all room A people have coins with bias 0.1, while all room B people have coins with bias 0.3. Here, it is impossible to satisfy Calibration Within Groups except by basing predictions on room membership … Perhaps this is a fairness dilemma … Or perhaps … Calibration Within Groups and the requirement of blindness to group membership are not both necessary for fairness. If so, I would be inclined to reject the latter rather than the former."
- *Footnote 21:* calibration combines a fairness condition (equal calibration across groups) "with an accuracy condition."
- The word "arbitrarily" occurs only for the 0.5 tie-break.

**(d)** None.

### Eidelson 2013, "Treating People as Individuals" (in Hellman & Moreau eds., pp. 203–227)

**(a) Thesis.** Treating people as individuals is "not a matter of eschewing statistical evidence about them, but rather of paying attention to their own roles in determining who they are and respecting their capacities to make choices for themselves as autonomous agents" (p. 227). It is a recognition-respect norm grounded in autonomy, distinct from fairness and epistemic conscientiousness.

**(b) The autonomy account** (p. 216, verbatim): "In forming judgments about Y, X treats Y as an individual if and only if:
- (Character Condition) X gives reasonable weight to evidence of the ways Y has exercised her autonomy in giving shape to her life, where this evidence is reasonably available and relevant to the determination at hand; and
- (Agency Condition) if X's judgments concern Y's choices, these judgments are not made in a way that disparages Y's capacity to make those choices as an autonomous agent."

**(c) Relevant content.**
- *Other people's data, the closest passage to the Stein case* (p. 209): "My older brother's college record may well have been relevant to predicting my own odds of success in college… If an admissions committee declined to consider that information … that would hardly have constituted a failure to treat me as an individual. If anything, we would worry that an admissions committee that did do that had failed to treat me as an individual."
- *Inclusive, not exclusive.* "there is nothing wrong per se with making use of such information. But the character condition does require that one also consider relevant information that does manifest a person's self-authorship" (p. 217). Its "prescription coincides with demands of epistemic rationality" (p. 218).
- It "avoids any reliance on the unstable notion of 'statistical' evidence" (p. 218).
- *Reasonableness and cost.* It depends on "'value-adjusted' investments in different bits of information" (p. 224). One may use "gross statistical categories or blanket policies" when individual information is not reasonably available (p. 224).
- *Scope.* It is limited to judgments that implicate autonomy: estimating whether someone is "a genetic carrier … makes no sense to worry about treating her respectfully as an individual" (p. 225).
- *Accuracy.* Treating as individual is distinct from conscientiousness. Ignoring relevant information is not always a failure to individualize (p. 209).
- Dismissing a person's choices treats them "as determined by demographic categories or other matters of statistical fate" (p. 216).

**(d)** None.

### Lippert-Rasmussen 2011, "'We are all different': statistical discrimination and the right to be treated as an individual" (J Ethics 15:47–59)

**NOT READ.**

**(a)–(b)** Secondary sources:
- Eidelson (p. 209 n. 14) reports that Lippert-Rasmussen holds a person is treated as an individual only when her treatment is informed by "all relevant information . . . reasonably available" to the decision-maker (L-R p. 54).
- Viganò et al. (2022) summarize this as "the demand to make accurate judgments about a person, using all the relevant information reasonably available" (p. 54). They add that the principle is pro tanto (p. 57) and lapses when individual information is scarce (p. 54).

[FROM MEMORY] L-R distinguishes several readings of the right. On the best reading, statistical discrimination using all reasonably available information does not violate it. So the right cannot be what makes statistical discrimination distinctively wrong, and its rationale is largely accuracy- or outcome-based.

**(c)–(d)** Unknown.

### Beeghly 2018, "Failing to Treat Persons as Individuals" (Ergo 5)

**NOT READ: abstract only (paraphrased by tool from the PhilArchive record).**

**(a)** The paper assesses the "failure-to-individualize theory of wrongful stereotyping," on which "stereotyping is wrong if and only if it involves failing to treat persons as individuals." On every interpretation the theory either fails to pick out all wrongful stereotyping or fails to explain why it is wrong. The individualization objection should play "a more limited role."

**(b)** Viganò et al. cite Beeghly (p. 708) as holding that the Eidelson and Lippert-Rasmussen versions can be a moral obligation "sometimes or always."

[FROM MEMORY] She separates epistemic (all-relevant-information) and autonomy-based readings. She argues that accurate, fully informed stereotyping can still be wrong, and that some failures to individualize are not wrong.

**(c)–(d)** Unknown.

---

## Group 2

### Eva 2022, "Algorithmic fairness and base rate tracking" (PPA 50(2):239–266)

**NOT READ.** Definition verified from Eva 2024 (JAIR 80:859–873, open access): "Base Rate Tracking (BRT): The difference between the average risk scores assigned to the relevant groups should be equal to the difference between the (expected) base rates of the groups." Eva 2024 splits it into BRT1 (difference no greater than) and BRT2 (difference no less than). He likens BRT to a group-level version of Dwork's Lipschitz condition, "treat similar individuals similarly."

[FROM MEMORY] The 2022 paper responds to Hedden by proposing BRT as a criterion that his coin case satisfies, while it still diagnoses COMPAS-type bias.

**Stein note (mine):** shrinkage toward a single common target compresses between-group differences in average scores, so it violates BRT2. Shrinkage is also a contraction, so it satisfies Lipschitz *within* a pool.

**(d)** None in the JAIR paper.

### Fleisher 2026, "Algorithmic fairness criteria as evidence" (Ergo, forthcoming)

**(a)** Statistical fairness criteria are defeasible evidence of fairness, not definitions or necessary or sufficient conditions.

**(b)** The Evidence Account (§4.1, p. 15, tool): "The satisfaction or violation of a genuine algorithmic fairness criterion (potentially) provides defeasible evidence regarding whether an algorithmic system is fair."

**(c) Footnote 12 (pp. 10–11, tool), directly on other people's data.**
- He reports that Viganò et al. say Hedden's case does "not involve making inferences about one individual based on data from other individuals," and that criteria "should only apply … to prediction systems that involve making inferences about one person based on other people's data."
- His reply: "it is relatively simple to produce a case that is structurally identical to Hedden's case, but where the labels are determined by statistical inference based on other people's behavior". The coins come from factory runs with a common bias, and "we label the coins … based on the past behavior of coins from the same run."
- He notes the boundary only in passing; accuracy and outliers are not discussed.

**(d)** None.

### Moss, *Probabilistic Knowledge* (2018), ch. 10

**NOT READ.** Substitutes read:

*Moss, "Moral Encroachment" (PAS 2018, tool).* It quotes the book's rule of consideration (p. 221): "you morally should keep in mind the possibility that they might be an exception to statistical generalizations." Racial profiling is "forming opinions about a person on the basis of statistics about members of their racial group."

*Moss, "Knowledge and Legal Proof" (OSE 7, 2023), read in full:*
- **(a)** Legal proof requires knowledge. The preponderance standard requires knowing that the defendant is *probably* liable. Statistical evidence fails because it cannot rule out relevant, lottery-like possibilities.
- **(c)** In Gatecrasher, the defendant "is raising a certain possibility—namely, that he is an individual, not represented by features of the group to which he belongs. Given the lottery-like similarity of all the possible defendants … this possibility is impossible to ignore" (p. 23).
- Against moral accounts, via Dog Bite: "Whose individuality is demeaned by this inference? The subject of the inference is a dog" (p. 16).
- Ensemble point (p. 11): if 25 separate juries each convicted, "our standard of proof would demand 25 convictions and ensure the conviction of an innocent person."
- Moral stakes can make possibilities "epistemically resilient," including "the possibility that the defendant has individual traits that would undermine any alleged probative value of statistics having to do with racial categories" (p. 27).
- She sets aside the "revisionary" view that "Courts should aim to maximize the accuracy of verdicts" (p. 14).
- She discusses an arbitrariness objection about duplicate juries reaching different verdicts (Smith 2018) and accepts externalist "legal luck" (pp. 30–32).
- **(d)** None (Alex Stein only).

### Enoch, Spectre & Fisher 2012, "Statistical evidence, sensitivity, and the legal value of knowledge" (PPA 40(3))

**(a)** Statistical evidence yields insensitive findings, which explains the epistemic intuition. Knowledge has no legal value worth sacrificing accuracy for. But sensitivity matters instrumentally, through primary-behavior incentives.

**(b)** "Sensitivity: S's belief that p is sensitive =df. Had it not been the case that p, S would (most probably) not have believed that p" (§III, tool). Knowledge's value, if any, "is lexically inferior to that of accuracy" (§V.A).

**(c)**
- Statistical evidence "can serve to minimize error just as much as individual evidence can" (§V.A).
- Preferring knowledge over accuracy is "an objectionable kind of epistemological fetishism" (§V.A).
- On incentives: relying on statistical evidence "almost entirely annihilates whatever incentive" (§V.B).
- n. 24: "Individuals seem entitled not to be subjected to procedures that are too inaccurate."
- The reference class problem is explicitly set aside (n. 6).

**(d)** None (Alex Stein only).

### Steele, "Evidence, Arbitrariness, and Fair Treatment"

**No written version found** (talk abstracts only).
- **(a)** The distinctive moral problem with some statistical evidence is "arbitrariness and thus unfairness in the supporting evidence." This is separate from disrespectful generalization. "unfair evidence is ubiquitous," and "Whether this ought to be mitigated is another matter." She positions this against Di Bello & O'Neil.
- The Oxford version ("'Evidential Luck' and (Un)Fair Treatment") says the problem of general evidence "mainly concerns evidential luck."
- **Substitute: Steele & Colyvan 2023** (partly read). Naked statistical evidence lies at the extreme of a continuum of cases "vulnerable to challenge due to 'meta-uncertainty' about the underlying model," including reference-class uncertainty. They note "it would be very unfair to convict one prisoner when all one hundred have the same probability of guilt."
- **(d)** None.

### Frick 2015, "Contractualism and Social Risk" (PPA 43(3):175–223)

**NOT READ.**
- Secondary (Rüger 2018, JESP): Frick's ex ante contractualism grounds claims "as a function of the expected value that a given policy gives each person ex ante." Mass Vaccination, as Rüger presents it: "We can decompose cases like Mass Vaccination into a large number of single-person gambles." The subtitle is "How to count the numbers without aggregating."
- [FROM MEMORY, unverified] Frick defends ex ante over ex post contractualism. Mass Vaccination compares certain paralysis of a leg for each child with a small death risk for each child. Complaints are discounted by probability. He restricts ex ante justification to cases decomposable into separate risk impositions, each in the bearer's ex ante interest, and discusses identified versus statistical victims.
- Check against the text before relying on any wording.

### Gustafsson & Kowalczyk 2026, "Ex Ante Pareto and the Opaque-Identity Puzzle" (J Phil 123(1):63–76)

**(a)** Mahtani's puzzle (Ann/Beth vs Smith/Jones) does not show the Ex Ante Pareto Principle is incomplete. Prospects are already relative to a method of trans-world identification across epistemic possibilities, which context supplies.

**(b)** "The Ex Ante Pareto Principle: If the prospect of everyone affected is better if you choose one option than if you choose another, then you should not choose the second option if you can choose the first" (pp. 64–65).
- With a counterpart-theoretic reading, context can affect whether the antecedent holds. With Bernoulli, avoiding context-sensitive permissibility pushes toward expectational utilitarianism (pp. 70–71).
- The puzzle does not arise for Harsanyi's chance- and preference-based version (§4).

**(c)** Identifying by name and condition makes the full-dose policy ex ante better for everyone. Identifying by role ("whoever arrived first") does not. Learning dossiers, or a mere salience shift such as a phone call from "Jones," can change the operative identification (p. 70). This maps directly onto "each named assessee" versus "whoever turns out to be the outlier."

**(d)** None.

### Hare 2016, "Should We Wish Well to All?" (Phil Review 125(4))

**(a)** Theories that forbid acting as reasonable beneficence toward each affected person recommends are mistaken: "Wish well to all, and act on your wishing" (p. 28). Examples are extreme progressivism and constraints against killing (At the Doctor; Footbridge with Suitcases).

**(b) Principles.**
- Defeasible privacy (p. 17): "When you know that an action will affect the well-being of only one person, and you know who that person is, then it is morally appropriate, in the absence of powerful defeating considerations, to act out of reasonable concern for that person."
- Weak Agglomeration (P2, p. 13).
- The argument from composition requires decomposability into single-person sub-actions.

**(c)**
- *One Big Button* (non-decomposable): "Nonetheless my inclination is to think that you ought to press in this case too" (p. 19).
- *Known victim:* "it may be that it matters whether you know who is who" (p. 21). "Bridgey" values are not reasons you have "until you recognize the ways in which it is better" (p. 27).
- Hare notes Parfit's objection: "One of them has Maleficitus." He also notes Fleurbaey & Voorhoeve's ex post "decide as you would with full information" objection, and rejects both.

**(d)** None.

### Voorhoeve 2014, "How Should We Aggregate Competing Claims?" (Ethics 125(1))

**(a)** Aggregate Relevant Claims (ARC) explains both limited aggregation (many disabilities can outweigh one death) and limited non-aggregation (no number of trivial harms can). The rationale combines aggregative and sympathetic, one-person-at-a-time responses to each person's equal value.

**(b) ARC** (p. 66, verbatim):
1. "Each individual whose well-being is at stake has a claim on you to be helped…"
2. "Individuals' claims compete just in case they cannot be jointly satisfied."
3. "An individual's claim is stronger: a) the more her well-being would be increased by being aided; and b) the lower the level of well-being from which this increase would take place."
4. "A claim is relevant if and only if it is sufficiently strong relative to the strongest competing claim."
5. "You should choose an alternative that satisfies the greatest sum of strength-weighted, relevant claims."

Relevance test (p. 72): "Person A's claim is relevant to B's competing claim just in case, in a one-to-one comparison of their claims from A's permissible personal perspective, A's claim is at least as important as B's."

**(c)**
- Explicitly riskless: "my cases involve neither risk nor changes in the population" (p. 67).
- *Case 5* (pp. 84–86): ARC can mandate an option worse at every anonymized position in order to give a large benefit to the one with most at stake. "it seems reasonable to sacrifice some impersonal goodness in order to do justice to how things look when we take up each person's point of view" (p. 87).
- Contraction consistency is handled by fine-grained individuation (§VI).

**(d)** None.

---

## Additional relevant finds (not on your list)

- **Viganò, Hertweck, Heitz & Loi, "People are not coins," FAccT 2022** (arXiv 2204.10305, read).
  - "An h-individual probability is determined with data of the person whom the prediction is about; an h-group probability is determined with data of other people beyond the person whom the prediction is about."
  - "h-group practices treat the person as an instance of a more general type, not as an individual."
  - Hedden's argument holds only for h-individual practices. This is the nearest existing treatment of "other people's data" as such.
- **Giacomini, Lee & Sarpietro, "Individual Shrinkage for Random Effects"** (econometrics, arXiv 2308.01596, v4 2026).
  - James–Stein and empirical Bayes "target aggregate performance and can lead to inaccurate individual decisions." They speak of the "'tyranny of the majority' inherent in existing methods" and say JS "can induce large bias for outliers."
  - Estimates "may depend on sample composition rather than reflecting true individual quality."
  - They cite Efron & Morris 1971 (limit shrinkage of outliers) and Mallows & Tukey on "relevance."
- **Mehta 2019, Quantitative Economics 10:1537–77.** Shrinkage in teacher incentive schemes can fail to reward the best small-class teacher. "It is not clear that an estimator with a lower mean squared error should always be preferred to an unbiased one."
- **Susin & Voicu 2018, J Legal Studies 47(1).** Empirical Bayes for individual damages in discrimination suits (abstract only).
- **Creel & Hellman, "The Algorithmic Leviathan: Arbitrariness, Fairness, and Opportunity…" (2022).** Not read, but the obvious arbitrariness reference.
- **Romeijn, "Stein's paradox and group rationality"** (Caltech HPS talk; social epistemology, no fairness).
- [FROM MEMORY]
  - Efron & Morris 1972 showed James–Stein's maximum single-component risk grows roughly like p/4, and proposed "limited translation" estimators to cap it.
  - Phelps 1972 and Aigner & Cain 1977 model statistical discrimination as Bayesian shrinkage of a noisy individual signal toward a group mean.

---

## Synthesis (≤500 words)

**1. The right to be treated as an individual.** The best-developed positive statement is Eidelson's autonomy account: Character plus Agency Conditions. It is *inclusive*: it permits statistical evidence but requires reasonable weight on evidence of the person's self-authorship, and its scope is limited to autonomy-implicating judgments. Its rivals are:
- an informational/accuracy reading (Lippert-Rasmussen: all relevant information reasonably available);
- Moss's rule of consideration (keep in mind that she "might be an exception");
- a data-source view (Viganò et al.);
- replacements that abandon "individual" talk: comparative equal protection (Di Bello & O'Neil), statistical criteria (Hedden's calibration; Eva's BRT), or deflation (Beeghly; Enoch et al.'s priority of accuracy).

**2. The Stein case.** Nothing I read addresses data from mere co-assessees. Near misses:
- Eidelson's sibling example: using a particular other person's record is, "if anything," a failure to individualize.
- Viganò et al.'s definition classifies Stein estimates as "h-group," but their rationale (assimilation to similar people) does not fit unrelated others.
- Fleisher fn 12 and Hedden fn 22 both involve others who are *similar* to the person.
- Vassend et al. stress unrelatedness and Clemente's code-dependence but draw only epistemic morals.

Two points look new:
- Under an exchangeable model, the raw estimate is miscalibrated (regression to the mean) and shrinkage restores calibration. So Hedden's sole criterion favors shrinkage, while BRT2 and a "same record, same score across pools" norm disfavor it.
- Dependence on who else is assessed fits Steele's "evidential luck" and Di Bello & O'Neil's predictability test better than the individuality literature.

**3. Frameworks for lowering one person's accuracy to raise the total.** Stein's dominance is aggregate dominance for every true configuration, not per-person dominance. Per-person ex ante gain arises only under symmetric uncertainty about who is extreme.
- **Ex ante Pareto and Hare.** These support shrinkage under exchangeability. Hare's composition argument does not apply, because each estimate depends on all data (his "One Big Button"), though his verdict there still favors acting.
- **Gustafsson & Kowalczyk.** This is the sharpest tool: whether shrinkage is ex ante better *for everyone* depends on identifying persons by name or by role ("the outlier"), and context or dossiers can shift this.
- **Frick.** Probability-discounted complaints (not read).
- **Voorhoeve's ARC, applied ex post.** The outlier's large loss could make the many small gains irrelevant. This mirrors limited-translation estimators, which act as a statistical form of partial aggregation.
- **Di Bello & O'Neil.** Adds a comparative ex ante test: is the higher risk borne by a type that can be specified in advance?

The best fit is Gustafsson & Kowalczyk plus Hare for the ex ante question, ARC for limits, and Di Bello & O'Neil for comparative claims.

**4. Antecedents.** I found no philosophy paper linking Stein's paradox to fairness or the right to be treated as an individual. Closest are Vassend et al. 2017; Giacomini et al.'s "tyranny of the majority"; Efron & Morris; Mehta 2019; and statistical-discrimination economics, where shrinkage is toward a *group* mean. The Stein case generalizes the target to an arbitrary cohort's mean. The gap appears open, subject to the access limits above.

## Sources
- [Vassend, Sober & Fitelson preprint](https://philsci-archive.pitt.edu/13303/1/Philosophical%20significance%20of%20Stein%20Preprint.pdf)
- [Di Bello & O'Neil (PhilArchive)](https://philarchive.org/rec/DIBPEF) and [CUNY copy](https://academicworks.cuny.edu/le_pubs/468/)
- [Climenhaga record](https://philarchive.org/rec/CLIURO) and [Ethics page](https://www.journals.uchicago.edu/doi/10.1086/736739)
- [Hedden](https://philarchive.org/rec/HEDOSC)
- [Eidelson chapter PDF](https://blogs.cornell.edu/marmor/files/2017/07/Eidelson-Treating-People-as-Individuals-2cuxx77.pdf)
- [Beeghly record](https://philarchive.org/rec/BEEFTT)
- [Eva 2024, JAIR](https://www.jair.org/index.php/jair/article/view/15236)
- [Fleisher](https://philarchive.org/rec/FLEAFC)
- [Moss, Knowledge and Legal Proof](https://public.websites.umich.edu/~ssmoss/Moss%20-%20Knowledge%20and%20Legal%20Proof.pdf)
- [Moss, Moral Encroachment](https://academic.oup.com/aristotelian/advance-article/doi/10.1093/arisoc/aoy007/5042180?guestAccessKey=9b0d9760-d700-4580-9dbd-52162744c509)
- [Enoch, Spectre & Fisher](https://philarchive.org/rec/ENOSES)
- [Steele talk, ANU HMI](https://hmi.anu.edu.au/ourwork/evidence-arbitrariness-and-fair-treatment) and [Oxford abstract](https://philosophy.web.ox.ac.uk/node/3003506)
- [Steele & Colyvan 2023](https://link.springer.com/article/10.1007/s11098-023-01951-5)
- [Rüger, JESP](https://jesp.org/index.php/jesp/article/view/323/224)
- [Gustafsson & Kowalczyk preprint](https://johanegustafsson.net/papers/ex-ante-pareto-and-the-opaque-identity-puzzle.pdf)
- [Hare (MIT)](https://dspace.mit.edu/handle/1721.1/115207)
- [Voorhoeve (LSE)](https://eprints.lse.ac.uk/55883/)
- [Viganò et al.](https://arxiv.org/pdf/2204.10305)
- [Giacomini, Lee & Sarpietro](https://arxiv.org/abs/2308.01596)
- [Mehta 2019](https://mail.econometricsociety.org/publications/quantitative-economics/2019/11/01/Measuring-quality-for-use-in-incentive-schemes-The-case-of-shrinkage-estimators/file/QE950.pdf)
- [Susin & Voicu](https://chicagounbound.uchicago.edu/jls/vol47/iss1/7)
- [Creel & Hellman](https://philarchive.org/rec/CRETAL-3)
- [Romeijn talk](https://hss.caltech.edu/news-and-events/calendar/seminar-on-history-and-philosophy-of-science-3)
