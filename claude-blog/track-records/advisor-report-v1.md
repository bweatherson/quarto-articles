# Advisor report v1 on idea memo v2 ("Socratic Track Records")

## Verdict: (A). Clearly flawed. Do not write this paper.

The memo fails in three ways, and any one of them would be enough.

1. **Every component already exists, including the person-level framing.**
   - Claim 1 is Ville/Wald/Robbins. Al-Najjar & Weinstein (AW) call it "a standard observation" in their proof of Thm 1. Kavaler–Smorodinsky make it an axiom of comparative tests.
   - Shafer states the person-level version in plain words: "Too many predictions contradicted by experience discredit the person making them. If you lose too much money betting on something, you are not much of an expert about it."
   - Claim 4, and the "same mathematics" remark, are Herrmann/Schurz/Olszewski–Pęski and Chernov–Vovk.
   - Blind tester B predicted the combination as the third most natural paper on the slate.
2. **The central asymmetry is produced by switching standards, the same fault that sank memo v1.**
   - Verification is judged against *strategic* forecasters; refutation is judged against *sincere* ones.
   - Against strategic forecasters, refutation fails by the very theorems the memo cites.
   - Against sincere forecasters, non-verifiability is the elementary fact that sharp hypotheses are refutable but not verifiable. It has nothing to do with the manipulability results.
3. **The claim that gets refuted ("I know the chances") is one no novice holds.**
   - Read in the first person, the test is informative only to an agent who thinks no rival knows more than she does.
   - Experts who know a lot but not everything are refuted cheaply, and sometimes by worse forecasters.
   - The useful version of the test (is G better than me?) already exists in statistics as prior-free, anytime-valid comparative e-tests.

The Charmides reading also inverts the text. Socrates' positive claim, that only the fellow craftsman can tell the doctor from the quack, is what the comparative results *vindicate*.

Details follow, then my answer on whether anything on this subject is worth writing.

---

## 1. Priority (question i)

