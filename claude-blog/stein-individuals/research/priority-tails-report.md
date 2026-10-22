# Priority check: "treating someone as an individual" as bounded-influence (outlier-prone) priors

## 0. Bottom line

- **The statistics is not new, and it has been written up repeatedly.** This covers three claims:
  - Normal hierarchical shrinkage is unbounded and pulls the exceptional back the most.
  - Heavy-tailed priors bound that pull (limited translation) or make it vanish (prior rejection).
  - This protects "individual components" and "the exceptional".

  The key sources are Efron & Morris 1971/72/75, Dawid 1973, O'Hagan 1979/1990, Pericchi & Smith 1992, Pericchi & Sansó 1995, Fúquene, Cook & Pericchi 2009, Efron 2010, O'Hagan & Pericchi 2012, and Pericchi & Pérez (circulated 2011, arXiv 2025, NEJSDS 2026).
- **Statisticians already use loose normative words for this.** Examples:
  - Pericchi & Pérez: "unfair 'pulling down'" of hospitals; "myopic to the exception".
  - Efron 2010: Clemente "is learning too much from the experience of others".
  - Giacomini, Lee & Sarpietro: "tyranny of the majority".
  - COPSS-CMS 2012: "unfair to move their SMRs".

  None of them connect it to treating people as individuals, moral encroachment, profiling or the rule of consideration.
