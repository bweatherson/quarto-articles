# Stein's paradox and fairness to individuals: research report

I checked bibliographic data (journal, volume, pages, DOI) against Crossref or OpenAlex, or in a few cases against the publisher or proceedings page. I read passages marked as quotes in the primary text: the PDF or the court slip opinion, or for Lederman a verbatim excerpt returned by a page-fetch tool. A few quotes come from secondary sources; I say so where that happens. Items I could not confirm are marked **UNVERIFIED**. Statements marked *[my derivation]* or *[my computation]* are my own work, checked by simulation, and not taken from a source.

**One correction to the brief:** Silber et al. (2010) is in *Health Services Research*, not *JAMA*.

---

## PART 1: The formal facts

### (a) Setting, estimators, risk and the size of the gain

**Setting.**
- There are p people, each with an independent noisy record: X_i ~ N(θ_i, σ²), i = 1,…,p, with σ² known (set σ² = 1 below).
- The loss is total squared error, L = Σ(δ_i − θ_i)².
- The "individual" estimator δ⁰(X) = X (the MLE) has constant risk p.

**Stein (1956).**
- Citation: "Inadmissibility of the usual estimator for the mean of a multivariate normal distribution," *Proc. Third Berkeley Symp.* 1: 197–206, doi:10.1525/9780520313880-018.
- He showed that X is inadmissible for p ≥ 3. The better estimators have the form (1 − b/(a + ‖X‖²))X, with b small and a large.
- X is admissible for p ≤ 2. Section 4 of Stein (1956) gives the first proof for p = 2 in the Gaussian case.
- Source for both points: Johnstone (2019), "Larry Brown's Work on Admissibility," *Statistical Science* 34(4): 657–668, doi:10.1214/19-STS744.

**James & Stein (1961).**
- Citation: "Estimation with quadratic loss," *Proc. Fourth Berkeley Symp.* 1: 361–379. The end page is given as 379 or 380 in different sources (minor, **UNVERIFIED**). Reprinted in *Breakthroughs in Statistics I*, doi:10.1007/978-1-4612-0919-5_30.
- **Estimator, shrinking to 0:** δ^JS(X) = (1 − (p−2)/‖X‖²) X.
- **Shrinking to a fixed point ν:** ν + (1 − (p−2)/‖X−ν‖²)(X−ν).
- **Risk:** R(θ, δ^JS) = p − (p−2)² E_θ[1/‖X‖²] < p for every θ when p ≥ 3. At θ = 0 the risk is 2. (Stark, Berkeley lecture notes; Efron & Morris 1975.)

**Shrinking to the grand mean (Lindley).**
- The idea is Lindley's, in the discussion of Stein (1962), *JRSS B* 24(2): 265–285, doi:10.1111/j.2517-6161.1962.tb00458.x. Efron & Morris (1975) cite it at pp. 285–7.
- Estimator: δ_i = X̄ + (1 − (p−3)/S)(X_i − X̄), with S = Σ(X_i − X̄)².
- It dominates X for p ≥ 4. Efron (2010, Theorem 1) states it as "N ≥ 4".
- Its risk is p − (p−3)² E[1/S], with a minimum of 3 when all θ_i are equal.

**Positive-part estimator.**
- Replace the factor with max(0, ·).
- Efron & Morris (1975, p. 312) state that R(θ, δ^{1+}) < R(θ, δ^1) for all θ, citing the proofs.
- They also note that these rules are "neither Bayes nor admissible, so they can be uniformly beaten (but not by much)."
- Citation: Efron & Morris (1975), "Data analysis using Stein's estimator and its generalizations," *JASA* 70(350): 311–319, doi:10.1080/01621459.1975.10479864.

**How the gain depends on spread** *[my derivation]*.
- ‖X‖² is a Poisson(‖θ‖²/2) mixture of central χ²_{p+2K} distributions, and E[1/χ²_m] = 1/(m−2).
- So E[1/‖X‖²] = E[1/(p−2+2K)] ≥ 1/(p−2+‖θ‖²) by Jensen.
- Hence **R ≤ p − (p−2)²/(p−2+‖θ‖²)**, which equals 2 at θ = 0 and tends to p as ‖θ‖ → ∞.
- For the grand-mean version, replace p−2 by p−3 and ‖θ‖² by Σ(θ_i − θ̄)².
- So the fractional saving is roughly (p−2)/(p−2+‖θ‖²). If the true values are spread with average squared deviation τ² (in noise-variance units), the saving is about 1/(1+τ²) for large p.
- Efron & Morris (1977) put it this way: "The risk is smallest when all the means are clustered at a single point. As the means depart from one another the risk of the James-Stein estimators increases, approaching that of the observed averages but never quite reaching it." (*Scientific American* 236(5): 119–127, doi:10.1038/scientificamerican0577-119.)

