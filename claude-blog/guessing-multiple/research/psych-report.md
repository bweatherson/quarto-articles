# Background report: multiple guesses, the "crowd within", sampling, and joint vs. marginal guessing

**How I checked citations.** I checked every DOI below against the Crossref API, unless an entry says otherwise. For the key empirical claims I read the primary text itself, either the full PDF or the publisher's abstract, and I say where I relied on a secondary source. Anything marked **UNVERIFIED** I could not confirm.

---

## 1. The "crowd within" / inner crowd

**Precursors**
- **Stroop (1932)**, *J. Exp. Psych.* 15(5): 550–562, doi:10.1037/h0070482.
  - Participants ranked weights that looked identical, and some came back up to 50 times.
  - Averaging rankings from the same person improved the correlation with the true ranking as much as averaging across different people did.
  - I have this second-hand, from Herzog & Hertwig 2014 (TiCS).
- **Ariely et al. (2000)**, *JEP: Applied* 6(2): 130–147, doi:10.1037/1076-898x.6.2.130.
  - They predicted that averaging a person's own probability judgments would help, but found no such benefit.
  - Vul & Pashler suggest the reason: probability judgments are biased toward 0 and 1, and averaging does not remove bias.

**Vul & Pashler (2008)**, "Measuring the crowd within: Probabilistic representations within individuals," *Psych. Science* 19(7): 645–647, doi:10.1111/j.1467-9280.2008.02136.x. I read the PDF.
- **Design.**
  - N = 428 online participants answered 8 CIA-Factbook percentage questions (e.g., "% of the world's airports in the US").
  - Each was then unexpectedly asked for a second guess, either immediately or 3 weeks later.
- **Accuracy of the average.**
  - The average of the two guesses had lower mean squared error (MSE) than either guess, in both conditions.
  - 95% CI for the error reduction relative to the first guess: [2.5%, 10.4%] immediate; [11.6%, 20.4%] delayed. The delay effect was significant, t(426) = 2.12.
- **Second guesses were worse than first guesses** in both conditions.
- **Value of a second guess.** They define λ as the fraction of a second person's guess that one's own second guess is worth.
  - λ = 0.11 immediate and 0.32 delayed.
  - In their words: "you can gain about 1/10th as much from asking yourself the same question twice as you can from getting a second opinion… if you wait 3 weeks… 1/3."
- **Interpretation.**
  - Responses "are sampled from an internal probability distribution, rather than deterministically selected on the basis of all the knowledge a subject has."
  - They explain the cost of asking immediately as anchoring on the first response.

**Steegen, Dewitte, Tuerlinckx & Vanpaemel (2014)**, *Frontiers in Psych.* 5: 786, doi:10.3389/fpsyg.2014.00786. This is a pre-registered replication.
- Averaging beat the first guess both immediately (n = 471, d = 0.40) and after a delay (n = 140, d = 0.34).
- Second guesses were again less accurate than first guesses.
- The pre-registered test of the delay effect, measured against guess 1, was null (p = .858). A larger benefit measured against guess 2 (d = 0.30) was exploratory.

**Herzog & Hertwig (2009)**, "The wisdom of many in one mind: Improving individual judgments with dialectical bootstrapping," *Psych. Science* 20(2): 231–237, doi:10.1111/j.1467-9280.2009.02271.x. I read the PDF.
- **Formal analysis.** Relative to the first estimate, there is a "gain range" for the second estimate:
  - If the two estimates *bracket* the truth (one too high, one too low), the second can have almost 3× the first's error and the average still wins.
  - If they don't bracket it, the second estimate must be more accurate than the first for the average to win.
- **Design.** N = 101 participants dated 40 historical events. They then gave a second estimate, either plainly (reliability condition) or under a consider-the-opposite instruction. The instruction read:
  > "First, assume that your first estimate is off the mark. Second, think about a few reasons why that could be… Was the first estimate rather too high or too low? Fourth… make a second, alternative estimate."
- **Accuracy gains.** Gain was measured as the median decrease in error of the average relative to the first estimate.
  - Reliability condition: 0.3 percentage points.
  - Dialectical condition: 4.1 points (d = 0.53); 72% of participants benefited and 24% got worse.
  - Averaging with a random other person: 7.1 points (d = 0.86).
