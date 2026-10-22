# _NOTES: paper on Stein's paradox and fairness to individuals (working title TBD)

Started 2026-10-20 (after the guessing project was parked: claude-blog/guessing-multiple/).
Process (BW's): (1) idea from research; (2) advisor; (3) rough draft; (4) 10-agent Q&A; (5) triage;
(6) Quarto paper < 6000 words with checked .bib; (7) screening per claude-blog/CLAUDE.md.

## Human-input log
- 2026-10-20, BW: original topic (guessing / multiple guesses) -- see guessing-multiple/_NOTES.md.
- 2026-10-20, BW: after two advisor rejections, chose "Change topic, workshop new subject"; then "Let me scout three
  subjects first"; then, from Claude's shortlist of three (Stein/fairness; promising to rewritable minds; testing
  experts), chose "Stein's paradox and fairness". PERMITTED (choosing topic / selecting among outputs).
  The subject and its framing ("Stein's paradox and the right to be judged as an individual") were proposed by a
  Claude scouting agent (scouting/scout-value-theory.md), not by BW.

## Log
- 2026-10-20: philosophy research report received (research/philosophy-report.md; extracted texts in
  research/texts/). Key: no philosophy paper links Stein to fairness/individual treatment (access limits:
  Climenhaga 2025, Lippert-Rasmussen 2011, Beeghly 2018, Frick 2015, Eva 2022, Moss 2018 ch.10 NOT read).
  CLOSEST ANTECEDENTS: Vassend, Sober & Fitelson 2017 (holistic pragmatism: total vs per-part error is a pragmatic
  choice; outliers suffer; "if you know who those players are, exclude them"); Giacomini, Lee & Sarpietro
  (arXiv 2308.01596 v4 2026, econometrics): JS/EB "target aggregate performance", "tyranny of the majority",
  "large bias for outliers", "estimates may depend on sample composition"; propose individual-weight shrinkage +
  minimax regret; cite Efron & Morris 1971, Mallows & Tukey 1982 ('relevance'). Also Mehta 2019 QE.
  => Points B (outliers pay) and C (batch dependence) are KNOWN in econometrics. Novelty must be the normative
  analysis (which loss/standpoint is right for assessing persons, and why).
- Own simulations (code/js_sim.py, js_sim2.py): p=10, outlier at +4 among nine at 0: total MSE 10 -> 7.5 (JS),
  outlier's MSE 1 -> 2.4; mean estimate 2.86. Batch dependence: observed +2.0 -> 0.16 (others clustered near 0)
  vs 1.94 (others dispersed). Thin vs thick record, same observed +2.0: 0.90 vs 1.77 (EB, illustrative).
