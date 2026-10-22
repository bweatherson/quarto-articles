# What a track record can show about expertise: the philosophy literature

Research report for the track-record paper. Companion to `econ-report.md`, which covers the economics, CS and statistics results in technical detail. This report covers philosophy only. Compiled 2026-10-20.

**Verification tags used below.**
- **[READ]**: I have the full text and read the relevant sections, though not always every line. Quotes are checked against it. Saved texts are in `research/texts/`.
- **[READ in full]**: I read every line (Levy 2025).
- **[PART]**: I read part of the text, or a tool summary of the full text. Quotes under this tag are short excerpts the tool returned verbatim, or come from a secondary source that quotes the original.
- **[ABS]**: abstract or metadata only.
- **[MEM]**: from my background knowledge, not checked in this session. Verify before citing.

---

## 0. Method and access log

**What worked**
- **OpenAlex citation search (main priority-check tool).** I pulled every work OpenAlex lists as citing each of these, then screened the citing works for philosophy venues and philosopher authors:
  - Sandroni 2003; Foster & Vohra 1998; Lehrer 2001; Dekel & Feinberg 2006; Olszewski & Sandroni 2008, 2009 (Annals of Statistics, Mathematics of Operations Research, PNAS) and 2011 (AER, "Falsifiability"); Al-Najjar & Weinstein 2008; Feinberg & Stewart 2008; Stewart 2011; Fortnow & Vohra 2009; Shmaya 2008; Vovk & Shafer 2005; Kalai, Lehrer & Smorodinsky 1999; Al-Najjar, Sandroni, Smorodinsky & Weinstein 2010; Foster & Hart 2021; Olszewski 2015; Dawid 1982; Shafer & Vovk 2001 and 2019; Dawid 1984 (prequential).
  - I also ran OpenAlex keyword searches restricted to the philosophy subfield.
  - Raw lists are saved in `research/priority-check-data/`.
- **Crossref.** Used for bibliographic verification and for the reference lists of several papers. That is how I found that Grodniewicz 2022 cites Olszewski & Sandroni 2011.
- **Open-access full texts.** Downloaded from arXiv, PMC, Cambridge OA, Seidenfeld's CMU page, the Caltech preprint server and the SEP.

**What did not work**
- **PhilPapers and PhilArchive search pages.** Both are behind a Cloudflare challenge, which refused curl and WebFetch. Individual PhilArchive record and citation pages sometimes loaded through WebFetch, but only when a search result had already surfaced the URL. **I could not run PhilPapers searches directly.** §1.6 lists the searches the author should run by hand.
- **PhilSci-Archive.** Refused by a TLS/firewall error.
- **Springer, Wiley and OUP HTML.** Bot challenges blocked direct download. WebFetch sometimes returned summaries of open-access pages.
- **Semantic Scholar API.** Rate-limited (429) throughout.
- **Google Scholar.** Not attempted, since it blocks automated access.
- **Paywalled texts.** I did not use mirrors. Shieber 2015 (book), Goldman 2001, White 2009, Sliwa & Horowitz 2015, Schoenfield 2015, Isaacs 2021 and Williams & Pettigrew 2026 were not read in full.
  - Williams & Pettigrew's White Rose copy is embargoed until about April 2027.
  - Goldman 2001 quotes below come from secondary sources that quote it with page numbers.

**Texts saved in `research/texts/` (philosophy side)**
- levy-2025-no-trespassing-novice-expert.txt (full)
- seidenfeld-1985-calibration-coherence-scoring-rules.txt (full)
- belot-2013-failure-of-calibration-is-typical.txt (full)
- belot-2020-absolutely-no-free-lunches.txt (full)
- pomatto-sandroni-2018-axiomatic-inductive-inference.txt (full preprint)
- zaffora-blando-2024-pride-and-probability.txt (full)
- hu-2025-does-calibration-mean-reference-class.txt (full preprint)
- roth-tolbert-weinstein-2023-reconciling-individual-forecasts.txt (full)
- roth-tolbert-2025-reference-class-problem-at-scale.txt (full)
- sep-roush-epistemic-self-doubt.txt (SEP)
- sep-pettigrew-epistemic-utility-arguments.txt (SEP)
- philosophy-webfetch-notes.txt (tool summaries and excerpts: Fan 2026, Herrmann 2022, Grodniewicz fn. 21, Nguyen 2020, Masterton 2014, Isaacs, and the Goldman quotes via secondary sources)

The economics assistant saved Olszewski & Sandroni 2011 "Falsifiability", which I also used for its Popper framing.

---

## 1. Priority check

### 1.1 Bottom line

I found **no philosophy paper that presents the manipulability theorems as an argument about what a forecaster's track record can show about expertise**. That covers Sandroni, Foster–Vohra, Olszewski–Sandroni, Shmaya, Lehrer, Fortnow–Vohra, the comparative escape of Al-Najjar–Weinstein and Feinberg–Stewart, and the Bayesian escape of Stewart.

Philosophy's engagement with this body of results is thin and indirect. It falls into five groups:

1. **One textbook use and one footnote reply (testimony).** Shieber 2015, as reported by Grodniewicz, uses Olszewski & Sandroni 2011 against reputation-based reliability mechanisms. Grodniewicz 2022 replies in a footnote.
2. **One CS-venue paper with two philosopher co-authors.** Roth, Tolbert & Weinstein 2023 summarise Sandroni 2003 and the comparative escape correctly, in the context of individual probabilities and the reference class problem.
3. **Economists publishing in philosophy venues.**
   - Pomatto & Sandroni 2018 (*Phil Sci*) is on induction and orgulity, not testing. It links to testing only through Al-Najjar, Pomatto & Sandroni 2014.
   - Gradwohl & Shmaya 2015 (*Economics and Philosophy*) add computational tractability to falsifiability.
4. **Philosophers on calibration who touch the edge of the results.**
   - Seidenfeld 1985 (*Phil Sci*) is the important precursor. He asks whether calibration can "demarcate the expert from the duffer" and shows that short-run calibration is gameable.
   - Belot 2013 cites Foster–Vohra in a footnote on randomization.
   - Belot 2020 cites Dekel–Feinberg for a measure-theoretic lemma.
5. **Recent philosophy on track records that does not know the theorems.**
   - Fan 2026 (*Synthese*): strategic track-record building, modelled with Bayesian persuasion.
   - Huang 2023 (*BJPS*): track records can fail even with a God's-eye view.
   - Herrmann 2022 (*Synthese*): prediction with expert advice applied to the novice/2-expert problem.
   - Douven & Kriegeskorte 2025 (*Phil Sci*): reinforcement-learning deference.
   - Schurz on meta-induction.

The closest live competitor is **Fan 2026**. It differs on every structural point (§1.4), and none of these papers cites Sandroni and colleagues.

**My assessment.** A philosophy paper built on the theorems would be new in philosophy. It would not be new as mathematics. Referees from formal epistemology will know Seidenfeld 1985 and perhaps Dawid, so the "calibration is weak and gameable" point is not news to them. The news is the extension from calibration to every test, the comparative and prior-based escapes, and what these mean for the novice/expert and calibrationism debates.

### 1.2 Direct engagements with the testing-experts results