- **Bracketing rates:** 7.9% (reliability), 13.6% (dialectical), 17.6% (dyads).
- **Explanation offered:** the second estimate draws on partly different, non-redundant knowledge.
- **Related exchange:** a methodological critique by White & Antonakis (2013), doi:10.1177/0956797612449174, and a reply by Herzog & Hertwig (2013), doi:10.1177/0956797612457399.

**Herzog & Hertwig (2014a)**, "Harnessing the wisdom of the inner crowd," *TiCS* 18(10): 504–506, doi:10.1016/j.tics.2014.06.009. This is a narrative review; I read the PDF.
- **Overall pattern.** "Most – but not all – studies" find the effect. Outer crowds beat inner crowds of the same size because inner-crowd errors are more redundant.
- **What increases the gain.**
  - A time delay between estimates.
  - The consider-the-opposite prompt.
  - Using different elicitation methods.
  - Lower working-memory span: Hourihan & Benjamin (2010), *JEP:LMC* 36(4): 1068–1074, doi:10.1037/a0019694, read as reflecting smaller memory samples.
- **What people actually do.** They often combine their own estimates but rarely average them strictly. They cannot beat strict averaging by choosing between their estimates. Sources: Herzog & Hertwig (2014b), *JEP:LMC* 40(1): 218–232, doi:10.1037/a0034054; Fraundorf & Benjamin (2014), *J. Mem. Lang.* 71(1): 17–38, doi:10.1016/j.jml.2013.10.002.
- **An open question they flag:** whether the effect extends to judgments that are *not quantitative*.

**Rauhut & Lorenz (2011)**, *J. Math. Psych.* 55(2): 191–197, doi:10.1016/j.jmp.2010.10.002. I read the abstract only.
- N = 144 participants each gave 5 consecutive estimates.
- "Asking oneself several times is on average less powerful than asking only one other individual." Repeated estimates converge toward a larger bias.
- People "cannot make truly independent draws" from an internal distribution.

**Müller-Trede (2011)**, *JDM* 6(4): 283–294, doi:10.1017/s1930297500001893.
- Gains depend on question type. They appear for year and percentage questions but not for general numerical ones; inner-crowd gains were about ¼–⅓ of dyadic gains.
- When asked for a third, final answer, only about 10% of people consistently averaged their first two, and more than 30% of final answers fell outside that range.

**van Dolder & van den Assem (2018)**, "The wisdom of the inner crowd in three large natural experiments," *Nature Human Behaviour* 2(1): 21–26, doi:10.1038/s41562-017-0247-6. I read the PDF.
- **Data.** About 1.2 million incentivised estimates of the number of objects in a container (Holland Casino promotions, 2013–15).
- **Within-person averaging works, weakly.** Averaging a player's first two estimates beat either one, with small effects (d ≈ 0.05–0.11).
- **Delay matters.** Accuracy gain was defined as the % reduction in squared error relative to the mean individual squared error.
  - 16–18% for estimates entered simultaneously; about 30% for estimates more than 5 weeks apart.
  - The correlation between the two estimates fell from above .8 to about .5 with delay, and the delay-dependent covariance halved roughly every 8 days.
- **The inner crowd has a ceiling.** Averaging infinitely many of one's own estimates is worth only 1.6–2.1 other people. The authors conclude that "the average of a large number of judgements from the same person is barely better than the average of two judgements from different people."
- **Why:** the variance of person-specific bias is about twice the variance of within-person noise, and within-person averaging only removes the noise.
- **One contrast with the lab studies:** here second estimates were *more* accurate than first ones, which the authors attribute partly to learning.

**Later work on how second guesses are generated**
- **Gaertig & Simmons (2021)**, "The psychology of second guesses: Implications for the wisdom of the inner crowd," *Management Science* 67(9): 5921–5942, doi:10.1287/mnsc.2020.3781. Nine studies, N = 8,465.
  - Asking people explicitly whether their first guess was "too high or too low" made second guesses more extreme in the same direction.
  - That reduced, sometimes eliminated or reversed, the inner-crowd effect for questions with non-extreme answers, and increased it for questions with extreme answers.
  - They contrast a "resampling" process with a "choice" process for producing the second guess, and conclude the effect "is not inevitable."
  - Note that Herzog & Hertwig's dialectical instruction itself contains the too-high/too-low question.