**Empirical-Bayes version of the same fact.**
- If θ_i are independent N(0, A), the Bayes risk of JS is p − (p−2)/(1+A).
- The oracle Bayes rule has risk p − p/(1+A), so JS loses only 2/(1+A) relative to it.
- *[My derivation, matching Efron & Morris 1973, "Stein's estimation rule and its competitors—an empirical Bayes approach," JASA 68(341): 117–130, doi:10.1080/01621459.1973.10481350.]*

**Baseball example (Efron & Morris 1975, p. 313).**
- Total squared prediction error was 17.56 for the MLE and 5.01 for Stein's rule (efficiency 3.50).
- Stein's rule was better for 15 of the 18 batters and worse for batters 1 (Clemente), 10 and 15.

### (b) Per-component risk: who loses, and by how much

**The basic admission.**
- Efron & Morris (1975, p. 313): "Stein's estimators achieve uniformly lower aggregate risk than the MLE but permit considerably increased risk to individual components of the vector θ. As a function of θ, the risk for estimating θ_1 by δ_1^1, for example, can be as large as k/4 times as great as the risk of the MLE X_1."
- They chose the data on purpose to "include an unusually good hitter (Clemente) to test the method with at least one extreme parameter, a situation expected to be less favorable to Stein's estimator" (p. 312).
- JS moved Clemente "an excessive 1.56 standard deviations" from his own average (p. 313).

**Why no shrinkage estimator can help everyone.**
- Morris & Lysy (2012), "Shrinkage estimation in multilevel normal models," *Statistical Science* 27(1): 115–134, doi:10.1214/11-STS363, §1:
  > "the JS estimator cannot even guarantee that every component (hospital) has a smaller risk … Such an improvement is impossible because each individual y_i is an admissible estimate of its own μ_i, in one dimension. Rather, minimaxity of the JS estimator for sum of squared errors is accomplished by 'balancing' or 'trading off' component risks … The minimaxity claim … is for aggregate risk, and not for every component."

