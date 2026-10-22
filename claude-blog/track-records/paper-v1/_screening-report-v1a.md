# Screening report: "The Record and the Account" (v1a)

**Title:** The Record and the Account: What a Track Record Can Show About Knowing the Chances

**Word count:** about 5,100 words of body text, plus a 294-word abstract. The bibliography has 47 entries.

**Thesis summary:** A record of forecasts can show that someone knows the chances only relative to an "account" of which hypotheses are possible chance processes. The account is supplied by whoever reads the record. The record can tell knowers apart only insofar as those hypotheses are mutually singular, so accounts closed under mixture certify no one; and because a record measures a head start over a learner, this holds for sincere forecasters too. Propensity views supply no certifying account, and best-system views supply one only if their simplicity standards exclude mixtures, which yields a dilemma; novices can get comparative deference, and institutions owe a statement of their account.

**Verdict:** NOT READY

## Deal-breakers

**1. The central idea is already in the literature the paper cites, and the paper does not say so (Criterion 1; priority requirement).**

- **The "account" already has a name.** The expert-testing literature calls it a restricted "class of allowed data-generating processes", or a "paradigm". Olszewski (2015) surveys it as a standard response to the impossibility theorems in its section "Restricting the class of allowed data-generating processes". That chapter is in the bibliography but is cited only for Prop. 8.
- **That section already contains the paper's §3.1 example.** It gives the same i.i.d. case: ask for the bias, and pass the forecaster if the frequency matches. It also notes that the negative results survive restriction to exchangeable processes, i.e. mixtures of i.i.d. processes.
- **Two directly relevant papers are uncited.** Al-Najjar, Sandroni, Smorodinsky and Weinstein (JET 2010) build a test for a restricted class and conclude: "Such a test is not possible if the theory is unrestricted." Sandroni and Shmaya (2014) describe testing that "relies on a priory [sic] assumptions on how the data might be produced."
- **So the stated aim already has a published answer.** The aim, "to say what the relativity is relative to", is answered by this work: it is relative to the restricted class. The thesis's second clause restates Kavaler and Smorodinsky's Theorem 5, which I checked. The paper never locates what it adds against these works.

**2. The headline formal claim is either borrowed or false for unbounded records (Criteria 7, 4).**

- **The counterexample.** Sandroni and Shmaya, "A Prequential Test for Exchangeable Theories" (*J. Dynamics and Games* 2014; arXiv:1305.4421), Theorem 1: for the class of exchangeable processes, which is closed under mixture, there is a prequential test that passes the truth with probability 1 and is strongly non-manipulable. The authors draw the moral themselves: the infinite-horizon impossibility "does not hold for convex and compact paradigms."
- **Which claims it contradicts.** By the paper's own standard of success (a test that cannot be ignorantly passed, which is what its i.i.d. example is shown to meet), this contradicts:
  - the abstract's "an account on which every mixture of chances is itself a chance certifies no one";
  - §3.1's claim that closure under mixture is "the formal core of the impossibility";
  - §2's verdict that nothing "finite or infinite" built from forecasts actually made escapes, once §3 carries that verdict over to restricted accounts.
- **The slide between two kinds of test.** The paper moves between single-forecaster manipulability (the minimax "engine" of §2) and Kavaler and Smorodinsky's comparison test for two forecasters. Read as a claim about comparison, "certifies no one" is just their Theorem 5. Read as a claim about single forecasters, it is false for unbounded records. On bounded records it is true, but that is Olszewski and Sandroni (2009, MOR), which the paper already cites.
- **Two repairs are available, and the paper makes neither.** It could restrict the thesis to bounded records. Or it could adopt a standard relative to the tester's prior: under that standard, a charlatan who announces the tester's own mixture passes Sandroni and Shmaya's test with prior probability one, while under the i.i.d. account he cannot announce a mixture at all. Either repair changes the thesis.

**3. The metaphysics section, the most original part, is undercut by the paper's own apparatus.**

