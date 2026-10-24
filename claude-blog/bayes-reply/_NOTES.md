# _NOTES: reply to Meehan & Zhang, "Bayes Is Back" (Phil Review, forthcoming/published)

Started 2026-10-23 12:42 (America/Detroit). Same staged process as the fiction paper (BW): (1) idea from research;
(2) advisor; (3) rough draft; (4) 10-persona Q&A; (5) triage; (6) Quarto paper < 6000 words, .bib checked against
Crossref; (7) screening per claude-blog/CLAUDE.md, twice, fresh contexts. Deadline 31 Oct 2026. Models: Opus at most.
Agents must not use messaging, email, scheduling, trigger, reminder, artifact or widget tools.

## Human-input log (classified against the competition FAQ; be explicit)
- 2026-10-23 12:42, BW uploaded Meehan & Zhang, "Bayes Is Back" (PDF headed "Forthcoming in The Philosophical Review",
  43 pp., compiled 31 Aug 2026) and wrote: "This process seemed to work well; maybe we should be aiming more narrowly at
  6000 words. Can you have a try at starting the same process with this paper. It's also in Phil Review, also by high
  profile people, and was also in Philosophers' Annual. So I think it's OK to just do a reply - if you have interesting
  replies to make." CLASSIFICATION: providing a source paper (PERMITTED) + choosing the topic/target paper (PERMITTED:
  choosing topic) + length/genre guidance (PERMITTED: format). BW supplied no thesis, objection or assessment of the paper.
  FLAG FOR THE REPORT: as with the fiction paper, the target paper was chosen by BW; say so plainly.

## Log
- 12:45 Read the whole paper (research/texts/target.txt; pdftotext -layout). Notes on its structure in research/target-notes.md.
- Published version: Philosophical Review 134(3): 285-350 (2025), DOI 10.1215/00318108-11873775 (from the published PDF's
  first page). Selected for The Philosopher's Annual for 2025 (Daily Nous, 30 Aug 2026). Published PDF found publicly posted on
  Kevin Dorst's website (kevindorst.com/uploads/.../285meehan__1_.pdf; it is the Duke UP PDF with an MIT Libraries download
  stamp). Saved as research/texts/mz-published.pdf/.txt for PAGE NUMBERS ONLY. FLAG for BW: if he prefers, he can supply his own
  copy of the publisher PDF; quotes will be checked against it either way.
- Prior discussion found: Richard Pettigrew, Substack post "Bayesianism when learning isn't straightforward" (Dec 2025), praising
  the paper; it notes the result "relies on you thinking each evidence function is equally likely". Kenny Easwaran's comment
  (20 Dec 2025, summarised by WebFetch; verbatim not obtained): the result is roughly equivalent to expected accuracy when each
  situation is equally likely to be the one you're in; his framework with Nielsen uses "signals"; optimum shifts each world's
  probability in proportion to the likelihood of the received signal. => The CAR/likelihood reduction is PARTLY ANTICIPATED
  (informally). Must credit.
- Easwaran & Nielsen 2025, "Updating by Maximizing Expected Accuracy in Infinite Non-Partitional Settings", JPL 54: 1095-1134
  (OA; research/texts/oa/en2025.txt). READ §4-6. §4.4: with stochastic signals L, the EA-optimal plan is p_s(ω) ∝ p(ω)L_ω(s)
  (p. 1118-1119). p. 1120: when "for every signal, every world that gives it a non-zero probability gives it the same probability"
  the update coincides with conditionalizing on the signal's support ("a generalization of Theorem 4 of Isaacs and Russell") =
  CAR in all but name. §5.3: continuous unmarked dial with uniform signal density in the margin => conditionalization; with a
  cosine (centre-peaked) density => posterior raised near the centre (p. 1129). Does NOT discuss Bayes Is Back (only Meehan &
  Zhang 2020 "Jeffrey meets Kolmogorov"). No mention of CAR / Grünwald-Halpern.
- Grünwald & Halpern 2003 (JAIR; arXiv cs/0306124) downloaded: research/texts/oa/gh2003.txt. Medina 2023 (Phil Imprint
  23(28), OA; M&Z cite it as "Medina 2024 ... Philosophers' Imprint 3") downloaded: research/texts/oa/medina2024.txt.
  Schultheis 2025 "Accurate Updating" Phil Sci 92: 324-343 (OA) downloaded.
