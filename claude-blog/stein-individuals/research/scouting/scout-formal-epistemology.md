# Scouting report: formal epistemology and decision theory

**Bottom line.** I found four candidates. The strongest is the first: whether a track record can show that someone is an expert. It has a formal backbone of striking theorems from economics, a recent opening in philosophy, a problem any generalist cares about, and as far as I could tell the natural philosophical theses are unpublished.

**Limits on the checks.**
- The shared web-search budget ran out near the end of this run.
- PhilPapers and PhilArchive search pages mostly could not be fetched.
- So every "no philosophy uptake found" below rests on general web search plus reading the key papers. Each one should be re-checked directly in PhilPapers before committing. I list the specific queries under each candidate.
- Everything cited below was fetched and checked unless it is marked *[not re-verified]*.

---

## 1. What can a track record show? Testing experts against strategic ignorance

**(a) Problem.** Philosophers' main "objective" criterion for picking experts is the track record: past forecasts that came out right or were well calibrated (Goldman 2001). Economists have proved that no test of a single forecaster's record of forecasts is safe from cheating. Any such test that a genuine expert passes with high probability can also be passed, with high probability and on every possible data sequence, by someone who knows nothing about the process. So the question for generalists is this: can evidence ever show that someone is an expert, rather than merely better than a rival? It matters for pundits, science advice and evaluating AI forecasters.