- **The urn and the coin can be told apart.** The paper says "not even the whole history" distinguishes Pólya's urn from a coin whose unknown bias was fixed once and for all. That uses the unconditional probabilities from before the bias is fixed. But type-I control is defined over the "true conditional chances". Someone who knows the coin forecasts the fixed bias; someone who knows the urn forecasts by Laplace's rule. Those two measures are mutually singular, so by the Kavaler–Smorodinsky criterion the paper itself adopts, an unbounded record tells the two knowers apart. The analogue with Earman and Roberts fails as stated.
- **The examples of mixtures that simplicity might allow are harmless by the paper's own test.** The paper offers the Laplace rule and statistical-mechanical chances. Both are continuous mixtures, and a continuous mixture is singular with respect to each of its components; §3.2 says exactly this about Laplace's prior. So on unbounded records they pose no obstacle. Any threat they pose is about rates on finite records, which §4 does not analyse.
- **Horn two of the dilemma does not follow.** Excluding mixtures is weaker than pairwise singularity, so it does not follow that best-system knowers "can in principle be told apart".
- **The obvious propensity reply is not addressed.** A propensity theorist will say that chances are relative to kinds of set-up, and that physics restricts them: coins are i.i.d., urns are urns. The paper claims the asymmetry between the two views is "a new epistemic consideration". That needs this restriction to be unavailable to the primitivist but available to the Humean, and nothing argues it.

## Key strengths

- **The Stewart case (§3.3) is sharp and correct.** I checked it against Stewart's definition of ε. Forecasting one half every day out of certainty in a fair coin gives ε = 1; doing it out of uniform uncertainty over deterministic sequences gives ε = 0. The forecasts are identical but the verdicts about who counts as a knower are opposite. This cleanly shows that certification depends on how uncertainty is carved into chance hypotheses, not on credence alone.
- **"The record as textbook" (§3.2) is a good framing.** It gives the sincere forecaster a precise place: he is bounded at 1/w against a learner whose prior gives the truth weight w, and against a diffuse prior the margin grows only like √n per parameter. It also connects the novice/expert problem to results on merging of opinions.
- **The question about primitive chance looks new.** The paper recasts Lewis's "I don't begin to see" as a question about whether knowledge of primitive and of best-system chance can be tested. As far as my searches show, nobody has asked this before, and philosophers of chance generally would care about it.
- **§5 draws two useful distinctions.** It separates discrediting a forecaster from crowning one, and it uses calibeating to show that where a forecast came from is a fact the record does not contain. Both are accurate and both support the institutional norm.

## Key weaknesses

- **"Account" does three jobs.** It is the set of processes over which type-I control is required (§3.1), a carving of the reader's credence into chance hypotheses (§3.3), and a baseline learner (§3.2). The §3.2 margin (the 1/w bound and the √n rate) depends only on the learner's predictive measure, not on any carving. So "choosing the baseline is choosing an account" moves between senses.
- **The best-system standard is assumed, not argued.** §4 calls the New Principle standard "the fair analogue" without argument. On the best-system view the complete history fixes the chances, so certification on infinite records is close to trivial. The case that matters, finite records, is not treated.
- **The novice section is mostly borrowed and partly overstated.** Its positive proposal, a performance-weighted mixture with a bound on log-loss regret, is Herrmann's (2022), who is cited in a parenthesis; the paper's own addition is one sentence. It asserts without argument that the positive results "certify exactly something of that comparative shape" as total trust (Dorst et al.). A Stewart pass, which shows only that the forecaster beats the tester's likelihood, does not establish total trust.
- **The objections section is thin.** It has four short paragraphs. Each one closes off an objection in two or three sentences, mostly by pointing back to an earlier section, where a real reply is needed.

---

*Sources checked for priority and accuracy:*
- [Kavaler & Smorodinsky, arXiv:1710.09461](https://arxiv.org/pdf/1710.09461v2): Thm. 5 and Prop. 1 confirmed.
- [Sandroni & Shmaya, arXiv:1305.4421](https://arxiv.org/pdf/1305.4421v1).
- [Al-Najjar et al. 2010, JET](https://ideas.repec.org/a/eee/jetheo/v145y2010i6p2203-2217.html).
- [Olszewski handbook chapter](https://faculty.wcas.northwestern.edu/wol737/Hand.pdf).
- [Stewart working paper](https://www.economics.utoronto.ca/public/workingPapers/tecipa-360.pdf): ε and the remark about ambiguity aversion confirmed.
- [Lewis 1994](https://mail.joelvelasco.net/teaching/3865/lewis%2094%20-%20humean%20supervenience%20debugged.pdf): pp. 479 and 484 confirmed.
- [Levy 2025](https://link.springer.com/article/10.1007/s10670-024-00794-8): quotation confirmed, page number not checked.
- [Schwarz, "Best System Approaches"](https://www.umsu.de/papers/bsa.pdf): the description-length gloss is fair.
- [Herrmann 2022](https://link.springer.com/article/10.1007/s11229-022-03809-5).
- I could not access the full text of Al-Najjar and Weinstein (2008), so the p. 555 quotation and the §6 attribution are unverified. The published abstract does support the gist of the reducibility point.
