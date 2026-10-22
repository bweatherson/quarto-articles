# Advisor memo, round 3: "Not Like the Others" (idea memo v3)

## Verdict: (A). Do not draft this, and drop the subject.

I do not see a paper on Stein shrinkage and treating people as individuals that would get past these judges. The reasons:

1. **The coupling is textbook, and the stereotyping version has already been modelled.**
   - Both halves of "pull = push" are in *Bayesian Data Analysis* (3rd ed., §17.1 and §17.4). That includes the mixture/responsibility version, which BDA states almost in the memo's words (quoted in §1).
   - Gershman & Cikara (2023) formalise Allport's "refencing" as Bayesian subtyping. In their words: "stereotyping and group assignment are two aspects of a single process". Lu & Lin (2026) find that ideal observers "attribute counterevidence to individual differences rather than updating group stereotypes".
2. **The normative tension between (I) and (R) is old, and it has been argued as a question of what to do.**
   - Allport's re-fencing device just *is* "admitting exceptions" in order to keep the generalisation.
   - The contact-hypothesis literature has argued since 1984–86 about whether to treat outgroup members as individuals (Brewer & Miller's decategorisation) or as representatives of their group so that attitudes generalise (Hewstone & Brown). The standard criticism of decategorisation: if it succeeds, "the generalization of positive attitudes to the outgroup as a whole is impeded".
   - Pettigrew (1998) resolves the tension by a temporal sequence: individuate first, make group membership salient later. That is your "decoupling" horn in another form.
   - Pettigrew's "ultimate attribution error" (1979) lists "exceptional case" as a standard way of explaining away a counter-stereotypical outgroup member.
   - So the corollary ("individuating the exceptional is partly constitutive of keeping the stereotype") is Allport, Hewstone & Brown, and Rothbart & John.
3. **The trilemma as stated is either trivial or false.**
   - Read exactly, (O) means no learning at all. Read in degrees, coherent models satisfy all three to a high degree, including the Huber column of your own table.
   - Your own numbers also put "pioneers pay" in the wrong horn. Normal empirical Bayes violates (O) *more* than the learned-scope mixture does (§2).
4. **(R) and (O) are contested by the sources the memo cites, or rejected by them.**
   - Begby (2021) and Napolitano (2023) *deny* that failing to yield to counterexamples is the mark of prejudice.
   - (O) is base-rate neglect at the level of the group's spread. It is rejected by Lippert-Rasmussen's "use all your information" account of treating people as individuals, and by Eidelson's account, which "coincides with demands of epistemic rationality".
   - Both points trigger failure mode (d) (resting on contested intuitions).

**Predicted marks.** A formal judge reads "BDA ch. 17 plus Tweedie, with a normative label": EXPECTED. A value theorist who knows the contact literature or Allport reads "re-fencing, restated": EXPECTED. One who does not may say "interesting but contested (Begby)". I put "surprising" below 10%.

---

## 1. Priority

| Memo's claim | Where it already is | Residue |
|---|---|---|
| **Pull = push (location model).** Huber/Laplace caps both; t/Cauchy makes both vanish. | **Gelman et al., *BDA3* §17.1** (p. 435): a normal population model lets one outlying school strongly affect inference for all the others, so a heavy-tailed population model is used. **§17.4** (p. 441): the normal model "causes the most extreme estimated school effects to be pulled too much toward the grand mean", and the largest effect "may be exerting undue influence on estimation of the population variance". **Seltzer 1993** (*JEBS* 18:207): t level-2 errors downweight "extreme cases" in the fixed effects. **O'Hagan & Pericchi 2012** (conflict resolution). **The exact identity** (Tweedie plus the ML-II score as an M-estimator) is a two-line observation. | The exact proportionality, which is folklore. Credit it; do not build on it. |
| **Mixture/EM version.** "The degree to which she is assessed as typical is the degree to which she counts as evidence about the typical." | **BDA3 §17.1** (p. 436): a long-tailed model means the outlier is interpreted "as arising from an extreme draw from the long-tailed distribution rather than as evidence that the normal distribution of effects has a high variance", and is "shrunk … not nearly as much". Mixture models "not only result[] in categorizing extreme observations as arising from high-variance mixture components … but also impl[y] that these points have less influence on inferences for estimands such as population means". **Gershman & Cikara 2023** (*PBR* 30:1273): "stereotyping and group assignment are two aspects of a single process"; subtyping is "a formalization of 'refencing' as proposed by Allport"; "too much atypicality will result in subtyping and therefore zero stereotype shift" (p. 1290, in their "applied implications"; verbatim from the PDF). **Lu & Lin 2026** (CogSci; hierarchical Bayes). | None in the formal content. |
| **(I) and (R) are standardly allies, and they conflict.** | **Allport 1954, ch. 2**: re-fencing is the device of admitting exceptions so that the generalisation stays intact. Verify the exact wording and page; the archive.org scans are restricted. **Contact theory:** Brewer & Miller 1984 (decategorisation: interact "as single individuals") against Hewstone & Brown 1986 (keep group salience, or there is no generalisation). Summarised in Vezzali, …, Hewstone 2023 (*GPIR* 26:1181): if decategorisation succeeds, "the generalization of positive attitudes to the outgroup as a whole is impeded". **Typicality:** Wilder 1984, "Intergroup contact: the typical member and the exception to the rule" (*JESP* 20:177); Rothbart & John 1985 (*J. Soc. Issues* 41:81); Rothbart 1996: strong disconfirmers are "functionally isolated"; moderate ones change stereotypes more. Kunda & Oleson 1997 find the same. That is redescending influence, observed. | What remains is to put it as a conflict between two *norms on assessors* (epistemic or moral) rather than between two intervention strategies. That distinction is real but thin; a judge will see a restatement. |
| **Corollary:** "treat people as individuals" is no remedy, and individuating is partly constitutive of keeping the stereotype. | **Allport** (above). **Pettigrew 1979** ("exceptional case"). **Hewstone & Brown 1986.** **Beeghly 2018 §8:** a bigot "could very well succeed in treating persons as individuals, despite stereotyping them". Her mechanism is different (the autonomy conception misses the bigot). Beeghly 2025, ch. 4 ("Failing to Treat Persons as Individuals") and ch. 5 ("Prejudice and the Problem of Statistical Stereotyping") are **unread**: check them before any use. Beeghly 2018 §2.4 and §4 treat *tokenizing* as one form of failing to individualise, which bears directly on your horn 1. | The mechanism (coherence forces it) is new in philosophy only as a gloss on the above. |
| **Pioneers pay; individuality borrowed from predecessors.** | **Induction:** after n conforming members, the posterior weight on exceptions is about 1/(n+2) (Laplace); this is Hume on uniform experience. **Economics:** Tirole 1996, collective reputation (*RES* 63:1); Kim & Loury 2018 (*IER* 59:3: a poor initial collective reputation persists); Komiyama & Noda (bandit learning: "As long as firms only hire majority workers, society cannot learn about the minority group"). **G&C 2023:** as subgroups accumulate, "the expanding diversity of the superordinate group renders it more tolerant of deviants". That is history-dependent treatment of the next deviant. | Only the specific "learned scope" channel. §2 shows the normal model has it too, and more strongly. |
| **Learned scope honours (R).** | **Generics:** a prevalence drop from 99% to 66% leaves "Gs are F" acceptable. That exception-tolerance is exactly what Begby 2013/2021 and Napolitano 2023 say lets prejudice *resist* counterevidence (Leslie 2008/2017 on exception-tolerance). | Against the memo. By the lights of the prejudice literature, horn (3) is the paradigm of resistance, not a way of honouring (R). |
| **Decoupling is limited-translation practice.** | **Efron & Morris 1972 (Part II):** the centre is x̄ and the shrinkage factor comes from the normal-theory S, with the translation then capped. So: full push, capped pull. This part of the memo is accurate. **Modular or "cut" Bayes:** Liu, Bayarri & Berger 2009 (*Bayesian Analysis* 4:119); Plummer 2015 (*Stat. Comput.* 25:37); Jacob, Murray, Holmes & Robert 2017 (arXiv 1708.08719). That is the established home for single-model incoherence adopted on purpose. **Pettigrew 1998** gives a temporal decoupling. | The pairing "LT is a cut, and it is a cut for moral reasons". This would be a footnote, not a paper. |

---

## 2. Is the trilemma true? Precise versions

Setting: known Gaussian noise s²; an exchangeable assessor with θ_i | φ iid π_φ; the assessment is the posterior mean, by full hierarchical Bayes or ML-II plug-in.

**Fact 1 (conditional Tweedie).** E[θ_new | x, D] = x + s²·∂ₓ log p(x | D). The assessment of any new record depends on others' records only through the predictive marginal.

**Fact 2 (pull = push; location family; ML-II).**
- pull_j = s²ψ(x_j − M̂).
- The influence of x_j on M̂ is ψ(x_j − M̂)/Σψ′.
- So bounded pull holds iff bounded single-record push holds, and vanishing pull holds iff vanishing push holds.
- Exact for ML-II; approximately right under full Bayes with a diffuse hyperprior.

**Proposition A (true, elementary).** In location-only models, (I) bounds each record's influence on the centre, in exact proportion to the bound on her pull. Two qualifications:
- **Per-record push is O(1/n) under every model.** Your k = 1 row: one exception moves the normal centre by 0.04 and the Huber centre by 0.00. The exchange rate under normal pooling is pull : push = n·s²/(τ²+s²), which is 25 at your settings. "Tokenism" is then literally "she pays 25 times what the group moves". Also elementary.
- **Aggregate push survives bounded influence.** At k = 10 the Huber centre moves 0.60 against the normal model's 0.78, i.e. 77%. The new member with x = 3 gets 2.03 against 2.30, and her assessment is history-invariant (2.01 → 2.03). **So in your own table the fixed Huber satisfies (I), (O) and about three quarters of (R).** Re-fencing is exact only for redescending models (t, Cauchy, mixtures with responsibility → 0). Huber is *bounded* fencing.

**Proposition B (O is trivial or local).**
- **(O) exactly, for all x,** holds iff p(x | D) = p(x) for all D. That is no learning at all, which entails not-(R). This is the "exchangeability implies others' records matter" objection, and it is correct.
- **(O) on a region A** holds iff no learned hyperparameter enters the predictive score on A.
- It **fails in the transition region** (roughly 1.5–4 marginal sd out) for every model that learns a scale, weight or shape. It **holds approximately in the far tail** whenever the tail shape is fixed and the exception weight is bounded away from 0.

**Escapes from the trilemma.** My runs are in `code/advisor3/escape.py` and `escape.out.txt`, with your setup and 40 reps.

| Model | Pioneer x = 3 (k = 0 → 10) | Pioneer x = 5 (k = 0 → 10) | Centre at k = 10 |
|---|---|---|---|
| Mixture, ML-II ε (yours) | 1.09 → 2.02 | **3.03** → 4.57 | −0.46 |
| Mixture, floor ε ≥ .05 | 1.45 → 2.02 | **4.55** → 4.58 | −0.46 |
| Mixture, full Bayes, ε ~ Beta(1,1) | 1.50 → 2.07 | **4.44** → 4.58 | (E[ε] = .07 at k = 0) |
| Huber with **learned** scale | 1.47 → 2.23 | 3.44 → 4.20 | −0.36 |

What the runs show:
- **Floors and full Bayes satisfy (I), (R) via scope, and (O) in the far tail.** At x = 5 the pioneer gets 4.55 or 4.44, against 4.58 for successors. "Pioneers pay" in the far tail is mostly an artefact of the ML-II estimate ε̂ → 0. Under any prior on ε, it survives only in the transition region.
- **Huber violates (O) as soon as it learns its scale.** Your Huber "keeps (O)" only because its scale was fixed at the oracle value 1.
- **Normal EB is a learned-scope model, with scope = τ².** Exceptions widen τ² and so reduce the pull on later exceptions: 1.00 → 2.30, the largest (O)-violation in your table. So "normal pooling gives up (I)" and "learned scope gives up (O)" are not separate horns. Normal pooling gives up both.
- **No-pooling assessors satisfy all three if (R) concerns the group's members.** Because Σ pulls = 0 at the ML-II centre, the average assessed member equals the raw average under *every* location prior. A finite-population generalisation ("what the group's members are like, on average") is always fully responsive. **(R) must therefore be about the predictive, i.e. the stereotype as applied to the next, unknown member.** The memo never says this, and the dilemma depends on it.
- **A subgroup mixture escapes (R) as well.** In your mixture the exception component is Cauchy(M, 2), centred on the bulk. It is symmetric, so "scope" cannot represent "some members are high". Give the exception component its own location (Gershman & Cikara's subgroup) and the predictive mean of a new member, (1−ε)M + εM_H, responds fully. Individuals still escape, and (O) fails only in the transition region.

**Weakest assumptions under which a precise result holds.** You get Proposition A, plus the fact that learning any spread, scope or weight parameter violates (O) in the transition region. The first is pull = push. The second is induction: base rates of exceptionality are evidence. Neither is a trilemma among independent norms. Note also that **(I) and (O) are not independent**: both are parts of "her assessment should depend only on her own record" (I bears on the centre, O on the scope). So the "trilemma" is the old individualism-versus-statistical-evidence dilemma, plus pull = push.

**"Coherent".**
- ML-II plug-in empirical Bayes, including James–Stein, is not a Bayes rule either; positive-part JS is inadmissible. So horns 1–3 as computed are not "coherent" in the strict sense that disqualifies horn 4.
- Say "single-model" or use full hierarchical Bayes.
- Limited translation fails to be Bayes for *any* prior for a cleaner reason: Gaussian-noise posterior means are real-analytic in x, and LT has kinks. Cite analyticity (e.g. Brown 1986, *Fundamentals of Statistical Exponential Families*). Koenker & Gu's remark ("the corresponding Huber procedure does not" yield a Bayes rule) concerns their Huber procedure. It supports the memo's stronger "not the Bayes rule of any prior" only together with the analyticity point.

---

## 3. The norms and the sources

- **(R) is misattributed.**
  - Begby 2021 is *against* the standard view: Napolitano summarises him as rejecting that the prejudiced person must show "resistance to counterevidence", because generic stereotypes can be rationally sustained despite counterinstances.
  - Napolitano 2023 (*Inquiry*) agrees that the generic form makes prejudice "highly resistant to statistical facts". She relocates the undermining evidence to the *absence of an explanatory relation*, not to counterexamples.
  - See also Kelly 2024 (*Inquiry* 67:2601) and Vinten 2025.
  - Citing Begby and Napolitano for (R) misrepresents them. Their debate makes (R) contested, which is failure mode (d). Building on their exchange is failure mode (c).
  - The subtyping papers (Weber & Crocker; Kunda & Oleson; G&C) are descriptive and state no norm.
- **(O) is not "implicit in 'judged on her own record'"** on the leading accounts.
  - Lippert-Rasmussen's conception tells you to use all reasonably available relevant information, *including* the group's history of exceptions.
  - Eidelson's account coincides with epistemic rationality (pp. 217–18, as advisor 2 found).
  - Only a strict own-record view endorses (O), and that view rejects pooling altogether.
  - A "moral floor" on ε is Moss's rule of consideration read as ε-contamination with a lower bound (Berger & Berliner 1986). That is moral encroachment, and contested.
- **Social forms.**
  - *Tokenism* fits horn 1: Kanter's "assimilation" is pull, her "visibility/symbolism" is push. Hewstone et al. 2006 (*GPIR* 9:509) quote Kanter: tokens' characteristics are "distorted to fit the generalized view".
  - *Re-fencing* fits only redescending models (above).
  - *Pioneers pay* belongs to every model that learns spread, and above all to the normal one.
  - *Decoupling = LT* is apt.
- **Beeghly.** Your corollary is not her conclusion. She argues the failure-to-individualise theory is neither necessary nor sufficient for wrongful stereotyping, and that one can individualise while stereotyping. That overlaps your slogan but not your mechanism. The mechanism belongs to Allport and the contact literature.

---

## 4. Numbers (vii)

- **Every value in the memo's table reproduces exactly** from `code/scope.py` (seed 5, 40 reps). So do "P(typical) .96", advisor 2's −0.84 / −1.09 after 20 records, and the 1.92 / 0.99 pulls with Σ pulls = 0.
- **Errors of reading:**
  1. "Pioneers pay" is attributed to the learned-scope model, but normal EB shows the larger history effect (1.00 → 2.30 against 1.09 → 2.06).
  2. Huber's (O) depends on a fixed oracle scale.
  3. "Huber: centre moves less" is true, but by 0.60 against 0.78, which is not re-fencing.
  4. The protected mixture centre does not help typical members. At k = 10 a new x = −1 is assessed at −0.75 (mixture) and −0.71 (Huber), against −0.81 (normal); the truth is −1.
  5. The three columns differ in what is learned. The normal model learns τ²; Huber and the mixture use oracle bulk scale 1, and the mixture's exception component is fixed and centred on the bulk. So the comparison mixes the model's structure with what is held at the oracle.
- **"Effects modest":** confirmed. Single-record pushes are under 0.05 everywhere. The only large effect is the pioneer's x = 3 assessment, and the normal model produces it as much as the mixture does.

---

## 5. Is any paper on this subject still worth writing?

**No. Abandon Stein / shrinkage plus treating people as individuals.**

- **Three rounds, one pattern.** Each round has offered a philosophical reading of a statistical fact about shrinkage. Each time, both the fact and the reading had an owner in a neighbouring field:
  - Round 1: aggregation and the stand-alone guarantee. Vassend, Sober & Fitelson fn. 27; Hodges–Lehmann; Koenker & Gu.
  - Round 2: tails and bounded incredulity. Pericchi & Pérez; Johnstone & Silverman; Carvalho, Polson & Scott.
  - Round 3: the I/R coupling. BDA §17.1; Gershman & Cikara; Allport; contact theory.
- **Every flank is occupied.** The statistics is seventy years old. The cognitive science has already modelled stereotype change as hierarchical and Bayesian, in exactly these terms. The philosophy lies at the junction of three active debates: individualisation (Lippert-Rasmussen, Eidelson, Beeghly), moral encroachment (Moss, Bolinger) and prejudice and counterevidence (Begby, Napolitano, Kelly).
- **Expected originality is low.** Anything you add will probably be either "a known formula applied to a new case" (b) or a reply to one of those debates (c). One judge co-wrote the main philosophical paper on Stein (VSF 2017).
- **Nothing escapes.**
  - The NPMLE ceiling (advisor 2) is known to statisticians, and its normative reading would again be (b).
  - The "exchange rate" n·s²/(τ²+s²) and "Σ pulls = 0, so pooling redistributes credit within the batch" are true but elementary.
  - The one live philosophical question I found is no longer about Stein, and its framing is pre-empted. That question: is there a duty to let a counter-stereotypical person count as evidence about her group, against Beeghly's anti-tokenizing wrong? Contact theory and Beeghly's "tokenizing" already frame it. I would not enter it in this competition.

**For the next subject (process).** Before any idea memo, run the priority check in this order:
1. the standard graduate textbook (here BDA would have caught round 3);
2. the cognitive-science and social-psychology literature on the phenomenon;
3. economics;
4. philosophy.

Ask the go/no-go tester to predict the thesis from the textbook alone.

---

### Sources checked this session
- Gelman et al., [*BDA3* PDF](https://sites.stat.columbia.edu/gelman/book/BDA3.pdf), §17.1 (pp. 435–36) and §17.4 (p. 441), read in full text.
- Gershman & Cikara 2023, [PDF](https://gershmanlab.com/pubs/GershmanCikara23.pdf), read in full text: intro, Eq. 6–7, subgrouping, sample size, general discussion.
- Lu & Lin 2026, [eScholarship](https://escholarship.org/uc/item/0hw9m9r0), abstract only.
- Contact theory:
  - [Vezzali et al. 2023](https://iris.unimore.it/retrieve/0b062afc-714c-4194-a3f2-9e4250b8f115/Vezzali%202022%20Sequential%20model.pdf), summarising Brewer & Miller 1984, Hewstone & Brown 1986 and Pettigrew 1998.
  - [Wilder 1984](https://prejudicereduction.princeton.edu/publications/intergroup-contact-typical-member-and-exception-rule).
  - [Rothbart 1996](https://pages.uoregon.edu/mickroth/Abstract25.htm).
  - [Ultimate attribution error](https://en.wikipedia.org/wiki/Ultimate_attribution_error), which describes Pettigrew 1979. Check the original.
- Beeghly 2018, [Ergo full text](https://quod.lib.umich.edu/e/ergo/12405314.0005.026/--failing-to-treat-persons-as-individuals?rgn=main;view=fulltext), via summary; the §8 quote was checked. Beeghly 2025: [table of contents](https://books.google.com/books/about/What_s_Wrong_with_Stereotyping.html?id=yihJEQAAQBAJ) only.
- Prejudice and evidence:
  - [Napolitano 2023](https://philarchive.org/rec/NAPPGA)
  - [Begby 2013](https://philarchive.org/rec/BEGTEO-4)
  - [Kelly 2024](https://collaborate.princeton.edu/en/publications/can-prejudiced-beliefs-be-rational/)
  - [Vinten 2025](https://run.unl.pt/bitstream/10362/184960/1/logos-episteme_2025_0016_0002_0069_0087.pdf)
- Economics:
  - [Kim & Loury 2018](https://ideas.repec.org/a/wly/iecrev/v59y2018i1p3-18.html)
  - [Komiyama & Noda](https://www.mdc.e.u-tokyo.ac.jp/wp/wp-content/uploads/2021/07/UTMD-011.pdf)
  - [Levin 2009](https://web.stanford.edu/~jdlevin/Papers/CRDynamics.pdf), for Tirole's line.
- Robust hierarchical models: [Seltzer 1993](https://journals.sagepub.com/doi/10.3102/10769986018003207), abstract only. Pinheiro, Liu & Wu 2001, Lange, Little & Taylor 1989 and O'Hagan & Pericchi 2012 were not read in full: the fetches failed. BDA3 suffices for priority.
- Kanter via [Hewstone et al. 2006](https://research.unipd.it/retrieve/e14fb267-8ce7-3de1-e053-1705fe0ac030/Hewstone%20et%20al%202006%20Tokens%20in%20the%20tower.pdf).
- **Not verified:**
  - Allport's exact re-fencing wording and page (archive.org text is restricted).
  - Blum 2004 on exceptions (PhilArchive blocked).
  - Beeghly 2025, chs. 4–5.
- Computations:
  - Re-ran `code/scope.py` and `code/advisor2/{refencing_bias,pull_equals_push}.py`; all memo numbers reproduce.
  - New: `/mnt/user-data/outputs/stein-paper/code/advisor3/escape.py` and `escape.out.txt` (floor, full-Bayes ε, learned-scale Huber).