**(b) Key works (all verified).**
- Recent philosophical opening: Levy, ["No trespassing! Abandoning the novice/expert problem"](https://researchers.mq.edu.au/en/publications/no-trespassing-abandoning-the-noviceexpert-problem/), *Erkenntnis* 90(5), 2025. He argues novices can't apply Goldman's criteria without already having expertise.
- Recent revival of calibration: Williams & Pettigrew, ["Consequences of Calibration"](https://www.journals.uchicago.edu/doi/10.1086/725097), *BJPS* 77(2), 2026.
- The impossibility results:
  - Sandroni, ["The reproducible properties of correct forecasts"](https://ideas.repec.org/a/spr/jogath/v32y2003i1p151-159.html), *IJGT* 2003.
  - Olszewski & Sandroni, ["Manipulability of future-independent tests"](https://www.econometricsociety.org/publications/econometrica/2008/11/01/manipulability-future‐independent-tests), *Econometrica* 2008. The only tests that can't be gamed use predictions about data not yet observed, which means the expert must commit to a full theory up front.
- Where testing does work:
  - Comparative tests: Al-Najjar & Weinstein, ["Comparative testing of experts"](https://www.econometricsociety.org/publications/econometrica/2008/05/01/comparative-testing-experts), *Econometrica* 2008; Feinberg & Stewart, ["Testing multiple forecasters"](https://ideas.repec.org/p/ecl/stabus/1957.html), *Econometrica* 2008.
  - The comparison test is essentially unique and is an asymptotic likelihood ratio: Kavaler & Smorodinsky, ["On comparison of experts"](https://arxiv.org/abs/1710.09461), *Games and Economic Behavior* 2019. They cite Edwards's "Likelihood Axiom", but not Royall or the philosophical likelihoodism literature.
  - Limits on the cheater's computing power restore testability: Fortnow & Vohra, ["The complexity of forecast testing"](https://www.econometricsociety.org/publications/econometrica/2009/01/01/complexity-forecast-testing), *Econometrica* 2009.
- Survey: Olszewski, ["Calibration and expert testing"](https://ideas.repec.org/h/eee/gamchp/v4y2015icp949-984.html), *Handbook of Game Theory* vol. 4, 2015.

**(c) What is open.** No philosophy paper I could find uses these results in the novice/expert or track-record debate, in the debate about matching your confidence to your own track record ("calibrationism"), or in the likelihoodism debate. Open questions:
- What follows for the concept of expertise?
- Is Levy's pessimism right or wrong in light of the theorems?
- Does likelihoodism get a new vindication?

**(d) Thesis sketches.**
- **Counterfactual commitment.** Expertise can be tested only if experts commit to whole models, including predictions about contingencies that never happen. Records of actual forecasts can never certify it. That ties testable expertise to the counterfactual-rich competence that accounts of understanding emphasise, and it gives experts a duty to make that kind of commitment.
- **Comparative only.** Absolute certification is impossible. The comparative test (likelihood ratio) works whenever one party is informed. That partly rebuts Levy: the novice needs commensurable forecasts on shared questions, not domain expertise. It also gives a new, strategic argument that evidence is contrastive in structure, of interest to Fitelson-style debates.

**(e) Priority checks.** Web searches combining "Sandroni", "Foster–Vohra", "comparative testing", "charlatan" and "manipulable test" with philosophy, epistemology, Goldman and expertise found no philosophy-journal uptake. The econ/CS side is mature.

Two items must be read before committing:
- Pomatto & Sandroni, "An axiomatic theory of inductive inference", *Philosophy of Science* 2018. Its existence is confirmed on [Pomatto's page](https://www.its.caltech.edu/~lpomatto); I did not read it. It shows the testing economists have already written in philosophy venues.
- Olszewski & Sandroni, "Manipulability of comparative tests", *PNAS* 2009. Its existence is confirmed on the [Kellogg page](https://www.kellogg.northwestern.edu/academics-research/research/detail/2009/manipulability-of-comparative-tests/?p=1); I could not get the abstract. It may limit the "comparative only" thesis.

Also engage Shafer and Vovk's betting-based "defensive forecasting".

Recheck queries for PhilPapers: "Sandroni", "Foster Vohra", "forecast testing", "strategic expert".

**(f) Risk.** If done well: about 25% surprising, 55% interesting, 20% expected. The main failure is that it reads as a report on economics, so the philosophical claim has to carry the paper. A second objection is that adversarial cheaters who randomise are unrealistic; that needs a Bayesian reconstruction showing that passing a test carries a likelihood ratio near 1. The comparative claims also need nuance: Feinberg & Stewart's test rejects some true experts when no informed expert is present.

---

## 2. Forecasts that steer: self-fulfilling forecasts, advice, and the scope of accuracy

**(a) Problem.** Many forecasts change what they forecast: bank runs, polls, AI risk scores, advice a decision-maker then acts on. What counts as a correct or honest forecast then? Can a decision-maker get honest advice about the consequences of options she will not take?

**(b) Key works.**
- Perdomo, Zrnic, Mendler-Dünner & Hardt, ["Performative prediction"](https://proceedings.mlr.press/v119/perdomo20a.html), *ICML* 2020.
- Oesterheld, Treutlein, Cooper & Hudson, ["Incentivizing honest performative predictions with proper scoring rules"](https://arxiv.org/abs/2305.17601), 2023 (PMLR v216). With three or more outcomes, no scoring rule makes the score-maximising report self-consistent (a fixed point). They cite only Greaves (2013) from philosophy.
- Perdomo, ["Revisiting the predictability of performative, social events"](https://mlanthology.org/icml/2025/perdomo2025icml-revisiting), *ICML* 2025.
- Harel, ["Self-defeating and self-fulfilling reactivity"](https://link.springer.com/10.1007/s13194-026-00720-5), *EJPS* 2026.
- Advice for decisions:
  - Othman & Sandholm, ["Decision rules and decision markets"](https://ifmas.csc.liv.ac.uk/Proceedings/aamas2010/pdf/01%20Full%20Papers/13_03_FP_0224.pdf), *AAMAS* 2010.
  - Oesterheld & Conitzer, ["Decision scoring rules"](https://www.andrew.cmu.edu/user/coesterh/DSRWINE.pdf) (WINE 2020 per the filename). Experts can't be scored on actions not taken; honest advice otherwise requires the decision-maker to randomise.
- Philosophy side *[classics, not re-verified]*: Greaves 2013 (*Mind*); Caie 2013 (*Phil Review*); Carr 2017 (*PPR*); Konek & Levinstein 2019 (*Mind*); Joyce 2018 on ratification.

**(c) What is open.**
- What the multi-outcome impossibility means for accuracy-first epistemology.
- How the machine-learning distinction between stable and optimal predictions maps onto Joyce's ratifiability versus consequentialist scoring of credences.
- Whether "deliberation crowds out prediction" has a multi-agent analogue, where deliberation crowds out elicitation.

**(d) Thesis sketches.**
1. The Oesterheld et al. impossibility is a decisive argument that accuracy for self-affecting credences must be assessed as ratifiable fixed points. Then show the new cost: stable points can be accuracy-dominated.
2. A decision-maker who acts deterministically can elicit only "evidential" consequence-forecasts. Honest causal advice has a price, a commitment to randomise, which is the logic of the randomised trial. That gives a new institutional argument in the CDT/EDT debate.

**(e) Priority checks.** No philosophy paper found connecting performative-prediction results or decision scoring rules to epistemic decision theory or CDT/EDT. However, the "futarchy implements EDT" point is argued on LessWrong ([dynomight 2025](https://dynomight.net/futarchy) and the [reply](https://www.greaterwrong.com/posts/dEoyaWznnKtM5GMnM/no-futarchy-doesn-t-have-an-edt-flaw)). Oesterheld also publishes in philosophy venues, so check his philosophy output.

**(f) Risk.** About 15% surprising, 55% interesting, 30% expected. It fails if it looks like a crossover note on CS work, or if judges see the self-fulfilling-credence debate as having peaked around 2019.

---

## 3. Where "ordinary" ends and "Pascalian" begins: a riskiness threshold for fanaticism

**(a) Problem.** Should we ignore tiny probabilities of vast payoffs? Tarsney argues that background uncertainty (uncertainty about value our choice doesn't affect) makes stochastic dominance demand expected-value reasoning in ordinary choices but not in Pascalian ones. Where exactly is that line, and is it principled?

**(b) Key works.**
- Tarsney, ["Expected value, to a point"](https://philarchive.org/rec/TAREVT), *Noûs* 59(4), 2025. His 2020 arXiv version cites Pomatto et al. (2020) and gives his own sufficiency and necessity theorems, approximating the threshold by the sure payoff divided by the background spread. He does not give a clean formula.
- Mu, Pomatto, Strack & Tamuz, ["Background risk and small-stakes risk aversion"](https://www.its.caltech.edu/~lpomatto/background_risk.pdf), *AER: Insights* 2024. Their Theorem 1 is a tight criterion: a favourable bounded gamble is dominant to accept whenever its Aumann–Serrano riskiness is at most the "exponential size" of the background risk. They cite Tarsney 2018 but say nothing about fanaticism.
- Pomatto, Strack & Tamuz, ["Stochastic dominance under independent noise"](https://arxiv.org/abs/1807.06927), *JPE* 2020.
- Russell, ["Fixing stochastic dominance"](https://philarchive.org/rec/RUSFSD), *BJPS* 2026; Russell, "On two arguments for fanaticism", *Noûs* 2024.
- *[not re-verified]*: Beckstead & Thomas, *Noûs* 2024; Wilkinson, "In defence of fanaticism", *Ethics* 2022; Aumann & Serrano, *JPE* 2008; Foster & Hart, *JPE* 2009.

**(c) What is open.** Whether the boundary is best stated as a riskiness threshold rather than a probability threshold. My rough calculation: for a Pascalian gamble, riskiness is about loss divided by probability. Also what that means for probability-discounting views, and whether riskiness's long-run meaning connects Tarsney's argument to long-run arguments for expected value (Thoma; Wilkinson).

**(d) Thesis sketches.**
- Anti-fanaticism under stochastic dominance is a precise, background-relative riskiness threshold. That shows probability-discounting thresholds have the wrong shape.
- Foster–Hart riskiness has a no-bankruptcy, long-run reading. On that reading, stochastic dominance licenses expected value for exactly those gambles the world's "reserve" of background value can absorb.

**(e) Priority checks.** It is unverified whether Tarsney's final *Noûs* version cites the 2024 Mu et al. paper or frames the line as riskiness. That is the critical check: read the published reference list. Nothing found linking Mu et al. to the fanaticism literature.

**(f) Risk.** About 20% surprising, 45% interesting, 35% expected. It fails if Tarsney, who is a likely judge, has already absorbed this. Other ways it fails: the criterion covers only "take the gamble or not" and doesn't extend cleanly to general comparisons; or it reads as "an economics formula applied". The area is crowded.

---

## 4. What a calibrated forecast is worth: multicalibration, individual probabilities and deference

This overlaps with #1; pick one or merge them.

**(a) Problem.** What does "your risk is 30%" mean for an individual? When should you adopt an algorithm's probability as your own credence? Theoretical CS has new answers: "multicalibration" (calibrated across many overlapping subgroups) and "outcome indistinguishability" (no test in a given class can tell the predictor's probabilities from the truth).

**(b) Key works.**
- Roth & Tolbert, ["Resolving the reference class problem at scale"](https://www.cambridge.org/core/journals/philosophy-of-science/article/resolving-the-reference-class-problem-at-scale/A60BFD1FF068E0D1E3071C2EE8697C3E), *Phil Sci* 92(4), 2025. From the abstract and page they don't discuss the Principal Principle or deference; I haven't read the full text.
- Roth, Tolbert & Weinstein, "Reconciling individual probability forecasts", *FAccT* 2023 (verified via [PhilPeople](https://philpeople.org/profiles/aaron-roth/publications)).
- Dwork et al., ["Outcome indistinguishability"](https://ar5iv.labs.arxiv.org/html/2011.13426) (STOC 2021 *[venue not re-verified]*).
- Gopalan et al., ["Omnipredictors"](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ITCS.2022.79), *ITCS* 2022; Gopalan, Kim & Reingold, ["Swap agnostic learning"](https://arxiv.org/abs/2302.06726), *NeurIPS* 2023.
- Kleinberg et al., ["U-calibration"](https://proceedings.mlr.press/v195/kleinberg23a.html), *COLT* 2023; Roth & Shi, ["Forecasting for swap regret for all downstream agents"](https://arxiv.org/abs/2402.08753), 2024. Calibration has long been known to guarantee that any downstream agent who best-responds to the forecasts won't regret doing so, whatever their goals.
- Philosophy: Williams & Pettigrew 2026; Levinstein, ["Accuracy uncomposed: against calibrationism"](https://philarchive.org/rec/LEVAUA), *Episteme*; Dawid, ["On individual risk"](https://api.philpapers.org/rec/DAWOIR), *Synthese* 2017; Masterton, ["What to do with a forecast?"](https://api.philpapers.org/rec/MASWTD), *Synthese* 2014.

**(c) What is open.** A version of the Principal Principle (the rule tying credence to chance) relative to an agent's computational powers, where what counts as "admissible" evidence becomes computational. Also the standing of calibration relative to accuracy, given that calibration is cheap to achieve yet guarantees decision-safety.

**(d) Thesis sketches.**
- You should defer to a multicalibrated predictor exactly when your evidence is computably screened off by its test class. Individual probabilities would then be agent-relative "computational chances".
- Calibration is the virtue of forecasts as tools for trust and action, not of forecasters as knowers. That splits the difference between calibrationists and accuracy-first critics.

**(e) Priority checks.** Roth & Tolbert occupy the reference-class angle. No philosophy uptake found of omnipredictors, U-calibration or the swap-regret result. Earlier "epistemic or relative chance" views (Eagle; deterministic-chance literature) make the computational Principal Principle risk looking expected.

**(f) Risk.** About 15% surprising, 50% interesting, 35% expected. It fails through technical overhead and through Dwork et al. and Roth already doing the philosophy.

---

## Rejected after checking
- **E-values as a measure of evidence.** Chugg, Ramdas & Grünwald, ["E-values as statistical evidence"](https://arxiv.org/abs/2603.24421) (2026), already cover the likelihood principle (strict and loose versions), Birnbaum, Mayo and Royall.
- **AI shutdown and incomplete preferences.** Saturated: Thornley 2024, plus Alignment Forum formal statements.
- **Instrumental convergence.** Done by Gallow, ["Instrumental Divergence"](https://philarchive.org/rec/GALIDB) (*Phil Studies*).
- **Awareness growth.** Crowded: Steele & Stefánsson, Pettigrew, Mahtani, plus economics.
- **Logical induction as a coherence norm for bounded reasoners.** Little academic uptake, but LessWrong and MIRI have made the natural moves.
- **"Surprisingly popular" answers and disagreement.** No philosophy uptake found, but it overlaps #1 and is heavily studied in psychology.
- **Risk aversion; Reflection and martingale principles; Sleeping Beauty; multiverse self-location.** Crowded or tied to a single exchange.

## Overall judgment
I would bet on **#1**, with the counterfactual-commitment thesis as the centrepiece and the "calibration certifies usability, not knowledge" point from #4 folded in as a section.
- It poses a question any philosopher cares about: can evidence ever show that someone is an expert?
- It rests on deep, little-known theorems, so specialists are likely to learn something.
- It has a live philosophical foil in Levy 2025, plus the 2026 revival of calibration.
- It suits likely judges: Fitelson on likelihoodism, Easwaran on social and formal epistemology.
- Unlike the guessing project, the formal results are openly imported. The originality lies in what they mean for the concept of expertise, which I could not find anywhere.

The decisive pre-commitment checks are Pomatto & Sandroni (2018), Olszewski & Sandroni (*PNAS* 2009), and a direct PhilPapers sweep. #2 is the best backup with real decision-theoretic content. #3 is the highest-variance option: excellent if Tarsney hasn't used the 2024 Mu et al. result, dead if he has.
