# Scouting report: value theory, formal ethics, social/political (2024–26)

## How I checked, and the limits
- **Coverage.** I pulled the 2025–26 tables of contents from Crossref for Phil Review, Noûs, Mind, J Phil, Ethics, PPA, PPR, AJP, Analysis, PQ, Utilitas, E&P, Phil Imprint, Ergo, JMP and Phil Studies. I also went through the GPI working-paper list, PhilArchive records, and web searches.
- **Search budget ran out.** The shared web-search budget was used up about two-thirds of the way through. After that, priority checks were done only by fetching specific publisher, arXiv or PhilArchive pages and by Crossref DOI lookups. No further keyword searching was possible.
- **Citation marks.** [v] means title, author, venue and year were confirmed this session. [m] means from memory and not re-checked.

## Already done or crowded (so you don't repeat these)
- **Fanaticism.** Tarsney PPR 2025; Kowalczyk AJP 2025; Bottomley & Williamson Ethics 2025; Barrett GPI 2024; Beckstead & Thomas Noûs 2023/24 [v]. Saturated, and the judges are the main players.
- **Incompleteness vs dominance.** Tarsney, Lederman & Spears, Phil Review 134(4) 2025 [v]; Francis & Gustafsson Analysis 2025; Buchak & Nebel J Phil forthcoming; Horton & Ross Phil Review 2025. Also saturated.
  - An application exists: Thornley-style shutdownable agents deployed as many instances look exposed to the Tarsney–Lederman–Spears dominance argument. That is my inference, not something the paper says.
  - It would likely read as a narrow corollary.
- **Limited aggregation under risk.** Kowalczyk Analysis 2024; Francis GPI 2024; Tank, Wendler & Mainka Noûs 2025; Kneer & Viehoff AJP 2025.
- **AI safety vs AI welfare, and counting AI minds.** Long, Sebo & Sims Phil Studies 2025; Moret 2025; Bradley & Saad 2025; Register 2025 [v].
- **Other topics already taken:**
  - Goodhart / proxy optimization: Neth, PPR 2026 [v].
  - Value of normative information: Russell, AJP 2025.
  - Proportional giving under moral uncertainty: Kaczmarek, Lloyd & Plant, Ergo 2025.
  - AI rights for safety: Salib & Goldstein, Va. L. Rev. 112 (2026) [v], plus Goldstein's draft on war between humans and AIs.
  - Undefined expected value of the future: Wilkinson, Ergo 2026 [v].
  - Testing AI under imperfect recall: Chen, Ghersengorin & Petersen, GPI 2024. The decision theory is the known Piccione–Rubinstein and Briggs material.

---

## 1. Stein's paradox and the right to be judged as an individual (top pick)

**(a) Problem.** Courts, lenders, universities and AI risk-scorers estimate many people's traits from noisy individual records.
- **Stein's theorem.** The ideal of "judge each person only on her own evidence" is inadmissible once three or more people are assessed (Stein 1956; James & Stein 1961 [m]). Some other estimator is more accurate in total under every possible truth, and it gets there by pulling each person's estimate toward everyone else's.
- **No shared group needed.** This holds even when the people assessed are statistically unrelated.
- **Who pays.** Under shrinkage the exceptional are the ones mis-assessed, and your score depends on which strangers happen to be in your batch.
- **Why it matters now.** Empirical-Bayes and regularized scoring build this in.