| Memo claim | Closest antecedents (checked) | Status |
|---|---|---|
| **1.** A truthful forecaster is outscored by factor c with probability ≤ 1/c, by any rival, prior-free | Ville 1939; Wald's SPRT; Robbins 1970; Royall 2000's "universal bound". **AW 2008**: the proof of Thm 1 opens by calling the martingale property of L_t under the truthful expert's P "a standard observation" (Fudenberg–Levine 1992, Lemma 4.1). Thm 1 is the stronger version. **Kavaler–Smorodinsky 2019**: "error-free" (a truthful expert is never beaten) is an *axiom* of comparison tests. FS 2008 Prop 1; Stewart 2011 Prop 1(i). **Shafer 2021**, JRSS A 184(2), Protocol 4 "Testing a forecaster" (prior-free, prequential): "the forecaster is discredited if Sceptic manages to multiply the capital he risks by a large factor"; "multiplying the money you risk by a large factor discredits a probabilistic hypothesis or a probability forecaster no matter how you decide to bet and no matter how long you persist in betting." §2.2.1 uses a rival's Q/P as the bet. | **Textbook.** The abstract's "neglected dual" is false: it is the type-I premise of every theorem in the literature. |
| **Person-level** reading ("refutes a person's claim to know") | The econ tests are *already* tests of persons ("self-proclaimed experts" who "claim that they know the probabilities"). **Shafer 2023**, NEJSDS 2(2): 215–228, §2.2: "We are testing the forecaster qua forecaster … the question is only whether they are good forecasts, relative to the knowledge and skill of whoever is doing the testing"; "Too many predictions contradicted by experience discredit the person making them. If you lose too much money betting on something, you are not much of an expert about it." Shafer's 2021 reply to discussants discusses discrediting Nate Silver by betting. | **Stated.** It is stated with AW-style relativity built in. |
| **2.** Refute, never verify: "Popper moved from theories to people" | O&S 2011 ("refutation is a better maxim … than verification", for strategic experts); AW p. 555 ("we cannot say whether or not a theory is correct in any absolute sense, only that it is better than others"); Dawid 2004 (Bayes–de Finetti–Popper–Borel synthesis for forecasting systems). **Genin & Kelly 2017** (TARK/EPTCS 251): "the sharp hypothesis that the bias of the coin is exactly .5 … is almost surely refutable, but it is not almost surely verifiable." "F's forecasts are the chances" is a sharp hypothesis. | **Exists.** Tester A predicted it (slate N3); tester B too (#3, "Expertise Is Contrastive", which names "the Ville/Royall universal bound" as its engine). |
| **3.** Self-test: being outscored refutes *my* claim; Socratic | Box/Dawid prequential model criticism (rejecting one's own forecasting system). Tester B slate #2 and philosophy-report §2(b)4 already have the self/other asymmetry as a sincere/strategic asymmetry. memo1-check-B labelled the self-test **D** (derivable). | **Predicted.** The memo's "History" overstates: neither tester marked this N. |
| **4.** Defer to forecasts in proportion, never identify persons | Herrmann 2022 (*Synthese* 200(4); PWEA for novices); Schurz 2008–2019 (meta-induction; 2012 *Episteme*: informant reliability via meta-induction over records); **Olszewski–Pęski 2011** (first-best "without learning the expert's type"); Echenique–Shmaya; Gradwohl–Salant; Olszewski 2015 §9.2 ("the tester is indeed able to benefit almost fully … if the expert is informed, without losing much if the expert is ignorant"). Tester B's #8, "Identification Is Unnecessary". | **Exists**, in philosophy and in economics. |
| "Same minimax mathematics makes identification impossible and exploitation possible" | **Chernov, Kalnishkan, Zhdanov & Vovk** (ALT 2008), "Supermartingales in prediction with expert advice": the Aggregating Algorithm and defensive forecasting "lead to identical procedures". Vovk 2007 (arXiv 0708.1503); Foster–Vohra 1998 (calibration via regret). | **Known in game-theoretic probability (GTP)/CS.** The philosophy report's "not in the meta-induction literature" is true but irrelevant: it is in the literature the judges will check. |
| The *useful* self-test ("am I out of my depth against G?") | **Henzi & Ziegel 2022**, *Biometrika* 109(3): 647–663: e-values for the null that p_t is conditionally at least as good as q_t at all times. Valid in finite samples without assumptions on the data-generating process; the ideal forecast lies in the null. **Choe & Ramdas 2024**, *Operations Research* 72(4): 1368–87: game-theoretic, distribution-free anytime-valid comparison of sequential forecasters. Arnold, Henzi & Ziegel 2023, *AoAS*, give e-tests of calibration. | **Exists.** This is the right null for a novice, and statisticians already have it. |
| Charmides and the recognition of experts | Gentzler 1995, *HPQ* 12(3): 227–46 ("How to Discriminate between Experts and Frauds: Some Problems for Socratic Peirastic"; on the Charmides); LaBarge 1997, *Apeiron* 30(4): 51–62; Hardy 2010, *Episteme* 7(1). | **Standard hook.** It is fine as a hook, but not new. |

**Bottom line on priority.**
- The thesis sentence, "records teach that you do not know, never that someone else does", is AW's relativism plus the error-free axiom, put into Socratic language.
- Shafer has already said the person-level half in print, twice, in venues the formal judges read.

---

## 2. Truth of the claims (question ii)

### 2.1 Claim 1 is true, with two conditions the memo omits

- **Condition (a).** G's forecast and randomisation at t must be conditionally independent of x_t given F's information. This allows G to see F's past and current forecasts.
- **Condition (b).** Strictly, L is a nonnegative *super*martingale; it is a martingale only if g_t puts no mass where f_t is zero. Ville's inequality still applies.
- **"Whatever they know" is the catch.** If G has outcome-relevant information F lacks (radar against season), then F's forecasts are not "the chances" relative to G's filtration, and the bound fails.
  - So the antecedent must read: "F's forecasts are the chances given everything any rival knows."
  - "Knowing the chances" therefore means knowing everything relevant that anyone knows. This is AW's point that stochastic truth is relative to the most informed observer.
- **The first-person reading is not "the same computation".**
  - By F's own lights, L is a test martingale only if she regards g_t as uninformative about x_t given what she already knows: P_F(x_t | her info, g_t) = f_t. That is immodesty (Dawid/Seidenfeld).
  - A novice facing a putative expert does not satisfy it. By her own lights she *expects* to be outscored, so being outscored teaches her nothing.
  - The two readings coincide only for agents who believe no rival knows more than they do, and those are not novices.

### 2.2 The asymmetry is an artefact of switching standards

| | **Refute** a claim to know the chances | **Verify** it |
|---|---|---|
| **Strategic claimant** | **Impossible** (see below) | **Impossible** (Sandroni; O&S; Shmaya; MOR) |
| **Sincere claimant** (forecasts not chosen with the test in view) | **Possible**, for self *and others* alike | **Impossible** with finite data. This is the elementary fact that a sharp hypothesis is not verifiable (Genin–Kelly), not a manipulability result. |

Why refuting a strategic claimant is impossible:
- The memo's own test is "reject F if L_t(G : F) ≥ c by n", with G's rule fixed. It is a finite-horizon test that passes the truth with probability ≥ 1 − 1/c for every P. So Sandroni 2003 applies: an ignoramus who knows G's rule avoids refutation with probability ≥ 1 − 1/c − δ on every path.
- More strongly, Vovk & Shafer 2005 (abstract): "it is possible, using randomization, to make sequential probability forecasts that will pass any given battery of statistical tests". This includes "never outscored by rival i" for every computable rival at once, with suitable thresholds.
- If the charlatan can see the rivals' current forecasts, he does not even need to randomise. The Bayes mixture of the rivals is never outscored by rival i by more than 1/w_i, on every path.
- In my simulation (below), a w = ½ mixture of {truthful, base rate} was refuted at c = 20 in **0/500** runs.

Consequences for the memo:
- **"Charlatan-proof" means only type-I control.** Every test in the impossibility literature has that property by assumption. The calibration test has it too.
- **"Against anyone" is false.** Refutation reaches only sincere forecasters, as tester A's U2 already said.
- **The steelman fails as well.** The best defence is "I am sincere with myself, others may be strategic, so self/other = refute/verify". But that asymmetry is sincere/strategic, not self/other: a sincere pundit is as refutable as I am, and I can no more verify my own chance-knowledge than hers. It is also already in tester B's slate #2.

### 2.3 Refutation is too cheap to matter: some numbers

Setup:
- p_t ~ U(0.1, 0.9) independently each period; binary outcomes; c = 20; horizon 2,000 periods; 4,000 runs.
- Code: `code/advisor-v1-refutation-sim.py`.

| Forecaster F | Rival G | P(F refuted at c = 20 within 2,000) | Median time to refutation |
|---|---|---|---|
| truthful | base rate 0.5 | 0.038 (Ville bound 0.05) | n/a |
| coarse expert (knows p to the nearest of 4 bins) | truthful | **0.999** | 259 |
| near-expert (p ± U(−.05, .05)) | truthful | **0.82** | 862 |
| near-expert | coarse expert (**worse** than F) | **0.165** (3× the nominal 1/c) | 312 |
| base rate | coarse expert | 1.000 | 24 |

What the numbers show:
- Real experts are refuted reliably, and often by people who know less.
- The 1/c guarantee protects only the exactly truthful, and nobody is exactly truthful.
- What refutation actually tracks is "someone in the pool was KL-closer on this stretch". That is comparative content with an absolute-sounding label.
- Replace the null with the one novices care about ("I am at least as good as G") and you have Henzi–Ziegel and Choe–Ramdas.

### 2.4 Other claims

- **Claim 2: "comparative tests certify no winner" is overstated.**
  - AW Thms 2 and 5 show that with a diffuse μ the uninformed rival's value is below ε (in the infinite-horizon case, 0). FS Prop 2 is the same kind of result.
  - Comparative tests do certify relative superiority. What is untestable is "is anyone informed?" (AW Thm 7, finite horizon; O&S *PNAS* for independently randomising experts).
- **Claim 3 is false as stated in three places.**
  - "It can only expose a non-truthful one" should read "a *sincere* non-truthful one".
  - "'I do not know the chances' is certifiable" holds but is no news, and is subject to the immodesty condition in 2.1.
  - The contrast with calibration is wrong. The likelihood-ratio test is exactly as "internal" in Seidenfeld's sense: by her own lights she is ≥ 1 − 1/c sure to pass. Calibration also controls type I. The real difference is *power* against unrefined forecasts, which is Seidenfeld 1985 p. 287 ("For purposes of differentiating among rival coherent forecasters, proper scores such as L have an advantage over gambles") and Foster–Hart 2023 (Brier, "not … calibration alone").
- **Claim 4 is true, with conditions.**
  - It holds pathwise for log loss provided the candidates' forecasts at t are fixed before she mixes and do not depend on her current forecast. Continuous dependence is handled by Vovk 2007 and Chernov et al. 2008.
  - The regret is relative to the pool. For Brier the constant changes; for absolute loss the regret is O(√(T log N)).
  - The log-loss bound is a one-line telescoping identity; it needs no minimax argument.
  - **There is also a tension inside the memo.** Once she mixes, her likelihood ratio against any candidate is at most 1/w on every path. So the self-test can never again tell her she is out of her depth relative to the pool. The "Socratic cousin" (self-test plus proportional deference) collapses into Bayesian model averaging, in which the self-test is just her own posterior weight falling.
- **The upshots.**
  - The calibrationism upshot is wrong (see claim 3).
  - The asymmetry of reputation is wrong in both halves. Strategic pundits evade refutation (2.2). Tournament wins certify superiority over the field, which is all an honour claims.
  - The AI upshot is true but trivial.

---

## 3. The Charmides (question iii)

I checked the Lamb (Loeb) translation at Perseus. The passages:
- 170b: one with only knowledge of knowledge "will probably know that he has a certain piece of scientific knowledge about himself and about other people".
- 170c: "he who is ignorant of all this will not know what he knows, but only that he knows."
- 170d: temperance will be "merely knowing that one knows or does not know"; "such a person will also be unable to examine another man's claim to some knowledge, and make out whether he knows or does not know what he says he knows".
- 170e–171c: telling the true doctor from the false requires inquiring into health and disease, which "nobody at all … but a doctor" can do; "one will only distinguish one's fellow-artist, as craftsmen usually can."
- 172a: "nowhere can any such science be found."
- 172b: the residual benefit is that the person "will probe more surely the state of other men respecting the things which he has learnt himself."

**The question is faithfully reported, but the memo's moral misreads the text in three ways.**

1. **The dialogue's line is *that* versus *what*, not self versus other.**
   - It grants knowledge-*that* for self and others alike (170b, 170d).
   - It denies knowledge-*what* for self and others alike (170c–d).
   - The memo's "available half" (knowing *that* one does not know) is something Socrates already concedes, so it does not correct him.
   - The memo's "unavailable half" (that another knows) is *less* than Socrates concedes at 170b.
2. **Socrates' positive answer is the fellow craftsman (171c, 172b), and the formal results vindicate it.**
   - Comparison works when an informed rival is present (AW Thms 1–2; FS).
   - A field of non-craftsmen cannot tell whether anyone is a craftsman (AW Thm 7).
   - An informed evaluator can also certify an informed candidate by agreement (memo1-check-B (c)4).
   - So "never that someone else does" is false for evaluators who know, and on the memo's own mapping Socrates comes out *right*, not "half right".
3. **Self-knowledge of ignorance belongs to the Apology (21b–23b), not the Charmides.** There it is reached by refuting *others'* claims. That fits "records refute" but has no self/other asymmetry.

A small inaccuracy as well: the memo says Socrates concludes that sophrosune, "read as knowledge of what one knows and does not know, cannot do it". In the text, sophrosune *as knowledge of knowledge* turns out to yield only knowing-that. The knowledge of what one knows and does not know is what Socrates says cannot be found (172a).

The hook itself is standard in this literature (Gentzler 1995; LaBarge 1997; Hardy 2010).

---

## 4. Philosophical substance (question iv)

A specialist reading the slogan "records teach that you do not know, never that someone else does" will translate it as:
- AW p. 555: "the only coherent notion of 'true' probabilities is relative. That is, we cannot say whether or not a theory is correct in any absolute sense, only that it is better than others";
- plus the error-free axiom (equivalently, Ville).

Shafer 2023 has already said it in ordinary language. Nothing in the memo goes beyond that combination.

It would be surprising if any of the following were true. None is.

1. The refute/verify asymmetry survived when both halves are judged under one standard. It does not (2.2).
2. The first-person refutation told a *non-immodest* agent something she did not expect. It does not (2.1).
3. The self-test delivered something neither conditionalisation nor existing model criticism (Box, Dawid prequential, e-tests) delivers. It does not.
4. The formal picture overturned a philosophical datum. The one it bears on, Charmides 171c, it confirms.

---

## 5. Is any paper on this subject still worth writing?

**For this competition: no, on the evidence of three rounds.**

What the three rounds have shown:
- The slate (S2–S4), memo v1 (information versus judgment) and memo v2 (refutation of persons) were each predicted by blind testers, or false, or both.
- The economists drew the philosophical morals themselves: Popper and refutation (O&S 2011), relativity of truth (AW), "this literature is about the philosophy of science" (Olszewski 2015).
- The GTP authors drew the person-level testing morals themselves (Shafer 2021, 2023; Vovk–Shafer 2005 §5.3).
- Philosophy already has the deference side (Herrmann; Schurz).
- What is left is integration: bringing these results to Goldman, Levy and the calibrationists. A panel with Fitelson, Easwaran and Salow will rate that EXPECTED, which is exactly failure mode (b).

**The one sound paper on the subject** is tester A's N1 / tester B's #1 (S2): "the track-record source certifies only comparative and prior-relative claims, and only against a field that contains a knower". It is new *in philosophy* and correct if written with the testers' fixes. Its best frame is the Charmides read correctly:
- **170d** is the manipulability results: a generic "science of science" cannot examine another's claim.
- **171c** is the comparative escape: only the fellow craftsman can tell (AW/FS).
- **AW Thm 7** is the field version: a community of non-craftsmen cannot tell whether anyone among them is one.

That paper's ceiling for a formal panel is EXPECTED, and perhaps "interesting" for social epistemologists. It belongs at *Episteme*, *Synthese* or *Social Epistemology*, not in a competition weighted on originality. If it is written, claims 1, 3 and 4 of this memo go in as cited background (Ville/AW/Shafer; Herrmann/Olszewski–Pęski/Chernov–Vovk), not as contributions.

**I looked for a residual thesis and found none I would back.**
- One candidate was "records track deference-worthiness, which parasites share (mixtures, calibeaters, AW Thm 1 case (b)), not creditable first-hand expertise".
- Each version reduces to Olszewski–Pęski, or Foster–Hart, or AW, plus a conceptual gloss on Goldman 2018 or Croce 2019. Both of those need checking, and my expectation is EXPECTED.
- The "include cranks cheaply" corollary of the mixture bound (excluding the expert costs linearly, including a charlatan costs log 1/w) is Herrmann §8.1 territory. It also does not reach the non-repeatable disputes (climate, vaccines) where the inclusion debate actually lives.

My recommendation is to park the subject and choose the next one away from the testing-experts literature.

**Process lesson.** In both memo v1 and memo v2 the apparent novelty came from judging the two sides of an asymmetry under different standards:
- memo v1: "by her lights" versus "under the truth";
- memo v2: "sincere" versus "strategic".

Before the next memo goes to testers, state every claim under one fixed standard (who is strategic; whose probability) and check that the asymmetry survives. If it does not, there is no thesis.

---

### Sources used (beyond the project's research folder)
- [Shafer 2021, "Testing by betting", JRSS A, with discussion and reply](https://glennshafer.com/assets/downloads/articles/article104_jrss_shafer-testingbybetting-with-discussion-response.pdf)
- [Shafer 2023, "Two ways game-theoretic probability can improve data analysis" (arXiv; NEJSDS 2(2): 215–228)](https://arxiv.org/pdf/2308.14959) · [NEJSDS version](https://nejsds.nestat.org/journal/NEJSDS/article/62/text)
- [Henzi & Ziegel 2022, Biometrika (arXiv 2103.08402)](https://arxiv.org/pdf/2103.08402) · [BORIS record](https://boris.unibe.ch/166789)
- [Choe & Ramdas, "Comparing sequential forecasters" (arXiv 2110.00115)](https://arxiv.org/abs/2110.00115v6) · [Operations Research 72(4)](https://ideas.repec.org/a/inm/oropre/v72y2024i4p1368-1387.html)
- [Arnold, Henzi & Ziegel 2023, "Sequentially valid tests for forecast calibration"](https://arxiv.org/pdf/2109.11761)
- [Genin & Kelly 2017, "The Topology of Statistical Verifiability"](https://arxiv.org/pdf/1707.09378)
- [Vovk 2007, "Defensive forecasting for optimal prediction with expert advice"](https://arxiv.org/abs/0708.1503)
- [Chernov, Kalnishkan, Zhdanov & Vovk, "Supermartingales in Prediction with Expert Advice" (ALT 2008)](https://mlanthology.org/alt/2008/chernov2008alt-supermartingales)
- [Herrmann 2022, Synthese 200(4)](https://par.nsf.gov/biblio/10372342)
- [Plato, Charmides, Lamb translation (Perseus), 170d](http://www.perseus.tufts.edu/hopper/text?doc=Perseus:text:1999.01.0176:text=Charm.:section=170d)
- [Gentzler 1995 (PhilArchive listing)](https://philarchive.org/s/peirastic) · [LaBarge 1997](https://dc2.philarchive.org/rec/LABSAT) · [Hardy 2010, Episteme](https://www.cambridge.org/core/journals/episteme/article/abs/seeking-the-truth-and-taking-care-for-common-goodsplato-on-expertise-and-recognizing-experts/49929368E44046EE0CD8CB16772CA6DC)