- **Philosophers have already put moral encroachment into the prior.** Johnson King & Babic 2020; Babic & Johnson King 2023; Y. Liu, *Synthese* 2026. Liu & Liang 2020 tie "respecting individuality" to giving individualized evidence priority over the population prior. None of these use tail shape, bounded influence or the individual's own record against a group prior.
- **I found no work that identifies treating-as-an-individual (or Moss's rule, or moral encroachment) with a tail or bounded-influence condition on the prior.** Nor did I find any philosophical argument that normal priors wrong the exceptional because shrinkage grows with distance from the mean. That linkage looks new. The statistical premises must be credited to the statisticians.

---

## 1. Priority verdict: everything that anticipates part of the thesis

### A. Statistics and econometrics (anticipate the formal core)

1. **Efron & Morris 1971, 1972** (JASA 66:807–815; 67:130–139) and **Efron & Morris 1975** (JASA 70:311–319). They introduced "limited translation estimators" to stop shrinkage moving any one component too far. Quotes from the 1975 paper:
   - p. 313: "Stein's estimators achieve uniformly lower aggregate risk than the MLE but permit considerably increased risk to individual components of the vector θ."
   - Under limited translation, each component's estimate must "not differ from X_i by more than" a fixed number of standard deviations.
   - "Clemente (i = 1) was known to be an exceptionally good hitter from his performance in other years. Limiting translation results in a much better estimate for him."
   - p. 318: "the limited translation modification protects individual components."

   This anticipates the "bounded pull" idea. It is frequentist and empirical Bayes, with no normative framing.

2. **Efron 2010**, "The Future of Indirect Evidence", *Stat. Sci.* 25:145–157, §5. He names the "Clemente problem":
   > "James–Stein estimation is not an unmitigated blessing. Low total squared error can conceal poor performance on genuinely unusual cases. Baseball fans know from past experience that Clemente was an unusually good hitter, who is learning too much from the experience of others by being included in a cohort of less-talented players. I'll call this the Clemente problem…"

   In §8 he treats it as a question of relevance: "where is the relevant indirect information?"

3. **Pericchi & Pérez**, "Limiting the Shrinkage for the Exceptional by Objective Robust Bayesian Analysis: the 'Clemente Problem'". The arXiv version (2506.10114, posted June 2025) is dated "September 2011". It is now published in *New England J. Stat. in Data Science* (2026), doi 10.51387/26-NEJSDS106, online 8 July 2026, so your brief's "2025" should be updated. **This is the closest anticipation of thesis part (b).**
   - They frame the problem as direct "individual data" versus indirect "group data", and ask: "Wouldn't it be reasonable to weight less the common indirect evidence, when there is reason to believe that the individual is exceptional?" (§1.1)
   - They diagnose: "the usual method shrinks a fixed proportion to all players… It does not make any exception… the potential influence of indirect evidence is unbounded… the procedure is 'myopic' to the conflict between the bulk of the data and the individual." (§1.3)
   - They prescribe "priors of heavy tails which make more probable the exceptional."
   - They link it to dogmatism: "the Clemente problem is closely related to the implicit dogmatism inherent, not in Bayes in general, but in 'Conjugate Bayes with Square Loss'."
   - Their one explicit fairness remark (§6): "the unfair 'pulling down' of hitherto perfect score hospitals in hospital profiling, just because there are a couple of hospitals with bad performance… Shrinkage is a good thing, but non-robust methods yields too much of a good thing."
   - They do **not** discuss persons, discrimination, or treating people as individuals.

4. **Fúquene, Cook & Pericchi 2009**, *Bayesian Analysis* 4:817–846.
   - "conjugate priors may lead to a dogmatic analysis while robust priors promote self-criticism"
   - "as the location prior/data conflict |µ − x̄| grows, so does |µn − x̄| and without bound"
   - "the hierarchical model should [use] robust priors in the hierarchy to prevent unbounded and undesirable shrinkages"
   - Under prior–data conflict "the prior acts 'as if' it were uniform."

5. **O'Hagan & Pericchi 2012**, *Brazilian J. Prob. Stat.* 26:372–401, abstract verbatim (from O'Hagan's site):
   > "Traditional Bayesian models based on normal distributions or other conjugate structures typically resolve conflicts by centring the posterior at some compromise position… Bayesian modelling with heavy-tailed distributions has been shown to produce more reasonable conflict resolution, typically by favouring one source of information over the other. The less favoured source is ultimately wholly or partially rejected as the conflict becomes increasingly extreme."

   No fairness content.

6. **Giacomini, Lee & Sarpietro**, "Individual Shrinkage for Random Effects", arXiv 2308.01596 (v3). Econometrics.
   - "While effective in improving aggregate performance, these methods may lead to inaccurate individual decisions… overcome the 'tyranny of the majority'."
   - "JS… applies the same degree of shrinkage to all units, which can induce large bias for outliers."
   - Applications named: teacher dismissal, hospital reward.
   - Their remedy is individual-specific weights, not heavy-tailed priors, though gains grow with the tail heaviness of the random effects.

7. **COPSS-CMS White Paper**, "Statistical Issues in Assessing Hospital Performance" (Ash, Fienberg, Louis, Normand, Stukel, Utts; 2011, revised 2012).
   - §6: "if some low-volume hospitals perform well, it would be unfair to move their SMRs too far towards a single, low-volume hospital target."
   - It notes basic random-effects estimates "have less ability to detect exceptional facilities".
   - It recommends "replacing the single Gaussian prior distribution for the hospital-specific random effects"; Appendix H covers low-degree-of-freedom t priors.
   - The fairness worry there concerns low volume and shrinkage targets, not tails as such.

8. **Wainer 2000**, "Kelley's paradox", *Chance* 13(1):47–48 (Crossref title "Visual Revelations").
   - Kelley's formula t = ρx + (1−ρ)μ_group regresses an individual's score toward their group's mean.
   - Wainer defends it against affirmative-action intuitions: a "Striver" who scores 1000 is "probably… someone who really performs at 950."
   - This is the normal linear-shrinkage form of statistical discrimination the thesis targets. No tails discussed.

The standard Phelps model is normal–normal: E(p|θ,j) = [σ_j²/(σ_j²+σ_εj²)]θ + [σ_εj²/(σ_j²+σ_εj²)]μ_j (Onuchic survey, arXiv 2205.05994, eq. 1). I found **no** economics work analysing statistical discrimination with heavy-tailed priors so that group membership stops mattering for extreme signals.

### B. Moral encroachment or individuality put into priors (philosophy; anticipates the "priors" framing, not the tails)

9. **Johnson King & Babic 2020**, "Moral Obligation and Epistemic Risk", *Oxford Studies in Normative Ethics* 10:81–105. I did not read it directly; this account is from Babic & Johnson King 2023 §4 and the HKU abstract.
   - Their claim is that "a standard Bayesian view simply is a moral encroachment view."
   - Priors are chosen from the agent's epistemic-risk function, using asymmetric scoring rules.
   - The model is Beta–Binomial on a **group proportion θ**. The prediction for "a new individual" is the posterior mean (α+t)/(α+β+n), with **no individual-level evidence**.
   - Moral concern lowers α. Larger α+β means the prior "will shift more slowly in response to new evidence."
   - Aim: "a weighted prior that makes her correspondingly less sensitive to statistical evidence suggesting that certain individuals are more likely… to possess socially disvalued traits based on their membership in groups."
   - The mechanism is prior location and concentration on a conjugate model, not tail shape. It anticipates "moral encroachment = prior choice", not bounded influence.

10. **Babic & Johnson King 2023**, "Moral Encroachment under Moral Uncertainty", *Philosophers' Imprint* 23 (doi 10.3998/phimp.2073).
    - Adds a hierarchical layer: truncated-normal hyperpriors on α and β, plus a misclassification-noise layer (η, λ).
    - They paraphrase Moss: "we should keep in mind the possibility that individuals can be exceptions to accurate statistical generalizations."
    - They argue Moss's view only works by "effectively ignoring half of the source of the uncertainty."
    - No tails and no individual records.

11. **Babic, Gaba, Tsetlin & Winkler 2024**, "Normativity, Epistemic Rationality, and Noisy Statistical Evidence", *BJPS* 75(1):153–176. **Johnson King & Babic 2026**, "On the Epistemic Significance of Noise", *Oxford Studies in Epistemology*, pp. 140–165.
    - With big data the Johnson King & Babic prior is swamped; misclassification noise "drastically reduces statistical evidence's probative value."
    - This bounds how strongly **group statistics alone** can support a credence. It is a cousin of bounded influence, but on a different object: there is no individual record and no tail condition.

12. **Yumin Liu 2026**, "Prior adjustments and moral encroachment on credences", *Synthese* 208:119 (doi 10.1007/s11229-026-05770-z, CC-BY).
    - "moral influences on credence operate through priors."
    - Agents raise the prior credence for the morally salient individual and rebalance others to keep probabilism.
    - "assess individuals on the basis of evidence connected to their particular traits, rather than treating them merely as interchangeable members of a demographic group… preventing credences from being unduly shaped by potentially harmful demographic statistics" (p. 19).
    - Discrete point credences, no tails, no likelihood-versus-prior conflict.

13. **Liu & Liang 2020**, "What it means to respect individuality", *Phil. Studies* 178:2579–2598. A philosopher and a statistician. **This is the closest philosophical anticipation of "the individual's record should dominate".**
    - §3: "respecting individuality also requires that, other things being equal, individualized evidence be prioritized over non-individualized evidence."
    - Bayesian gloss: "most Bayesians tend to adopt the objective Bayes theory, which aims to minimize the prior impact and weigh the data point much higher than the population prior" via "non-informative prior[s]".
    - fn 8: "high-quality individualized evidence is prioritized in Bayesian practices."
    - fn 10 cites Moss's rule (p. 221).
    - Their remedy is a flat or diffuse prior for everyone. Pericchi & Pérez explicitly argue that this is not the fix: inflating the prior variance cuts shrinkage "to all batters in equal proportion, even to those who are not exceptional." Nothing about tails or extremeness.

### C. Conceptual anticipations (no formal model)

14. **Eidelson 2013**, "Treating People as Individuals", in Hellman & Moreau (eds.), *Philosophical Foundations of Discrimination Law* (OUP), ch. 10. Page range not verified; quotes are at printed pp. 206, 216, 224.
    - "(Character Condition) X gives reasonable weight to evidence of the ways Y has exercised her autonomy in giving shape to her life…"
    - "one ought not to discount information that (1) appears to reflect a person's autonomous choice and (2) is not less available or less probative than other information that one does take into account."
    - His "Discounted Performance" case (Sally's audition reinterpreted through ethnicity and sex) is a group prior overriding an individual record. No quantitative bound.

15. **Smartt 2022**, "Reconsidering the Rule of Consideration", *Episteme* 19:303–318.
    - §4.2 (manuscript p. 24): one can "diachronically remain open to the possibility that the individual is an exception by being disposed to update your attitude in light of new evidence."
    - This is an important foil. A normal-prior updater has that disposition yet never lets an extreme record show through. The thesis gives a precise sense in which mere updatability is not enough.

16. **Cen & Raghavan 2023**, "The Right to Be an Exception to a Data-Driven Rule", *MIT Case Studies in Social and Ethical Responsibilities of Computing* (arXiv 2212.13995).
    - A decision-maker "should only apply the rule if they have exercised due care and due diligence".
    - Three factors: individualization, uncertainty, harm.
    - No priors, shrinkage or tails.

17. **Gardiner 2018**, "Evidentialism and Moral Encroachment", in McCain (ed.), *Believing in Accordance with the Evidence* (Springer), pp. 169–195.
    - "a person might differ from arbitrary members of their relevant reference classes" (§4).
    - Demographically based belief should be "a working hypothesis, or tentative belief, one that could be easily dislodged" (§6).
    - Qualitative only.

### D. Checked, no anticipation of the tail or bounded-influence idea

- **Moss 2018 PAS; Probabilistic Knowledge ch. 10; Moss 2022 OSE.** Rule of consideration and resilience of individual-trait possibilities; see §3 below.
- **Munton 2019.** Projectability; explicitly brackets application to individuals.
- **Bolinger 2020.** Strength rather than probability threshold; credence proportional to statistics is fine.
- **Others:**
  - Basu 2019: no formal model.
  - Fritz 2020: moderate versus radical encroachment.
  - Bolinger 2020 "Varieties": a taxonomy; abstract only.
  - Beeghly 2018: abstract only; full text unavailable.
  - M. Smith 2025 (*Phil Studies* 182:3247–3267): normic theory, rejects moral encroachment.
  - Cao, Kleiman-Weiner & Banaji 2017: empirical "base rate intrusion".
  - Lum, Dunson & Johndrow 2022 (*JRSS A*): individual random effects in risk assessment, normal priors only.
  - Eva 2024 (*JAIR*): Lipschitz individual fairness and base-rate tracking.
  - Chambers & Echenique (Phelpsian characterization).
  - Marley 2023 (MA thesis).
- **Not read in full:** Lippert-Rasmussen 2011 (*J Ethics* 15:47–59), Vassend, Sober & Fitelson 2017 (*EJPS* 7:411–433, on Stein's paradox), Pace 2011, Schroeder, Kim. My searches turned up nothing tying any of them to tails or robust priors.

---

## 2. The statistical facts, stated precisely

**Setup.** Observation x | θ ~ N(θ, σ²); prior π centred at the group location M. The posterior-mean identity is E[θ|x] = x + σ²·(d/dx) log m(x), where m is the prior predictive. This is Efron 2010 Lemma 1 (eq. 15, σ = 1: "E{µ|z} = z + f′(z)/f(z)"); see also Efron 2011, "Tweedie's formula and selection bias", JASA 106:1602–1614. So shrinkage |E[θ|x] − x| is governed by the tails of m, and hence of the prior.

**Normal prior N(M, τ²).**
- E[θ|x] = x − [σ²/(σ²+τ²)](x − M). Shrinkage equals c·|x − M|: linear and unbounded.
- Pericchi & Pérez eq. (4): "E(µi|xi) = xi + 1/(1+σ0²)(M − xi)… all batters either exceptional or average are shifted to the mean of the means M a fixed proportion c… so the shrinkage is c·|M − xi|. That is the 'Clemente Problem'."
- They also say: "With a Normal prior the shrinkage grows linearly without bound."
- In the Phelps model the gap between two groups for the same signal is constant in the signal: σ_ε²/(σ²+σ_ε²)·(μ_A − μ_B). Even the most exceptional record never escapes it.

**Dawid 1973**, *Biometrika* 60:664–667. Full text paywalled; this is from the abstract and summaries.
- One observation, location parameter, x → ∞.
- One set of conditions gives posterior → prior. The example is a normal prior with Student-t error, so the observation is rejected.
- The dual conditions give a posterior that is "asymptotically fiducial", i.e. the prior is rejected, when the prior has the heavier tail.

**O'Hagan 1979**, *JRSS B* 41:358–367. From the published summary.
- Extreme observations are rejected automatically when the data distribution is heavy-tailed, whatever the prior.
- The normal is "outlier-resistant": rejection never happens.
- Under the t, any admissible procedure "will effectively ignore extreme outlying observations".
- This is about the *data* distribution. The prior–data version is O'Hagan 1990, "Outliers and credence…", JASA 85:172–176: the source with heavier tails (lower "credence") is the one discounted.

**Andrade & O'Hagan 2006**, *Bayesian Analysis* 1:169–188.
- Gives regular-variation conditions "to reject the conflicting data or the prior distribution in favour of the other source of information."
- The general rule: in a conflict, the heavier-tailed source is discarded.
- So for her record to win, the prior's tails must be heavier than the noise in her record. That matches your formulation.

**Pericchi & Smith 1992**, *JRSS B* 54:793–804. Full text paywalled.
- Exact first and second posterior moments for a normal location parameter: double-exponential prior exactly, Student-t approximately.
- Pericchi & Pérez cite it for: with a double-exponential prior "the posterior expectation become essentially a 'limited translation estimator'… The influence of the overall mean M is bounded and monotonic." With a Cauchy prior the posterior mean "is not monotonic" and "the prior is progressively discarded in favor of the MLE."

**Pericchi & Sansó 1995**, *Biometrika* 82:223–225. From the abstract.
- Contrasts Dawid's "bounded and vanishing influence" with priors and likelihoods having "bounded but nonvanishing influence on posterior moments." The latter is the double-exponential, limited-translation case.

**Pericchi & Pérez: Clemente numbers** (transformed batting-average data; empirical-Bayes models).
- Clemente's first 45 at-bats gave .400; the rest of his season was .346.
- Normal empirical Bayes predicts .290; the Cauchy prior predicts "a more respectful 0.314".
- Overall MSE improves: the Cauchy model is 0.99× the normal model's, the Cauchy-scaled-Beta2 models 0.93×.
- Caveat they note themselves: robust priors "give more shrinkage near the center than the Normal."

**My own numerical check (not from the literature).** σ = 1; priors centred at 0 with quartiles matched to N(0,1). Entries are shrinkage x − E[θ|x].

| x | Normal | Laplace (DE) | t₄ | Cauchy |
|---|---|---|---|---|
| 1 | 0.50 | 0.51 | 0.51 | 0.57 |
| 2 | 1.00 | 0.86 | 0.93 | 0.91 |
| 4 | 2.00 | 1.03 | 1.20 | 0.62 |
| 8 | 4.00 | 1.03 | 0.65 | 0.26 |
| 20 | 10.0 | 1.03 | 0.25 | 0.10 |
| 40 | 20.0 | 1.03 | 0.13 | 0.05 |

- Laplace with scale b: monotone, capped at σ²/b.
- Student t_ν: decays like σ²(ν+1)/|x − M|.

Group gap for the same x, comparing group means 0 and −1:
- Normal: 0.50 at every x.
- Laplace: falls to about 0 once x is above both centres.
- Cauchy: becomes **negative** at intermediate x (−0.17 at x = 4), then goes to 0. This is a reversal effect worth flagging.

**Caveats for the paper's wording.**
- *Distance versus precision.* "Sufficiently strong individual evidence always shows through" holds even for normal priors if "strong" means precise (σ → 0). The distinctive claim must be about extremeness, |x − M| → ∞ with σ fixed.
- *Bounded versus vanishing pull.* Bounded-but-nonvanishing pull (Laplace) and vanishing pull (polynomial tails such as t or Cauchy) are different properties. "Bounded influence / limited translation" names the first; "shows through" suggests the second.
- *"Outlier-prone".* O'Hagan coined this for data distributions. For priors, phrase it as "tails heavier than the likelihood" (lower credence).

---

## 3. Philosophical sources' key formulations

**Moss.**
- The rule, in "Moral Encroachment", *PAS* 118 (2018):177–205, §III, quoting *Probabilistic Knowledge* (2018) p. 221: "[I]n many situations where you are forming beliefs about a person, you morally should keep in mind the possibility that they might be an exception to statistical generalizations." The PK chapter is ch. 10, "Knowledge and persons".
- What it requires (PAS §III): "The rule of consideration is not an epistemic norm. But it does have epistemic consequences." Further: "As long as the clerk is abiding by her moral obligations, she will pay attention to certain possibilities that she cannot rule out." Those possibilities become relevant alternatives, so the probabilistic belief fails to be knowledge whether or not it is justified.
- She grants that statistics "could in principle raise or lower the evidential probability" for a group member.
- Thesis restriction: "moral encroachment merely affects the epistemic status of risky beliefs."
- **So the rule works at the level of knowledge and relevant alternatives, not credence.** The thesis's "credal counterpart" is a reinterpretation and should say so.
- In "Knowledge and Legal Proof" (*OSE* 7, 2022, pp. 176–213), §3.4: the defendant raises the possibility "that he is an individual, not represented by features of the group to which he belongs."
- Same paper, §3.5: "possibilities are resilient, including the possibility that the defendant has individual traits that would undermine any alleged probative value of statistics having to do with racial categories… Jurors are not morally compelled to assume that certain statistical inferences are in fact misleading, but only that they might be misleading."
- She quotes Wasserman 1991: "it ignores the defendant's capacity to diverge from his associates or from his past, thereby demeaning his individuality."

**Munton**, "Beyond accuracy", *Phil. Issues* 29 (2019):228–240.
- Abstract: "Statistical beliefs are accompanied by an implicit representation of the statistic's modal profile. Their modal profile determines the circumstances in which they can legitimately be projected to unobserved instances."
- "The problem of projectability is the problem of when it is legitimate to project a statistic onto a novel instant that falls under the description used to initially characterize the set in question."
- "Responsible projection, then, requires some representation of the modal profile of the statistic."
- She explicitly brackets individuals: "None of our thinkers are yet applying these statistics to a particular individual. It may be that there are additional epistemic problems that arise at that stage (see Moss (2018), Bolinger (2018))."
- Conclusion: "There will be further epistemic flaws that arise when we apply a statistical generalization to an individual."
- Her "exceptions" (an imported Croatian Dalmatian; a garden sprout that is not a bonsai) are instances outside the statistic's causal or modal domain, not individuals with countervailing records.

**Bolinger**, *Synthese* 197 (2020):2415–2431.
- fn. 8, p. 2419: "standard pragmatic encroachment proposals remain thoroughly probabilistic… I advocate modeling the demand not as a difference in probability threshold, but strength: you need evidence that can function to dismiss a salient error possibility, and even extremely high probability generalizations often can't play this role."
- p. 2422: generalizations "don't directly license her to discard ¬p."
- p. 2421: after acceptance "a much smaller pool of possible evidence is capable of making S attend to these possibilities."
- Appendix, pp. 2430–2431: "Some (including Moss) argue that when anticipating the properties of autonomous agents, we must always be sensitive to the fact that A may choose to act differently from others in the reference class." Also: "It seems morally and epistemically permissible to increase your credence in proportion with your (properly justified) statistical evidence."
- This sits in direct tension with a credal-level reading.

**Others** (quoted in §1): Johnson King & Babic, Liu & Liang, Y. Liu, Eidelson, Smartt, Gardiner, Cen & Raghavan.

---

## 4. What, if anything, is new

**Not new — cite, don't claim:**
- That normal or conjugate shrinkage is unbounded and pulls the exceptional most, while Laplace or t priors bound or remove the pull (Efron–Morris through Pericchi–Pérez).
- The casual normative gloss in statistics: "protects individual components", "unfair pulling down", "tyranny of the majority", "dogmatic", "myopic to the exception".
- Moral encroachment as a choice of prior (Johnson King & Babic 2020; Y. Liu 2026).
- Respecting individuality as giving the individual's evidence priority over the population prior (Liu & Liang 2020; Eidelson 2013, informally).
- Noise bounding the force of statistical evidence (Babic et al. 2024; Johnson King & Babic 2026).

**Apparently new — nothing found anticipating these:**
1. Analysing "treating her as an individual" as a constraint on the *tail shape* of the prior relative to her noise, i.e. bounded or vanishing influence of the group prior on her assessment, rather than on its location, concentration or diffuseness.
2. Moral stakes requiring outlier-prone priors. This makes tail shape the locus of moral encroachment, which differs from Johnson King & Babic's α/β and Liu's prior adjustment. Unlike Liu & Liang's flat priors, it keeps group information for typical cases.
3. A credal-level counterpart to Moss's rule. This is a substantive departure from Moss, whose rule is "not an epistemic norm" and works through knowledge, and from Bolinger's endorsement of proportional credence.
4. The reply to Smartt: disposition to update is insufficient, because normal-prior updaters never let an extreme record show through.
5. Recasting thin-tailed practice (Phelps/Aigner–Cain, teacher value-added, hospital ratings, empirical-Bayes/Stein shrinkage) as a failure of individualization that falls hardest on the exceptional. One corollary I computed myself and found nowhere in print: heavy tails make the group-membership gap vanish for extreme records, where Phelps's gap is constant.

**Points the paper needs to handle:**
- Distance versus precision; bounded versus vanishing influence (see §2 caveats).
- Robust priors shrink *typical* individuals more than normal priors do (Pericchi–Pérez).
- Cauchy-type priors are non-monotone and can reverse the group gap (my computation).

---

## Access limitations

- **Statistics papers not read in full** (paywalls and bot protection): Dawid 1973, O'Hagan 1979, Pericchi & Smith 1992, Pericchi & Sansó 1995, and O'Hagan & Pericchi 2012 apart from its abstract. Their results above rest on abstracts and published summaries, statements in Pericchi & Pérez, Fúquene, Cook & Pericchi and Gagnon (arXiv 2110.09556), and my own numerical check.
- **Philosophy papers not read in full:** Johnson King & Babic 2020 (known via Babic & Johnson King 2023 and the HKU abstract); Moss PAS (read through WebFetch only; exact page of the rule within pp. 177–205 not obtained); Beeghly, Lippert-Rasmussen, Vassend et al.
- PhilArchive refused direct downloads; some items were read through WebFetch, which limits verbatim quotes to short fragments.
- All citations above were checked on Crossref unless marked.

**Files** (all in /tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/pc/):
- Downloaded texts: clemente.txt, nejsds_text.txt, efron2010.txt, em_b.txt, fcp2009.txt, gls.txt, munton_l.txt, unito.txt (Bolinger), moss_klp.txt, babic_jk_2023.txt, liu.txt, yliu.txt, eidelson.txt, smith2025.txt, wainer2000.txt
- Computation scripts: scripts/postmean.py, scripts/groupgap.py