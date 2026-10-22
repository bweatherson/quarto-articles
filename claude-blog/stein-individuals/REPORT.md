# Parked: Stein's paradox and treating people as individuals (2026-10-20)

Outcome: abandoned at step 1-2 of the staged process after three idea memos, two advisor rejections and two
failed predictability (go/no-go) tests. BW: "Unless something radical turns up, I think it's time to go to the
track record paper" (shortlist item 3). Advisor 3 (advisor-report-v3.md) then returned (A) with advice to abandon the subject: the
pull = push coupling is textbook (Gelman et al., BDA3 §17), its stereotyping version is modelled (Gershman & Cikara
2023), and the individuation-vs-generalisation tension is old in contact theory.

## What was tried
1. **v1: Stein as an aggregation paradox; the right to be judged as an individual = a bounded stand-alone
   guarantee** (idea-memo-v1.md). Advisor 1 (advisor-report-v1.md): (A). Aggregation reading in Vassend, Sober &
   Fitelson 2017 fn 27 (citing Brown 1975); the bounded guarantee is Hodges & Lehmann 1952 restricted Bayes, tied
   to limited translation and "individuals" by Koenker & Gu 2026; Pareto-admissibility not distinctive
   (Strawderman); proper Bayes rules immune (Brown 1971); I reversed Eidelson p. 209.
2. **v2: "Not how much, but where": treating as an individual = bounded incredulity (tails of the prior no
   thinner than exponential)** (idea-memo-v2.md). Go/no-go: EXPECTED (gonogo-prediction.md). Advisor 2
   (advisor-report-v2.md): (A). Slogan = Pericchi & Perez 2026 §1.3 "differential shrinkage"; bound = Johnstone &
   Silverman 2004; a global Lipschitz cap is itself a "how much" constraint; escape fails with unequal noise;
   Eidelson misread; "cheap" false where the demand has moral content. My own check (code/curvature.py) showed
   the "three faces" are nested, not equivalent (escape holds for all tails between normal and exponential).
3. **v3: "Not like the others": pull = push; trilemma among Individuality, Responsiveness, Own-record**
   (idea-memo-v3.md). Go/no-go: EXPECTED (gonogo3-prediction.md), and my own numbers broke the trilemma (normal
   pooling also violates Own-record; Huber nearly satisfies all three).

## Findings that might be reused
- Pull = push in location-family pooling (Tweedie + ML-II score); EM-responsibility version in mixtures.
- NPMLE ceiling: nonparametric EB caps a new member's assessment near the best member seen (advisor 2,
  code/advisor2/npmle_ceiling.py).
- Group gap under generalised-normal priors: thinner than normal -> gap grows toward the full group difference;
  normal -> constant (Phelps); between normal and exponential -> vanishes though pull is unbounded
  (code/curvature.py). Second-order Tweedie: gap ~ (M_A - M_B)(1 - Var[theta|x]/s^2).
- Reading done: Pericchi & Perez 2026; Babic & Johnson King 2023; Liu & Liang 2020; Y. Liu 2026; Moss (KLP, PAS);
  Bolinger 2020; Eidelson 2013; Efron 2010; Fuquene, Cook & Pericchi 2009; Giacomini, Lee & Sarpietro; Smartt;
  Munton (texts in research/texts/).

## Lessons
- Priority-check the standard graduate textbook and the cognitive-science / social-psychology literature before
  writing an idea memo (advisor 3).
- Run a predictability test on my own abstract BEFORE the advisor; it would have saved two advisor rounds.
- Read my own tables against my thesis before sending a memo out.
- In this neighbourhood (statistics with a long robust-Bayes tradition), almost every formal fact is in print;
  a bridge paper needs a philosophical claim that is not a relabelling.

Note: extracted source texts (research/texts/, ~3MB) were left in the cloud session and not copied to claude-blog.
