# _NOTES: paper on what a track record can show (testing experts) -- working title TBD

Started 2026-10-20 (after the Stein project was parked: stein-paper/REPORT.md).
Process (BW's): (1) idea from research; (2) advisor; (3) rough draft; (4) 10-agent Q&A; (5) triage;
(6) Quarto paper < 6000 words with checked .bib; (7) screening per claude-blog/CLAUDE.md
(copy: /mnt/user-data/outputs/_standard/CLAUDE-blog.md).
Process changes from lessons of the two parked projects: (a) run a predictability (go/no-go) test on my own
abstract BEFORE the advisor; (b) check my own numbers against my thesis before a memo goes out; (c) priority
checks in neighbouring fields (economics, CS/ML, statistics) from the start.

## Human-input log
- 2026-10-20, BW: chose the subject ("Unless something radical turns up, I think it's time to go to the track
  record paper") -- item 3 on Claude's scouting shortlist ("What a track record can show: testing experts against
  strategic ignorance"; scout report: stein-paper/research/scouting/scout-formal-epistemology.md §1).
  PERMITTED (choosing topic). The subject and the two thesis sketches in the scout report (counterfactual
  commitment; comparative only) were proposed by a Claude scouting agent, not by BW.

## Log
- Existing claude-blog papers checked for overlap: none on testing experts. "Findable, Not Simple" uses a
  cryptographic-assumption argument (cf. Fortnow & Vohra 2009 on computationally bounded charlatans) -- avoid
  duplicating its method or thesis.
- 2026-10-20: econ/CS report received (research/econ-report.md, 17k words; ~40 extracts in research/texts/).
  Core: prior-free, single-expert tests of REALIZED forecasts are manipulable (Sandroni 2003; O&S 2008 future-
  independent; Shmaya 2008 Borel prequential; O&S 2009 MOR any test with bounded data). Positive results need:
  commitment to future/counterfactual predictions (Dekel-Feinberg 2006; O&S 2009 AoS), unbounded data, a tester
  prior (Stewart 2011: then the test measures value added over the tester's own forecasts), restricted (non-convex /
  learnable) classes, an informed rival (AW 2008; FS 2008), computational limits (Fortnow-Vohra; Hu-Shmaya).
  Non-manipulability is only topological (O&S 2009 MOR Prop 3). Engine: minimax + "reducibility" (Nature's
  mixtures are themselves processes the expert can announce) -- AW §6. Economists' own philosophical claims
  (verbatim in report §11.6): O&S 2011 "falsifiability has no power to distinguish ..."; AW "the only coherent
  notion of 'true' probabilities is relative"; Olszewski 2015 "this literature is about the philosophy of science";
  O&S 2009 AoS "difficulty for the prequential principle"; Seidenfeld 1985 calibration is "internal".
  Pomatto & Sandroni 2018 (Phil Sci) is on Bayesian orgulity (sigma-additivity), cites Weatherson 2015.
  NB: BW has published in the orgulity debate (Weatherson 2015) -- the user is expert in an adjacent debate.
- Closest econ links to the orgulity debate: Pomatto, Al-Najjar & Sandroni 2014 (AoS): testability <-> Blackwell-
  Dubins merging; Al-Najjar, Pomatto & Sandroni 2014 "Claim Validation" (AER, abstract only): skeptical experts can
  evade rejection, experts required to accept well-supported claims can be tested; Stewart 2011: prior-free type-I
  control "arises only if the tester has an extreme form of ambiguity aversion". So "testing needs orgulity/priors"
  is largely in the econ literature already; any modesty-vs-deference thesis must go beyond these.
- 2026-10-20: philosophy report received (research/philosophy-report.md, 11.5k words). Priority: no philosophy
  paper uses the manipulability results to argue about what track records show about expertise. Near-precursors:
  Seidenfeld 1985 (calibration "otiose"; one-note weatherman; asks for a short-range criterion separating expert
  from duffer, p. 284); Shieber 2015 (Testimony textbook, pp. 82-84, uses O&S 2011 against reputation-based
  accounts -- NOT READ); Grodniewicz 2022 fn 21 (reply); Roth, Tolbert & Weinstein 2023 (FAccT; Sandroni stated,
  reference-class framing); Fan 2026 Synthese (strategic track-record building; Bayesian persuasion; no
  randomizing charlatans); Huang 2023 BJPS (track records can fail even with God's-eye view; non-strategic);
  Herrmann 2022 Synthese (prediction with expert advice for novices); Schurz meta-induction; Levy 2025 Erkenntnis
  (criteria extend trust rather than ground it). Belot 2013 SPL (failure of calibration typical) sets FV aside.
  Agent's observation: the same minimax/approachability that makes absolute tests manipulable underwrites regret
  bounds / meta-inductive optimality (not found in the meta-induction literature).
- My thinking (pre-memo): every route ends in "certification is relative" (AW's own conclusion). Candidate
  philosophical theses: S2 "trust extended, not grounded" (Levy + fields untestable + parasites/calibeating);
  S3 "expertise is not behavioural" (Blockhead/psychologism; AI evaluation) -- caveat: O&S 2009 MOR shows even
  model commitment (future-dependent tests) is manipulable with bounded data; S4 "the social cost of modesty"
  (orgulity <-> testability; ANPS 2014 Claim Validation, PAS 2014, Pomatto & Sandroni 2018, Belot, Weatherson
  2015). Rejected on reflection: "information not insight" (dissolves into Bayesian model averaging: a coherent
  agent CAN learn that a method she entertains beats her old one); "Humean chance escapes the theorems"
  (non-convexity helps only with infinite data; finite-data tests still manipulable by closure); "meta-induction
  is charlatanry" (Schurz never claims certification).
- Process: run a slate-level predictability test FIRST (two independent testers given only the econ results and
  the list of philosophical debates, asked for the most natural papers) to see whether S2-S4 are the obvious ones.
- Slate predictability test A (slate-prediction-A.md): S2 = the most natural paper (MATCH, 7P/1D) and overstated
  ("no performance-based solution" false: AW solves the 2-expert case given one informed; computability escape
  omitted; Levy's slogan vindicated but his access-based reason not -- and U1 reverses it; field claim needs
  qualification: AW Thm 7 finite horizon, O&S PNAS not read). S3 Blockhead frame inverted (charlatan's
  counterfactual dispositions DIFFER; only test verdicts coincide; repaired: "expertise is modal, not actualist",
  anti-Blockhead). S4 false in sigma-additive setting (orgulous opinions still face manipulable prequential /
  bounded-data tests; orgulity matters only in PAS's finitely additive extension). Tester's own non-obvious theses:
  U1 "it takes a non-expert to certify an expert" (Stewart: true expert fails w.p. eps = tester's chance of
  learning the truth herself; AW Thm 2 needs diffuse prior) -- inverts "it takes one to know one", Charmides,
  Nguyen, Levy's reason; U2 the theorems concern test-aware optimisation, not ignorance (sincere non-experts fail
  except on negligible sets: Dekel-Feinberg Thm 3, Stewart Cor 1) -- exact for models trained against the metric;
  U3 metaphysics of chance (reducibility needs chances closed under mixture; Humean chances are not) -- I had
  this idea too (C5), set aside because non-convexity helps only with unbounded data.
- Slate predictability test B (slate-prediction-B.md): S2 MATCH with its #1 (only one worth pursuing, after fixes);
  S3 not as framed (3 of 4 rescue routes behavioural; "psychologistic" wrong); S4 already in ANPS/PAS and costless
  (BD-twin argument: any opinion has a sigma-additive twin agreeing on all finite histories). B's own most
  surprising thesis: "Ignorance of chance looks like chance": with bounded data, screening the ignorant requires a
  NON-CONVEX protected class (MOR Prop 1 contrapositive; Sandroni-Shmaya Prop 1); a mixture is what an ignoramus
  and an honest coarse expert both forecast; so finite records certify only sharp knowledge, never modest/coarse
  expertise. (Converges with my C5 and A's U3.)
- My synthesis (T**): two kinds of expertise (Hall 2004 database vs analyst -- VERIFY Hall's terms): information
  (knowing more) vs judgment (reasoning better from the same evidence). (i) Prior-free finite tests certify neither
  absolutely, except sharp foreknowledge relative to a non-convex class (= information relative to the class's
  hull); protecting all honest learners over a model class protects its convex hull -> manipulable (MOR Prop 1).
  (ii) A Bayesian evaluator certifies informational expertise relative to her prior (Stewart; better the less she
  knows: A's U1), but never judgment superior to her own: if the other's method has weight w in her prior, the
  other's LR against her is <= 1/w on EVERY path (mixture bound); if not, Ville says she is near-certain it won't
  beat her, and Stewart says false experts pass w.p. 0 by her lights. (iii) Judgment is certifiable only
  comparatively between others (LR picks the KL-closer forecaster; caveats: parasitism/calibeating, AW Thm 1).
  Upshot: you can learn that someone knows more than you, not that she reasons better than you; recognising
  better judgment is third-personal / institutional (tournaments), and first-person deference to it needs
  non-conditionalising self-doubt (higher-order evidence).
- Memo v1 check by tester B (memo1-check-B.md): EXPECTED, and the Hall information/judgment line FAILS: (1)
  inconsistent with claim 2 (Stewart certifies someone who knows the chances); AW's representation point -- the
  same forecasts are information or judgment depending on the evaluator's uncertainty; (2) for non-ideal
  evaluators superior computation is certifiable (all advertised cases move to the information side); (3) breaking
  cases: doctor certifies doctor by agreement ("non-doctor better placed" is an artefact of Stewart's quack knowing
  the evaluator's prior); dogmatic i.i.d. modeller rightly concludes a Markov forecaster judges better; LLMs have
  database expertise. Formal corrections: 1/w bound only for ATOMS (smooth priors: LR can grow ~ n^{d/2});
  "false experts pass w.p. 0" only for history-measurable forecasters, by the evaluator's lights, infinite horizon;
  "knows least" conflates diffuse with mistaken; LR-picks-KL-closer needs forecasts bounded away from 0/1 and a
  growing KL gap (Kavaler-Smorodinsky). The one possibly new piece REVERSES claim 3: another's likelihood ratio
  against one's own forecasts is a test martingale under one's own forecasts (Ville), so one can reject one's own
  forecasts at level 1/c, and by one's own lights no charlatan can game it: a novice CAN recognise being out-judged.
- My reaction: the self-test gives a person-level refutation/verification asymmetry: a truthful expert cannot be
  made to fail a test of her forecasts against ANYONE's (prior-free; Ville under the truth; cf. AW Thm 1), while no
  record certifies anyone. Records refute persons, never verify them -- and the person a novice can most usefully
  refute is herself (Socratic: Charmides 170e-171c, knowledge of what one does not know). Caveat: O&S 2011 already
  argue "refutation is a better maxim than verification" (for theories/contracts); AW: only relative truth;
  game-theoretic probability (Shafer-Vovk: Skeptic's capital is a test martingale) is the standard home of the
  self-test.
- Memo v1 check by tester A (memo1-check-A.md): formal core predictable; headline false (contradicts claim 2;
  the first/third-person asymmetry comes from switching standards: "by her lights" vs "under the truth"); the
  learners -> convex-hull lemma is "the one nice lemma" (needs compactness; unbounded charlatans; MOR Prop 2
  mis-cited); salvage idea: "orgulity hides better judgment" (modest evaluators, orgulous experts) -- unverified.
- My further check of the lemma: in MOR Prop 1 with paradigm conv(C) the manipulating charlatan randomises over
  conv(C), i.e. he knows C -- which the test itself builds in. So the lemma says hedgers over C are
  indistinguishable from someone who knows only what the test embodies (near-tautology, as B said). General
  moral: a public test cannot certify knowledge it builds in; certification is always of knowledge beyond the
  evaluator's baseline (AW/Stewart again). DROPPED as a headline.
- Memo v1 ABANDONED. Next: memo v2 on the one piece both testers found new-ish and that survives both standards:
  person-level refutation. Ville under the truth (prior-free): if F's forecasts are the chances, any rival's LR
  against F (any strategy, randomised, even seeing F's forecasts) is a test martingale, so P(F ever beaten by
  factor c) <= 1/c. Records can refute anyone's claim to know the chances -- including one's own -- charlatan-
  proof and prior-free; they can verify no one's. Same computation by her lights and under the truth (no
  standard switching).
- Advisor round 1 (advisor-report-v1.md; code/advisor-v1-refutation-sim.py): VERDICT (A); recommends PARKING
  THE SUBJECT. Person-level refutation is in Shafer 2023 (NEJSDS 2(2) §2.2: "Too many predictions contradicted by
  experience discredit the person making them ... you are not much of an expert about it") and Shafer 2021 (JRSS A,
  Protocol 4); AW call the martingale property "a standard observation"; Kavaler-Smorodinsky's "error-free" axiom;
  refute/verify asymmetry for sharp hypotheses = Genin & Kelly 2017; anytime-valid comparative e-tests = Henzi &
  Ziegel 2022, Choe & Ramdas 2024; AA = defensive forecasting (Chernov, Kalnishkan, Zhdanov & Vovk 2008).
  The asymmetry again came from switching standards (verification judged against STRATEGIC forecasters,
  refutation against SINCERE ones; against strategic ones refutation fails too: a Bayes mixture of rivals is never
  refuted -- 0/500 runs). The refuted claim ("I know the chances") is one no novice holds; coarse experts are
  refuted 99.9% of the time. Charmides moral inverted (171c: the fellow craftsman can tell -- AW/FS vindicate
  Socrates); self-knowledge of ignorance is the Apology. Only sound paper: S2, ceiling EXPECTED (Episteme/
  Synthese), not competitive. Process lesson: fix one standard per claim before testing an asymmetry.
- 2026-10-20 ~22:30: PROJECT PARKED pending BW (REPORT.md). Alerting BW per instruction ("if you abandon ... alert
  me and we can workshop a different subject").
- 2026-10-20, BW (human input, via multiple-choice after my abandonment alert): "Write the safe S2 paper anyway"
  -- i.e. run steps 3-7 on the sound but 'expected' track-record paper (advisor's Charmides frame), to exercise the
  rest of the process. PERMITTED (choosing among options I offered). The thesis and frame are Claude's/advisor's.
  Project UN-PARKED for S2.
- Step 3: rough draft draft-v1.md (3,785 words): "Only a Fellow Craftsman: What a Track Record Can Certify". Thesis:
  a record of probabilistic forecasts can certify expertise only relative to a baseline the evaluator supplies
  (own forecasts / an informed rival / a restriction on the world); no record and no comparison shows that anyone
  knows the chances. Incorporates testers' and advisor's corrections (rival must be informed; computation route
  set aside; field claim qualified; calibeating = misattributed credit; Stewart by-her-lights; sincere vs strategic).
- Step 4: 10 Q&A agents launched in parallel (temperature can't be set; variety via personas and four different
  models: opus x3, sonnet x3, haiku x2, fable x2). Outputs: qa/suggestion-01..10.md.
- Asked BW for PDFs (Goldman 2001; Shieber 2015 pp. 80-85; Sandroni 2003; O&S 2009 PNAS; Huang 2023; Fan 2026;
  Charmides translation) in claude-blog/track-records/pdfs/.
- Step 4 results (qa/suggestion-01..10.md); step 5 triage in qa/triage-step5.md. Strong convergence of #2, #5, #9,
  #10 (and #1): what a record certifies is relative to an account of what the chances could be (the evaluator's
  hypothesis space mu, computable chances, best-system chances); the impossibility bites where every mixture of
  chances counts as a chance (propensity/primitivist), not on best-system Humeanism. Errors fixed: §4.2 ran the
  wrong way (#6: a known craftsman discredits, never crowns; crowning a winner needs "one informed, unknown
  which"); Stewart needs mu not p-bar (#2); mixed measure/topology standards (#1, #4). Restriction: the strategic
  impossibility bites in practice only for test-aware forecasters (#4, #8). My correction to #8: copying the crowd
  inherits the crowd's resolution, so certify only resolution beyond the crowd.
- DECISION (step 5): option 3 -- substantive revisions, then back to step 4 (second Q&A round). Not option 4: the
  core claim (certification is relative to something the record does not supply) is deepened, not replaced.
  New chance-ontology claims sent for verification + priority check (research/chance-ontology-check.md).
- Note: Q&A agent #6 accidentally triggered a message-compose draft card ("placeholder"); nothing was sent.
- Chance-ontology check (research/chance-ontology-check.md, 7.4k words): (1) "best-system chances are never
  mixtures" is FALSE as stated (every non-deterministic chance function is a mixture; Mentaculus; Laplace/Polya
  has zero parameters; under MDL mixtures compete and often win); weak form only: some mixtures of
  distinguishable systems (1/2 iid(.3) + 1/2 iid(.7)) are never best, given a simplicity assumption penalising
  mixing. (2) Polya urn = Beta mixture of iid with no hidden parameter: correct (Hill, Lane & Sudderth 1987).
  (3) Dawid: computable forecasters calibrated on all computable selection rules agree asymptotically; existence
  not guaranteed; only asymptotic; Dawid 1985 not read (via Belot 2013, Dawid 2017, RTW 2023). (4) Pathwise
  Humean test OK, but fails probabilistic type-I by the undermining probability; and ANY finite-segment test that
  passes the Humean chance-knower on every path must pass every system best for some continuation -> no power:
  Humean certification is by the whole history, not a track record. (5) No prior work connecting testing
  theorems to Humean vs primitivist chance; nearest: Earman & Roberts 2005 (epistemic argument for HS of laws),
  AW pp. 554-5, Vovk-Shafer §5.3, Olszewski 2015 §5.3, Dawid 2017, Hoeltgen 2026, Belot 2024, Barrett & Chen 2026.
  My conclusion: the generalist's dilemma (#9) does NOT hold for finite records: neither metaphysics of chance
  makes chance-knowledge certifiable by a track record (propensity: mixtures are chances; best system: chances
  outrun the record); computability only asymptotically. This becomes a supporting section ("the world does not
  supply the account"), strengthening the relativity thesis rather than replacing it.
- Draft v2 (draft-v2.md, ~4,170 words): "The Record and the Account". Thesis: a finite record certifies knowledge of
  chance only relative to an account, held fixed by its reader, of what the chances could be; neither the
  metaphysics of chance (propensity: any process realisable as a chance process by a history-recording mechanism,
  so mixtures are chances; best system: chances outrun any finite record) nor the record supplies it; computation
  only in the limit. Comparison rewritten (known craftsman discredits, never crowns; crowning needs "one of the
  two knows"); provenance; guild; test-aware forecasters (AI benchmarks; crowd as baseline); novice: aggregation
  needs no account. Self-check fixes applied before Q&A (convexity "uses" not "exactly needs"; restriction is
  about decomposing credence into chance hypotheses, reconciling #2 and #10; Stewart examples corrected;
  generalised urns; recalibration REMOVES calibration error).
- Step 4 (round 2): 10 new Q&A personas on draft v2 (qa2/).
- Step 4 round 2 results (qa2/suggestion-01..10.md); triage in qa2/triage-step5-round2.md. Key: hostile referee
  (#9) -- sincere case unargued (fixed: record = test and textbook; head start relative to a baseline learner);
  Humean (#1) -- I switched standards AGAIN in §3.3 (pointwise for best-system, probabilistic for propensity);
  New Principle standard restores the dilemma (standards ours vs objective); economist (#4) -- singularity
  (Kavaler-Smorodinsky Thm 5) as the exact property; de Finettian (#2) -- Stewart's test uses only forecasts;
  deference (#3) -- novices need deference-worthiness; institutional norm (#6) + double use (#10) -- accounts
  fixed in advance; Plato (#7) -- two senses of "account"; AI eval (#8) -- static evals of fixed models are the
  sincere case (but feedback NOT required for manipulation: randomise-once suffices with bounded data).
- DECISION (step 5, round 2): option 2 -- incorporate/set aside each, then write the final paper (step 6). New
  claims sent for verification (research/final-claims-check.md).
- Step 6: final paper paper/record-and-account.qmd (body ~5,050 words + abstract ~295) and record-and-account.bib
  (47 entries). Crossref verification log in scratchpad bib/out1.txt (copied to paper/crossref-log.txt); notes in
  paper/record-and-account-bib-notes.md. HTML render OK, all citations resolve. Awaiting final-claims-check before
  locking claims about Dorst et al. (Total Trust), Lewis 1994 ("if nature is kind"), Hoefer 2019, Anderson 2011,
  Earman & Roberts, Plato Stephanus numbers, Dawid 1985, Levy page.
- Final-claims check (research/final-claims-check.md) applied: Dorst et al. Total Trust restated (variables;
  equivalent to letting the source decide; allows modesty); Lewis 1994 p. 479 ("if nature is kind": standards only
  "partly a matter of psychology") reworded; Hoefer 2019 (unread) replaced by Hoefer 2007 ("best for us"); Earman &
  Roberts characterised correctly (all possible evidence; they leave chance aside); Laplace sqrt(n) growth stated
  "on average" (a.s. only up to log log n); Genin & Kelly qualified (isolated points); Levy quote p. 2089; Lewis
  "whatnots" passage checked in the original: p. 484 ("I don't begin to see").
- Test builds: HTML OK; PDF OK (14 pp.) with a stub lmodern.sty and TeX Gyre Pagella (container TeX lacks lmodern;
  stub deleted after build). Word count: body ~5,140 + abstract ~300 (+1 footnote); bibliography excluded.
- Step 7: two independent fresh-context screenings against claude-blog/CLAUDE.md.
- Step 7 screening (2026-10-21): BOTH NOT READY (paper/_screening-report-v1a.md, -v1b.md).
  Shared deal-breakers: (1) PRIORITY: the "account" is the economists' "paradigm"/"restricted class of allowed
  data-generating processes" (Olszewski 2015 survey section, incl. the i.i.d. example; O&S 2009 MOR §4.1 two-theory
  non-convex paradigm); uncited: Al-Najjar, Sandroni, Smorodinsky & Weinstein 2010 (JET 145: 2203-2217),
  Sandroni & Shmaya 2014, Pomatto 2021 "Testable forecasts" (TE 16: 129-160: paradigm = "a summary of
  preexisting knowledge"; necessary and sufficient condition for testability; optimal tests are likelihood-ratio
  tests against a hypothetical Bayesian outside observer -- anticipates "head start over a learner"). Pomatto 2021
  was missed by all research rounds. (2) The headline formal claim is FALSE for unbounded records: Sandroni &
  Shmaya 2014 give a non-manipulable prequential test for the convex exchangeable class (Pomatto fn 4: the
  learnable paradigm "is convex, but testable"); singularity (K-S Thm 5) characterises ideal COMPARATIVE tests,
  not single-forecaster certification. MY ERROR: the econ report (§4.6) and the chance-ontology check both said
  non-convexity matters only with bounded data; I still wrote "accounts on which mixtures of chances are chances
  certify no one" -- lesson (b) violated again. (3) Metaphysics section undercut: urn-knower (Laplace forecasts)
  and fixed-bias-coin-knower are mutually singular, so the urn/coin E&R analogue fails; Laplace and stat-mech
  mixtures are harmless by the paper's own singularity criterion; propensity reply (chances relative to kinds of
  set-up) unaddressed. Strengths both noted: the Stewart example; record-as-textbook framing; Charmides reading of
  AW; provenance/calibeating; screener A: the primitive-vs-best-system testability question "looks new".
- Read Pomatto 2021 (scratchpad pomatto.txt) and S&S 2014 intro myself. Findings:
  * Pomatto Thm 1 / Cor 1: a paradigm L is testable by FINITE tests iff for every e there is a prior mu on L with
    ||Q_mu - P||_TV >= 1-e for all P in L (iff I(L)=1, I = sup over the closed convex hull of the TV distance to L).
    Thm 2: then the LR test "pass iff P(w^n_P) > Q_mu(w^n_P)" accepts the truth w.p. >1-e and is e-nonmanipulable.
    Thm 3: LR tests are least manipulable (Neyman-Pearson). Intro: paradigm "a summary of preexisting knowledge",
    "restrictions imposed ... by a scientific theory", or "a normative standard"; optimal tests compare forecasts
    with "a Bayesian endowed with an uninformative prior". Fn 18: exchangeable class is convex and compact, so not
    finitely testable; S&S 2014 make it testable with non-finite prequential tests. Prop 2 proof: uniform prior over
    n orthogonal laws.
  * So draft's formal core = Pomatto's theorem, and its sincere-case argument ("head start over a baseline learner")
    = Pomatto Thm 2. The S2 paper's thesis is anticipated, precisely. Not fixable by presentation.
- DECISION (step 7): core revision -> back to step 2, NOT a step-4 round. Re-centre on the one question both screens
  flagged as possibly new: does the metaphysics of chance decide whether records can certify chance-knowledge?
  Candidate core: (L1) if a Humean theory of chance is delta-proper (each chance law P gives prob >= 1-delta to
  {w: BS(w)=P}), distinct chance laws are at TV distance >= 1-2delta [one line: the events {BS=P} are disjoint];
  (L2) so with n such laws, a uniform prior gives I >= 1-2delta-1/n, and by Pomatto Thm 2 the LR test against the
  uniform mixture is (2delta+1/n)-nonmanipulable with type-I error < 2delta+1/n. Humeanism supplies, a priori, the
  paradigm Pomatto says is needed; mixtures of distinct chance laws are maximally self-undermining ("Nature's
  compound lotteries" are not chances). Primitivism supplies none (Polya urn; hidden two-stage set-ups); with a
  convex compact class it is finitely untestable (O&S MOR; Pomatto Cor 1). Undermining probability = certification
  error ("the big bad bug is the price of testability").
  Known threats, to be pre-tested before the advisor (lesson a): (i) LOCALITY: L1 needs BS to be a function of the
  record; for local records (one coin in a many-coin mosaic) Humean chance of the record can be a Polya mixture and
  Polya(a,b), Polya(a',b') are mutually absolutely continuous -> class not near-singular; (ii) finite worlds: delta
  is the undermining probability (Schwarz 10-toss: 0.754; toy MDL values 0.003-0.115), large at the resolution
  limit; (iii) infinite horizon removes the asymmetry (S&S 2014; O&S AoS); (iv) ties/imprecise BS reintroduce
  convexity; (v) priority: Belot 2024 "Unprincipled" (proper theories of chance), ANSSW 2010, JKS 1999
  (learnable representations), Earman-Roberts style arguments for chance.
  If the pre-test kills this too, alert BW (abandonment) rather than retreat to step 1.
- Pretest v3-A (opus, pretest-v3-A.md): STOP. Its brief-only Phase 1 predicted the memo's thesis as the MODAL paper
  (~65%), including L1 with the same proof and the 1-2delta-mu({P}) bound; all six claims P/EXPECTED. Decisive
  objections I accept: (1) properness is NOT constitutive of Humean chance (Lewis-style finite laws undermine at
  0.754), so "restriction is part of what chance is" is false; a primitivist can adopt Lambda_H and get the same
  test; uncertainty about the BS map restores mixtures (Polya(1,1) proper under one standard, Polya(2,2) under
  another; mutually a.c.). (2) "Undermining is the price" conflates delta with test error: small delta is
  sufficient, not necessary (counterexample with a perverse BS map); under the New Principle delta drops out.
  (3) Locality: for every real record the Humean is in the primitivist's position. (4) My delta figures were for
  iid(1/2) only; in the toy MDL model Laplace is the best system of most worlds, so the uninformed Bayesian counts
  as the chance-knower. Residue it suggests: (i) a short specialist note "proper theories of chance are testable";
  (ii) the less predictable NEGATIVE thesis: the Humean's epistemic advantage does not survive strategic testing;
  under mixture-friendly simplicity standards the uninformed Bayesian is the chance-knower.
- Pretest v3-B (fable, pretest-v3-B.md): "PROCEED WITH CHANGES, but STOP unless re-centred". Phase 1 predicted the
  memo's thesis as its N1 (~70%), with identical Lemma A/B and Corollary; all claims P/EXPECTED. Agrees with A:
  properness = a.s. identifiability of the law from the world, a property of a chance map, not of Humeanism
  (non-Humean maps can be proper; finite-world BSAs are improper unless laws are cheap: delta = 2Phi(-c) with grid
  spacing 2c s.e.); local marginals mix (TV(Polya(1,1),Polya(2,2)) = 0.19); restricting to Lambda_delta has an
  uncounted misspecification cost; Schwarz's 0.754 is under frequentism, not a BSA (my attribution was wrong);
  n_P unbounded so no fixed-horizon certification. Both testers locate the only live residue in the same place:
  code-length (MDL) simplicity makes Bayes/universal mixtures best systems, so either local Humean paradigms
  mix (uncertifiable) or the uninformed mixture-announcer IS the chance-knower; "certifiability as a constraint on
  the BSA's simplicity measure". B: with that as core, possibly a real contribution; otherwise a short formal note.
  B's own Phase 1 predicted "mixtures can be best systems" (N5) at ~30% as an anti-Humean counter.
- My assessment: the v3 thesis is dead as a generalist paper (the modal predicted paper; its one non-obvious
  claim false). Per my commitment, alert BW about abandonment and offer the options; do not start another
  re-centring unasked. Waiting on the priority check first.
- Priority check v3 (research/priority-v3.md): C1 PARTLY ANTICIPATED (Belot 2024 Def. 2.8 "proper"; singularity
  used in proof of Prop. 3.4); C2 PARTLY (Pomatto Prop. 2 construction, mixing laws in place of chance laws);
  C3 PARTLY (AW 2008 p. 554 "Nature's compound lotteries"; exclusion on Humean grounds not found); C4 epistemic
  theme ANTICIPATED, testing version NOT FOUND; Barrett & Chen give primitivists proper "constraining" laws, which
  undercuts the asymmetry; C5 NOT FOUND. Closest: Pomatto 2021 Prop. 2.
- STEP-7 OUTCOME: the v3 core fails the pre-test (modal predicted paper; asymmetry false; formal content an
  exercise; a short note would be NOT READY on generalist appeal/incrementality under CLAUDE.md criteria 1-2).
  The only live residue (simplicity-measure constraint on BSAs) is partly predicted (B's N5, ~30%), unverified,
  and a dilemma a Humean can escape by biting (chance = ideal learner's credence). Alerting BW: abandonment of
  this subject is warranted; asking how to proceed rather than retreating to step 1.
- 2026-10-21, BW (human input, multiple choice after my second abandonment alert): "Stop; write a post-mortem
  (Recommended)". PERMITTED (choosing among options I offered). Subject STOPPED. Post-mortem: _POST-MORTEM.md
  (whole trial: guessing, Stein, track records). REPORT.md updated with the final outcome.