- **Van de Calseyde & Efendić (2022)**, *Psych. Science* 33(6): 971–983, doi:10.1177/09567976211061321. Making the second estimate from the perspective of someone you *disagree* with improves the average; it backfires for answers near the end of the scale.
- **Fiechter & Kornell (2021)**, *Cogn. Research: P&I* 6: 5, doi:10.1186/s41235-021-00273-6. After training, the benefit of averaging one's own estimates vanished because within-person variance collapsed; the outer-crowd benefit remained.
- **Litvinova, Herzog, Kall, Pleskac & Hertwig (2020)**, *Decision* 7(3): 183–211, doi:10.1037/dec0000119. Averaging a person's two confidence judgments improves their accuracy. I have this from the abstract of the related dissertation chapter.

**Meta-analysis:** I found none, despite several targeted searches. The TiCS review is narrative.

**Summary of explanations offered**
- **(a) Sampling from an internal distribution** (Vul & Pashler; see §2). Anchoring, or autocorrelated sampling, explains why an immediate second guess helps less.
- **(b) Error decomposition into within-person noise vs. person-level bias**, with only the noise averaging out (van Dolder & van den Assem; Rauhut & Lorenz).
- **(c) Retrieval of different, non-redundant knowledge** (Herzog & Hertwig; Hourihan & Benjamin).
- **(d) Resampling vs. deliberate "choice" processes** for producing the second guess (Gaertig & Simmons).

---

## 2. Sampling accounts of probability judgment

**Vul, Goodman, Griffiths & Tenenbaum (2014)**, "One and done? Optimal decisions from very few samples," *Cognitive Science* 38(4): 599–637, doi:10.1111/cogs.12101. I read the PDF.
- If drawing a sample costs time, then deciding on 1 or a few posterior samples is often globally optimal: "Making many locally suboptimal decisions quickly is the globally optimal strategy."
- **Probability matching is the one-sample policy.** Across 25 studies reviewed by Vulkan (2000, *J. Econ. Surveys* 14(1): 101–118, doi:10.1111/1467-6419.00106), higher stakes correlated with more samples per decision (r = .61).
- **What a single response reveals.** On this view a single response is one draw, so "Bayesian behavior emerges only on average." A single response says little about the full posterior.
- They cite the crowd within as evidence that a person's variability comes from reusing samples rather than from fixed biases.

**Sanborn & Chater (2016)**, "Bayesian brains without probabilities," *TiCS* 20(12): 883–893, doi:10.1016/j.tics.2016.10.003.
- The brain samples hypotheses rather than representing probabilities. "Only with infinite samples does a Bayesian sampler conform to the laws of probability."
- Sampling explains unpacking effects, the conjunction fallacy and base-rate neglect.
- Autocorrelated (MCMC-style) sampling explains anchoring.
- "Behavior will look noisy, even where on average the response will be correct." They cite Vul & Pashler and the inner-crowd work.

**Zhu, Sanborn & Chater (2020)**, "The Bayesian sampler," *Psych. Review* 127(5): 719–748, doi:10.1037/rev0000190. I read the full text via Europe PMC.
- A probability estimate is formed from N samples plus a generic Beta(β,β) prior: P̂(A) = (S(A)+β)/(N+2β).
- Expected value: [N/(N+2β)]·P(A) + β/(N+2β). This produces conservatism and conjunction-fallacy patterns.
- Variance: N·P(A)(1−P(A))/(N+2β)², so repeated estimates should vary. Their participants gave 3 repeated estimates of each query.

**Zhu, Sundh, Spicer, Chater & Sanborn (2024)**, "The autocorrelated Bayesian sampler," *Psych. Review* 131(2): 456–493, doi:10.1037/rev0000427.
- A response is the latest sample from an autocorrelated chain.
- The effective sample size is small (about 17% of the nominal sample count in their simulations).

**Dasgupta, Schulz & Gershman (2017)**, "Where do hypotheses come from?", *Cognitive Psychology* 96: 1–25, doi:10.1016/j.cogpsych.2017.05.001.
- Hypotheses are generated by drawing a small number of Monte Carlo samples.
- The abstract explicitly lists "the crowd within," along with sub- and superadditivity, anchoring, and the self-generation effect, among the phenomena the model reproduces.

