# Idea memo v1: "Borrowing Strength from Strangers" (working title)

Subject (chosen by BW from a Claude-scouted shortlist): Stein's paradox and the right to be judged as an individual.
Research behind this memo: research/philosophy-report.md, research/stats-report.md (both by assistants, with
access limits noted there), own simulations in code/.

## The case
Ten teachers (hospitals, surgeons, loan applicants with thin files) are each assessed from a noisy record of their own
performance, X_i ~ N(theta_i, 1). Judging each only on her own record -- the "stand-alone" estimate X_i -- is, by
Stein's theorem (Stein 1956; James & Stein 1961; grand-mean version Lindley 1962, p >= 4), beaten in total squared
error by shrinking every estimate toward the batch mean by an amount fixed by everyone's data, *whatever the true
values are*, even if the people have nothing to do with one another (Efron & Morris 1977: the theorem does not require
"that the component problems have some sensible relation to one another"). Consequences:
- **Batch dependence.** Ann's record is +2.0. If the other nine records are clustered near 0, the James-Stein estimate
  of Ann is 0.16; if they are widely spread, 1.94 (own simulation). Efron & Morris 1977: had Alvis had an early hitting
  streak, the estimate of Clemente's ability would have risen from .294 to .325 -- "They were not even in the same
  league." A US court treated this as a due-process defect in a teacher-evaluation system: "the accuracy of one score
  hinges upon the accuracy of all" (Houston Fed. of Teachers v. Houston ISD, S.D. Tex. 2017).
- **The exceptional pay.** One person truly at +3.16 among nine at the target: total risk falls from 10 to 6.2, but her
  own risk rises from 1 to 2.9; the worst individual risk grows like p/4 (Efron & Morris 1975: "as large as k/4 times").
  Efron (2010) calls this "the Clemente problem" and asks for "theoretical guidance".

## Thesis
**Stein's paradox is an aggregation paradox, and the right to be judged as an individual is an anti-aggregative
constraint -- best honoured not as a ban on borrowing strength from others but as a bounded stand-alone guarantee:
no one may be made to bear much more risk of misassessment, for others' benefit, than she would bear if judged on her
own record alone.**

## Argument
1. **Pareto vs. aggregate (the formal core).**
   (a) Judging alone is *Pareto-admissible*: no rule is at least as accurate for every person in every state and
   better for someone. Indeed the only rule that never leaves anyone worse off than her stand-alone assessment, in any
   state, is the stand-alone rule itself (fix the others' true values; person i's estimate is then a randomised
   estimator of a one-dimensional normal mean; admissibility of the 1-d sample mean plus strict convexity forces
   equality with X_i). Morris & Lysy 2012 state the first half: improvement for every component is "impossible because
   each individual y_i is an admissible estimate of its own mu_i".
   (b) Judging alone is *inadmissible on every aggregate measure that trades persons' losses at bounded rates*:
   Brown 1975 (JASA) shows X is admissible when losses are "totally incompatible" (any nonnegative weights) and
   inadmissible when the ratios of weights are bounded. So the Stein phenomenon arises exactly when, and because, one is
   willing to weigh different people's accuracy against each other. This normative reading of Brown appears unused.
2. **Accuracy-based groundings of the right fail.** (i) Total accuracy favours pooling (Stein). (ii) Each person's
   expected accuracy *by the assessor's lights* favours pooling whenever the assessor's credence is exchangeable,
   i.e. whenever she has no individuating information -- so ex ante contractualism (Frick) and ex ante Pareto endorse
   pooling. (iii) Calibration -- Hedden's one necessary fairness criterion -- is satisfied by pooled, not stand-alone,
   estimates (raw scores regress to the mean). So the leading accounts of treating people as individuals
   (Lippert-Rasmussen: use "all relevant information"; Eidelson's inclusive autonomy account, which says ignoring a
   brother's college record might itself fail to treat me as an individual) permit or require borrowing strength
   from strangers. Pooling involves no stereotyping or assumption of similarity. Whatever is objectionable is
   distributive.
3. **The right's real ground is a claim from the assessee's own standpoint.** The person who knows she is exceptional
   assesses the rule by her risk *given her true value*; from there pooling raises her risk for others' gain. Ex ante
   endorsements rest on the assessor's ignorance of who is exceptional (cf. Gustafsson & Kowalczyk 2026 on how the
   identification of persons fixes ex ante verdicts). That is the structure of a claim against being sacrificed.
4. **Strict anti-aggregation is too strong; bounded protection is cheap.** By 1(a), honouring the right exactly forgoes
   all of Stein's gain. But Efron & Morris's *limited translation* estimators cap how far anyone is moved from her own
   record: worst-case individual risk <= 1 + k^2 (Bayes case), independent of batch size, while keeping most of the
   gain (E&M 1975 baseball: max component risk 4.60 -> 1.52, retaining 80% of Stein's savings; own simulation: cap 0.5
   sd keeps everyone within ~27% of stand-alone risk and retains over half the maximal gain). This is the estimation
   analogue of limited aggregation (Voorhoeve's ARC): small gains to many justify only small extra risks to one.
   So the defensible right is an *approximate stand-alone guarantee*, with the tolerance set by the stakes.

## Payoffs beyond the Stein case
- An intrapersonal baseline for the statistical-evidence debate: Di Bello & O'Neil compare an innocent defendant's risk
  with other defendants'; Climenhaga (Ethics 2025) argues unequal risks are unavoidable. The stand-alone guarantee
  compares a person's risk with her own risk if judged on her own evidence.
- A diagnosis of practice: teacher value-added and hospital ratings (Kane & Staiger 2002's fairness case *for*
  shrinkage: raw extremes are dominated by small units; Mehta 2019 and Xia et al. 2022 against; COPSS-CMS 2012;
  Houston and Lederman v. King).

## Closest antecedents (each must be located precisely in the paper)
- Vassend, Sober & Fitelson 2017 (EJPS): total vs per-part error is a pragmatic choice ("holistic pragmatism"); no ethics.
- Morris & Lysy 2012: the hospital directors' assurance norm -- consent only if "each was assured that doing so would
  make their own hospital's estimate more accurate" -- and the impossibility of improving every component.
- Efron 2010 ("the Clemente problem"); Efron & Morris 1971-72, 1975 (limited translation as design goal).
- Giacomini, Lee & Sarpietro (econometrics, arXiv 2308.01596 v4, 2026): "tyranny of the majority", individual-weight
  shrinkage chosen by minimax regret.
- Donahue & Kleinberg 2021-23: individual rationality in voluntary federated learning.
- Hashimoto et al. 2018 (ICML): distributionally robust learning "in the spirit of Rawlsian distributive justice".
What is new: the normative reading of Brown's theorem (Stein as an aggregation result); the argument that every
accuracy-based standard favours pooling so the objection is distributive; the stand-alone guarantee as the content of
the right to be judged as an individual; limited translation defended as a fairness principle.

## Main risks
- Squared error vs decisions (with equal noise, shrinkage preserves rank order; the bite is at absolute thresholds,
  public ratings, pay, and thin records -- where shrinkage reorders).
- Two-sided fairness: raw scores also treat thin-record units unequally (Kane & Staiger).
- "Known formula + application"; the stand-alone norm is stated (as consent) by Morris & Lysy.
- Normal model, squared error.
