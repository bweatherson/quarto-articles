# Idea memo v1: "Knowing More and Judging Better: What a Track Record Can Certify" (working title)

Subject (BW's choice): what a forecaster's track record can show about expertise (scouting shortlist item 3).
Research: research/econ-report.md (17k words; ~40 texts read), research/philosophy-report.md (11.5k words).
Pre-screening: a slate of three theses (slate-v1.md) was tested by two independent predictability testers who
first wrote down the papers they expected (slate-prediction-A.md, -B.md). The "trust extended, not grounded" paper
is the obvious one (both predicted it nearly verbatim); the Blockhead and orgulity framings failed on substance.
Neither tester predicted the thesis below, though each produced one component of it (A: "it takes a non-expert to
certify an expert"; B: "only sharp knowledge is certifiable with bounded data").

## The problem
Can a record of probabilistic forecasts show that someone is an expert? Goldman (2001) counts track records as
perhaps the novice's best evidence; Levy (2025) says the criteria only extend trust. Economists have proved that
no test of a single forecaster's realized forecasts that is guaranteed to pass a forecaster who knows the true
process -- whatever it is -- can screen out a strategic forecaster who knows nothing (Sandroni 2003; Olszewski &
Sandroni 2008; Shmaya 2008; with bounded data, any test whatever: O&S 2009 MOR Prop 1). The economists conclude
that "the only coherent notion of 'true' probabilities is relative" (Al-Najjar & Weinstein 2008). I think the
theorems show something more specific, and more interesting philosophically.

## Thesis
**There are two kinds of epistemic superiority one might want a track record to certify: knowing more (having
information the evaluator lacks -- Hall's "database expert") and judging better (evaluating shared evidence
better -- Hall's "analyst expert"; Hall argues chance itself is an analyst expert). A track record can certify the
first, relative to a baseline, and the less the evaluator knows the better it does so. It can never certify to an
evaluator that someone judges better than she does: superior judgment can be certified only by comparing two
others. Knowing the chances -- analyst expertise par excellence -- is exactly what no record can certify.**

## The four claims and their formal backing (all mathematics credited)
1. **Prior-free, finite data: only sharp foreknowledge.** A test that protects every honest learner over a model
   class (any prior over the class, under any truth in it) protects the class's convex hull, so with bounded data
   it is manipulable (O&S 2009 MOR Prop 1; Sandroni & Shmaya 2014 Prop 1, e.g. the exchangeable class). Tests can
   resist manipulation with bounded data only by protecting a non-convex class -- e.g. sharp commitments to a
   parameter (a frequency-band test for announced i.i.d. biases; O&S MOR Prop 2) -- i.e. foreknowledge relative to
   the class, which is information relative to the class's convex hull. Coarse ("it's one of these regimes")
   expertise and the capacity to learn from the record are indistinguishable from ignorance.
2. **A Bayesian evaluator certifies information, best when she knows least.** Stewart (2011): a likelihood-ratio
   test against the evaluator's own predictive passes an expert who knows the true process with probability
   1 - eps, where eps is the evaluator's prior probability of learning the truth quickly on her own; any forecaster
   without that knowledge passes with probability 0 (by her lights). So certification of superior information is
   available to every evaluator with a prior, and most reliable for the least informed.
3. **No evaluator can certify that someone judges better than she does.** (a) If the other's method is among her
   hypotheses with prior weight w, the other's likelihood ratio against her own predictive is at most 1/w on every
   possible sequence (mixture/aggregating bound) -- the record can never show the other to be much better. (b) If
   it is not, then by Ville's inequality she gives probability at most 1/c to the other's ever beating her by a
   factor c, and (Stewart) probability 0 to lasting outperformance by anyone without information she lacks. Either
   the other's judgment is already hers, or its superiority is, by her lights, a null event. Recognising better
   judgment requires either awareness growth (adding the other's method as a hypothesis, after which the gap
   closes) or a non-conditionalising response to her own record (the territory of higher-order evidence).
4. **Judgment is certifiable comparatively, between others.** The likelihood ratio between two non-strategic
   forecasters picks, with probability going to 1 under the truth, the one whose forecasts are closer to the
   chances in Kullback-Leibler terms (martingale argument); Al-Najjar & Weinstein's Theorem 1 gives a
   strategic-robust version when one forecaster is truthful. Caveats: parasitism (a forecaster who sees a rival's
   current forecast can beat it by its calibration error: Foster & Hart's calibeating); "is anyone here informed?"
   cannot be tested (AW Thm 7, finite horizon).

## Upshots
- Charmides 170e-171c (can a non-doctor tell a doctor from a quack?) gets two answers: for knowing more, yes, and
  the non-doctor is better placed than another doctor; for judging better, no one can tell in her own case.
- The novice/expert problem splits. Levy is right about judgment-expertise and wrong about information-expertise
  (his reason -- that applying the criteria takes expertise -- is reversed for the latter).
- Forecasting tournaments are not a convenience but the only route to recognising superior judgment; Tetlock's
  superforecasters (generalists with public information -- judgment experts) could be recognised only that way.
- Deference: Hall's two kinds of expert need different epistemologies of recognition; the Principal Principle's
  expert (chance, an analyst) is the uncertifiable kind.
- AI forecasters reasoning over public data are judgment experts; benchmarks can rank them against each other,
  not certify them against us.

## Closest antecedents and what is new
- Econ: Al-Najjar & Weinstein (relativity of truth; reducibility); Stewart 2011 (Bayesian test; eps); O&S 2009 MOR
  (convexity); Sandroni & Shmaya 2014; Olszewski 2015 §9.1 ("the tester will find the expert's forecasts valuable
  only when these forecasts are more precise than her own").
- Philosophy: Goldman 2001; Levy 2025; Hall 2004 (analyst vs database); Elga 2007 (experts and gurus; no
  bootstrapping one's own superiority); Lewis 1971 (immodest inductive methods); Seidenfeld 1985; Herrmann 2022;
  Huang 2023; Fan 2026; Schurz (meta-induction); Dorst et al. 2021 "Deference done better" (CHECK).
- New (as far as the two research reports found): the information/judgment line as the line between certifiable
  and uncertifiable expertise; the first-person impossibility for judgment (claim 3) put together with the
  prior-free and comparative results; the reversal of "it takes one to know one" for information; the
  identification of the economists' "true expert" (knows the chances) with Hall's analyst expert.

## Risks
- Claim 3 may be seen as Lewis's immodesty / standard "no deference to same-evidence agents" (EXPECTED).
- Claim 2's reversal may be judged a gloss on Stewart's eps.
- Scope: repeated, verifiable forecasting only; climate-style disputes untouched.
- Logically non-omniscient evaluators: a same-evidence forecaster can carry information about what the evidence
  supports (computational/analytic information); the paper must say this is database expertise of a logical kind,
  or restrict to ideal evaluators. Overlap with "Findable, Not Simple" to avoid.
- Hall's terms must be checked in the original (SEP: chance is an analyst-expert, which "earns [its] epistemic
  status because [it] is particularly good at evaluating the relevance of one proposition to another").

## 150-word abstract
Can a forecaster's track record show that she is an expert? Economists have proved that no test of a single
forecaster's record that is sure to pass someone who knows the chances can screen out a strategic forecaster who
knows nothing. I argue that the theorems draw a line between two kinds of epistemic superiority. A record can
certify that someone knows more than you: relative to your own forecasts, a likelihood-ratio test does this, and
does it best when you know least, reversing the thought that it takes an expert to recognise one. But no record
can show you that someone judges better than you from the same evidence: either her way of judging is already
among your hypotheses, so that she can never outscore you by much, or its lasting success is, by your own lights,
an event of probability zero. Superior judgment, of which knowing the chances is the extreme case, can be
recognised only by comparing two others.