1. **Shieber, Joseph (2015), *Testimony: A Philosophical Introduction* (Routledge), pp. 82–84.** **[Not accessed. Known only through Grodniewicz's report.]**
   - According to Grodniewicz, Shieber offers empirical evidence that "undermines the relationship between the risk of reputation loss and truthfulness" (Grodniewicz's paraphrase of a referee).
   - That evidence includes Olszewski & Sandroni 2011's result that Popperian falsification cannot screen informed from uninformed experts. It also includes Tetlock 2005 on unchecked political pundits and the replication crisis.
   - Shieber appears to be the **only philosopher I found who used the testing-experts literature as evidence in an epistemology argument**. He used it against reductionist and reputation-based accounts of testimonial reliability, not about track records as such.
   - **Action: read pp. 82–84 in the library before submission.**

2. **Grodniewicz, J. P. (2022/2024), "Effective Filtering: Language Comprehension and Testimonial Entitlement," *Philosophical Quarterly* 74(1): 291–311, footnote 21.** **[PART. Open-access version read through WebFetch.]**
   - Crossref confirms that the reference list contains Olszewski & Sandroni 2011.
   - In footnote 21 Grodniewicz replies that Olszewski & Sandroni's game-theoretic work shows "falsification (as construed by Popper) is not an effective strategy" for separating reliable from unreliable experts. The same paper shows that "a different strategy, i.e., refutation," is "effective in the same context." So it does not show that experts cannot be told apart.
   - He reads Tetlock as himself favouring "tracking the quality of claims and counterclaims."
   - This is accurate as far as it goes. O&S 2011 do construct a screening *refutation contract* (econ-report §4.3).
   - The exchange shows that the testimony literature has met the result in a footnote and set it aside. That is a hook for the paper.

3. **Roth, Aaron, Alexander Williams Tolbert & Scott Weinstein (2023), "Reconciling Individual Probability Forecasts," *FAccT '23*, pp. 1124–1138; arXiv 2209.01687.** **[READ: §§1–1.3]**
   - Tolbert and Weinstein were in Penn Philosophy at the time.
   - Section 1.3 states (arXiv v2, p. 7): "Sandroni [2003] showed that any empirical test (not just calibration tests) that is guaranteed to pass an expert who is forecasting true individual probabilities can be passed by a prediction algorithm on any sequence of outcomes. This is closely related to the fact that individual probabilities are not uniquely specified by data — and so we cannot attempt to test an expert by computing unique individual probabilities ourselves."
   - They add that Al-Najjar–Weinstein and Feinberg–Stewart "showed that there are comparative tests that can distinguish between two forecasters, one of whom is forecasting true individual probabilities and one of whom is not."
   - Their own result: two models that disagree substantially can be used together to falsify and improve one of them, so the parties "cannot agree to disagree". This is a comparative, reconciliation-based answer to model multiplicity and the reference class problem (Hájek 2007).
   - Relevance: this is the clearest philosopher-co-authored statement of the impossibility-plus-comparative-escape picture. It is framed as a point about individual probabilities, not about expertise or epistemic dependence.
   - **Sequel: Roth & Tolbert (2025), "Resolving the Reference Class Problem at Scale," *Phil Sci* 92(4): 868–882.** **[PART: abstract read, text searched]** It is about multicalibration and the reference class problem at scale. It does not cite the testing literature.

4. **Pomatto, Luciano & Alvaro Sandroni (2018), "An Axiomatic Theory of Inductive Inference," *Phil Sci* 85(2): 293–315.** **[READ: intro and the testing-related passages of the April 2017 preprint]**
   - This is about Belot's "Bayesian orgulity", not expert testing. It axiomatizes Humean and Goodmanian skepticism for finitely additive priors and proves a structure theorem: a coherent view is inductive in both senses iff it is σ-additive.
   - It cites **Weatherson 2015 (*Ergo*)**: "Weatherson (2015) revisited Belot's argument from the perspective of Bayesian imprecise probability."
   - Its only link to testing is a pointer to "Al-Najjar, Pomatto and Sandroni (2014), who study how different dispositions towards induction can affect incentive problems."
   - **The linked paper matters for this project.** Al-Najjar, Pomatto & Sandroni (2014), "Claim Validation," *AER* 104(11): 3725–36 **[ABS]**: "If experts can be skeptical about the validity of claims then they can evade rejection strategically. In contrast, if experts are required to conclude that claims backed by sufficient evidence are likely to be true, then they can be tested and rejected."
   - The companion paper is Pomatto, Al-Najjar & Sandroni (2014), *Annals of Statistics* 42(3): 1003–28 **[ABS]**: "in the presence of incentive problems, opinions can only be tested and rejected when data produces consensus among Bayesian agents".
   - Together these give a **direct bridge from the orgulity/humility debate to testability**: Belot 2013; Elga 2016; Huttegger 2015; Weatherson 2015; Nielsen & Stewart 2019; Zaffora Blando 2024. Roughly, orgulous (merging) opinions are testable and modest ones can evade tests. No philosopher has picked this up.

5. **Gradwohl, Ronen & Eran Shmaya (2015), "Tractable Falsifiability," *Economics and Philosophy* 31(2): 259–274.** **[ABS]**
   - Economists writing in a philosophy-and-economics journal: "We propose to strengthen Popper's notion of falsifiability by adding the requirement that when an observation is inconsistent with a theory, there must be a 'short proof' of this inconsistency."
   - It is in the Fortnow–Vohra and Hu–Shmaya computational line.
   - Per `_NOTES.md`, avoid duplicating "Findable, Not Simple".

6. **Al-Najjar & Weinstein (2009), "The Ambiguity Aversion Literature: A Critical Assessment," *Economics and Philosophy* 25(3).** It cites Sandroni 2003 but is about ambiguity aversion. Not relevant except as a venue precedent.

7. **Belot, Gordon (2013), "Failure of Calibration is Typical," *Statistics & Probability Letters* 83(10): 2316–2318.** **[READ]**
   - Belot is a philosopher, publishing in a statistics journal.
   - It extends Schervish 1985: for any (deterministic) forecasting system, failure of high–low calibration is topologically typical. The proof uses a Banach–Mazur game.
   - It then asks Dawid's question (1982 §6): "Is it really rational for Bayesian forecasters to be certain that they are calibrated?"
   - Key lines:
     - "Agents obeying the dictates of Bayesianism tend to be supremely self-confident."
     - "we again find that Bayesian agents are subjectively certain of success (i.e., of calibration)—but now we find that each and every one of them is typically unsuccessful."
   - **Footnote 1 is the only point where Belot touches Foster–Vohra.** Randomizing over deterministic schemes "will make no difference—all that Nature cares about is the forecast probability output each day (Foster and Vohra, 1998, §3). But there are some interesting variants of our game that forecasters playing mixed strategies can win: see, e.g., Foster and Vohra (1998), Vovk et al. (2005), and V'yugin (2009)."
   - So Belot knows the randomization result and sets it aside. He does not use it about testing experts.

8. **Belot, Gordon (2020), "Absolutely No Free Lunches!," *Theoretical Computer Science* 845: 159–180.** **[PART: text searched for testing content]** It cites Dekel & Feinberg 2006 only for a measure-and-category lemma. It does not discuss testing experts.

9. **Zaffora Blando, Francesca (2024), "Pride and Probability," *Phil Sci* 91(3): 634–660.** **[PART: intro read, text searched]** It cites Pomatto & Sandroni 2018 in the orgulity literature list ("Huttegger 2015; Weatherson 2015; Elga 2016; Belot 2017; Cisewski et al. 2018; Pomatto and Sandroni 2018; Nielsen and Stewart 2019; Gong et al. 2021"). No testing content.

### 1.3 Precursors and near-precursors on calibration as a test of forecasters

These are the papers a referee will say "already showed this".

1. **Seidenfeld, Teddy (1985), "Calibration, Coherence, and Scoring Rules," *Phil Sci* 52(2): 274–294.** **[READ, from Seidenfeld's own CMU page]**
   - **The main precursor.** Abstract (p. 274): "(ii) Subject to feedback, calibration in the long run is otiose. It gives no ground for validating one coherent opinion over another as each coherent forecaster is (almost) sure of his own long-run calibration. (iii) Calibration in the short run is an inducement to hedge forecasts. A calibration score, in the short run, is improper. It gives the forecaster reason to feign violation of total evidence by enticing him to use the more predictable frequencies in a larger finite reference class than that directly relevant."
   - p. 278: "In an extreme case, a weatherman is calibrated if he announces the same 'chance' of precipitation day after day, where that is the correct overall percentage of 'rainy' days, e.g., 20 percent for the Chicago area." This is the "one-note weatherman".
   - p. 279: "Long-range calibration is, at best, otiose. Short-range calibration is a norm that promotes lies and deceit!"
   - p. 284: "Is there some useful criterion of short-range calibration that demarcates the expert from the duffer?"
   - p. 289: a calibration-scored weatherman does well to "announce a '20 percent chance of precipitation'" whatever he thinks. Near year's end, he should announce 50% on a day he is sure it will rain, to repair his calibration curve.
   - **Relation to the theorems.**
     - Seidenfeld's charlatans need the base rate (the one-note forecaster) or must exploit end-of-period incentives.
     - Foster–Vohra's charlatan needs neither. It is calibrated on every sequence.
     - Sandroni and Olszewski–Sandroni extend this from calibration to every test the true expert passes.
     - So the theorems move from "calibration is a weak, gameable test" (Seidenfeld) to "no test of a lone track record is a good test" (Sandroni).
   - The paper should present itself as finishing Seidenfeld's question in the negative and then saying what survives.

2. **Lad, Frank (1984), "The Calibration Question," *BJPS* 35(3): 213–221.** **[ABS]** Early philosophy-venue discussion of whether calibration is a criterion of good subjective probability.

3. **Dawid, A. P.** He is the statistician who carried calibration into philosophy venues.
   - (1985), "Probability, Symmetry and Frequency," *BJPS* 36(2): 107–128 **[ABS]**.
   - (2004), "Probability, Causality and the Empirical World: A Bayes–de Finetti–Popper–Borel Synthesis," *Statistical Science* 19(1): 44–57 **[ABS]**: "a synthesis of the personalist Bayesian views of de Finetti and Popper's falsificationist programme. A falsification method for probabilistic or causal theories, based on 'Borel criteria,' is described."
   - (2017), "On Individual Risk," *Synthese* 194(9): 3445–3474 **[ABS]**.
   - Dawid's "calibration as Popperian falsification of probability forecasts" is the programme that Olszewski & Sandroni 2011 and Shmaya 2008 show to be manipulable when the forecaster is strategic. I found no philosophy paper that puts the two together.

4. **Masterton, George (2014), "What to Do with a Forecast?," *Synthese* 191(8): 1881–1907.** **[ABS, via the Lund repository]** Both deferring to a forecast and updating on it are, under conditions, "fully determined by one's beliefs about the forecaster's calibration." This presupposes that calibration beliefs can be grounded, which is exactly what the theorems undercut against strategic forecasters.

5. **Dorst, Kevin (2023), "Being Rational and Being Wrong," *Philosophers' Imprint* 23(1).** **[ABS]**
   - "rational people can often be expected to be miscalibrated. Thus we can't test whether people are overconfident by simply testing whether they are over-calibrated."
   - This is the mirror image of Foster–Vohra: calibration is not necessary for rationality (Dorst), and it is not evidence of expertise (FV). The two halves have not been put together.

6. **Belot 2013.** Above.

### 1.4 Recent philosophy on track records: what each paper models, and how it differs from a theorem-based paper

| Paper | What it shows | Strategic? | Probabilistic forecasts? | Cites testing literature? |
|---|---|---|---|---|
| **Fan, Yao (2026), "Regulating Strategic Track-Record Building: Institutional Remedies for Individual Expert Identification," *Synthese* 208(1), art. 11** [PART: WebFetch of abstract, footnotes and appendix; body paywalled] | Three models. (1) Kamenica–Gentzkow persuasion: the Expert picks a "cognitive challenge" (ε₁ = P(success \| incompetent), ε₂ = P(failure \| competent)); full information still lets her raise her trust probability from 0.3 to 0.45. (2) The Expert picks a difficulty level x; her optimal x† (≈0.258) differs from the novice-optimal x* (=0.5). (3) A DeMarzo–Kremer–Skrzypacz-style disclosure model. Remedy: an institutional minimum difficulty standard. Thesis: expert identification is "system-oriented social epistemology" even with one expert and one novice, against Goldman 2012. | Yes: the expert chooses the test's difficulty and disclosure | No. Binary competence type, binary outcomes; no calibration, no randomizing charlatans | No (per summary and Crossref refs). Cites Goldman 2001/2021, Nguyen, Huang 2023 "Landscapes and Bandits" (not "Track Records", per OpenAlex), Schurz 2012, Grundmann 2025, Croce & Baghramian 2024, Bayesian persuasion, DeMarzo et al. 2019 |
| **Huang, Alice C. W. (2023), "Track Records: A Cautionary Tale," *BJPS* (online 6 Nov 2023; issue details not yet in Crossref)** [ABS] | "it is often assumed that track records are the gold standard for evaluating expertise ... I show, using a computational model, that even in an idealized environment where agents have a God's eye view on track records, they may fail to identify experts. Under plausible conditions, selecting testimony based on track records ends up reducing overall accuracy, and preventing the community from identifying the real experts." | No (as far as the abstract shows) | Uses Brier scores | No. Refs include Goldman 2001, Nguyen 2020, Schurz 2012, Herrmann 2022, Zollman 2007, Brier 1950 |
| **Herrmann, Daniel A. (2022), "Prediction with expert advice applied to the problem of prediction with expert advice," *Synthese* 200(4)** [PART: WebFetch of OA text] | Uses Cesa-Bianchi–Lugosi regret bounds for the novice/2-expert problem and policymaking. Conditions: outcomes must be verifiable ("it only works in cases where the policy maker needs to predict events that she will be able to verify"), events must be sequential, and approximate act–state independence must hold. §8.1, "Prediction with malicious experts": a manipulative expert must already have high weight, so manipulation is "quite costly". | Partly: malicious experts, aggregator manipulation | Yes (regret on losses) | No Sandroni or FV. Cites Schurz, Cesa-Bianchi & Lugosi, Tetlock, Goldman ("may provide the novice's best source of evidence for making credibility choices") |
| **Douven, Igor & Nikolaus Kriegeskorte (2025), "The Emergent Basis of Expert Trust," *Phil Sci* (online)** [ABS] | Reinforcement-learning model after Barrett, Skyrms & Mohseni 2019: "Agents incrementally weight peers who outperform them". Run on human probability-judgment data, communities learn whom to defer to. | No | Yes | No (abstract) |
| **Schurz, Gerhard: meta-induction** (2008 *Phil Sci* 75(3): 278–305; 2009 *Episteme* 6(2): 200–220; 2012 *Episteme* 9(2): 151–170; 2019 *Hume's Problem Solved*, MIT) [ABS; MEM for the deceiver material] | Success-weighted meta-induction is approximately optimal among *accessible* methods in every world. 2012: "Indicators of the reliability of informants ... should be based on meta-induction over records of truth-success." Schurz discusses "deceivers", methods that predict badly whenever the meta-inductivist follows them, and shows attractivity weighting survives them [MEM: check Schurz 2008 §§ on deceivers, and the 2019 book]. | Yes (deceivers) | Yes (continuous-score variant) | Not the testing literature [MEM] |

Critics of meta-induction:
- Arnold (2010), *Phil Sci* 77(4): 584–593. Optimality fails with infinitely many predictors.
- Sterkenburg (2019/20), *Episteme* 17(4): 519–541, and (2019) *Phil Sci* 86(5): 981–992 on the pool of strategies.
- Bakshi (2025), *Phil Sci* 92(5): 1427–1437, with Schurz's 2026 reply.
- Pitts (2023), *JGPS*.

**How a theorem-based paper differs**
- **From Fan.** Fan's expert controls the test's difficulty. In the Sandroni setting the tester controls the test completely, and the result is that no tester-chosen test works. Fan's institutional fix is a better-designed absolute test, which is exactly what the theorems say cannot work for probabilistic forecasting when the type-I clause is prior-free. Fan's remedy works because his expert's type space is binary and her success probabilities are exogenous. Neither holds for a randomizing charlatan.
- **From Huang.** Huang's failure is statistical and social: finite samples, correlated deference. The theorems' failure is game-theoretic and holds with infinite data and a God's-eye view.
- **From Herrmann and Schurz.** Regret bounds and meta-inductive optimality are *comparative* guarantees: do as well as the best in the pool. They rest on the **same minimax mathematics that makes absolute tests manipulable** (Foster–Vohra's and Vovk–Shafer's proofs are minimax and approachability arguments). One theorem-family underwrites both "you can't certify an expert" and "you can do as well as whoever turns out best." That observation does not appear in the meta-induction literature [MEM-level confidence that it doesn't].

### 1.5 What I did not find

I found no philosophy discussion of any of the following:
- Sandroni 2003 or Olszewski–Sandroni 2008 as such: the general manipulability of all future-independent tests.
- Fortnow–Vohra's computationally bounded charlatans, apart from Gradwohl & Shmaya in *E&P*.
- Stewart 2011's Bayesian non-manipulable test.
- Al-Najjar–Weinstein's or Feinberg–Stewart's comparative tests. RTW 2023 is the only mention.
- Vovk–Shafer defensive forecasting in philosophy venues. Only Belot's footnote, plus Sterkenburg, Herrmann and Kinney citing Shafer–Vovk or PWEA background (OpenAlex humanities filter).
- Any link between the manipulability theorems and van Fraassen 1983 or Shimony 1988 on calibration.
- Any link to Goldman's track-record source, Nguyen's cognitive islands, or Levy's pessimism.
- Philosophy papers on Fortnow & Vohra or "charlatans" in the CS sense.

### 1.6 Searches the author should run by hand on PhilPapers

PhilPapers is behind Cloudflare, so I could not run these. Suggested queries, with the date filter off:
- `Sandroni`
- `Foster Vohra calibration`
- `manipulable test`
- `"testing experts"`
- `"strategic expert"`
- `"uninformed expert"`
- `charlatan forecast`
- `"track record" expert`
- `"defensive forecasting"`
- `"comparative testing"`
- `prequential`
- `"well-calibrated Bayesian"`

Also open the PhilPapers "citations of" pages for:
- Olszewski & Sandroni "Falsifiability", if indexed.
- Pomatto & Sandroni 2018.
- Seidenfeld 1985.
- Lad 1984.
- Dawid 2004 and Dawid 2017.
- Schurz 2008.

Check Google Scholar's "cited by" for Sandroni 2003 and Olszewski & Sandroni 2011, filtered by journal, for:
- *Synthese*, *Erkenntnis*, *Episteme*, *Social Epistemology*, *Phil Sci*, *BJPS*, *PPR*, *Phil Studies*, *Ergo*.

---

## 2. The debates

### (a) The novice/expert problem and identifying experts

**Key texts and claims**

1. **Goldman, Alvin I. (2001), "Experts: Which Ones Should You Trust?," *PPR* 63(1): 85–110.** [PART: quotes come from secondary sources that give page numbers]
   - **Aim.** To avoid Hardwig's "testimonial scepticism" (p. 86, as quoted by Levy). The "hearer's evidence about a source's reliability or unreliability can often bolster or defeat the hearer's justifiedness in accepting testimony from that source" (p. 88, quoted by Trubody 2015).
   - **Five sources (p. 93).**
     - Levy's paraphrase: "(1) evidence of dialectical superiority; (2) agreement from additional putative experts; (3) appraisal of the person's expertise by 'meta-experts'; (4) evidence of the experts' interests and biases; and (5) evidence of the experts' track records."
     - [MEM] Goldman's (E) reads roughly "Evidence of the experts' past 'track-records'". Check the exact wording.
   - **Track records (§7, pp. 106–108).** Esoteric statements can become exoteric over time: "For example, consider the statement, 'There will be an eclipse of the sun on April 22, 2130, in Santa Fe, New Mexico.' Relative to the present epistemic standpoint, i.e., the standpoint of people living in the year 2000, this is an esoteric statement. Ordinary people in the year 2000 will not be able to answer this question correctly, except by guessing. On the other hand, on the very day in question, April 22, 2130, ordinary people on the street in Santa Fe, New Mexico will easily be able to answer the question correctly" (p. 106, quoted in Derschan 2024, an MA thesis at Vienna).
   - **Weight.** Goldman treats track records as potentially "the novice's best source of evidence for making credibility choices" (quoted by Herrmann 2022; page probably 106–107, [MEM] verify).
   - **Role of track records:** central. The worry Goldman addresses is *access*, not identification.
   - **Notice.** Every example is a near-deterministic prediction or a palpable repair: eclipses, rockets, mended cars. This matters for what the theorems add (below).

2. **Goldman (2018), "Expertise," *Topoi* 37(1): 3–10** [ABS; MEM]. A veritistic definition: an expert has a substantially larger fund of true beliefs in a domain, or the capacity to help others answer questions in it.
   - **Goldman (2021), "How Can You Spot the Experts? An Essay in Social Epistemology," *Royal Institute of Philosophy Supplement* 89: 85–98** [ABS; one quote via Derschan]. "To take simpler examples, laypersons can sometimes successfully identify cases in which their doctor, their mechanic, their investment adviser, etc. gives them just the sort of treatment, advice, etc. that palpably succeeds in generating sought-after results" (p. 90). The track-record source survives, framed again around palpable success.

3. **Levy, Neil (2025), "No Trespassing! Abandoning the Novice/Expert Problem," *Erkenntnis* 90(5): 2077–2094** (online 2024, open access). **[READ in full]** The PMC text has no page numbers, so section names are given.
   - **Thesis (abstract).** The Goldman-style criteria "can't do the work that Goldman and his successors want from them: avoid a kind of testimonial scepticism. We can't deploy them in the way needed to avoid such scepticism, because it would take genuine expertise to do so."
   - **On track records ("Criteria for Expert Choice").** Accepts the heuristic for mechanics but says "the markers of success themselves are disputed". Dissenters "obfuscate evidence of track record". Mortality effects of recessions remain unresolved: "If experts can't settle disputes like this one, even about the accuracy of past predictions, what hope do we have?" Then: "In a slogan, were the criterion useful, we'd already have used it by now – we usually already have."
   - **Central positive claim ("Trusting the Expert").** "We actually deploy the criteria to extend our trust, rather than in a way that could ground it." Also: "our assessments of track record are based on trust: we trust the testimony of other experts that the research reported is reliable." And: "If we don't already trust well, the criteria won't help us trust better."
   - **Novice trespassing.** Applying the criteria in contested cases is "epistemic trespassing_n", "at least as unreliable as the expert version".
   - **Conclusion.** Re-engineer the epistemic environment so that "signals for trustworthiness better align with reliability". Makes the analogy with trade associations and stock exchanges.
   - **Role of track records.** Levy's objection is again about access and disputed markers, not identification in principle.
   - **Reply.** Doan Vu Duc, Quentin Hiernaux & Olivier Sartenaer (2026), "On Meta-Expertise, Dissent and Epistemic Trespassing: A Reply to Neil Levy," *Erkenntnis* (online) [metadata only].
   - **Related.** Levy & Varley (2024), "Mind the Guardrails: Epistemic Trespassing and Apt Deference," *Social Epistemology* 40(2): 153–169.

4. **Anderson, Elizabeth (2011), "Democracy, Public Policy, and Lay Assessments of Scientific Testimony," *Episteme* 8(2): 144–164.** [ABS; quotes via Levy]
   - Legitimacy is secured "provided citizens can make reliable second-order assessments of the consensus of trustworthy scientific experts."
   - Uses a "hierarchy of expertise" (146), credentials checkable by "a simple Google search" (150), honesty and epistemic responsibility, and consensus.
   - **Track records:** minor. Her criteria are credentials, integrity and consensus, which is an implicitly comparative and institutional route.

5. **Nguyen, C. Thi (2020; online 2018), "Cognitive Islands and Runaway Echo Chambers: Problems for Epistemic Dependence on Experts," *Synthese* 197(7): 2803–2821.** [PART: abstract and notes through WebFetch]
   - "Cognitive islands are those domains for knowledge in which expertise is required to evaluate other experts. They exist under two conditions: first, that there is no test for expertise available to the inexpert; and second, that the domain is not linked to another domain with such a test." Candidates are the moral and aesthetic domains.
   - In the notes: "Goldman's solution to the track record problem is to focus on statements that begin as esoteric". Nguyen adds that "many useful tests involve no propositions, just successful practical demonstrations of skill."
   - **Track records:** central by negation. Outside cognitive islands, track records or demonstrations supply "a test for expertise available to the inexpert."

6. **Coady, David (2012), *What to Believe Now: Applying Epistemology to Contemporary Issues* (Wiley-Blackwell), ch. on experts** [MEM, not accessed]. A sympathetic critique of Goldman's criteria. Check how it treats track records.

7. **Croce, Michel**
   - (2019; online 2018), "On What It Takes to Be an Expert," *PQ* 69(274): 1–21 [ABS/MEM]. Separates research-oriented ("expert-oriented") abilities from novice-oriented abilities (see also Croce, "Expert-oriented abilities vs. novice-oriented abilities," *Episteme*, online 2017). Track records are not central.
   - Croce & Baghramian (2024), "Experts – Part I: What They Are and How to Identify Them," *Phil Compass* 19(9–10): e13009.
   - Croce & Baghramian (2024), "Experts—Part II: The Sources of Epistemic Authority," e70005. Both are surveys and the best current map [ABS; the Wiley pages were blocked].
   - Croce & Marsili (2025), "Misplaced Trust in Expertise: Pseudo-Experts and Unreliable Experts," *Soc Epist* 39(6): 667–682 [metadata].

8. **Grundmann, Thomas (2025), "Experts," in Lackey & McGlynn (eds.), *Oxford Handbook of Social Epistemology*: 85–104.** [ABS] Evidence-linked accounts of expertise. On identification, "only reliance on the institution of science enables laypeople to identify experts." Like Levy and Fan, this is an *institutional* turn.

9. **Martini, Carlo (2019), "The Epistemology of Expertise," in *Routledge Handbook of Social Epistemology*: 115–122** [metadata]. Also Martini (2014), "Experts in science: a view from the trenches," *Synthese* [MEM].

10. **Guerrero, Alexander (2017), "Living with Ignorance in a World of Experts," in Peels (ed.), *Perspectives on Ignorance from Moral and Social Philosophy* (Routledge): 168–197** [MEM; cited by Levy].
    - Introduces contexts of *strategic expertise*, where experts have incentives to mislead.
    - Argues that dialectical superiority and similar markers fail there.
    - **This is the closest informal anticipation of the "strategic forecaster" framing.** Check his exact terms.

11. **Matheson, Jonathan, Scott McElreath & Nathan Nobis (2018), "Moral Experts, Deference & Disagreement," in Watson & Guidry-Grimes (eds.), *Moral Expertise* (Springer): 87–105** [metadata]. On deference to moral experts, a likely cognitive island.

12. **Quast, Christian (2018), "Expertise: A Practical Explication," *Topoi* 37(1): 11–27** [metadata]. A functional account.
    - Stichter, Matt (2015), "Philosophical and psychological accounts of expertise and experts," *Humana.Mente* 28 [MEM].
    - Watson, Jamie Carlin (2021), *Expertise: A Philosophical Introduction* (Bloomsbury). It has chapters on truth-based and social-role accounts [metadata].
    - Collins, Harry & Robert Evans (2007), *Rethinking Expertise* (Chicago) [MEM]. Their meta-expertises include "local discrimination", judging experts by their local track record of behaviour, as in Wynne's Cumbrian sheep farmers. This is a sociological version of the track-record source.

13. **Newer work on what laypeople can assess**
    - **Mirkin & Sojka (2026), "From Expertise to Trustworthiness: What Laypeople Can Really Assess about Experts," *Episteme*** [ABS]. "metacriteria are not indicators of expertise"; they indicate "experience and lack of epistemic integrity."
    - Keren (2025), "Expert Authority and Its Assessment," *Soc Epist* 39(6): 612–625 [metadata].
    - Harris (2024), "Intellectual Virtue Signaling and (Non)Expert Credibility," *JAPA* 11(1): 118–134 [ABS]. "non-experts often display apparent intellectual virtues while legitimate experts often display apparent intellectual vices". This is a signalling and mimicry argument, informally analogous to manipulability.
    - Brennan (2020), "Can Novices Trust Themselves to Choose Trustworthy Experts?," *Soc Epist* 34(3): 227–240.
    - De Cruz (2020), *Soc Epist* 34(5): 440–452.
    - Dellsén (2026), "Collectivizing Public Scientific Testimony," *Episteme* [ABS]. Experts should report opinion distributions, which is a comparative and aggregative fix.

14. **Formal models of learning whom to trust from track records**
    - Barrett, Skyrms & Mohseni (2019), "Self-Assembling Networks," *BJPS* 70(1): 301–325.
    - Douven & Kriegeskorte 2025.
    - Romeijn & Atkinson (2011), "Learning juror competence: a generalized Condorcet Jury Theorem," *PPE* 10(3): 237–262.
    - Merdes, von Sydow & Hahn (2021), "Formal models of source reliability," *Synthese* 198: 5773–5801.
    - Olsson's Laputa model [MEM].
    - Huang 2023; Herrmann 2022; Schurz 2012.
    - **All of these assume non-strategic sources.** Fan 2026 is the exception.

**What a theorem-based argument adds**
1. **It moves the problem from access to identification.**
   - Every author above, from Goldman and Nguyen to Levy and Huang, locates the difficulty in getting or assessing outcome data, or in finite-sample and social effects.
   - The theorems grant a God's-eye view of outcomes and unbounded data. They show that for probabilistic forecasts, any single-forecaster test of the record that a genuine expert passes with high probability, whatever the truth, can be passed by an uninformed randomizer.
   - For future-independent tests this holds on every path, at level about 1 − ε − δ (O&S 2008).
   - With bounded data, even future-dependent tests can have rejection delayed past the data horizon (O&S 2009 MOR). See econ-report §11.1.
   - Huang's "even with a God's eye view" is therefore true for a much stronger reason than her simulations show.
2. **It explains why Goldman's examples work.**
   - Eclipse prediction and palpable repairs are near-deterministic. Restricting the class of admissible processes (to deterministic, or "learnable and predictive", or non-convex classes) is one of the routes to non-manipulability (econ-report §11.2).
   - So Goldman's paradigm is the special case in which the track-record source is safe. Medicine, macroeconomics, elections and climate are domains where experts' outputs are probabilities, and there the track-record source fails in principle unless something is added.
3. **It turns Nguyen's taxonomy around.**
   - Nguyen's condition (1), "no test for expertise available to the inexpert", is met by probabilistic forecasting *even though outcomes are fully observable*.
   - Probabilistic domains are cognitive islands of a new kind: islands whose shores the novice can walk along.
4. **It gives Levy's pessimism a theorem.**
   - Levy: criteria "extend" trust rather than "ground" it.
   - Stewart's (2011) escape works only relative to the tester's prior. It is a likelihood-ratio test of the expert against the tester's own Bayesian forecasts, and it rejects true experts whenever the tester would have learned the truth herself (econ-report §5.1, §11.2).
   - Al-Najjar–Weinstein and Feinberg–Stewart work only with a second, informed forecaster.
   - So the only ways a track record can certify expertise are through prior trust or through a trusted rival. That is a precise version of "if we don't already trust well, the criteria won't help us trust better."
   - **This convergence is, I think, the most publishable point.** A formal result vindicates a recent, much-discussed informal pessimism, and it also says exactly what the "extension" consists in.
5. **It supports the institutional turn on principled grounds.**
   - Grundmann 2025, Fan 2026, Levy's environment engineering and Anderson's consensus all point to institutions.
   - The theorems say which institutions work: comparative tournaments, where forecasters are scored against each other on the same events, and structures that make experts commit to full theories in advance (future-dependent tests).
   - Absolute certification schemes do not work. Neither does Fan's minimum-difficulty standard, if it is read as an absolute test.

**Expected vs surprising (to a social-epistemology referee)**
- **Expected:** that strategic agents can game track records (Fan; Guerrero; Harris on virtue signalling; Goodhart); that calibration is weak (Seidenfeld); that access is hard (Goldman, Nguyen, Levy).
- **Surprising:**
  - (i) the charlatan needs *no* domain knowledge and *no* base rates;
  - (ii) the result covers *every* test, not just calibration;
  - (iii) it holds with perfect access and unbounded data;
  - (iv) adding a second, possibly informed forecaster rescues identification;
  - (v) "is *anyone* here informed?" is untestable even comparatively (Al-Najjar–Weinstein Thm 7; O&S 2009 PNAS). This is a formal analogue of Levy's "the whole field may be corrupt" worry.

### (b) Calibration and calibrationism

**Key texts and claims**
1. **van Fraassen, Bas C. (1983), "Calibration: A Frequency Justification for Personal Probability," in Cohen & Laudan (eds.), *Physics, Philosophy and Psychoanalysis* (Reidel): 295–319** [MEM; citation confirmed via the SEP bibliography].
   - Calibration (the match of credences to relative frequencies) is proposed as the success criterion for personal probability.
   - Roughly, only coherent forecasters can be perfectly calibrated in some possible world, so calibration vindicates the probability axioms.
   - Relatives: van Fraassen (1984), "Belief and the Will," *J Phil* 81: 235–256 (Reflection); Shimony (1988), "An Adamite derivation of the calculus of probability," in Fetzer (ed.), *Probability and Causality* [MEM]; Lange (1999), "Calibration and the Epistemological Role of Bayesian Conditionalization," *J Phil* 96(6): 294–324 [metadata].
   - **Track records are central**: calibration *is* a track-record property.
2. **Seidenfeld 1985 (§1.3).** Long-run calibration is otiose and short-run calibration is improper and gameable.
3. **Dawid (1982), "The Well-Calibrated Bayesian," *JASA* 77: 605–610** [MEM]. A coherent forecaster is subjectively certain of her own calibration.
   - Oakes (1985) and Schervish (1985): no forecaster is calibrated on every sequence.
   - Belot (2013): failure is topologically typical.
   - Foster–Vohra (1998): *randomized* forecasters can be calibrated on every sequence. This dissolves Oakes for anyone willing to randomize.
4. **Accuracy-first and calibration**
   - Joyce (1998), *Phil Sci* 65(4): 575–603. Rejects calibration as the measure of accuracy [MEM on the specific argument; check §3].
   - Pettigrew (2016), *Accuracy and the Laws of Credence* (OUP). Proposes a "Decomposition" axiom: inaccuracy partly reflects calibration [MEM]. The SEP describes this as "an argument for additive and continuous strictly proper epistemic utility functions, based on a suggestion by Frank P. Ramsey (1926 [1931]) that connects accuracy and calibration, and Williams and Pettigrew (2023) improve on that characterization" (SEP "Epistemic Utility Arguments for Probabilism", rev. 2023) [READ].
   - Levinstein (2017), "Accuracy Uncomposed: Against Calibrationism," *Episteme* 14(1): 59–69 [ABS]. If calibration is valuable it should be explained, not explanatory: "calibration is a globally defined property" and Decomposition "introduces a value that is separate from accuracy proper".
5. **Williams, J. Robert G. & Richard Pettigrew (2026; accepted 2023), "Consequences of Calibration," *BJPS* 77(2): 399–411.** [ABS, from the White Rose metadata; full text paywalled and embargoed]
   - "Drawing on a passage from Ramsey's 'Truth and Probability', we formulate a simple, plausible constraint on evaluating the accuracy of credences: the calibration test. We show that any additive, continuous accuracy measure that passes the calibration test will be strictly proper. Strictly proper accuracy measures are known to support the touchstone results of accuracy-first epistemology, for example, vindications of probabilism and conditionalization."
   - Their "calibration test" is a test *of accuracy measures*, not of forecasters. That is a **terminological collision to flag in the paper.**
   - Crossref lists two citing works: Ayaita 2026 (*J Phil Logic*) and Williams 2023 (*Synthese*).
   - I could not check whether the paper mentions forecaster testing. Probably not.
6. **Calibrationism (higher-order evidence)**
   - **White (2009)**, "On Treating Oneself and Others as Thermometers," *Episteme* 6(3): 233–250 [MEM/SEP].
   - **Roush (2009)**, "Second Guessing: A Self-Help Manual," *Episteme* 6(3): 251–268.
   - **Sliwa & Horowitz (2015)**, "Respecting All the Evidence," *Phil Studies* 172(11): 2835–2858.
   - The SEP (Roush, "Epistemic Self-Doubt", 2017) [READ] states the principles:
     - **Guess Calibration (GC):** "If I draw the conclusion that q on the basis of evidence e, my credence in q should equal my prior expected reliability with respect to q." (White 2009; Sliwa & Horowitz 2015)
     - **Evidential Calibration (EC):** "When one's evidence favors q over not-q, one's credence in q should equal the [prior] expected reliability of one's educated guess that q." (Sliwa & Horowitz 2015)
     - The thermometer image: "We take the reading of a thermometer no more seriously than we regard the instrument as reliable. Our beliefs can be viewed as readings of the world and treated the same way."
   - Critics and developments:
     - **Schoenfield (2015)**, "A Dilemma for Calibrationism," *PPR* 91(2): 425–455.
     - **Schoenfield (2018)**, "An Accuracy Based Approach to Higher Order Evidence," *PPR* 96(3): 690–715.
     - **Isaacs, Yoaav (2021; online 2019)**, "The Fallacy of Calibrationism," *PPR* 102(2): 247–260. Talk abstract: "Calibrationism relies on the base-rate fallacy, a classic mistake in probabilistic epistemology."
     - **Topey (2022)**, *Erkenntnis* 89(4): 1407–1433. An accuracy-based argument *for* calibrationism.
     - **Ye, Ru (2023)**, *Higher-Order Evidence and Calibrationism* (Cambridge Elements). Proposes "Evidence-Discounting Calibrationism".
     - **Schoenfield (2026)**, "Instrumentalism and higher-order defeat," *PQ*. Treats reasoning capacities "as we'd treat any other instrument".
   - **Track records:** expected reliability is typically estimated from frequency of past success. Track records are the evidential base for calibrationism, especially when the "thermometer" is another person (White).
7. **Dorst 2023** (§1.3): rational agents can be expected to be miscalibrated. See also Dorst, Levinstein, Salow, Husic & Fitelson (2021), "Deference Done Better," *Phil Perspectives* 35: 99–150. That paper gives the formal notion of an "expert" one should defer to. The question of how one *learns* that something is such an expert from its record is open in that literature.
8. **Calibration in algorithmic fairness (philosophy)**
   - Hedden (2021), *Phil & Public Affairs* 49(2): 209–231. Calibration within groups is the defensible criterion [MEM].
   - Hu, Lily (2025, forthcoming *Phil Studies*), "Does calibration mean what they say it means; or, the reference class problem rises again" [PART: abstract and intro]. "calibration guarantees no such thing", because people belong to many groups.
   - Stewart & Nielsen (2020), "On the Possibility of Testimonial Justice," *AJP* 98(4): 732–746 [ABS]. The impossibility theorems for fair risk assessment carry over to "just credibility assessment". This is calibration of hearers' trust in speakers.
   - Roth & Tolbert 2025.
9. **Terminological collisions to avoid**
   - Williamson's "Calibration" norm of objective Bayesianism (e.g., *Erkenntnis* 2019).
   - Irikefe (2025, *Synthese* 205: 94), calibration of philosophical intuitions.
   - Williams & Pettigrew's "calibration test" of accuracy measures.

**What a theorem-based argument adds**
1. **The thermometer analogy breaks for agents.**
   - Thermometers do not choose their readings in light of how they will be checked. People and trained models can.
   - Foster–Vohra: a forecaster with no information can guarantee calibration on every outcome sequence by randomizing.
   - So a good calibration record of *another* agent is evidence of reliability only under a non-strategic assumption, or relative to a rival or a prior.
   - White's "treating others as thermometers" therefore needs a non-manipulability premise that the calibrationism literature never states.
2. **Neither necessary nor sufficient.**
   - Dorst: rational agents may fail calibration.
   - Foster–Vohra and Sandroni: charlatans can pass.
   - Seidenfeld: calibration rewards hedging.
   - Together: calibration is neither necessary for rational credence nor sufficient for expertise. That leaves the van Fraassen/Shimony/Pettigrew line, that calibration is part of what makes credences *good*, needing a non-evidential reading: calibration as a component of value, not a criterion one can check.
3. **Proper scoring rules don't escape on their own.**
   - Philosophers often think strict propriety fixes calibration's gameability, and Seidenfeld already contrasts calibration with Brier.
   - The theorems cover *any* absolute pass/fail test, including Brier-threshold tests. A fixed threshold either fails true experts in high-entropy worlds or can be met by the charlatan.
   - Proper scores certify expertise only *comparatively*. Accuracy-first epistemology uses them comparatively anyway (dominance, expected accuracy), so the fit is natural.
   - The truthful-calibration-measures work in the econ report (Haghtalab et al. 2024; Hartline et al. 2025) is relevant here.
4. **Self-calibration vs other-calibration.**
   - Calibrationism concerns one's own reliability. The manipulability theorems concern another's.
   - A paper could argue that the asymmetry is exactly strategic: I cannot strategically game my own calibration against myself, but others can game theirs against me.
   - This explains why calibrationism is more plausible for self-doubt than for deference.

**Expected vs surprising**
- **Expected (to formal epistemologists):** calibration is weak (Seidenfeld, DeGroot–Fienberg on refinement); Dawid's self-certainty result.
- **Surprising:** that randomization gives *pathwise* calibration against every sequence; that the impossibility extends to all tests; and that the escape is comparative, which fits accuracy-first epistemology's comparative use of scores. Calibrationists have not considered strategic thermometers at all.

### (c) Likelihoodism and contrastive confirmation

**Key texts and claims**
1. **Hacking (1965)**, *Logic of Statistical Inference* (CUP). The law of likelihood [MEM].
   - **Royall (1997)**, *Statistical Evidence: A Likelihood Paradigm* (Chapman & Hall). [MEM, verify wording and page: p. 3] Royall's Law of Likelihood: "If hypothesis A implies that the probability that a random variable X takes the value x is p_A(x), while hypothesis B implies that the probability is p_B(x), then the observation X = x is evidence supporting A over B if and only if p_A(x) > p_B(x), and the likelihood ratio, p_A(x)/p_B(x), measures the strength of that evidence."
   - **Royall (2000)**, "On the Probability of Observing Misleading Statistical Evidence," *JASA* 95(451): 760–768. The universal bound: if A is true, the probability of ever getting a likelihood ratio ≥ k in favour of B is ≤ 1/k. This is a Ville/martingale inequality [MEM on formulation].
2. **Sober (2008)**, *Evidence and Evolution* (CUP), ch. 1 [MEM]. Likelihoodism is contrastive. It says when evidence favours H1 over H2, and is silent on the absolute support of a hypothesis.
   - Sober (1990/1994), "Contrastive Empiricism".
3. **Fitelson (2007)**, "Likelihoodism, Bayesianism, and Relational Confirmation," *Synthese* 156(3): 473–489 [metadata; MEM on content]. Compares likelihoodist "favoring" with Bayesian relational confirmation.
   - Fitelson (2011), "Favoring, Likelihoodism, and Bayesianism," *PPR* 83(3): 666–672.
4. **Chandler (2013; online 2010)**, "Contrastive Confirmation: Some Competing Accounts," *Synthese* 190(1): 129–138.
   - **Forber (2011)**, "Reconceiving Eliminative Inference," *Phil Sci* 78(2): 185–208. "Eliminative inferences help frame testing problems."
5. **Track records** have not been discussed in this literature as such. Royall's misleading-evidence bound has been discussed by philosophers of statistics (Sober; Mayo critically) [MEM].

**What a theorem-based argument adds**
1. **The comparative escape is likelihoodism at work.**
   - Al-Najjar–Weinstein's test is a likelihood-ratio test. Feinberg–Stewart's is cross-calibration. Stewart's Bayesian test is a likelihood ratio against the tester's own predictive.
   - The reason the true expert cannot be framed is that her likelihood ratio against any rival is a non-negative martingale under the truth: Royall's universal bound.
   - So the econ results give a sharp statement of what likelihoodists have long said informally. Evidence from a track record supports *contrastive* claims ("A forecasts better than B"), never the absolute claim "A is an expert".
   - Absolute support for expertise is what the impossibility theorems rule out.
2. **Where the bound runs out.**
   - Royall's bound needs one of the compared hypotheses to be true, i.e., one forecaster to be the informed expert.
   - When *neither* is informed, comparative tests are jointly manipulable (O&S 2009 PNAS; econ-report §11.4).
   - This parallels a known worry about likelihoodism under misspecification, but with strategic misspecification. It is a new wrinkle for the likelihoodism debate.
3. **"Expertise" is not a likelihood hypothesis.**
   - "F is an expert" is a hypothesis about F's relation to the data-generating process. It is not itself a probability model, so likelihoodism has nothing to say about it except through rivals.
   - That is a clean philosophical diagnosis of why the single-expert test fails: there is no likelihood function for "knows the truth" against the composite "doesn't know it", because the alternative includes every randomization.

**Expected vs surprising**
- **Expected (to philosophers of statistics):** contrastive claims are the natural output of likelihood-based evidence.
- **Surprising:**
  - that a *strategic* setting forces contrastivism on independent grounds, so even a Bayesian with a prior only gets "better than my prior predictive";
  - that the universal bound is exactly what makes comparative tests non-manipulable;
  - that the comparative escape fails when nobody is informed.
- This section is less likely to look new to a philosophy-of-statistics referee. It is most useful as the conceptual spine of a positive proposal.

### (d) Falsifiability, testability, prophecy; prediction markets; AI forecasters

**Popper and falsifiability**
1. **Popper, *The Logic of Scientific Discovery* (1959/1968).** As quoted by Olszewski & Sandroni (2011, intro; [READ]): "For although probability statements play such a vitally important rôle in empirical science, they turn out to be in principle impervious to strict falsification. Yet this very stumbling block will become a touchstone upon which to test my theory, in order to find out what it is worth" (Popper 1968, p. 133).
2. **Popper, *Conjectures and Refutations* (1963), ch. 1** [MEM for page, probably p. 37]. On astrologers: "It is a typical soothsayer's trick to predict things so vaguely that the predictions can hardly fail." The sentence is confirmed via a quotation database; check the edition and page.
3. **Popper, "Prediction and Prophecy in the Social Sciences" (C&R ch. 16)** [MEM, verify]. Scientific predictions are *conditional*; historicist prophecies are *unconditional*.
   - This maps strikingly onto the econ results.
   - Future-dependent tests are possible when the expert commits to a full theory: conditional forecasts at all histories, including counterfactual ones. Dekel–Feinberg and O&S 2009 AoS give such tests (econ-report §11.3).
   - Prequential tests of unconditional, on-path forecasts are manipulable.
   - O&S 2008 make the commitment part of the expert's *claim*: "If Bob claims that he has a complete understanding of the stochastic process ... then future-dependent tests can be used" (quoted in econ-report §11.3).
   - **I found no one who has made this Popper connection.**
4. **Gillies (1971)**, "A Falsifying Rule for Probability Statements," *BJPS* 22(3): 231–261. A methodological rule for rejecting probabilistic hypotheses, the philosophical counterpart of Cournot's principle.
5. **Olszewski & Sandroni (2011)**, "Falsifiability," *AER* 101(2): 788–818. [READ, Dec 2009 version] It is framed explicitly against Popper and Kuhn and cites Lakatos & Musgrave. "if experts are strategic, falsifiability has no power to distinguish scientific theories from worthless theories"; verification contracts also fail; "some refutation contracts are capable of screening experts."
   - Philosophy's only uptake is Shieber 2015 and Grodniewicz 2022 (§1.2).
6. **Dawid (2004)**, the Bayes–de Finetti–Popper–Borel synthesis (§1.3).
   - Kelly & Schulte (1995), "The Computable Testability of Theories Making Uncomputable Predictions," *Erkenntnis* 43(1): 29–66.
   - Genin & Kelly (2017), "The Topology of Statistical Verifiability," *EPTCS* 251: 236–250. Formal learning-theoretic notions of testability and statistical falsifiability.
   - These are the philosophical counterparts of the topological "Popperian" tests in O&S 2009 AoS (econ-report §11.1(b)). **No one has connected the two.**
7. **Mayo (2018)**, *Statistical Inference as Severe Testing* (CUP). Severity: H passes a severe test if, were H false, the test would very probably have detected it [MEM paraphrase].
   - Corollary of the theorems: the claim "F is an expert forecaster" cannot be severely tested from F's realized record alone, against the alternative "F is a strategic randomizer".

**Prediction markets**
- Sunstein (2006), "Deliberating Groups versus Prediction Markets (or Hayek's Challenge to Habermas)," *Episteme* 3(3): 192–213 [ABS].
- Thicke (2017), "Prediction Markets for Science: Is the Cure Worse than the Disease?," *Soc Epist* 31(5): 451–467 [metadata].
- Markets are a comparative mechanism. Traders profit only by beating the price, the price being the aggregate rival.
- Massari (2023), "The Market Test" (SSRN), is the econ link (in the econ report's citer lists).
- No philosophy paper connects markets to the testing results.

**AI forecasters and evaluation by track record**
- **Computational reliabilism:** Durán & Formanek (2018), "Grounds for Trust: Essential Epistemic Opacity and Computational Reliabilism," *Minds & Machines* 28(4): 645–666 [MEM content]. Trust in opaque algorithms justified by reliability indicators, including a record of success.
- **AI as expert or authority:**
  - Ferrario, Facchini & Termine (2024), *Minds & Machines* 34: 30 [ABS]. Argues AI systems cannot be genuine experts; hybrid human–AI agents can.
  - Hauswald (2025), "Artificial Epistemic Authorities," *Soc Epist* 39(6): 716–725.
  - Magnus (2025), "On Trusting Chatbots," *Episteme* 22(4): 906–916 [ABS]. Chatbots frustrate the usual strategies for assessing sources.
- **Capability attribution:** Harding & Sharadin (2024), "What Is It for a Machine Learning Model to Have a Capability?," *BJPS* [metadata].
- The econ report covers the CS side: ForecastBench (Karger et al. 2025), pitfalls of LM forecasters (Paleka et al.), incentive-compatible competitions (Witkowski et al. 2023), outcome indistinguishability (Dwork et al. 2021), multicalibration.
- **What the theorems add.**
  - A model can be made calibrated on deployment data by post-hoc recalibration or online calibration with no gain in discrimination. That is Seidenfeld's one-note forecaster at scale.
  - Evaluating an AI's forecasting expertise by its realized record is therefore subject to the same impossibility.
  - Principled evaluation must be comparative (head-to-head with humans or other models on the same questions, as in forecasting tournaments), or prior-relative, or must use *commitment and access*. Dwork et al. argue that "auditors should be granted oracle access to the algorithm, not simply historical predictions" (quoted in econ-report §11.3).
  - Oracle access is the AI analogue of requiring a "full theory" (future-dependent tests): one can query the model's conditional forecasts at histories that never occur.
  - This is a clean, novel application. AI systems can be *queried counterfactually*, unlike human pundits, so AI is the domain where the non-manipulable (future-dependent) tests become practical.

**Expected vs surprising**
- **Expected:** the Popper connection, which O&S themselves make.
- **Surprising:**
  - The strategic ignoramus issues *precise* probabilistic forecasts, not vague prophecies. Popper's soothsayer had to be vague. The randomizing charlatan is precise and still safe.
  - Popper's conditional/unconditional distinction marks where testability lives.
  - For AI the counterfactual-query route is open in a way it is not for humans.

### (e) Gaming the evaluation (Goodhart) and epistemic trespassing

**Key texts**
1. **Ballantyne, Nathan (2019), "Epistemic Trespassing," *Mind* 128(510): 367–395**; also ch. 8 of *Knowing Our Limits* (OUP 2019).
   - "We risk 'epistemic trespassing' when we hold controversial views on the basis of evidence and skills drawn from only some of the relevant fields. ... once we learn we have trespassed, we should often lower our level of confidence" (chapter abstract).
   - Follow-ups:
     - DiPaolo (2022), "What's wrong with epistemic trespassing?," *Phil Studies* 179: 223–243.
     - Gerken (2023), "Trespassing testimony in scientific collaboration," *Mind* 132: 505–522.
     - Watson (2022), "Epistemic neighbors," *Synthese* 200: 1–21.
     - Levy 2025 ("trespassing_n").
     - Mirkin & Sojka 2026.
   - **Track records** come in only as a possible defence. A trespasser might point to transferable success.
2. **Goodhart in epistemology.** There is little in philosophy journals under that name.
   - **Nguyen (2024)**, "Value Capture," *J Ethics & Social Phil* 27(3): 469–504 [ABS]. Simplified, quantified versions of values come to dominate reasoning: citation counts, rankings.
   - **Nguyen (2022)**, "Transparency is Surveillance," *PPR* 105(2): 331–361 [ABS]. Transparency demands push experts to act only on reasons legible to non-experts.
   - Harris 2024 (virtue signalling), Guerrero 2017 (strategic expertise) and Fan 2026 (strategic track-record building) are the closest work on experts gaming evaluation.
   - Outside philosophy journals: Manheim & Garrabrant (2018), "Categorizing Variants of Goodhart's Law" (arXiv); El-Mhamdi & Hoang (2024), "On Goodhart's law, with an application to value alignment" (arXiv 2410.09638); Biagioli & Lippman (eds.) (2020), *Gaming the Metrics* (MIT) [MEM].
3. **Terminological collision: the "track-record argument" in mainstream epistemology.**
   - This is bootstrapping and easy knowledge: using a source to certify its own record.
   - Vogel (2000), "Reliabilism Leveled," *J Phil* 97(11): 602–623; Cohen (2002), *PPR* 65(2): 309–329; Weisberg (2010), *PPR* 81(3); Alston (1993) [MEM].
   - White 2009 and Christensen use it in the calibration context. The SEP (Roush) notes that a reasoner "could use the track record so formed to bootstrap her way to judging herself reliable."
   - Elga (2007, *Noûs* 41(3): 478–502) gives the disagreement version: you must not conclude you are an advisor's superior "simply by noting cases of disagreement with her, and taking it that she made most of the mistakes."
   - These are relevant because a novice who scores an expert's record *by her own lights* is bootstrapping.
   - **The paper should say early that "track record" here means a record of realized forecasts against realized outcomes, not the bootstrapping argument.**

**What a theorem-based argument adds**
- **A sharp instance of Goodhart's law.** Any fixed absolute test of forecasting expertise that controls type-I error for every process can be hit by an agent with no domain knowledge who knows only the test.
  - That is stronger than the usual Goodhart story. The proxy does not merely drift from the target under optimization: it can be hit by someone with *zero* target-relevant competence.
  - The fixes the theorems license are comparison and commitment. They are also the standard anti-Goodhart remedies: relative evaluation, and committing in advance to full models.
- **Trespassers.** Ballantyne's trespasser cannot vindicate herself by a good calibration record across domains.
  - Tetlock's superforecasters are, by design, generalists forecasting outside any home domain. Their record counts as evidence only because tournaments score them *comparatively*, against other forecasters and the crowd, on the same questions.
  - **Philosophy of superforecasting is nearly absent.** OpenAlex finds only incidental mentions: Pettigrew 2022 *Synthese* and Konek 2022 *Phil Studies*, in aggregation contexts.

**Expected vs surprising**
- **Expected:** that metrics can be gamed.
- **Surprising:** the zero-knowledge character of the gaming; that the remedies are precisely comparison and counterfactual commitment; and the reading of superforecaster evidence as comparative evidence. It is a plausible, small but distinct contribution to the trespassing debate.

---

## 3. Synthesis for the paper

### 3.1 Where the paper would sit

The natural home is the **novice/expert and track-record debate** in social epistemology: Goldman, Nguyen, Levy, Huang, Fan, Grundmann. Secondary links:
- **calibrationism** and the White thermometer model;
- **the accuracy-first and calibration literature** (Seidenfeld, van Fraassen, Pettigrew, Williams & Pettigrew, Levinstein, Dorst);
- **the orgulity debate**, through Al-Najjar, Pomatto & Sandroni's testability-merging link. This one is directly relevant to the author's 2015 *Ergo* paper, which Pomatto & Sandroni cite.

### 3.2 Candidate theses the literature makes room for

1. **Identification, not access.** Even perfect, unbounded track records of probabilistic forecasts cannot, by themselves, distinguish an expert from a strategic ignoramus. Goldman's source works only in near-deterministic domains or with added structure.
   - Novel in philosophy. Huang and Fan get partway, for different reasons.
2. **Track records certify only relative claims.** The comparative escape (likelihoodism) and the Bayesian escape (relative to the tester's prior) show that track records ground "better than this rival" or "adds to what I already believe". They do not ground "is an expert".
   - This formalizes and partly vindicates Levy's "extend, not ground" thesis. **Strongest single hook.**
3. **Commitment makes expertise testable.** Experts who commit to full theories (conditional forecasts at all histories) can be tested. Prophets issuing on-path unconditional forecasts cannot.
   - This revives Popper's prediction/prophecy distinction in a precise form.
   - It suggests institutional design: pre-registration of models, not just of predictions; oracle access for AI.
   - Corresponds to the scout report's "counterfactual commitment" sketch.
4. **Calibration is neither necessary nor sufficient.** Combine Dorst (rational miscalibration) with Foster–Vohra (charlatan calibration). This undercuts calibrationism-for-others (White) unless a non-strategic premise is added.

### 3.3 Objections a referee will raise, and where the literature helps

- **"Seidenfeld/Dawid already showed calibration is weak."** Answer: the theorems are about all tests, pathwise, with no base-rate knowledge. Cite Seidenfeld's own question at p. 284 as the question the theorems answer.
- **"The type-I requirement (pass the truth under every process) is unreasonably strong. A tester with a prior doesn't need it."** That is Stewart's own point (econ-report §11.2). Embrace it: it is exactly the "prior trust" route, and that is the Levy convergence.
- **"The charlatan is computationally monstrous."** True for the general theorems. False for calibration tests: Foster–Vohra and Foster–Hart charlatans are efficient (econ-report §11.5).
  - The computability boundary (Hu–Shmaya, Fortnow–Vohra) is a real escape route.
  - `_NOTES.md` warns against duplicating "Findable, Not Simple"'s cryptographic method. Treat this route briefly.
- **"Real experts aren't facing strategic charlatans."** Answer with pundits (Tetlock; Shieber's use of it) and merchants of doubt (Levy's own examples). For AI, the analogue is evaluation-gaming by optimization, which needs no intent.
- **"Comparative tests just push the problem back to whom to compare."** Yes. "Is anyone informed?" is untestable (Al-Najjar–Weinstein Thm 7). This is the formal correlate of Levy's "corrupt field" worry, and should be stated as a limit, not hidden.

---

## 4. Consolidated bibliography (philosophy side)

Verification status: Crossref-checked unless marked [MEM].

- Al-Najjar, N. I., L. Pomatto & A. Sandroni (2014). Claim Validation. *American Economic Review* 104(11): 3725–3736. doi:10.1257/aer.104.11.3725
- Anderson, E. (2011). Democracy, Public Policy, and Lay Assessments of Scientific Testimony. *Episteme* 8(2): 144–164. doi:10.3366/epi.2011.0013
- Arnold, E. (2010). Can the Best-Alternative Justification Solve Hume's Problem? *Phil Sci* 77(4): 584–593. doi:10.1086/656010
- Bakshi, K. S. (2025). Identification and Indetermination in the Meta-Inductive Approach to Induction. *Phil Sci* 92(5): 1427–1437. doi:10.1017/psa.2025.10130 (reply: Schurz 2026, doi:10.1017/psa.2026.10247)
- Ballantyne, N. (2019). Epistemic Trespassing. *Mind* 128(510): 367–395. doi:10.1093/mind/fzx042
- Barrett, J. A., B. Skyrms & A. Mohseni (2019). Self-Assembling Networks. *BJPS* 70(1): 301–325. doi:10.1093/bjps/axx039
- Belot, G. (2013a). Bayesian Orgulity. *Phil Sci* 80(4): 483–503. doi:10.1086/673249
- Belot, G. (2013b). Failure of Calibration is Typical. *Statistics & Probability Letters* 83(10): 2316–2318. doi:10.1016/j.spl.2013.06.024
- Belot, G. (2020). Absolutely No Free Lunches! *Theoretical Computer Science* 845: 159–180. doi:10.1016/j.tcs.2020.09.013
- Brennan, J. (2020). Can Novices Trust Themselves to Choose Trustworthy Experts? *Social Epistemology* 34(3): 227–240. doi:10.1080/02691728.2019.1703056
- Chandler, J. (2013). Contrastive Confirmation: Some Competing Accounts. *Synthese* 190(1): 129–138. doi:10.1007/s11229-010-9845-9
- Coady, D. (2012). *What to Believe Now*. Wiley-Blackwell. [MEM]
- Collins, H. & R. Evans (2007). *Rethinking Expertise*. Chicago. [MEM]
- Croce, M. (2019). On What It Takes to Be an Expert. *PQ* 69(274): 1–21. doi:10.1093/pq/pqy044
- Croce, M. & M. Baghramian (2024). Experts – Part I. *Phil Compass* 19(9–10): e13009; Part II, e70005.
- Croce, M. & N. Marsili (2025). Misplaced Trust in Expertise. *Soc Epist* 39(6): 667–682.
- Dawid, A. P. (1982). The Well-Calibrated Bayesian. *JASA* 77: 605–610. [MEM]
- Dawid, A. P. (1985). Probability, Symmetry and Frequency. *BJPS* 36(2): 107–128. doi:10.1093/bjps/36.2.107
- Dawid, A. P. (2004). Probability, Causality and the Empirical World. *Statistical Science* 19(1): 44–57. doi:10.1214/088342304000000125
- Dawid, A. P. (2017; online 2015). On Individual Risk. *Synthese* 194(9): 3445–3474. doi:10.1007/s11229-015-0953-4
- Dellsén, F. (2026). Collectivizing Public Scientific Testimony. *Episteme*. doi:10.1017/epi.2026.10124
- Derschan, T. (2024). How could laypeople assess the trustworthiness of personal-finance advice? MA thesis, University of Vienna. (Secondary source for the Goldman quotes.)
- Dorst, K. (2023). Being Rational and Being Wrong. *Philosophers' Imprint* 23(1). doi:10.3998/phimp.597
- Dorst, K., B. Levinstein, B. Salow, B. Husic & B. Fitelson (2021). Deference Done Better. *Phil Perspectives* 35(1): 99–150. doi:10.1111/phpe.12156
- Douven, I. & N. Kriegeskorte (2025). The Emergent Basis of Expert Trust. *Phil Sci* (online). doi:10.1017/psa.2025.10186
- Durán, J. M. & N. Formanek (2018). Grounds for Trust. *Minds & Machines* 28(4): 645–666. doi:10.1007/s11023-018-9481-6
- Elga, A. (2007). Reflection and Disagreement. *Noûs* 41(3): 478–502. doi:10.1111/j.1468-0068.2007.00656.x
- Elga, A. (2016). Bayesian Humility. *Phil Sci* 83(3): 305–323. doi:10.1086/685740
- Fan, Y. (2026). Regulating Strategic Track-Record Building. *Synthese* 208(1), art. 11. doi:10.1007/s11229-026-05633-7
- Ferrario, A., A. Facchini & A. Termine (2024). Experts or Authorities? *Minds & Machines* 34(3): 30. doi:10.1007/s11023-024-09681-1
- Fitelson, B. (2007). Likelihoodism, Bayesianism, and Relational Confirmation. *Synthese* 156(3): 473–489. doi:10.1007/s11229-006-9134-9
- Forber, P. (2011). Reconceiving Eliminative Inference. *Phil Sci* 78(2): 185–208. doi:10.1086/659232
- Gaifman, H. (1988). A Theory of Higher Order Probabilities. In *Causation, Chance and Credence*: 191–219. doi:10.1007/978-94-009-2863-3_11
- Genin, K. & K. T. Kelly (2017). The Topology of Statistical Verifiability. *EPTCS* 251: 236–250. doi:10.4204/eptcs.251.17
- Gillies, D. (1971). A Falsifying Rule for Probability Statements. *BJPS* 22(3): 231–261. doi:10.1093/bjps/22.3.231
- Goldman, A. I. (2001). Experts: Which Ones Should You Trust? *PPR* 63(1): 85–110. doi:10.1111/j.1933-1592.2001.tb00093.x
- Goldman, A. I. (2018; online 2016). Expertise. *Topoi* 37(1): 3–10. doi:10.1007/s11245-016-9410-3
- Goldman, A. I. (2021). How Can You Spot the Experts? *Royal Inst. Phil. Supplement* 89: 85–98. doi:10.1017/s1358246121000060
- Gradwohl, R. & E. Shmaya (2015). Tractable Falsifiability. *Economics & Philosophy* 31(2): 259–274. doi:10.1017/s0266267115000127
- Grodniewicz, J. P. (2024; online 2022). Effective Filtering. *PQ* 74(1): 291–311. doi:10.1093/pq/pqac064
- Grundmann, T. (2025). Experts. In Lackey & McGlynn (eds.), *Oxford Handbook of Social Epistemology*: 85–104. doi:10.1093/oxfordhb/9780190949945.013.5
- Guerrero, A. (2017). Living with Ignorance in a World of Experts. In Peels (ed.), *Perspectives on Ignorance from Moral and Social Philosophy*: 168–197. [MEM]
- Hájek, A. (2007). The Reference Class Problem Is Your Problem Too. *Synthese* 156(3): 563–585. doi:10.1007/s11229-006-9138-5
- Harding, J. & N. Sharadin (2024). What Is It for a Machine Learning Model to Have a Capability? *BJPS*. doi:10.1086/732153
- Harris, K. R. (2024/25). Intellectual Virtue Signaling and (Non)Expert Credibility. *JAPA* 11(1): 118–134. doi:10.1017/apa.2024.3
- Hauswald, R. (2025). Artificial Epistemic Authorities. *Soc Epist* 39(6): 716–725. doi:10.1080/02691728.2025.2449602
- Hedden, B. (2021). On Statistical Criteria of Algorithmic Fairness. *Phil & Public Affairs* 49(2): 209–231. doi:10.1111/papa.12189
- Herrmann, D. A. (2022). Prediction with Expert Advice Applied to the Problem of Prediction with Expert Advice. *Synthese* 200(4). doi:10.1007/s11229-022-03809-5
- Hu, L. (forthcoming/2025). Does Calibration Mean What They Say It Means; or, the Reference Class Problem Rises Again. *Phil Studies*. arXiv:2412.16769
- Huang, A. C. W. (2023). Track Records: A Cautionary Tale. *BJPS* (online). doi:10.1086/728459
- Isaacs, Y. (2021; online 2019). The Fallacy of Calibrationism. *PPR* 102(2): 247–260. doi:10.1111/phpr.12640
- Joyce, J. M. (1998). A Nonpragmatic Vindication of Probabilism. *Phil Sci* 65(4): 575–603. doi:10.1086/392661
- Kelly, K. T. & O. Schulte (1995). The Computable Testability of Theories Making Uncomputable Predictions. *Erkenntnis* 43(1): 29–66. doi:10.1007/bf01131839
- Keren, A. (2025). Expert Authority and Its Assessment. *Soc Epist* 39(6): 612–625.
- Kinney, D. (2022). Why Average When You Can Stack? *Phil Sci* 89(4): 845–863. doi:10.1017/psa.2022.3
- Lad, F. (1984). The Calibration Question. *BJPS* 35(3): 213–221. doi:10.1093/bjps/35.3.213
- Lange, M. (1999). Calibration and the Epistemological Role of Bayesian Conditionalization. *J Phil* 96(6): 294–324. doi:10.2307/2564680
- Levinstein, B. (2017). Accuracy Uncomposed: Against Calibrationism. *Episteme* 14(1): 59–69. doi:10.1017/epi.2016.50
- Levy, N. (2025; online 2024). No Trespassing! Abandoning the Novice/Expert Problem. *Erkenntnis* 90(5): 2077–2094. doi:10.1007/s10670-024-00794-8
- Magnus, P. D. (2025). On Trusting Chatbots. *Episteme* 22(4): 906–916. doi:10.1017/epi.2024.29
- Martini, C. (2019). The Epistemology of Expertise. In *Routledge Handbook of Social Epistemology*: 115–122.
- Masterton, G. (2014). What to Do with a Forecast? *Synthese* 191(8): 1881–1907. doi:10.1007/s11229-013-0384-z
- Matheson, J., S. McElreath & N. Nobis (2018). Moral Experts, Deference & Disagreement. In *Moral Expertise* (Springer): 87–105.
- Mayo, D. (2018). *Statistical Inference as Severe Testing*. CUP.
- Merdes, C., M. von Sydow & U. Hahn (2021). Formal Models of Source Reliability. *Synthese* 198: 5773–5801.
- Mirkin, J. & M. M. Sojka (2026). From Expertise to Trustworthiness. *Episteme*. doi:10.1017/epi.2026.10118
- Nguyen, C. T. (2020; online 2018). Cognitive Islands and Runaway Echo Chambers. *Synthese* 197(7): 2803–2821. doi:10.1007/s11229-018-1692-0
- Nguyen, C. T. (2022). Transparency is Surveillance. *PPR* 105(2): 331–361. doi:10.1111/phpr.12823
- Nguyen, C. T. (2024). Value Capture. *JESP* 27(3): 469–504.
- Nielsen, M. & R. T. Stewart (2019). Obligation, Permission, and Bayesian Orgulity. *Ergo* 6. doi:10.3998/ergo.12405314.0006.003
- Olszewski, W. & A. Sandroni (2011). Falsifiability. *AER* 101(2): 788–818.
- Pomatto, L. & A. Sandroni (2018). An Axiomatic Theory of Inductive Inference. *Phil Sci* 85(2): 293–315. doi:10.1086/696386
- Pomatto, L., N. Al-Najjar & A. Sandroni (2014). Merging and Testing Opinions. *Annals of Statistics* 42(3): 1003–1028.
- Popper, K. (1963). *Conjectures and Refutations*. Routledge. [MEM for pages]
- Popper, K. (1968). *The Logic of Scientific Discovery*, p. 133 (quoted by O&S 2011).
- Quast, C. (2018). Expertise: A Practical Explication. *Topoi* 37(1): 11–27.
- Romeijn, J.-W. & D. Atkinson (2011). Learning Juror Competence. *PPE* 10(3): 237–262.
- Roth, A. & A. W. Tolbert (2025). Resolving the Reference Class Problem at Scale. *Phil Sci* 92(4): 868–882. doi:10.1017/psa.2025.17
- Roth, A., A. W. Tolbert & S. Weinstein (2023). Reconciling Individual Probability Forecasts. *FAccT '23*: 1124–1138. arXiv:2209.01687
- Roush, S. (2009). Second Guessing: A Self-Help Manual. *Episteme* 6(3): 251–268. Roush, S. (2017). Epistemic Self-Doubt. *SEP*.
- Royall, R. (1997). *Statistical Evidence: A Likelihood Paradigm*. [MEM] Royall, R. (2000). *JASA* 95(451): 760–768.
- Schoenfield, M. (2015). A Dilemma for Calibrationism. *PPR* 91(2): 425–455. (2018) *PPR* 96(3): 690–715.
- Schurz, G. (2008). *Phil Sci* 75(3): 278–305. (2009) *Episteme* 6(2): 200–220. (2012) *Episteme* 9(2): 151–170. (2019) *Hume's Problem Solved* (MIT).
- Seidenfeld, T. (1985). Calibration, Coherence, and Scoring Rules. *Phil Sci* 52(2): 274–294.
- Shieber, J. (2015). *Testimony: A Philosophical Introduction*. Routledge. [not accessed; pp. 82–84 per Grodniewicz]
- Shimony, A. (1988). An Adamite Derivation of the Calculus of Probability. In Fetzer (ed.), *Probability and Causality*. [MEM]
- Sliwa, P. & S. Horowitz (2015). Respecting All the Evidence. *Phil Studies* 172(11): 2835–2858. doi:10.1007/s11098-015-0446-9
- Sober, E. (2008). *Evidence and Evolution*. CUP. [MEM]
- Sterkenburg, T. F. (2019/20). The Meta-Inductive Justification of Induction. *Episteme* 17(4): 519–541; (2019) *Phil Sci* 86(5): 981–992.
- Stewart, R. T. & M. Nielsen (2020). On the Possibility of Testimonial Justice. *AJP* 98(4): 732–746. doi:10.1080/00048402.2019.1706183
- Sunstein, C. (2006). Deliberating Groups versus Prediction Markets. *Episteme* 3(3): 192–213.
- Thicke, M. (2017). Prediction Markets for Science. *Soc Epist* 31(5): 451–467.
- Topey, B. (2022). Higher-Order Evidence and the Dynamics of Self-Location. *Erkenntnis* 89(4): 1407–1433.
- Trubody, B. (2015). A Paradigm for Your Thoughts: A Kuhnian Analysis of Expertise. *Humana.Mente* 28. (Discusses Roubini's recession-forecasting record; quotes Goldman 2001.)
- van Fraassen, B. C. (1983). Calibration: A Frequency Justification for Personal Probability. In Cohen & Laudan (eds.), *Physics, Philosophy and Psychoanalysis*: 295–319. [pages MEM]
- Vogel, J. (2000). Reliabilism Leveled. *J Phil* 97(11): 602–623. [MEM]
- Vu Duc, D., Q. Hiernaux & O. Sartenaer (2026). On Meta-Expertise, Dissent and Epistemic Trespassing: A Reply to Neil Levy. *Erkenntnis*. doi:10.1007/s10670-026-01078-z
- Watson, J. C. (2021). *Expertise: A Philosophical Introduction*. Bloomsbury. (2022) Epistemic Neighbors. *Synthese* 200.
- Weatherson, B. (2015). For Bayesians, Rational Modesty Requires Imprecision. *Ergo* 2(20). doi:10.3998/ergo.12405314.0002.020
- White, R. (2009). On Treating Oneself and Others as Thermometers. *Episteme* 6(3): 233–250. doi:10.3366/e1742360009000689
- Williams, J. R. G. & R. Pettigrew (2026). Consequences of Calibration. *BJPS* 77(2): 399–411. doi:10.1086/725097
- Ye, R. (2023). *Higher-Order Evidence and Calibrationism*. Cambridge Elements. doi:10.1017/9781009127332
- Zaffora Blando, F. (2024). Pride and Probability. *Phil Sci* 91(3): 634–660. doi:10.1017/psa.2023.177