- Stats/econ/law report received (research/stats-report.md). Crucial finds:
  * Morris & Lysy 2012 (Stat Sci 27(1)): JS "cannot even guarantee that every component has a smaller risk ...
    impossible because each individual y_i is an admissible estimate of its own mu_i"; AND the hospital directors'
    assurance norm ("might agree ... but not unless each was assured that doing so would make their own hospital's
    estimate more accurate") -- = the stand-alone norm, stated as consent. Must cite as antecedent.
  * Brown 1975 (JASA 70): with losses that "cannot be pooled" (all nonnegative weightings: 'total incompatibility'),
    X is admissible; with bounded weight ratios, X is inadmissible. => Stein's phenomenon requires interpersonal
    trade-offs at bounded rates. Normative reading apparently unused: Stein is an AGGREGATION result.
  * Efron 2010 'Clemente problem'; Efron & Morris 1977 Alvis/Clemente batch dependence; LT caps worst individual
    risk at 1+k^2 (Bayes case; Koenker & Gu 2026); E&M 1975 baseball: LT s=.8 max component risk 4.60 -> 1.52,
    80% of savings retained.
  * Counterpoint: Kane & Staiger 2002 -- raw scores make extremes dominated by small units (fairness case FOR
    shrinkage). Houston Fed of Teachers v HISD 2017: batch dependence as due-process/verifiability defect.
    Lederman v King 2016. Xia et al 2022 Biostatistics: fixed effects for 'fair assessments' of providers.
    Hashimoto et al 2018 (DRO, 'Rawlsian') as ML analogue of LT.
  * Not found anywhere: (A) normative thesis that own-evidence assessment conflicts with accuracy without groups;
    sustained argument that outlier costs wrong the exceptional; batch dependence as itself unfair; LT defended as a
    fairness principle.
- Idea memo v1 (idea-memo-v1.md): Stein as an aggregation paradox (Brown 1975: Pareto-admissible but
  aggregate-inadmissible); the right to be judged as an individual = anti-aggregative constraint, best honoured as a
  bounded stand-alone guarantee (limited translation). Sent to a fresh advisor (step 2).
- Advisor round 1 on Stein (advisor-report-v1.md): VERDICT (A). Brown/aggregation reading already in Vassend, Sober
  & Fitelson 2017 fn 27; bounded-risk proposal = Hodges & Lehmann 1952 restricted Bayes (Koenker & Gu 2026 link it to
  LT and 'individuals'; Pericchi & Perez 2025 'Clemente problem'); Pareto-admissibility not distinctive (Strawderman
  proper Bayes minimax pooling rules); proper Bayes 'immune' (Brown 1971); bounded scales (Brown & Hwang 1986);
  ex ante claim reintroduces reference class; memo REVERSED Eidelson p.209 (corrected below); numbers mismatched
  estimators. Nearby paper offered (baseline guarantee; ceiling 'interesting'); riskier alternative: moral
  encroachment (Moss's rule of consideration) -> heavy-tailed priors -> bounded translation (LT); "bridge appears
  unoccupied; check before pursuing".
  CORRECTION: Eidelson 2013 p.209 says DECLINING to consider the brother's record "would hardly have constituted a
  failure to treat me as an individual"; a committee that DID consider it might have failed to.
- Step 1 round 2 (riskier alternative from advisor 1): own computation code/tails.py -- pull-back x - E[theta|x]
  under sd-1 priors: normal 0.5/1.0/2.0/4.0 at x=1/2/4/8 (linear, unbounded); Laplace caps at 1.41; t3 and
  95/5 normal mixture rise then fall (vanishing pull). MSE if truth N(0,1): normal .497, Laplace .512, t3 .531,
  mixture .519 (raw x .995).
- Priority check on moral encroachment -> heavy tails -> LT (research/priority-tails-report.md; texts in
  research/texts/pc/; agent scripts code/postmean.py, code/groupgap.py). VERDICT: statistics fully anticipated
  (Efron & Morris 1971-75 LT; Dawid 1973; O'Hagan 1979/1990; Pericchi & Smith 1992; Pericchi & Sanso 1995;
  Fuquene, Cook & Pericchi 2009 "dogmatic"; O'Hagan & Pericchi 2012; Pericchi & Perez, NEJSDS 2026 (arXiv 2025,
  dated 2011): "Clemente problem", "unfair 'pulling down'", "myopic to the exception", heavy-tailed priors).
  Philosophy: moral encroachment as prior choice = Johnson King & Babic 2020 (Beta-binomial alpha/beta; no
  individual record), Babic & JK 2023, Y. Liu Synthese 2026 (prior adjustments); "respecting individuality =
  individualized evidence prioritised" = Liu & Liang 2020 Phil Studies (flat/objective priors). Moss's rule works
  on knowledge/relevant alternatives, explicitly "not an epistemic norm"; Bolinger 2020 endorses proportional
  credence. Smartt 2022: openness = disposition to update. Gardiner 2018: demographic belief as "working
  hypothesis ... easily dislodged". NOT FOUND: tail shape / bounded influence as the content of treating as an
  individual; Phelps gap constant in signal under normal vs vanishing under heavy tails (agent's own computation).
  Caveats: distance vs precision; bounded (Laplace) vs vanishing (t) pull; robust priors may pull typical cases
  MORE; Cauchy non-monotone and can reverse the group gap.
- Own computations for memo v2: code/huber.py (huber.out.txt): Huber prior (normal bulk, exponential tails) caps
  pull at k; worst per-person risk 1+k^2 (k=1.5: 3.25); price if truth N(0,1): k=2 .3%, k=1.5 1.8%, k=1 9%,
  Laplace 2.9%; if truth 95% N(0,1)+5% N(0,25): normal .80 vs Huber .585-.613. Group gap (means 0 vs -1): normal
  .50 at every x; Huber k=1 .34/.18/.05/.006/0 at x=1/2/3/4/6. Extra record needed by B-member to reach posterior
  mean T: normal 1.0 at every T; Huber k=1 .46/.27/.06/.006/0 at T=.5/1/2/3/5.
  code/eb_batch.py (eb_batch.out.txt): one person at theta=6, rest at 0: JS risk 2.0 (p=10), 12.1 (p=50), 25.8
  (p=200); robust EB with pull capped at 1 noise sd: ~1.9 throughout. BUT with cap fixed in noise units, average
  risk in homogeneous batches is much worse (p=200: .32 vs JS .03-.17). Price not always small.
- Idea memo v2 (idea-memo-v2.md; abstract-v2.txt): "Not how much, but where": treating as an individual = bounded
  incredulity (log-prior Lipschitz in tails); three faces (epistemic/distributive/escape). Sent to fresh advisor
  (round 2) and, in parallel, to a go/no-go predictability tester (phase 1 predicts the natural paper from
  antecedent texts before seeing the abstract: gonogo-prediction.md).
- Go/no-go test (gonogo-prediction.md): VERDICT EXPECTED. Tester (given Pericchi & Perez, Babic & JK 2023, Liu &
  Liang, Moss KLP, Efron 2010, Eidelson) predicted an abstract matching mine "almost sentence for sentence"; every
  claim P or D (derivable within an hour). Strongest candidates: escape/autonomy point; Moss's rule underdetermines
  the credal requirement. Gaps flagged: zero-individual-evidence cases (Gatecrasher, Blue Bus) where tail shape is
  idle; loss-prior duality (Pericchi & Perez Result 2); WAIC/LOO can't distinguish tails; robust priors shrink
  central cases more. Suggested routes past EXPECTED: a trade-off/impossibility theorem; an answer to
  zero-individual-evidence cases; escape/autonomy promoted to the main argument.
- Own check (code/curvature.py, curvature.out.txt): memo v2's "three faces coincide" is FALSE -- they are nested.
  Generalised-normal priors log pi = -|t|^a/a: a=4 (thinner than normal): gap -> full group difference (.98 at
  x=80); a=2: gap .50 constant; 1<a<2: gap -> 0 (escape) but pull unbounded (a=1.5: pull 8.5 at x=80); a=1: gap 0 and
  pull capped. Second-order Tweedie: dE/dx = Var[t|x]/s^2, so asymptotic gap ~ (M_A - M_B)(1 - Var[t|x]/s^2):
  group membership matters for the exceptional exactly insofar as the group remains informative about them. The
  normal is the knife-edge (constant curvature).
- Advisor round 2 (advisor-report-v2.md; scripts code/advisor2/): VERDICT (A). Identification unclaimed but:
  slogan "not how much but where" = Pericchi & Perez §1.3 "not ... indiscriminate ... but differential shrinkage";
  Lipschitz bound = Johnstone & Silverman 2004 eq 7-8 ("Gaussian model ... ruled out"), Carvalho, Polson & Scott
  2009 ("bounded influence", "nonrobustness bias"); credalised Moss = eps-contamination (Berger & Berliner 1986;
  Hodges-Lehmann/Mallows, K&G §3). Thesis formally fails: a global L caps concentration (pi <= L/2: so it IS "how
  much"); a cap in prior-sd units fails distributive and escape faces; bounded scales make it vacuous; escape needs
  equal noise (Aigner-Cain's own case fails). Eidelson misread x3 (Sally in DP is a beneficiary, p.207; account
  "coincides with demands of epistemic rationality", p.218). "Cheap" false where demand has moral content.
  Re-fencing objection (Allport; subtyping; Gershman & Cikara 2023). Binary traits: tails idle. Law: 42 USC
  2000e-2(l) bans score adjustment by protected class. Price correction: contaminated world 0.69 -> 0.63-0.66
  (not 0.80 -> 0.585). NPMLE ceiling (data-driven priors cap new members near best seen). My "Huber prior = K&G's
  LT Bayes rule" was wrong (LT is not Bayes; Mallows rule is). eb_batch used 400 reps not 2000.
  NEARBY PAPER OFFERED: "pull equals push": in location-family pooling, member i's pull = s^2 psi(x_i - M) and her
  influence on ML-II M-hat is prop. to psi(x_i - M-hat); sum of pulls = 0. So Individuality (exceptions escape) and
  Responsiveness (generalisations yield to counterexamples) are one dial; making room for exceptions IS re-fencing.
  Horns: exceptional pay / generalisation protected / incoherent decoupling (LT practice). Ceiling "interesting",
  20-25% "surprising".
- My critique of the nearby paper: the coupling holds for the LOCATION parameter only. A coherent mixture model
  with a learned exception weight eps lets exceptions escape AND revise the generalisation -- through its scope
  (eps), not its centre. So "no coherent assessor can honour both" looks false; the paper may instead be about
  WHAT exceptions should teach (centre vs scope) and who benefits (all members vs future exceptional members).
  Checking numerically (code/scope.py).
- code/scope.py (scope.out.txt): batch of 50 (typical N(-1,1), k exceptional at 3); new member with record 3:
  normal EB 1.00 (k=0) -> 2.30 (k=10); Huber fixed shape ~2.0 regardless of k; mixture with learned eps 1.09 (k=0)
  -> 2.06 (k=10), centre most protected (-0.44 vs -0.16 normal at k=10). => under learned scope, pioneers pay.
- Idea memo v3 (idea-memo-v3.md; abstract-v3.txt): "Not Like the Others": pull = push (credited) + responsibilities
  in mixtures; trilemma among Individuality, Responsiveness, Own-record for coherent pooled assessors; four
  resolutions with social forms (tokenism; re-fencing; pioneers pay; incoherent decoupling = LT practice).
  Sent to go/no-go tester (advisor 2's specified antecedents) and to a fresh advisor (round 3).
- Go/no-go round 3 (gonogo3-prediction.md): VERDICT EXPECTED (10 claims P, 9 D, 0 N). And the memo's own numbers
  break the trilemma: (1) normal pooling also violates Own-record, more steeply than the mixture (1.00 -> 2.30 vs
  1.09 -> 2.06), so "pioneers pay" is generic to exchangeable learning, not the signature of the scope horn;
  (2) Huber keeps most group-level responsiveness (centre -0.93 -> -0.33 with 10 exceptions vs -0.16 normal) while
  satisfying Individuality and Own-record (2.01 -> 2.03). Bounded influence caps each exception's push, not the
  push of many. So the trilemma collapses to a quantitative trade-off unless Responsiveness means "each
  counterexample moves the generalisation in proportion to its extremity" -- which is what licenses tokenism.
  My error: I didn't read my own table against the thesis.
- Advisor round 3 (advisor-report-v3.md; code/advisor3/escape.py): VERDICT (A) and ABANDON THE SUBJECT. Coupling is
  textbook (BDA3 §17.1, §17.4: outliers in heavy-tailed/mixture components "have less influence on inferences for
  estimands such as population means"); stereotyping version modelled (Gershman & Cikara 2023: "stereotyping and
  group assignment are two aspects of a single process"; subtyping = Allport's refencing; Lu & Lin 2026). I-vs-R
  tension is old (contact theory: decategorisation vs group salience, Brewer & Miller vs Hewstone & Brown; Rothbart
  & John 1985; Pettigrew 1979, 1998). Trilemma trivial or false (O exact = no learning; O local fails for any model
  learning spread; "pioneers pay" in far tail an artefact of ML-II eps -> 0; normal EB is itself learned-scope).
  Begby 2021 rejects resistance-to-counterevidence as mark of prejudice (my memo misrepresented). Process advice:
  priority-check the standard graduate textbook and cog-sci/social-psych literature BEFORE the idea memo.
- 2026-10-20: BW (before advisor 3 finished): "Unless something radical turns up, I think it's time to go to the
  track record paper." Nothing radical turned up. PROJECT PARKED (REPORT.md).