**Icard (2016)**, "Subjective probability as sampling propensity," *Rev. Phil. Psych.* 7(4): 863–903, doi:10.1007/s13164-015-0283-y. I read the preprint.
- **Proposal.** Subjective probability is the propensity of an internal generative model to produce a sample.
- **His decision rule.** Draw R samples and choose the modal one. With R = 1 this gives probability matching. The rule predicts "inconsistent responses to the same question on different occasions."
- **Crowd within.** In the section titled "The Crowd Within," he reads Vul & Pashler as evidence that responses "originate from some underlying distribution" more accurate than any single sample.
- **Caveats he raises.**
  - When people remember an earlier answer, sampling is "overridden (perhaps out of concern for consistency)."
  - In obvious cases sampling is overridden too. Asked to guess the colour of a die with five red faces and one green, people guess red with probability 1, not 5/6.
  - Utility-weighted sampling raises the question of whether sampling propensities still represent the agent's uncertainty.

**Whether group-level calibration reveals individual distributions**
- **Mozer, Pashler & Homaei (2008)**, *Cognitive Science* 32(7): 1133–1147, doi:10.1080/03640210802353016.
  - Group-level "optimal predictions" (Griffiths & Tenenbaum 2006, *Psych. Sci.* 17(9): 767–773, doi:10.1111/j.1467-9280.2006.01780.x) could arise from individuals who each hold k instances. "Two instances proved sufficient" (quoted from the CogSci-proceedings abstract).
- **Lewandowsky, Griffiths & Kalish (2009)**, *Cognitive Science* 33(6): 969–998, doi:10.1111/j.1551-6709.2009.01045.x. Using iterated learning, they find results "inconsistent with" this few-instances model and argue individuals have rich distributional knowledge.

**Categorical analogue (repeated two-choice answers)**
- **Koriat (2012)**, "The self-consistency model of subjective confidence," *Psych. Review* 119(1): 80–113, doi:10.1037/a0025648. I read the PDF.
  - To answer a two-choice question, a person samples representations and picks the majority answer. Confidence tracks how consistent the sample is, and predicts whether the same answer will be given again.
  - Reporting Koriat (2008), *JEP:LMC* 34(4): 945–959, doi:10.1037/0278-7393.34.4.945: on general-knowledge items, the same answer was repeated on a second presentation 74% of the time for below-median-confidence answers and 95% for above-median ones.

---

## 3. How people choose guesses, how many alternatives they name, and second guesses