**(b) Key works**
- Di Bello & O'Neil, Ethics 130(2) 2020 [v, [doi](https://doi.org/10.1086/705764)].
- Climenhaga, "Unequal Risks of Mistaken Conviction Are Unavoidable," Ethics 136(1) 2025: 147–160 [v, [doi](https://doi.org/10.1086/736739)].
- Fleisher, "Algorithmic Fairness Criteria as Evidence," Ergo 2026 [v].
- Hedden, PPA 2021 [v]; Eva, PPA 2022 [v].
- Vassend, Sober & Fitelson, "The Philosophical Significance of Stein's Paradox," EJPS 7(3) 2017 [v]. This is philosophy of science only.
- Efron & Morris, "Limiting the Risk of Bayes and Empirical Bayes Estimators," JASA 1971 and 1972 [v]. These are the "limited translation" estimators that cap any one person's extra error.
- For the ex ante machinery: Gustafsson & Kowalczyk, J Phil 123(1) 2026 [v]; Frick, PPA 2015 [v].

**(c) What is open.** I found no ethics paper on shrinkage of the Stein kind. Four questions are open:
1. Is accuracy across many people an aggregative good?
2. Does the ex ante argument for shrinkage have authority? Under any exchangeable prior, every assessee's expected error falls, so it is ex ante Pareto-better for each.
3. Batch-dependence: identical evidence gets different scores depending on who else is assessed. What fairness principle does that violate?
4. Is limited translation the statistical twin of partial aggregation?

**(d) Thesis sketches**
- **T1: Accuracy is aggregative; individualized assessment is a distributive constraint on it.** The positions line up with the aggregation debate:
  - Full aggregation corresponds to James–Stein.
  - Anti-aggregation corresponds to the raw individual estimate.
  - Partial aggregation corresponds to Efron–Morris limited translation.
  
  Argue for limited translation in high-stakes decisions. It explains the profile-evidence intuitions better than Di Bello and O'Neil's equal-risk principle, which Climenhaga shows cannot be satisfied.
- **T2: A right everyone would waive ex ante.** Argue that ex ante Pareto loses its authority when the uncertainty is the assessor's ignorance of fixed facts, which the person assessed may know. That gives the exceptional a real ex post complaint, and it marks a principled limit on ex ante reasoning (link to the opaque-identity puzzle).
- **T3 (optional).** Shrinking toward any target dominates the individual estimate. So in the dominance sense accuracy cannot favour group-based targets over group-blind ones, and the choice of reference class is a fairness choice that accuracy leaves open.
- **Scope caveat to state openly.** With equal noise for everyone, uniform shrinkage preserves rank order. The practical bite is at absolute thresholds (bail, credit cut-offs), in comparisons across batches, and where some people have thinner records.

**(e) Priority check**
- **Philosophy.** Only Vassend, Sober & Fitelson (philosophy of science) and one epistemology paper on empirical Bayes (Shetty et al., Entropy 2024 [v]).
- **Economics and statistics.** Shrinkage distortions are recognised in applied work, but not framed as fairness to individuals. Mehta, QE 10(4) 2019 [v] shows shrinkage can do worse than raw measures in teacher incentive schemes.
- **Group-based shrinkage is well covered.** Phelps-style statistical discrimination [m]; Emelianov et al., AIJ 2022 [v] on noisier evidence in selection; Borsboom, Romeijn & Wicherts, Psych Methods 2008 [v] on whether fair selection is possible.
- **Conclusion.** The Stein-specific points look untouched in philosophy: no groups needed, dominance under every truth, batch-dependence, and limited translation as partial aggregation.

**(f) Risk.** Not expected; interesting; the theorem genuinely surprises ethicists.
- **Main failure mode.** Being read as "all evidence is statistical" again (Lippert-Rasmussen, J Ethics 2010/11 [v]; Climenhaga). The essay must foreground what only Stein delivers.
- **Unchecked.** The legal-evidence and computer-science "individual fairness" literatures were not exhaustively searched.

## 2. When your AI negotiates with my AI: loyalty, shared policies and dual agency

**(a) Problem.** More and more, both sides of a negotiation, auction or price-setting will be served by instances of the same model running one policy.
- **No loyal option.** Whatever the instances do, the developer has in effect chosen how the surplus is split. The agent is a dual agent.
- **Collusion falls out.** In markets, the policy that is best for every user, given that every user's agent follows it, is collusive.
- **Decision theory decides.** Instances that reason act by act, like causal decision theory, reproduce the non-cooperative outcome. Instances that reason at the level of the policy, like evidential or functional decision theory, cooperate.

**(b) Key works**
- Gabriel & Keeling, Phil Studies 2025 [v]. Competition between assistants is mentioned only in passing (checked the publisher page).
- Gabriel et al., "The Ethics of Advanced AI Assistants," arXiv 2024 [v].
- Hammond et al., "Multi-Agent Risks from Advanced AI," arXiv 2025 [v]. It treats collusion as a risk category.
- Oesterheld et al., "Similarity-based cooperative equilibrium," arXiv 2022/23 [v].
- Calvano et al., AER 110(10) 2020 [v] on algorithmic collusion.
- Gustafsson & Mogensen, "Future generations and the evidential veil of ignorance," E&P 2025 [v].
- Thoma, "the moral proxy problem," 2022 [v].

**(c) What is open.** Four things:
1. What loyalty means when both sides share one policy.
2. Whether a "partisan" design is a neutral default, or a choice to impose non-cooperative inefficiency on the developer's own users.
3. How users' claims, judged ex ante, trade against non-users harmed by collusion.
4. Whether the agent's decision theory is itself an ethical choice.

**(d) Thesis sketches**
- **T1: Loyalty collapses into arbitration.** The right model is the law's dual agency [m]: the agent acts as a facilitator with disclosed limits. The arbitration standard is what users would pick behind a "role veil", not knowing which side they will be on.
- **T2: Decision theory is not ethically neutral.** Every user, judged ex ante, prefers cooperating agents. But in markets that same property is tacit collusion against non-users, so whoever sets the policy inherits the duties of an organized group.
- **Speculative formal hook.** Myerson–Satterthwaite rules out efficient trade when each side's valuation is private. A shared model could escape it only by pooling both sides' private information. That would breach confidentiality and, in equilibrium, destroy users' candour toward their own agent.

**(e) Priority check**
- **Known in CS and economics.** Similar agents cooperate; common algorithms collude; antitrust has a "hub-and-spoke" theory of collusion through shared pricing software [m].
- **Philosophy.** Nothing found on loyalty or dual agency between instances of the same model.
- **Not checked.** The full cooperation chapter of the DeepMind assistants report, and legal work on AI fiduciaries.

**(f) Risk.** Generalist and organiser appeal is high.
- **Expected to decision theorists.** The point that correlated agents cooperate is old (Hofstadter, evidential decision theory), so the value has to come from the normative reframing.
- **Failure mode.** The premise that instances act on policy-level correlation is contestable. Argue instead that the developer's training choice is the policy choice.

## 3. The moral two-envelope problem for possibly sentient beings (animals, AI)

**(a) Problem.** Expected-value allocation between humans and beings of uncertain moral weight w depends on whose welfare unit you hold fixed.
- **Two answers.** In human units the expected weight of chickens is E[w]. In chicken units it is 1/E[1/w].
- **The gap.** With skewed credences these differ by orders of magnitude.
- **Why it matters.** This is the working core of the moral-weights debate and of the expected-value-equivalence principle discussed in Ethics 2025.

**(b) Key works**
- Clatterbuck & Fischer, "Navigating Uncertainty about Sentience," Ethics 135(2) 2025: 229–258 [v]. The two-envelope problem does not appear in the abstract.
- Ackermans, "Four Formal Versions of the Two-Envelope Paradox," Mind 2026 [v]. It gives a "ratio commensurability" condition and has no moral-weights application (checked).
- Blackwell, Analysis 2025 [v].
- Carranza-Pinedo, PQ 2026 [v].
- Nebel, PPR 2021/22 [v]: Harsanyi weights as dimensional constants.
- St. Jules, EA Forum 2024 [v]: argues for anchoring on the human unit.
- Economics neighbours: Weitzman, JEEM 1998 [v]; Gollier & Weitzman, Econ Letters 2010 [v]; Fisher's "time-reversal test" in index-number theory (Carli vs Jevons indices) [m].

**(c) What is open.** No academic paper found that applies a formal two-envelope diagnosis to moral weights. Nor one that links it to the Weitzman–Gollier discounting puzzle or index-number theory. Nor one that works out what a positive credence in zero weight does to the choice of unit.

**(d) Thesis sketches**
- **T1: Sentience uncertainty forces the anchor.** A being that might have zero weight cannot serve as the unit. Anchored on certainly sentient beings, expected value is maximally generous to the uncertain ones (E[w] ≥ 1/E[1/w]). So the two-envelope problem cannot be used to discount possibly sentient beings.
- **T2: Demanding unit-neutrality is a trap.** Among homogeneous means, only the geometric mean is invariant to the choice of unit. It is non-expectational and anti-fanatical, and it zeroes out any being with positive credence of non-sentience. So the demand for unit-neutral moral weights has to go.
- **T3.** Under uncertainty about what welfare itself is, no anchor satisfies ratio commensurability. That turns the question into an intertheoretic-comparison problem.

**(e) Priority check.** Before the budget ran out, searches turned up only EA Forum work (Tomasik; St. Jules). I fetched St. Jules's post: it makes no Weitzman, Gollier, numeraire or index-number link. Clatterbuck and Fischer's full text and Fischer's book [m] were not checked.

**(f) Risk.** T1 overlaps St. Jules, so it is partly expected for EA-adjacent judges. T2 is the surprising part, but it is a reductio rather than a positive view.

## 4. Voting power after the partition problem (weakest; optional)

**(a) Problem.** Wodak, "What Voting Power Cannot Be," Noûs 2025 [v], argues as follows:
- The standard (Banzhaf) measure rests on the principle of indifference.
- It relies on an arbitrary partition: equal probability over vote combinations rather than over vote shares.
- This undercuts claims such as "the Electoral College favours large-state voters".
- He offers no positive account (checked the PhilArchive page).

**(b) Neighbours**
- Straffin, Public Choice 30(1) 1977 [v]. Banzhaf corresponds to independent votes, Shapley–Shubik to a common propensity. These are exactly Wodak's two partitions.
- Gelman, Katz & Tuerlinckx, Stat Sci 2002 [v]; Gelman, Katz & Bafumi, BJPolS 2004 [v].
- Abizadeh & Vetta, GEB 2024; Jerzak, "Age-weighted democracy," PQ 2026 [v].
- Kaniovski 2008; Laruelle & Valenciano [m].

**(d) Thesis sketch.** Use de Finetti: exchangeable priors are mixtures over a common propensity to vote one way, and Banzhaf and Shapley–Shubik are two points in that family.
- Any anonymous rule gives equal power under every model in the family, so "one person, one vote" survives as a symmetry requirement.
- For the Electoral College, inequality is generic but its direction depends on the model, so both critics and defenders are wrong to treat the direction as settled.

**(f) Risk.** High. The formal content is largely known to voting-power specialists, and this would read as a reply to one paper.

---

## Which I'd bet on
**Candidate 1.**
- **Surprising.** It rests on a theorem ethicists find startling: judging people only on their own evidence is beaten, in total, under every possible truth.
- **Live.** It plugs into a current top-venue debate (Ethics 2020 and 2025; PPA 2021 and 2022; Ergo 2026).
- **Judge fit.** The tools that do the work are the judges' own: aggregation, ex ante Pareto, opaque identity.
- **Room.** I found no philosophical precedent, and a 6,000-word paper with one clean formal result and two normative theses (T1 + T2) fits.
- **Discipline.** The essay must lead with what only Stein delivers: no groups needed, batch-dependence, the penalty on outliers, and limited translation as partial aggregation. Otherwise it reads as a familiar point about reference classes.

**Second choice is Candidate 2** if appealing to the organiser matters. It has the highest generalist appeal, but more priority risk from the AI-cooperation and legal literatures.

**Before committing, run these follow-up searches** (I couldn't, once the budget ran out):
- "shrinkage" or "James–Stein" in the legal-evidence literature, Ethics, PPA and Phil Studies.
- The DeepMind report's cooperation chapter.
- Whether Wodak cites Straffin.