**Which component loses** *[my derivation via Stein's identity, Stein 1981, AoS 9(6): 1135–1151, doi:10.1214/aos/1176345632; checked by simulation]*.
- For JS shrinking to 0, an unbiased estimate of person i's own risk is 1 + (p−2)[(p+2)X_i² − 2S]/S², with S = ‖X‖².
- This exceeds 1 (the MLE's risk) exactly when **X_i²/S > 2/(p+2)**.
- In words: the people expected to lose are those whose own deviation from the target is a disproportionate share of the total spread, i.e. the outliers.

**Size of the loss** *[my computation, Monte Carlo]*.
- Example with p = 10: one person at θ_1 = 3.16 and the other nine at the target.
  - That person's risk is 2.88, against 1 under the MLE.
  - Each of the others has risk 0.37.
  - Total risk is 6.21 against 10.
- Maximum per-component risk of positive-part JS, with the other components at the target. The peak occurs at θ_1 ≈ √p.

| p | Max per-component risk (MLE = 1) | p/4 |
|---|---|---|
| 3 | 1.21 | 0.75 |
| 5 | 1.67 | 1.25 |
| 10 | 2.88 | 2.5 |
| 18 | 4.88 | 4.5 |
| 50 | 12.9 | 12.5 |
| 100 | 25.3 | 25 |
| 400 | 100.4 | 100 |

- The worst-case individual risk grows linearly in p, approximately p/4. Heuristically, the shrink factor is about p/(p+λ²), the bias is λp/(p+λ²), and the squared bias peaks at λ² = p with value p/4.
- Efron & Morris report 4.60 for their k = 18 grand-mean case.

**Limited translation, Bayes case (Efron & Morris 1971).**
- Citation: "Limiting the risk of Bayes and empirical Bayes estimators—Part I: The Bayes case," *JASA* 66(336): 807–815, doi:10.1080/01621459.1971.10482348.
- Their abstract: the usual Bayes estimator "has high risk if θ is far from the mean of the prior"; they propose "compromises between the Bayes rule and the MLE."
- Set-up: prior θ ~ N(0, A), X | θ ~ N(θ, 1), B = 1/(1+A).
- The Bayes rule (1−B)X has risk (1−B)² + B²θ², which is unbounded in θ.
- The limited-translation (LT) rule is δ(x) = (1−B)x if B|x| ≤ k, and x − k·sign(x) otherwise. That is, never move anyone more than k standard deviations from their own data.
- Koenker & Gu identify this rule with the Huber restricted-Bayes rule and prove **sup_θ R = 1 + k²**. Source: Koenker & Gu, "Robustifying Empirical Bayes," arXiv:2603.00704 (v3, Oct 2026; preprint).
- *[My computation]* With k = 1 the worst-case individual risk is 2, while the rule keeps 91%, 94% and 99% of the Bayes savings for A = 0.5, 1 and 3. With k = 0.5 it keeps 66%, 72% and 85%.

**Limited translation, empirical-Bayes case (Efron & Morris 1972).**
- Citation: "…Part II: The empirical Bayes case," *JASA* 67(337): 130–139, doi:10.1080/01621459.1972.10481215.
- Abstract: "compromises between Stein's estimator and the MLE which limit the risk to individual components … while sacrificing only a small fraction of the savings in total squared error loss given by Stein's rule. The compromise estimators 'limit translation' away from the MLE."
- Definition, as applied in Efron & Morris (1975, p. 313): δ_i^s is as close as possible to the JS estimate subject to |δ_i − X_i| ≤ D_{k−1}(s)·[(k−1)B̂/k]^{1/2} standard deviations.
  - B̂ = (k−3)/S.
  - s ∈ [0, 1], where s = 0 is the MLE and s = 1 is Stein's rule; s indexes the share of Stein's savings retained.
  - D is tabulated in Part II.
- Baseball, s = 0.8: the cap is 0.68 standard deviations. "This modification reduces the maximum component risk of 4.60 for δ^1 to 1.52 for δ^.8 while retaining 80 percent of the savings of Stein's rule over the MLE."
- Realized results on the data:
  - LT was closer than JS for 16 of 18 batters.
  - Efficiency was 3.91 at s = 0.9 and 3.01 at s = 0.8 (Stein: 3.50).
  - But the worst *realized* error (Munson, shrunk upward) rose as translation was limited: "just opposite to the maximum risks."
- Conclusion of the 1975 paper (pp. ~317–318): "the limited translation modification protects individual components."

**Important limit on the guarantee.** LT bounds the worst-case individual risk at 1 + D² and makes it independent of p. It does **not** guarantee anyone risk ≤ 1. That is impossible, per Morris & Lysy above.

**Stigler (1990).**
- Citation: "A Galtonian perspective on shrinkage estimators," *Statistical Science* 5(1): 147–155, doi:10.1214/ss/1177012274.
- He reframes the paradox as regression: the ordinary estimator comes from the regression of X on θ, while minimizing Σ(θ̂_i − θ_i)² calls for the regression of θ on X.
- He opens with the "price of French wine" puzzle about unrelated quantities.
- He traces the idea to Kelley's (1923) true-score formula in educational testing.

### (c) Unequal variances (thinner records)

**Who gets shrunk more.**
- Under the hierarchical / empirical-Bayes model θ_i ~ N(μ, A) with X_i ~ N(θ_i, V_i), the posterior mean is (1−B_i)X_i + B_i μ with **B_i = V_i/(V_i + A)**. Thinner records are pulled further.
- Efron & Morris (1975, §3, toxoplasmosis); Efron & Morris (1977): a measurement "based on a small sample … is therefore compressed more than the others are."
- Koedel, Mihaly & Rockoff (2015, eq. 6) give the same formula for teachers.

**Rankings change.**
- Efron & Morris (1977): "the city with the highest apparent incidence (according to the measured rates y) is ranked 12th according to the James-Stein estimators. The estimate is drastically reduced because the sample was very small in that city."

**Dominance (frequentist guarantee on total error) needs "reversed" shrinkage.**
- Morris & Lysy (2012, §3.1): "Paradoxically, Model-I minimaxity in the unequal variance setting requires reversed shrinkages (more shrinkage for smaller V_i)."
- Their example: the minimax rule "would thrill the management of Hospital 26, whose negative performance estimate … (2.8 standard deviations below the mean) is shrunken upward by 2.5 standard deviations."
- Xie, Kou & Brown (2012), "SURE estimates for a heteroscedastic hierarchical model," *JASA* 107(500): 1465–1479, doi:10.1080/01621459.2012.728154: typical minimax estimators (Hudson 1974, Stanford Tech. Rep. 58, cited at second hand; Berger 1976, *AoS* 4(1): 223–226) "usually shrink the coordinates with lower variances more than those with higher ones, as opposed to the common intuition."
- Tan (2015), *Bernoulli* 21(1): 574–603, doi:10.3150/13-BEJ580:
  - Berger-type gains are "insubstantial unless all the observations have similar variances."
  - A Stein-type rule is minimax only if c ≤ 2(tr D − 2 max V_i), which can fail when one variance dominates.

**Brown (1975): the key result for an "individual claims" view.**
- Citation: "Estimation with incompletely specified loss functions (the case of several location parameters)," *JASA* 70(350): 417–427, doi:10.1080/01621459.1975.10479883.
- Abstract: X is inadmissible "if the p separate loss functions can be pooled into a single loss function"; Brown studies the case "where the losses cannot be pooled."
- Johnstone (2019, §3) summarizes the result. Losses are Σ c_i(μ_i − δ_i)² with the weight vector c ranging over a class C.
  - **If C is the whole nonnegative quadrant ("total incompatibility"), δ⁰ = X is admissible.**
  - If the ratios c_i/c_j are bounded by some finite K ("partial incompatibility"), X is inadmissible.
- So Stein's phenomenon depends on being willing to trade individuals' losses against each other at bounded rates.

**Fixes that shrink in the intuitive direction.**
- Xie, Kou & Brown (2012) choose hyperparameters by SURE; their estimators are asymptotically optimal in their class.
- The semiparametric version imposes a monotonicity requirement (MON): "the larger the variance is, the stronger is the shrinkage."
- They warn that classical empirical Bayes degrades when θ correlates with V. In baseball, "a player with large p tends to play more games," citing Brown (2008), *Ann. Appl. Stat.* 2(1): 113–152, doi:10.1214/07-AOAS138.
- "Ensemble" or Model-II minimaxity allows more shrinkage for larger variance:
  - Maruyama, Brown & George (2022), "Ensemble minimaxity of James-Stein estimators," *Stat* 11(1), doi:10.1002/sta4.532.
  - Morris & Lysy (2012): "Model-II minimaxity can hold for every component."
- Walters (2024), "Empirical Bayes Methods in Labor Economics," NBER WP 33091, doi:10.3386/w33091. If true effects are more variable for noisier units, "we should not shrink noisier estimates more"; standard linear shrinkage then reorders units wrongly.

### (d) The Bayesian / empirical-Bayes reading; rank order

**JS as an empirical-Bayes posterior mean.**
- If θ_i ~ N(0, A) independently, then B = 1/(1+A) and (p−2)/S is unbiased for B.
- So JS is the posterior mean with B estimated from the batch (Efron & Morris 1973; Robbins 1956, *Proc. Third Berkeley Symp.* 1: 157–163, doi:10.1525/9780520313880-015).
- The model assumes exchangeability. Morris & Lysy (2012): "Exchangeability considerations would stop anyone from combining estimates of butterfly populations and percentages of sports car sales to augment the estimation of the 31 NY hospital success rates. Model-I standards provide no guidance on this."

**Rank order with equal variances** *[my derivation]*.
- Positive-part JS multiplies every deviation by the same factor c = (1 − (p−2)/S)₊ ≥ 0, so it preserves order weakly (ties if c = 0).
- Plain JS with S < p−2 has c < 0 and **reverses** the order.
- Gu & Koenker (2023, Lemma 3.2): with homogeneous variance, posterior mean, posterior tail probability and posterior tail expectation "all yield the same ranking."

**Rank order with unequal variances.** Rankings change. See Laird & Louis (1989), "Empirical Bayes ranking methods," *J. Educ. Stat.* 14(1): 29–46, doi:10.3102/10769986014001029: the differences come from "shrinking posterior means towards a common value by an amount that depends on the precision of individual measurements."

**Posterior means understate the spread.**
- Louis (1984), *JASA* 79(386): 393–398, doi:10.1080/01621459.1984.10478062: the ensemble of posterior means has "a sample variance smaller than the posterior expected sample variance for parameters." So the extremes are systematically understated.
- Shen & Louis (1998), "Triple-goal estimates…," *JRSS B* 60(2): 455–471, doi:10.1111/1467-9868.00135: "No set of estimates can simultaneously optimize" individual estimates, ranks and the histogram of true values.
- Gelman & Price (1999), "All maps of parameter estimates are misleading," *Stat. Med.* 18(23): 3221–3234:
  - Raw rates put extremes disproportionately in poorly sampled areas.
  - Adjusted rates put them in well-sampled areas, and "tend to look too uniform in areas with little data."

### (e) Ranking, selection, winner's curse and tails

**Winner's curse.**
- Efron (2011), "Tweedie's formula and selection bias," *JASA* 106(496): 1602–1614, doi:10.1198/jasa.2011.tm11181.
  - "The largest few of the z(i)'s are likely to substantially overestimate their corresponding μ(i)'s."
  - Tweedie's formula, E[μ | z] = z + σ²·(d/dz) log f(z), corrects this.
  - Efron ties this to "relevance."
- Andrews, Kitagawa & McCloskey (2024), "Inference on winners," *QJE* 139(1): 305–358, doi:10.1093/qje/qjad043.
- **Note for the paper:** conditional on being selected as top, a person's own record is biased *in their favour*.

**Gu & Koenker (2023).**
- Citation: "Invidious comparisons: Ranking and selection as compound decisions," *Econometrica* 91(1): 1–41, doi:10.3982/ECTA19304.
- With heterogeneous precision, "the posterior mean criteria favours individuals with smaller variances."
- In a second example, "the posterior probability ranking procedure prefers individuals with larger variances, while the posterior mean ranking procedure prefers smaller variances."
- They also show that selection false discovery rates can be large (e.g., about 52% in one setting).

**Other ranking results.**
- Walters (2024, §2): with tail selection, the optimal rule "rewards or punishes" units with large standard errors depending on the relative cost of Type I and Type II errors. "A clear statement of the loss function is therefore a central part of any coherent EB shrinkage analysis."
- Lockwood, Louis & McCaffrey (2002), *JEBS* 27(3): 255–270, doi:10.3102/10769986027003255: rank estimates are poor at the extreme percentiles.
- Mogstad, Romano, Shaikh & Wilhelm (2024), *REStud* 91(1): 476–518, doi:10.1093/restud/rdad006: confidence sets for ranks.

---

## PART 2: Normative discussion outside philosophy

### (i) Teacher value-added models

- **Kane & Staiger (2002)**, "The promise and pitfalls of using imprecise school accountability measures," *J. Econ. Perspectives* 16(4): 91–114, doi:10.1257/089533002320950993.
  - With raw, noisy measures, "rewards or sanctions for schools with scores at either extreme primarily affect small schools and provide weak incentives to large ones."
  - This is the fairness argument *for* shrinkage: raw scores over-reward and over-punish small units.
- **Koedel, Mihaly & Rockoff (2015)**, *Econ. Educ. Rev.* 47: 180–195, doi:10.1016/j.econedurev.2015.01.006. Shrinkage is standard practice. Its benefit is lower error variance; its "cost … is that the weight on the prior introduces a bias."
- **Herrmann, Walsh & Isenberg (2016)**, *Statistics & Public Policy* 3(1): 1–10, doi:10.1080/2330443X.2016.1182878.
  - They pose the fairness question directly: shrinkage "could have differential impacts on the probability that the teachers of fewer students or students with hard-to-predict achievement will be assigned consequences."
  - Teachers of low-achieving and free-lunch students have less precise estimates.
  - But in their sample, shrinkage had "no statistically significant effect" on the relative probability of consequences.
- **Mehta (2019)**, *Quantitative Economics* 10(4): 1537–1577, doi:10.3982/QE950.
  - "If the best teacher had a relatively small classroom … shrinking the raw measure could lower the odds of rewarding the best teacher. It is not clear that an estimator with a lower mean squared error should always be preferred to an unbiased one."
  - In Los Angeles data, the empirical-Bayes estimator does worst "at the extremes": about 800 and 600 more classification mistakes than fixed effects at 1st- and 99th-percentile cutoffs.
  - Conditioning shrinkage on class size could invite manipulation of class size.
- **Guarino, Maxfield, Reckase, Thompson & Wooldridge (2015)**, *JEBS* 40(2): 190–222, doi:10.3102/1076998615574771: "shrinking the estimates … does not itself substantially boost performance" in ranking teachers.
- **Gilraine, Gu & McMillan (2020)**, NBER WP 27094, doi:10.3386/w27094 (publication status **UNVERIFIED**): parametric (normal) empirical Bayes shrinks right-tail teachers too aggressively; the nonparametric version shrinks them less.
- **Chetty, Friedman & Rockoff (2014)**, *AER* 104(9): 2593–2632, doi:10.1257/aer.104.9.2593; **Kane & Staiger (2008)**, NBER WP 14607, doi:10.3386/w14607. These use and validate shrunken value-added. I found no normative fairness discussion in them.
- **Vendor position:**
  - SAS EVAAS, *Topics in PVAAS Reporting* (©2023, evaas.sas.com) says teachers of small classes "are not disadvantaged" because they are "protected by using a value-added estimate and standard error together."
  - Kupermintz (chapter, ~2002; book details **UNVERIFIED**, nepc-archive.colorado.edu) describes the earlier Tennessee system: teachers "with less data … are assumed to perform at their system level until more data become available."

### (ii) Hospitals and surgeons

- **Silber et al. (2010)**, "The Hospital Compare mortality model and the volume–outcome relationship," *Health Services Research* 45(5p1): 1148–1167, doi:10.1111/j.1475-6773.2010.01130.x.
  - The random-effects model "underestimates the typically poorer performance of low-volume hospitals."
  - Normative upshot: shrinking toward the national mean misleads patients about small hospitals. Here the cost falls on third parties, not on the assessed units.
- **George, Ročková, Rosenbaum, Satopää & Silber (2017)**, *JASA* 112(519): 933–947, doi:10.1080/01621459.2016.1276021.
  - "Except for the largest hospitals, these individual recommendations … are not checkable against data."
  - They propose calibrating against general advice, attribute-informed models, and direct standardization.
- **Dimick, Staiger & Birkmeyer (2010)**, *HSR* 45(6p1): 1614–1629, doi:10.1111/j.1475-6773.2010.01158.x. The pro-shrinkage case on patient-welfare grounds: reliability adjustment "should be used for public reporting."
- **COPSS–CMS white paper: Ash, Fienberg, Louis, Normand, Stukel & Utts (2012)**, "Statistical Issues in Assessing Hospital Performance" (revised Jan. 27, 2012; hhs.gov).
  - It records the critique "The hierarchical modeling methodology neutralizes small hospital performance."
  - On volume-based shrinkage targets (the choice of comparison batch): "if some low-volume hospitals perform well, it would be unfair to move their SMRs too far towards a single, low-volume hospital target."
  - It recommends evaluating attribute-dependent targets.
- **Xia, He, Li & Kalbfleisch (2022)**, *Biostatistics* 23(1): 257–273, doi:10.1093/biostatistics/kxaa024.
  - "Reduction in the overall MSE by RE is achieved by an average of substantial losses for extreme values … This is an example of an overall average missing important features. For profiling, it is the extreme values that are of primary interest."
  - Hence fixed effects are preferred for profiling, aiming at "fair assessments of all providers."
  - Background: Kalbfleisch & Wolfe (2013), *Stat. Biosci.* 5(2): 286–302, doi:10.1007/s12561-013-9093-x (content not read).
- **Jones & Spiegelhalter (2011)**, *Am. Statistician* 65(3): 154–163, doi:10.1198/tast.2011.10190. They distinguish statistical "outliers" from "extremes" and argue against flagging providers just for differing from the mean.
- **Chung et al. (2019)**, "CMS hospital ratings: pitfalls of grading on a single curve," *Health Affairs* 38(9): 1523–1529, doi:10.1377/hlthaff.2018.05345. Pooling all hospitals on one curve, despite different "test forms," undermines validity; they recommend peer groups. This is a comparison-set (batch) argument.
- **Normand et al. (2016)**, "League tables for hospital comparisons," *Annual Review of Statistics and Its Application* 3: 21–50, doi:10.1146/annurev-statistics-022513-115617. A review of the trade-offs.
- **Morris & Lysy (2012, §4)**, using a hospital-profiling example: "Hospital directors might agree to having their own hospital's performance be estimated by combining information from other hospitals, but not unless each was assured that doing so would make their own hospital's estimate more accurate." This is the closest statement I found to an individual-consent norm for being pooled.

### (iii) Insurance credibility and statistical discrimination

- **Whitney (1918)**, "The theory of experience rating," *Proc. Casualty Actuarial Soc.* 4: 274–292.
  - "The problem of experience rating arises out of the necessity, from the standpoint of equity to the individual risk, of striking a balance between class-experience on the one hand and risk-experience on the other."
  - "The experience of that risk which has the larger exposure will be entitled to the larger degree of consideration."
  - So credibility weighting (shrinkage) is framed as *equity*, but with shrinkage toward a class.
- **Bühlmann (1967)**, *ASTIN Bulletin* 4(3): 199–207, doi:10.1017/S0515036100008989. The formal credibility (linear Bayes) estimator.
- **Debate on "actuarial fairness"** (individual risk depends on the pool or reference class):
  - Frezal & Barry (2020), *J. Business Ethics* 167(1): 127–136, doi:10.1007/s10551-019-04171-2. Per its abstract, the "individual cost of risk" is really an insurer's group average, and fairness should rest on solidarity.
  - Landes (2015), *J. Business Ethics* 128(3): 519–533, doi:10.1007/s10551-014-2120-0 (content **UNVERIFIED**).
  - Charpentier, "Individual fairness" chapter in *Insurance, Biases, Discrimination and Fairness* (Springer Actuarial, 2024), doi:10.1007/978-3-031-49783-4_9 (content **UNVERIFIED**).
- **Phelps (1972)**, *AER* 62(4): 659–661, and **Aigner & Cain (1977)**, *ILR Review* 30(2): 175–187, doi:10.1177/001979397703000204.
  - The employer's estimate q̂ = (1−γ)α + γy is Kelley shrinkage toward the *group* mean, with γ the test's reliability.
  - Aigner & Cain: "Within-group or individual discrimination is inevitable." With equal means but a less reliable test for one group, they argue there is no *group* discrimination, even though individuals with identical scores are treated differently.
- **Wainer (2000)**, "Kelley's paradox," *Chance* 13(1): 47–48, doi:10.1080/09332480.2000.10542192. Regressing a high scorer from a low-scoring group *downward* conflicts with "Strivers" intuitions in admissions.

### (iv) Machine learning and algorithmic fairness

- **Dwork et al. (2012)**, "Fairness through awareness," *ITCS*: 214–226, doi:10.1145/2090236.2090255. Individual fairness means similar individuals are treated similarly. I found no paper applying it to shrinkage.
  - *[My observation]* Batch-dependent shrinkage gives identical records different scores in different batches. Heteroscedastic shrinkage gives identical raw scores different estimates by record length. So it fails individual fairness for any similarity metric defined only on a person's own record.
- **Hashimoto, Srivastava, Namkoong & Liang (2018)**, *ICML*, PMLR 80: 1929–1938. Minimizing average loss means "minority groups … tend to suffer higher loss." Their distributionally robust alternative controls worst-case risk "in the spirit of Rawlsian distributive justice." This is a structural analogue of limited translation versus JS.
- **Costs borne by the atypical:**
  - Feldman (2020), "Does learning require memorization? A short tale about a long tail," *STOC*: 954–959, doi:10.1145/3357713.3384290.
  - Bagdasaryan, Poursaeed & Shmatikov (2019), *NeurIPS* 32: 15479–15488: under differentially private training, "this cost is not borne equally."
  - Hooker et al. (2020), arXiv:2010.03058: "overall accuracy hides disproportionately high errors on a small subset."
  - Subramonian et al., "An effective theory of bias amplification," arXiv:2410.17263 (ICLR 2025): ridge regularization and minority-group error.
- **Emelianov, Gast, Gummadi & Loiseau (2022)**, *Artificial Intelligence* 302: 103609, doi:10.1016/j.artint.2021.103609 (EC'20 version doi:10.1145/3391403.3399482). The variance-aware ("Bayesian-optimal") selector "leads to underrepresentation of the high-variance group." Picking by raw scores does the opposite.
- **Kearns, Roth & Wu (2017)**, "Meritocratic fairness for cross-population selection," *ICML*, PMLR 70: 1828–1836. Fairness as selection probability that is monotone in *true* quality, when quality is estimated from finite pools.
- **Multicalibration:** Hébert-Johnson et al. (2018), *ICML*, PMLR 80: 1939–1948. I found no explicit link to shrinkage.
- **Shrinkage used as a tool for fairness auditing** (not criticized): Foulds et al., arXiv:1811.07255, and Ji, Smyth & Steyvers, arXiv:2010.09851 (venues **UNVERIFIED**).
- **Dawid (2017)**, "On individual risk," *Synthese* 194(9): 3445–3474, doi:10.1007/s11229-015-0953-4. Group-to-individual versus individual-to-group notions of risk.

### (v) Law

- **Houston Federation of Teachers v. Houston ISD**, Civil Action H-14-1189, Amended Summary Judgment Opinion, Dkt. 91 (S.D. Tex. May 4, 2017) (Smith, M.J.). The reporter citation 251 F. Supp. 3d 1168 is **UNVERIFIED**.
  - Quoting the district's admission that a "re-analysis has the potential to change all other teachers' reports," the court found "the house-of-cards fragility of the EVAAS system, where the wrong score of a single teacher could alter the scores of every other teacher in the district. This interconnectivity means that the accuracy of one score hinges upon the accuracy of all. Thus, without access to data supporting all teacher scores, any teacher facing discharge … will necessarily be unable to verify that her own score is error-free."
  - The procedural due process claim survived; the other claims were dismissed.
  - The court does not mention "shrinkage." It treats batch-dependence as a *verifiability* problem.
- **Matter of Lederman v. King**, 54 Misc 3d 886, 2016 NY Slip Op 26416 (Sup. Ct. Albany Cnty. May 10, 2016) (McDonough, J.). The growth score was "arbitrary and capricious." The court cited:
  - the imposed "bell curve" and comparison with "100 similarly situated teachers";
  - "the disproportionate effect of petitioner's small class size";
  - "VAM bias against teachers at both ends of the spectrum."
- **State v. Loomis**, 881 N.W.2d 749, 764–65 (Wis. 2016), as summarized in 130 *Harv. L. Rev.* 1530 (2017). The right to individualized sentencing versus group-based risk scores; their use is permissible if not determinative. This is about group data, not shrinkage.
- **Hamm v. Smith**, No. 24-872 (U.S. May 21, 2026), writ dismissed as improvidently granted; Sotomayor, J., concurring, quotes the AAIDD on "regression to the mean" for multiple IQ scores. It concerns one person's repeated tests, not cross-person shrinkage. Tangential. See also Kaye (2017), *Law, Probability & Risk* 16(1): 7–34, doi:10.1093/lpr/mgw012.
- **Policy-allocation analogue:**
  - Steed et al. (2022), *Science* 377: 928–931, doi:10.1126/science.abq4481: uneven impacts of data error on Title I funding.
  - Cui, Gong, Hannig & Hoffman (2023), *Science* 380: eadf9724, doi:10.1126/science.adf9724: invoke Stein's inadmissibility and compare shrinkage schemes for assessing that equity.

### (vi) Statisticians' own normative-sounding remarks

- **Efron & Morris (1977):**
  - "It cannot be demonstrated, however, that Stein's method is superior for any particular city; in fact, the James-Stein prediction can be substantially worse. Estimating the true mean for an isolated city by Stein's method creates serious errors when that mean has an atypical value."
  - On batch-dependence: "If Alvis had had an early-season hitting streak … the James-Stein estimator for Clemente's average would have been increased from .294 to .325. Why should Alvis' success or lack of it have any influence on our estimate of Clemente's ability? (They were not even in the same league.)"
  - "There is nothing in the statement of the theorem that requires the component problems to have some sensible relation to one another."
  - On purpose: "the expected error is added up for all the cities. Any particular hospital might be the wrong size or in the wrong place, but the sum of all such mismatches would be smaller."
- **Efron (2010)**, "The future of indirect evidence," *Statistical Science* 25(2): 145–157, doi:10.1214/09-STS308:
  - "James–Stein estimation is not an unmitigated blessing. Low total squared error can conceal poor performance on genuinely unusual cases … Clemente … is learning too much from the experience of others by being included in a cohort of less-talented players. I'll call this the Clemente problem."
  - In the rejoinder (pp. 170–171, doi:10.1214/10-STS308REJ): "pulling the Clemente of drugs down from 0.400 to 0.294 might seem less desirable … Some theoretical guidance would be welcome here, perhaps a theory quantifying the relevance of group data to individual estimates."
- **Koenker & Gu (2026, preprint):** empirical-Bayes rules "may still perform well with respect to ensemble risk, they may also fail spectacularly for some subpopulations or individuals. This concern underlies the limited translation proposal."
- **Philosophy, for completeness:** Vassend, Sober & Fitelson (2017), "The philosophical significance of Stein's paradox," *Eur. J. Phil. Sci.* 7(3): 411–433, doi:10.1007/s13194-016-0168-7.
  - Argues for "holistic pragmatism": whether to minimize error over the whole problem or per part depends on the agent's goals.
  - Notes a tension with evidentialism, and that "the risk of some of the individual estimates increases substantially."
  - No fairness discussion. Lippert-Rasmussen (2011), *J. Ethics* 15: 47–59, doi:10.1007/s10892-010-9095-6, is the "right to be treated as an individual" literature, but it concerns group statistics.

---

## What has and has not been said

My search was broad but not exhaustive, so "not found" means not found in these sources.

**(A) Individualized assessment is inadmissible in aggregate, so a "right to be judged on one's own evidence" conflicts with accuracy even without group statistics. Not found as a normative thesis.**
- The ingredients are all there:
  - Stein's theorem holds for unrelated quantities (Efron & Morris 1977; Stigler 1990).
  - Efron (2010) contrasts direct and indirect evidence.
  - Vassend, Sober & Fitelson (2017) find a tension with evidentialism.
  - Morris & Lysy (2012) state the hospital directors' assurance norm.
- The fairness, discrimination and legal literatures (Phelps; Aigner & Cain; Whitney; Loomis; Lippert-Rasmussen) frame the conflict around **group or class** statistics.
- Brown (1975) is the key formal result for (A) and appears not to have been used normatively. If individuals' losses are "totally incompatible," the individual estimator is admissible. Inadmissibility needs bounded trade-off rates between persons.

**(B) The gains are paid for by outliers and the exceptional. Said repeatedly, mostly in statistical or decision-theoretic terms.**
- Sources: Efron & Morris 1971, 1972, 1975 ("as large as k/4"), 1977; Efron (2010, the "Clemente problem"); Morris & Lysy (2012); Xia et al. (2022, "substantial losses for extreme values"); Koenker & Gu (2026); Louis (1984); Mehta (2019).
- Explicitly *fairness*-framed only in passing: COPSS (2012, one "unfair" sentence), Xia et al. ("fair assessments"), Lederman ("both ends of the spectrum"), Herrmann et al. (2016, "differential impacts").
- No sustained argument that this distribution of costs wrongs the exceptional.

**(C) Batch-dependence is a fairness problem. Partially said.**
- The phenomenon is stated vividly by Efron & Morris (1977, Alvis and Clemente) and Efron (2010, "relevance").
- It is treated as a **due-process / verifiability** defect in *Houston Federation of Teachers* (2017): "the accuracy of one score hinges upon the accuracy of all."
- It is treated as a **comparison-set** issue in COPSS (2012, shrinkage targets), Chung et al. (2019, "single curve") and Lederman (bell curve).
- I found no source arguing that dependence on who else is assessed is *in itself* unfair, as distinct from unverifiable or badly specified.

**(D) Limited-translation estimators are a principled compromise between aggregate accuracy and individual claims. Said as a statistical design goal, not as a normative principle.**
- Efron & Morris present limited translation as limiting "the risk to individual components … while sacrificing only a small fraction of the savings," and as something that "protects individual components."
- Koenker & Gu (2026) revive it as protection against individual "spectacular" failure.
- The closest normative analogue is in ML: Hashimoto et al. (2018), worst-case risk "in the spirit of Rawlsian distributive justice."
- No one I found defends limited translation as a fairness compromise.
- Two caveats for the paper:
  - Its guarantee is a cap of 1 + D² on worst-case *individual* risk, independent of p. It is **not** a promise that no one is worse off than under the MLE, which Morris & Lysy show is impossible.
  - In the 1975 baseball data, limiting translation *increased* the worst realized error (Munson).

**Remaining unverified points:**
- the end page of James & Stein (1961);
- the F. Supp. citation for *Houston Federation of Teachers*;
- the book details for the Kupermintz chapter;
- the contents of Landes (2015), Charpentier (2024) and Kalbfleisch & Wolfe (2013);
- the venues for Foulds et al. and Ji et al.;
- Hudson (1974), cited only at second hand;
- the publication status of Gilraine, Gu & McMillan.

Mehta's percentage figures lost their decimal points in PDF extraction, so I report only the absolute counts of mistakes.