- 2026-10-23 ~13:30: read Weatherson 2013 "Margins and Errors" (Inquiry 56: 63-76) from BW's own posts folder on the device
  (posts/mae/margins-and-errors.qmd; staged read-only). Source material only (his published paper, cited by M&Z). Relevant: the
  'Circular Appearance Centred' model (attributed to Williamson 2013 "Gettier cases in epistemic logic"): strongest knowledge
  V in [a-(e+m), a+(e+m)].
- STEP 1 candidate (process/candidate.md): margins => not coarsening at random; M&Z's TEA = expected accuracy in a transparent
  auxiliary problem (likelihood updating); bcond optimal iff CAR (= M&Z's extensionality); uniform measure CAR because
  permutation-invariant; margin-respecting weightings are never CAR unless nothing is learned; optimal GEC rule = 'interior'
  conditionalization (Dana: certainty in 15 on {15,16}; Olivia: 17 on [16,18]). Numerical checks: code/checks.py,
  code/run_checks.py (reproduces M&Z's -2.72/-4.48/-6.8), code/margins_fast.py (random margin-respecting weightings never
  extensional, n=3,4,5; mixed domains not extensional; under M&Z's uniform measure on a 6-point scale only 1/3 of
  (state, evidence) pairs respect a margin of 1).
- Launched (opus, background): blind predictability pretest (process/pretest-report.md; Phase 2 questions are ONLY in
  process/pretest-phase2.md, not in the prompt -- fix for the earlier leak) and antecedent/canon check (process/canon-check.md).
- PRETEST (opus, blind; process/pretest-report.md). Phase 1 top pick = "Bayes behind the veil" (TEA = EA for an agent uniformly
  unsure of her learning situation; Facts 10-12 = CAR), p~0.15; margin-respecting weightings reverse the verdict (obj. 4,
  p~0.20; it found the Dana numbers (1, 0,0)/(0,0,1)/(1/8,3/4,1/8) blind). Phase 2: points 1,2,6 predicted; 3,4 partly; 5 not.
  Est. ~0.10 that a critic headlines the general margins theorem. SOUNDNESS: points 1,2,4 correct. Point 3 valid but needs ONE
  FIXED SYMMETRIC CONNECTED R shared by all weighted situations: counterexample (b) on Dana's scale mixes Dana's situation with
  one-sided-margin gauges (weights 2/7,1/7,1/7,1/7,2/7) and restores CAR (I verified by hand). Corrections: interior rule =
  one-shot only on {15,16},{16,17} (on S: (1/8,3/4,1/8) vs delta16); under M&Z's full measure the interior rule scores -1.60
  vs -0.68 (Brier) and -inf (log). Further ideas: non-factive situations weighted uniformly => dogmatic rule optimal
  (factivity is a knife-edge too; Pettigrew's post makes a version of this); maximin aggregation => dogmatic. Verdict
  PURSUE WITH CHANGES: re-scope point 3 (fixed R / dilemma); lead with what is new; present interior rule as reductio horn.
- CANON CHECK (opus; process/canon-check.md). Points 1-2 ANTICIPATED (M&Z's own Lemmas 1-2 pp. 344-5 give the formula and the
  equivalence; "Any positive, constant weighting function is trivially extensional" p. 336; Easwaran comment verbatim: "basically
  equivalent to assuming you are equally likely to be using it in any of these situations"; I&R Thms 3-4; E&N; Gallow Prop 1).
  New only: the CAR label + statistics citations; permutation-invariance lemma (elementary). Point 3 NEW as a general claim
  but a one-line corollary of GvdLR/GH Thm 3.1(d) and M&Z Lemma 2; single-situation core informally in Williamson 2014 p. 980
  ("R(w) is known only at w"), Salow 2018 (popularity clock; truth-centred evidence exploitable, guess-centred not), Ahmed &
  Salow 2019 p. 6. CAR weightings in the clock literature (Carr 2021 §6.1; I&R clock; E&N p. 1129) are edge-allowing. Interior
  rule NOT found; centre-weighted relatives: Ahmed & Salow's Cr* (0.1/0.8/0.1), Gallow's 80/10/10, E&N 1/4-1/2-1/4 and
  cosine. No published reply to M&Z found besides Pettigrew's post + comments (Crossref/OpenAlex show 1 citing work,
  unidentified -> ask BW to check PhilPapers/Scholar). Verbatim Easwaran comment saved oa/pettigrew2025-substack-comments.json.
- Extra checks: code/margins_general.py (two-sided margins of varying width never CAR, n=3-5; CAR => E[posterior]=prior and
  bcond beats prior; Dana-prior margin weighting => E[posterior on 16]=0.63 and bcond worse than prior, -1.154 vs -1.12);
  code/margin_vs_prior.py (with UNIFORM priors bcond still beats the prior under margin weighting, n=3..7 -- so the
  'worse than dogmatism' effect is prior-dependent; do not overclaim).
- 2026-10-23 ~14:40: asked BW (message) for PDFs: Gallow 2021, Isaacs & Russell 2023, Salow 'Gnosticism and Inexact
  Knowledge' (PPR forthcoming, OA), Carr 2021, Bronfman 2014, Williamson 2013, Heitjan & Rubin 1991; and to check the one
  unidentified citing work on PhilPapers/Scholar. PERMITTED (source materials).
- process/idea-memo-v2.md written (corrected scope of the margin corollary; credits; T-narrow vs T-broad). STEP 2: advisor
  (opus, fresh) launched -> process/advisor-report.md.
- ADVISOR (opus, fresh; process/advisor-report.md; checks code/advisor_checks.py). VERDICT (B) promising, restructure.
  N1-N3 correct (N1 scoped to weightings ALL of whose methods are two-sided; pretest mixture re-verified CAR; CAR weightings
  are a knife-edge: 0/10,000 random weightings on that support). N4 OVERCLAIMS: CAR is sufficient for the good properties,
  but failure of CAR does not bring bias/negative value -- Williamson's symmetric clock (circle) is not CAR yet E[posterior] =
  prior and bcond beats prior. Drop "one source"; drop "safe evidence" wording (guess-centred theorists say their evidence is
  safe too) -> "truth-centred, two-sided margins". NEW centrepiece N5 (advisor's): if every learning situation has a
  two-sided margin, conditionalization is WEAKLY ACCURACY-DOMINATED, at every possible (evidence, state) pair, by a GEC
  rule: log -> pi(.|int p); Brier -> Euclidean projection of pi(.|p) onto the face over int(p) (pi(.|int p) is NOT
  Brier-dominant); concave scores -> conservative mixtures also dominate. Weighting-free; survives GEC; Fact 7 is proved via
  'learn whether p' problems where p is learned at its edge. Thesis sentence (advisor): "If every way an agent has of
  learning about a magnitude carries a two-sided margin for error, then conditionalizing on what she learns is
  accuracy-dominated by a rule that responds only to what she learns, so 'Bayes is back' holds only for evaluations that
  count learning which is exact at the edge of what is learned." Trilemma conclusion. Forecast for a well-executed
  version: NOT READY .35 / PASS .05 / PASS FORMAL .53 / STRONG .07 (T-broad as written ~.65 NOT READY).
  Must read before claiming N5 new: Dorst 2020 (Effacing Evidence: constant credence dominates in clock models -- READ
  in dissertation ch. 2 pp. 57-60: single-proposition dominance used to REJECT margin models; related but different),
  Nielsen 2021 (Phil Studies 178(10): 3217-36; abstract via PhilArchive: corrects Briggs & Pettigrew 2020; no mention of
  non-partitional learning -- need full text), Bronfman 2014.
- MY INDEPENDENT CHECK of N5: code/dominance.py (lines and cycles, n=3..7, 100 Dirichlet priors each): log gain >= 0
  everywhere, strict whenever rim nonempty; Brier-projection gain >= -4e-16 (float), strict whenever rim nonempty;
  conditioning on the interior is NOT Brier-dominant (gains down to -0.71). CONFIRMED.
- STEP 3: rough draft paper/draft-v1.qmd ("Bayes at the Edge", ~4,900 body words), structure per advisor: §1 problem; §2 margins
  around the truth (Observation); §3 Proposition (dominance; log: pi(.|int p); Brier: projection), remarks (GEC; conservative
  mixtures via M&Z Fact 4 technique; numbers: Olivia 1/3 -> delta17; Dana {15,16}: bcond -2.25, prior -2.08, f 0, mixture
  eps=.2 (0.85,0.15,0) -0.09; clock eps=.3 -> (0.1,0.8,0.1) = Ahmed & Salow's Cr*); uniformity vs Fact 7; §4 Lemma 1 =
  likelihood, extensionality = CAR, counting measure CAR, margins => not CAR, one-sided-gauge mixture (pretest's example;
  credited in notes, NOT in paper), uniform-error clocks (Carr, I&R, E&N); CAR-anomalies paragraph correctly scoped
  (symmetric clock: martingale and bcond beats prior -- checked code/draft_numbers.py); §5 M&Z's best reply + six
  responses; §6 trilemma. Footnote number: edge-discounting rule averages -1.58 vs -0.68 per situation under M&Z's equal
  weighting on Dana's space (code/draft_numbers.py), log -inf.
- Provisional .bib: paper/bayes-at-the-edge.bib (31 entries; Crossref check pending -- API rate-limited 429 at 14:50).
- STEP 4: Q&A round 1 launched: qa/COMMON.md, qa/briefs.md, qa/paper.md (rendered draft). Opus x4 (01 accuracy-first
  defender, 02 mathematician, 03 Williamsonian, 07 higher-order evidence), Sonnet x3 (04 guess-model theorist, 05
  statistician, 08 close reader), Haiku x3 (06 rule consequentialist, 09 generalist editor, 10 psychophysicist).
- Crossref check 1 (research/crossref-report-1.txt): 26 VERIFIED; Das2022 DOI was wrong (fixed to 10.1111/phpr.12742 from the AAM's first line); Stalnaker2009 DOI was wrong (removed; re-verify); Nielsen2021 rate-limited; books/misc skipped.
- Q&A ROUND 1 (qa/suggestion-01..10.md) and TRIAGE (qa/TRIAGE-round1.md): outcome RESTRUCTURE + second round.
  Key: 02 Proposition overstated generality (each rule dominates only under its own score; neither under additive log) ->
  general Bregman-projection version via Predd et al. 2009 (checked numerically for additive log, spherical, Brier:
  code/bregman_general.py; Predd arXiv copy read, Prop 3 + eq. 5); 01 conservative mixtures are themselves dominated (concede;
  dominance endorses rim-zero rules; for exact-E knowers, meta-cond); 03 E=K instability of pure rules (safe true certainty
  in int E(s) would be knowledge -> not two-sided); 07 higher-order (Trust/effacing) -> footnote; 04 horn (iii) = horn (ii)
  in an enriched space; slack framing (W/W 2013 appearance-centred with half-width e+m; Salow m=0); 05/10 graded margins:
  pointwise dominance fails, expected suboptimality remains unless lambda_p flat; 08 GEC slogan across agents is the CAR
  assumption; two-handed Dana; 06 veil dilemma (persons vs situations); fn 37 is M&Z calling the objection analogous to
  RC collapse; 09 exposition (three steps, antecedents to footnote, table).
  NOTE: the one-sided-gauge CAR mixture (§4 table) was found by the blind pretest agent (process/pretest-report.md,
  counterexample (b)); it is presented in the paper without attribution, as an illustration; record here for honesty.
- STEP 6 (in progress): draft-v2 (paper/draft-v2.qmd; 5,227 body words). New §6 "What accuracy recommends"; conclusion is
  now a dilemma (knowledge-first conditionalization without accuracy vindication vs accuracy-first updating on tracked
  signals without slack). Verified: margin-2 effacing claims (by hand), Olivia exact-E only certainty undominated.
- Q&A ROUND 2 launched on v2 (qa2/; briefs in qa2/briefs.md): opus x4 (defender, mathematician, Williamsonian, signal
  theorist), sonnet x1 (close reader), haiku x1 (generalist referee).
- Q&A ROUND 2 (qa2/suggestion-01..06.md) -> TRIAGE qa2/TRIAGE-round2.md -> draft-v3 (paper/draft-v3.qmd; 5,159 words).
  Predd2009 added to bib (Crossref check pending); 'van der Laan' protected.
- Q&A ROUND 3 (targeted; qa3/briefs.md): defender (§5), mathematician (proof/converse/§6 numbers), Williamsonian (§6/§7),
  close reader (all M&Z quotes and pages).
- Crossref check 2: Predd2009 VERIFIED; Stalnaker2009 DOI = 10.1093/mind/fzp061 (VERIFIED: title/vol/issue/pages); Nielsen2021 DOI 10.1007/s11098-020-01598-6 (VERIFIED; note a Correction exists, 178(11): 3845).
- Q&A ROUND 3 (qa3/suggestion-01..04.md) -> TRIAGE qa3/TRIAGE-round3.md -> v4 = FINAL paper/bayes-at-the-edge.qmd
  (5,301 body words + 209-word abstract; 30 bib entries). Main changes: §5 concedes contrastiveness + idempotence violation
  (p. 321 order) and diagnoses it as diachronic certainty without knowledge; §6 knowledge norm = (a) credence 1 in exactly
  what is known + (b) no credence above a known upper bound on evidential probability (pins conditionalization on uniform
  clock, all h, and Dana; LP check); certainty-only norm -> chain lemma (accuracy recommends nothing); Remark 2 cut;
  converse proof completed; quotes/pages corrected per close reader; "strictly proper" in abstract/§7; Hi-TEA = bridge
  principle; Fact 12 + likelihood-weighting concession credited. References header added. Renders: HTML (self-contained)
  and Typst PDF (13 pp.), visually checked.
- STEP 7: screening/ prepared (CLAUDE.md copy, SCREENING-BRIEF.md with BW's reply modification, paper-v4-as-screened.qmd,
  bib). Two independent fresh Opus screenings launched (A, B) -> screening/_screening-report-A.md / -B.md. Screeners told
  not to read process files.
- SCREENINGS A and B (v4): BOTH NOT READY (screening/_screening-report-A.md, -B.md). Shared deal-breaker: Zendejas
  Medina 2023 ("Just as Planned", Phil Imprint 23(28); M&Z cite as "Medina 2024", n. 2) unengaged -- conditional expected
  accuracy + epistemic admissibility = the rival grading §5 dismissed in two sentences. MY ERROR: canon-check read Medina
  but classed it "not relevant" because it only asked about the CAR point. Also: little beyond M&Z concessions (Facts
  11-12, p. 337); n. 35 reply = redescription; §5 contrastivity position unclear; small slips (Briggs-Pettigrew 'mirror
  image' misstates pairs result; Dorst footnote only for odd h; 'radical response' page cite; 'bottom of chain'; bib
  header still said PROVISIONAL). B's claim that G&H 'only special cases' is in §3 not §4 is WRONG: arXiv §4.1 says "There
  are, but they are quite special." Told BW at once (SendUserMessage), plan: revise, targeted Q&A, rescreen.
- v5 (paper/bayes-at-the-edge.qmd; v4 kept as paper/draft-v4.qmd): §5 rewritten -- Proposition removes both of M&Z's
  versions; M&Z's p. 337 presented as standoff (NB "a fact that we have to live with" is voiced for the NON-Bayesian, not
  M&Z -- do not attribute); fine-grid two-handed Dana (A's suggestion): both hands two-sided, f_A on total evidence GEC,
  non-contrastive, idempotent (Fact 6); Medina engaged: his objection to a-e plans (§8.4) doesn't touch f_A (condition
  = p); his grading (sure-thing over unconditional plans, §7.2) credits plan at rim states where it is never used; §8.3
  'what is optimal reaction to E being true' / 'explicate ... what one's evidence supports' = support-function reading;
  impartiality-between-agents paragraph (margin principle => all inexact knowers two-sided at fine grain). Also: Das 2019
  & Das 2022 added to antecedents; Briggs-Pettigrew sentence fixed (Thm 1(II) checked via WebFetch of Bristol AAM: pairs);
  Dorst footnote 'with h odd' (checked numerically); chain 'bottom' sentence cut; graded margins: appearance-centred model
  is stochastic yet truth always >= m from edges -- gradedness that puts truth on rim needs learning that isn't knowledge;
  conclusion bridge paragraph includes Medina; abstract +1 sentence. Bib: + Das2019 (VERIFIED), ZendejasMedina2023
  (Crossref says issued 2024-02-12, issue 0; article metadata and PhilArchive say vol 23 no 28, 2023 -> kept 2023);
  header updated; full Crossref re-run research/crossref-report-final.txt: all DOI entries VERIFIED.
  Checks: code/v5_checks.py. Words: body 5,492 + abstract 231.
- Q&A ROUND 4 (qa4/briefs.md): 01 Medina defender (opus), 02 hostile referee (opus), 03 close reader (sonnet).
- Q&A ROUND 4 -> qa4/TRIAGE-round4.md -> v5.1 (paper/bayes-at-the-edge.qmd; v5 pre-round-4 not separately kept beyond
  scratch). Key: Scope principle for n. 35; neutrality + grain replies; m₀ in physical units (§2); Medina: named premise
  (§4.1.2 valuation via §7.2 lemma), concession that use-valuation = a-e valuation restricted to carry-out-able plans,
  'proves too much' answered via CAR, convergence (Medina §5 complaint applies to f_A in Olivia), §8.5 cited; Remark 1
  luminosity wording + conservativity; §6 conservativity, Fact 4 mixtures (p. 303) / contrastiveness (p. 313); Das 2019
  §8 cited in §6; high-level paragraph cut. Words 5,738 + 218 = 5,956.