**Quillien, Bramley & Lucas (2025)**, "Lossy encoding of distributions in judgment under uncertainty," *Cognitive Psychology* 159: 101745, doi:10.1016/j.cogpsych.2025.101745. I read most of the PDF; the text available to me was cut off partway through the general discussion.
- **Their model.** A guess is a compressed encoding of the speaker's distribution. The speaker chooses the guess that minimises the KL divergence between their distribution and what a listener would decode from it. They compare this with the Dorst–Mandelkern accuracy–specificity trade-off.
- **Task.** Participants named 1–4 ball colours as their guess about a draw from an urn.
- **Production study (N = 64), model fits:** compression r = .964; Dorst–Mandelkern trade-off r = .929 (best-fitting J ≈ 3); a "probability" model .428.
- **98% of guesses were Pareto-optimal**, which corresponds to D–M's "filtering", compared with about 41% for random guessing.
- **Individual fits:** 27 participants were best fit by the trade-off model and 15 by compression.
- **Example urns** (from Quillien's xphi blog post, 3 June 2025):
  - [3,3,3,3]: nearly everyone named all four colours.
  - [9,1,1,1]: most named one.
  - [6,3,2,1]: about half named one colour and half named two.
  - [5,3,3,1]: people named one or three colours, as compression predicts; the trade-off model predicted two.
- **Study 4** is a conceptual replication of Yaniv & Foster (1995), *JEP:G* 124(4): 424–432, doi:10.1037/0096-3445.124.4.424, on choosing interval estimates.
- **Earlier version:** Quillien & Lucas (2022), CogSci Proceedings 44: 2876–2882. PsyArXiv doi:10.31234/osf.io/dy6rm; the proceedings themselves have no Crossref DOI.
- They do not study second guesses or explicit "top-k" requests.

**Ranked multiple guesses about one item: Vul, Hanus & Kanwisher (2009)**, "Attention as inference," *JEP:General* 138(4): 546–560, doi:10.1037/a0017352.
- **Task.** Participants made 4 *distinct* guesses about which letter had been cued, scored 1, .5, .25 and .125 points. That scoring rewards ordering guesses by probability.
- **Findings.**
  - Second guesses were above chance and fell near the first guess.
  - But the errors of the first and second guesses were uncorrelated (r ≈ −.06), and the distribution of second guesses was "independent of the serial position of the first guess."
  - The authors conclude "all guesses are samples from the same underlying distribution." A deterministic "next-most-probable" ordering would instead predict correlated errors.

**Second choices after a wrong first choice (psychophysics and memory)**
- **The paradigm:** Swets, Tanner & Birdsall (1961), *Psych. Review* 68(5): 301–340, doi:10.1037/h0040547. Four-alternative forced choice with a second response.
- **Second choices are correct above chance.** I have this through Wixted (2020), *JEP:LMC* 46(2): 201–233, doi:10.1037/xlm0000732, citing Green & Swets 1966, p. 108. I did not check the primary text myself.
  - This counts against high-threshold theories, on which a wrong first choice carries no information.
- **Kellen & Klauer (2011)**, *J. Math. Psych.* 55(3): 251–266, doi:10.1016/j.jmp.2010.11.004. Using first- and second-choice responses in recognition memory, they favour a hybrid dual-process model (I read the abstract).

**Second guesses after being told the first was wrong: Metcalfe & Finn (2011)**, *JEP:LMC* 37(2): 437–448, doi:10.1037/a0021962.
- After an error on a general-knowledge question, people were more likely to pick or produce the correct answer on a second guess when the error had been made with *high* confidence.

**Guess-until-correct paradigm: Shannon (1951)**, "Prediction and entropy of printed English," *Bell Sys. Tech. J.* 30(1): 50–64, doi:10.1002/j.1538-7305.1951.tb01366.x.
- When a guess was wrong the subject was "told so and asked to guess again… until he finds the correct letter."
- The ideal predictor "would guess letters in the order of decreasing conditional probability."
- See also Cover & King (1978), *IEEE Trans. IT* 24(4): 413–421, doi:10.1109/tit.1978.1055912.

**How many alternatives people generate**
- **HyGene model:** Thomas, Dougherty, Sprenger & Harbison (2008), *Psych. Review* 115(1): 155–185, doi:10.1037/0033-295x.115.1.155.
- **Sprenger et al. (2011)**, *Frontiers in Psych.* 2: 129, doi:10.3389/fpsyg.2011.00129.
  - Working-memory capacity "constrains the number of hypotheses that one can include in the comparison process."
  - The judged probability of the focal hypothesis falls with the number and strength of the alternatives generated.

**Changing answers on tests: Kruger, Wirtz & Miller (2005)**, *JPSP* 88(5): 725–735, doi:10.1037/0022-3514.88.5.725.
- "Most answer changes are from incorrect to correct," yet people believe they should stick with their first instinct.

**Gap.** I found no experimental study of explicit "give me your top three" requests on general-knowledge questions, beyond Vul, Hanus & Kanwisher (2009) and the forced-choice ranking paradigms above.

---

## 4. Formal results: answering several questions at once

**Per-question best answers vs. the jointly best answer**
- **Rabiner (1989)**, HMM tutorial, *Proc. IEEE* 77(2): 257–286, doi:10.1109/5.18626, p. 263. I read the text.
  - Choosing the individually most likely state at each time "maximizes the expected number of correct states."
  - But when some transitions have zero probability, "the 'optimal' state sequence may, in fact, not even be a valid state sequence."
  - The Viterbi algorithm instead finds the single most probable whole sequence.
- **Bahl, Cocke, Jelinek & Raviv (1974)**, *IEEE Trans. IT* 20(2): 284–287, doi:10.1109/tit.1974.1055186.
  - Title: "Optimal decoding of linear codes for minimizing symbol error rate." I verified the bibliographic details only. Its contrast with sequence-level (Viterbi) decoding is standard but I did not read the paper.

**Dembczyński, Waegeman, Cheng & Hüllermeier (2010)**, ECML PKDD 2010, LNCS pp. 280–295, doi:10.1007/978-3-642-15880-3_24. Extended in *Machine Learning* 88(1–2): 5–45 (2012), doi:10.1007/s10994-012-5285-8. I read the 2010 version. "Hamming loss" scores the number of wrong answers; "subset 0/1 loss" scores whether every answer is right.
- The Hamming-optimal prediction combines the per-question (marginal) modes. The 0/1-optimal prediction is the joint mode.
- **They coincide (Prop. 1)** if the questions are conditionally independent, or if the joint mode has probability ≥ 0.5.
- **How far apart they can be (Prop. 3).** The all-correct regret of the per-question-best answer can approach 0.5, and the bound is tight.
  - Their construction with two questions: p(1,0) = p(0,1) = ½ − δ and p(1,1) = 2δ.
  - Each question's best answer is 1, but the combination (1,1) has probability only 2δ.
- **The reverse (Prop. 4).** The joint mode can be much worse on expected number correct, with regret up to (m−2)/(m+2) for m > 3 questions.

**Park & Darwiche (2004)**, "Complexity results and approximation strategies for MAP explanations," *JAIR* 21: 101–133, doi:10.1613/jair.1236. Crossref lists the year as 2006; JAIR volume 21 is 2004.
- They distinguish three answers: the most probable values of a *subset* of variables ("marginal MAP"), that subset's values in the single most probable full assignment ("MPE projection"), and per-variable maxima.
- "The projection of an MPE solution… is usually not a most likely configuration. Neither is the configuration obtained by choosing the most likely state of each… variable separately."
- Marginal MAP is NP^PP-complete.

**Textbook-style example.** Daphne Koller's PGM course slide "MAP ≠ Max over Marginals":
- Joint distribution: P(a0,b0) = .04, P(a0,b1) = .36, P(a1,b0) = .30, P(a1,b1) = .30.
- The per-variable maxima are a1 and b1, giving (a1,b1) with probability .30, but the joint MAP is (a0,b1) with .36.
- The corresponding passage in Koller & Friedman's 2009 textbook is **UNVERIFIED** (section not located).

**Interpolating estimators.**
- The centroid estimator minimises expected Hamming loss: Carvalho & Lawrence (2008), *PNAS* 105(9): 3209–3214, doi:10.1073/pnas.0712329105.
- **Hamada et al. (2011)**, *PLoS ONE* 6(2): e16450, doi:10.1371/journal.pone.0016450.
  - Their γ-centroid estimator includes each component whose marginal exceeds 1/(γ+1).
  - γ trades true positives against false positives, a structural analogue of Dorst–Mandelkern's J.

**Optimal sequential guessing with feedback**
- With yes/no feedback on each guess, the optimal strategy guesses in decreasing order of probability. Stated by Malone & Sullivan (2004), *IEEE Trans. IT* 50(3): 525–526, doi:10.1109/tit.2004.824921; cf. Shannon (1951).
- Massey (1994), ISIT Proc., p. 204, doi:10.1109/isit.1994.394764, relates the expected number of guesses to Shannon entropy.
- Arikan (1996), *IEEE Trans. IT* 42(1): 99–105, doi:10.1109/18.481781, bounds the moments of the number of guesses using Rényi entropy.

---

## 5. Philosophy engaging the above

**Using the crowd within or sampling directly**
- **Icard (2016)**, see §2, is the main philosophical treatment.
  - Related: Icard (2018), "Bayes, bounds, and rational analysis," *Phil. Sci.* 85(1): 79–101, doi:10.1086/694837.
  - Icard (2021), "Why be random?", *Mind* 130(517): 111–139, doi:10.1093/mind/fzz065, on when randomised action is rational for bounded agents.
- **Rescorla** treats the probability that a system samples h as its credence ("sampling encoding" of credal states).
  - Rescorla (2019), "A realist perspective on Bayesian cognitive science," in *Inference and Consciousness*, pp. 40–73, doi:10.4324/9781315150703-3.
  - Rescorla (2021), *WIREs Cog. Sci.* 12(1): e1540, doi:10.1002/wcs.1540.
- **Porot & Mandelbaum**, "The science of belief: A progress report," *WIREs Cog. Sci.* 12(2): e1539 (2021), doi:10.1002/wcs.1539; also in *The Cognitive Science of Belief* (CUP 2022), pp. 55–91, doi:10.1017/9781009001021.005.
  - They use Vul & Pashler as evidence for *fragmented* belief: "The wisdom of the crowd within effect hinges on being able to tap into independent error… Fragmentation achieves independent error as a matter of course."
- **Lyon & Pacuit (2013)**, *Handbook of Human Computation*, pp. 599–614, doi:10.1007/978-1-4614-8806-4_47. Only a footnote citing Vul & Pashler and Herzog & Hertwig.
- **Ballarini**, "No credences in active reasoning: The argument from alternative neglect," *Noûs* (2026), doi:10.1111/nous.70037. She uses empirical findings on "alternative neglect" to argue for belief–credence dualism. I read the abstract only; whether she engages hypothesis-generation or sampling work is **UNVERIFIED**.

**Philosophy of guessing (checked for uptake of the above)**
- Dorst & Mandelkern (2022), *PPR* 105(3): 581–618, doi:10.1111/phpr.12831.
- Holguín (2022), *Phil. Imprint* 22(1), doi:10.3998/phimp.2123.
- Skipper (2023), *Phil. Studies* 180(7): 2025–2050, doi:10.1007/s11098-022-01915-1.
- Horowitz (2019), "Accuracy and educated guesses," *OSE* 6: 85–113, doi:10.1093/oso/9780198833314.003.0004.
- Horowitz (2025), "Do credences model guesses?", *Noûs* 59(2): 409–424, doi:10.1111/nous.12519. Her book *Guesswork* (Princeton UP) is forthcoming in 2027. Its draft chapters treat only two-option forced choices and do not discuss second guesses or sampling.
- Linnemann & Azhar (2025), *PPR* 110(2): 661–686, doi:10.1111/phpr.13118.
- Fang (2026), *PPR* 112(3): 563–577, doi:10.1111/phpr.70101.
- In the portions I read (Dorst & Mandelkern, Skipper, the Horowitz draft), there is no engagement with the crowd within, sampling accounts, or multiple guesses. **I did not check** Holguín, Linnemann & Azhar, or Fang for this.
- I found no philosophy paper on "self-disagreement" or "intrapersonal wisdom of crowds" that cites this literature, other than Porot & Mandelbaum.

---

## Possible bearings on the philosophy of guessing

1. **Asking again gets a different, and informative, answer.** If a good guess is a function of credence and question, then asking the same question again with no new evidence should get the same answer. Instead second answers differ, and averaging them beats either (§1). A credence-based theorist then has three options:
   - say "guess again" changes the question, since it implicates "not that";
   - say credences themselves fluctuate between elicitations (sampling);
   - say the variation is just error.
   That first guesses beat immediate second guesses (Vul & Pashler; Steegen et al.) fits "first guess = best guess."

2. **What one guess reveals.** On sampling views a guess is roughly one draw from a distribution, and maximizing appears only under high stakes or in obvious cases (Vul et al. 2014; Icard's die). That makes it hard to read credences off single guesses. But the credence-based norms survive as competence norms.

3. **Guessing again after feedback.** The formal ideal is to rule out the failed answer and guess the new mode, which is next in decreasing-probability order (Shannon; Massey). Metcalfe & Finn's data are compatible with that. Two findings sit less easily with it:
   - Vul et al. (2009): second guesses look like independent samples.
   - Gaertig & Simmons: the way the second guess is prompted changes what it is.

4. **Several questions at once.** Per-question best guesses can be jointly improbable or even impossible (Rabiner; Dembczyński et al.; Park & Darwiche). They match the jointly best guess only under independence, or when the joint mode has probability ≥ .5. So whether "your guesses" should hold together depends on the scoring rule: expected number right, or all right.

5. **"Top-k" requests.** People's guess sets are almost always filtered, but clustering effects favour compression over the J-trade-off in some cases (Quillien et al.).