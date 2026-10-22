# Idea memo v2: "Socratic Track Records" (working title; alt. "Records Refute Persons")

Subject (BW's choice): what a forecaster's track record can show about expertise.
History: slate v1 (S2 "trust extended, not grounded"; S3 Blockhead; S4 orgulity) and memo v1 (Hall's
database/analyst line) were pre-screened by two predictability testers and rejected by me before reaching an
advisor (slate-prediction-A/B.md; memo1-check-A/B.md; _NOTES.md). S2 is the obvious paper; S3/S4 and memo v1 failed
on substance (memo v1's asymmetry came from switching between "by the evaluator's lights" and "under the truth").
This memo builds on the one element both testers flagged as new-ish and that survives a single standard.

## The problem
Plato's Charmides (170d-171c): can someone who lacks medical knowledge tell a doctor from a quack? Socrates
concludes that sophrosune, read as knowledge of what one knows and does not know, cannot do it. The modern form is
the novice/expert problem (Goldman 2001: track records are perhaps the novice's best evidence; Levy 2025: the
criteria only extend trust). For probabilistic forecasting the economics of "testing experts" gives a precise
negative answer: no test of one forecaster's record that is guaranteed to pass someone who knows the chances --
whatever they are -- can screen out a strategic forecaster who knows nothing (Sandroni 2003; Olszewski & Sandroni
2008; Shmaya 2008; with bounded data, any test: O&S 2009 MOR Prop 1); "is at least one of these forecasters
informed?" cannot be tested either (Al-Najjar & Weinstein 2008 Thm 7, finite horizon). Economists conclude that
truth is "relative" (AW) and that refutation is a better maxim than verification (O&S 2011, for theories and
contracts).

## Thesis
**Track records can refute a person's claim to know the chances but can never verify one, and the refutation is
available to anyone, against anyone, including oneself. If a forecaster's probabilities are the chances, then no
one -- however strategic, whatever they know, even if they see her forecasts as they are made -- can outscore her
by a factor c with probability more than 1/c, whatever the world is like. So being decisively outscored refutes
her, prior-free and charlatan-proof; scoring well verifies nothing. What a record teaches is therefore Socratic:
it can show you that you do not know, never that someone else does. The novice's problem as standardly posed --
identify the expert -- is insoluble; its Socratic cousin -- find out whether you are out of your depth, and defer
in proportion to how badly -- is soluble, and solving it captures most of what identifying experts was for.**

## Claims and backing
1. **Unrefutability of the truthful (prior-free).** If F's forecasts f_t are the true conditional chances, then
   for any rival G whose forecast g_t is fixed before outcome t (any strategy, randomised, possibly using F's
   past and current forecasts), the likelihood ratio L_t = prod g_s(x_s)/f_s(x_s) is a nonnegative martingale
   with mean 1 under the truth, so P(sup_t L_t >= c) <= 1/c (Ville 1939). Holds for every data-generating process;
   no prior. (AW 2008 Thm 1 is a stronger finite-horizon version: either F wins the comparison or the forecasts
   are close in all but K periods.) Same computation from F's own standpoint (if F's credences are her forecasts,
   L_t is a test martingale by her lights), so first-person and third-person readings coincide.
2. **Asymmetry with verification.** No test passes the truthful and reliably fails ignoramuses (the impossibility
   results above), and comparative tests certify no winner (AW Thm 7; the winner of a comparison may be a lucky
   or parasitic forecaster: Foster & Hart's calibeating beats a miscalibrated forecaster by her calibration error
   without domain knowledge). So records refute persons and verify none: Popper's asymmetry, moved from theories
   to people. Credit O&S 2011 and AW for the theory-level and relative versions; the person-level, prior-free,
   any-rival form via Ville is (as far as the research found) not stated as such in either literature.
3. **Socratic self-knowledge.** The test in (1) can be run by anyone on herself against any rival, including a
   charlatan. It cannot be gamed against a truthful forecaster; it can only expose a non-truthful one. So "I do not
   know the chances" is certifiable from records; "she knows the chances" is not. Contrast calibration of one's
   own record, which is "internal" (Seidenfeld 1985) and can be had without knowledge (Foster & Vohra 1998).
4. **What follows for deference.** Performance-weighted deference -- a Bayesian mixture over one's own forecasts
   and candidates' forecasts -- is never worse than any component by more than log(1/w) in cumulative log score,
   on every sequence, against any (even adaptive, strategic) forecasters (standard mixture/aggregating bound; cf.
   Herrmann 2022 on prediction with expert advice for novices; Schurz's meta-induction). The same minimax
   mathematics that makes identification impossible makes this exploitation possible. So the novice can secure
   (nearly) the forecasting benefit of the best available forecaster without ever knowing who, if anyone, is an
   expert; she defers to forecasts, not to persons.
5. **Limits.** Repeated, verifiable forecasting only (not climate-style disputes: Levy's cases). The refuter need
   not be an expert (so refutation licenses deference to forecasts, not credit to persons). "Is anyone informed?"
   is untestable, so a whole field can be refuted member by member but never certified. With finite records the
   1/c bound is the whole story: refutation is graded, not conclusive.

## Upshots
- Charmides: Socrates was half right. Knowledge of one's own ignorance (in this precise form) is available and
  useful; knowledge of another's knowledge is not.
- Goldman/Levy: the track-record criterion cannot ground trust in a person, as Levy says, but -- against Levy's
  pessimism about regulative advice -- it grounds a policy (self-testing plus proportional deference) that needs no
  expertise to apply and cannot be gamed.
- Calibrationism (White 2009; Sliwa & Horowitz 2015): evidence of one's own unreliability is best taken not from
  one's own calibration (fakeable, internal) but from being outscored by others (charlatan-proof).
- Credit and blame: public honours for forecasters (tournament winners) certify nothing; public refutations of
  pundits can be decisive. The asymmetry of reputation.
- AI: an AI forecaster that outscores you refutes your claim to know; it does not thereby earn credit as an expert,
  but deferring to its forecasts in proportion is rational.

## Risks
- EXPECTED: "Ville + AW Thm 1 + O&S's refutation maxim + PWEA (Herrmann)". The person-level framing may be judged
  a relabelling.
- The Socratic framing must be faithful to the Charmides (check the text: 167a ff., 170d-171c).
- Claim 4 is Herrmann's/Schurz's; the paper must present it as consequence, not contribution.
- "Knowing the chances" is an idealisation (Olszewski: "what does it mean to know the probabilities?"); a
  forecaster who knows a lot but not everything is refutable by a better one -- the refutation is of a claim to
  know the chances, not of being knowledgeable. Is that the claim novices care about?
- Bootstrapping worry (Elga 2007): not relevant here because the score is computed from outcomes, not from one's own
  verdicts; say so.

## 150-word abstract
Can a forecaster's track record show that she is an expert? Results in economics show that no test of one
forecaster's record that someone who knows the chances is sure to pass can screen out a strategic forecaster who
knows nothing, and that no comparison can show that any forecaster is informed. I argue that the theorems have a
neglected dual. If a forecaster's probabilities are the chances, no one -- however strategic, whatever they know --
can outscore her by a factor c with probability above 1/c, whatever the world is like. So records can refute a
person's claim to know the chances, prior-free and charlatan-proof, though they can verify no one's. What a record
teaches is Socratic: that you do not know, never that someone else does. The novice cannot identify experts, but
she can find out when she is out of her depth and defer to forecasts in proportion, which secures most of what
identifying experts was for.
