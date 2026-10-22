# Go/no-go 3: predictability test

Tester's stance: formal epistemologist working on the ethics of discrimination and stereotyping. Phase 1 was written and saved before I opened abstract-v3.txt, idea-memo-v3.md, or any earlier memo, advisor report or prediction file in the folder.

## Phase 1: prediction from the antecedent texts alone

### What I read

- **Pericchi & Perez (NEJSDS 2026), the whole text, with attention to §1.3, §3 and §6.** Conjugate priors combined with squared loss shrink every unit toward M by the same proportion c = 1/(1+σ0²). The influence of the group evidence is therefore "unbounded", and the procedure is "myopic" to the exception. Inflating σ0² does not fix this, because it reduces shrinkage "to all batters in equal proportion"; the authors want "differential shrinkage". Eq. (1.1) gives a loss/prior duality: a weighted squared loss is equivalent to a heavy-tailed prior. A double-exponential prior gives limited translation. A Cauchy prior gives non-monotone shrinkage that "discards" the prior when prior and likelihood conflict. Robust priors give MORE shrinkage than the Normal near the centre (§3). Robustifying the location prior is not enough: the Inverse-Gamma scale prior must also be replaced (SBeta2). Robust models lower MSE by up to 7%, and their 80% intervals cover Clemente's .346. Their diagnosis: "implicit dogmatism" of "Conjugate Bayes with Square Loss". The paper also mentions the unfair "pulling down" of hospitals with perfect scores.
- **Koenker & Gu, arXiv 2603.00704v3, §3.** Hodges–Lehmann restricted Bayes minimizes the Bayes risk under G0 subject to sup_θ R(δ,θ) ≤ 1+t. By the minimax theorem this equals Bayes under the least-favourable prior in the ε-contamination class (1−ε)G0+εH. Huber's version clips the Tweedie score at ±k. With Gaussian G0 the result is exactly the Efron–Morris limited-translation rule; with Dirac G0 it is hard thresholding. Mallows' version is a smoother rule that oscillates around Huber's in the tails. They prove |δ(x)−x| ≤ √(2/ε) and a worst-case risk of 1+k². The cost of the restriction is modest for small ε. Remark: "a few extremely good hitters deserve their exalted averages."
- **Allport (1954), ch. 2, "re-fencing".** I could not retrieve the page online and quote it from memory. The gist is that when a fact cannot fit a category, "the exception is acknowledged, but the field is hastily fenced in again and not allowed to remain dangerously open". The examples are "There are nice Negroes but…" and "some of my best friends are Jews, but…". By excluding a few favoured cases, the negative rubric is kept intact for all other cases. The same chapter frames prejudice as being "actively resistant to all evidence that would unseat it" (p. 9; this phrase is verified via quotation sites).
- **Gershman & Cikara (2023), PB&R (par.nsf.gov/servlets/purl/10405467).** Their structure-learning model puts a CRP/nested-CRP prior over partitions, with Gaussian groups and a conjugate posterior mean within each group. A counter-stereotypical individual is either assimilated, which changes the stereotype, or segregated into a subtype, which leaves the stereotype intact. They describe subtyping as formalizing Allport's "refencing". Stereotype change is non-monotone in how deviant the individual is: it peaks at moderate deviance, and extreme deviants are subtyped. The model reproduces Weber & Crocker's finding that dispersed disconfirmers produce more change than concentrated ones. Perceived variability, sample size and cognitive load (lower α) all moderate subtyping. The paper is explicitly descriptive.

### (a) Predicted abstract (150 words)

> Stein's paradox shows that judging individuals partly by their group improves aggregate accuracy. But the standard conjugate, squared-loss rule pulls everyone toward the group mean by a fixed proportion. Its gains are bought with large errors about exceptional individuals: Efron's "Clemente problem." I argue that the statistical cure gives precise content to the norm that people be treated as individuals. Heavy-tailed priors, and limited-translation and Hodges–Lehmann restricted-Bayes rules, bound the group's influence on any one person. Because robust priors and robust losses are dual, the norm can be located equally in credences (Moss's rule of consideration) or in values. But the cure has a price. By Tweedie's formula, bounding the group's pull on an individual is the same as bounding that individual's influence on the group estimate. Robust shrinkage is Allport's "re-fencing." So resistance to counterevidence cannot define prejudice. What does is dogmatism about group variability.

### (b) Predicted claims, results and arguments

1. **The Stein argument for statistical generalization.** Shrinking individual estimates toward the group mean dominates individual-evidence-only estimation in total squared error. A blanket refusal to use group information therefore has a real epistemic cost, which counts against the strong reading of "treat people as individuals."
2. **The Clemente problem as a moral problem.** Stein dominance is a property of the ensemble (compound risk), not of each individual. Under conjugate linear shrinkage the group's influence on each person is unbounded, and the aggregate gain is paid for by large errors concentrated on the exceptional. This is the formal shape of the exceptional individual's complaint in Eidelson's and Lippert-Rasmussen's sense.
3. **Individual treatment is differential, not indiscriminate.** Raising the prior variance, i.e. trusting the group less across the board, is not the remedy (P&P §3). The norm requires that reliance on group evidence fall specifically where the individual evidence conflicts with it. So "treating as an individual" is not the same as "ignoring the base rate."
4. **Formal analysis of the individual-treatment norm as bounded influence.** Limited translation and heavy-tailed priors cap how far group membership can move a judgment about a person. A Cauchy-type prior discards the group prior entirely once the conflict is large enough. The proposal is that treating someone as an individual is a bound on the influence of group membership, i.e. on the influence function.
5. **The Hodges–Lehmann restricted-Bayes reading.** Minimize aggregate (Bayes) risk subject to a cap of 1+t on each individual's worst-case risk. This has the structure of a deontological side-constraint, or of a limit on each person's complaint, imposed on an aggregative accuracy goal. K&G's result that the cost is modest for small ε gets read as "the side-constraint is cheap."
6. **Duality: epistemic versus moral location of the norm.** By P&P's eq. (1.1), and by K&G's minimax/ε-contamination equivalence, the same rule arises either from a heavier-tailed credence that this person is an exception or from a loss that weights errors about exceptions more heavily. The first reading matches Moss's rule of consideration, with ε-contamination playing the role of "consider the possibility that she is an exception." The second matches moral encroachment. The paper claims the dispute about whether the individual-treatment norm is epistemic or moral is behaviourally underdetermined, and that the two norms are provably the same constraint.
7. **Accuracy and fairness converge, at least here.** On the Efron–Morris data, robust priors both protect Clemente and lower total MSE, and their intervals cover him. The alleged conflict between epistemic rationality and anti-stereotyping ethics (Gendler, Basu) is partly an artefact of light-tailed, conjugate modelling, which is P&P's "implicit dogmatism."
8. **The twist: robust shrinkage is re-fencing.** The robust estimator treats the extreme individual as an exception (it trusts his own record) and leaves the group generalization intact. That is Allport's re-fencing, and it is Gershman & Cikara's subtyping. The fix for the Clemente problem is rational re-fencing.
9. **The formal identity behind the twist (Tweedie meets M-estimation).** In a location hierarchical model, the shrinkage applied to individual i, x_i − δ(x_i) = −f′/f, equals ψ(x_i − M), which is i's contribution to the estimating equation for the group mean. So bounding the stereotype's pull on the individual is the same property as bounding the individual's push on the stereotype. In the redescending (Cauchy) case the individual's influence on the stereotype rises and then falls with deviance. This matches G&C's non-monotone stereotype change, with its peak at moderate deviance, and Kunda & Oleson's findings.
10. **Robust shrinkage intensifies stereotyping of the typical.** Robust priors shrink central individuals more than the Gaussian does (P&P §3), while they exempt the extremes. This is precisely "there are nice X, but…": favoured exceptions are excluded and the rubric is kept, and even tightened, for everyone else. A contrast is drawn with James–Stein, where an extreme case inflates the estimated variance and so reduces shrinkage for everyone. Linear EB assimilates; robust EB subtypes.
11. **Corollary against the "resistance to counterevidence" analysis of prejudice (Allport, Begby).** Optimal robust estimators show bounded, even redescending, responsiveness to counterevidence. So resistance to counterevidence cannot be sufficient for prejudice. The candidate differentiae are:
    - (i) asymmetric tails, so that only favourable exceptions are fenced off;
    - (ii) a dogmatic scale hyperprior, so that accumulating exceptions never widen perceived variability. This is P&P's point against the Inverse-Gamma prior, and it connects to the outgroup-homogeneity effect;
    - (iii) insensitivity to dispersed as opposed to concentrated disconfirmation (Weber & Crocker);
    - (iv) a threshold k or ε that is wrongly set relative to the stakes.
12. **Two norms, not one.** The individual-treatment norm (bounded influence of the group on the person) and the anti-prejudice or revisability norm (the group-level parameters, especially dispersion, respond to accumulated exceptions) are distinct and can pull apart. A full hierarchical model with a heavy-tailed scale prior (P&P's SBeta2) satisfies both: single exceptions are fenced off, but accumulated exceptions widen the fence.

**Confidence notes.** I am most confident in claims 1–6 and 8; these are the obvious moves from the reading list. Claims 9–11 are what a careful formal reader reaches within an hour of putting Tweedie's formula next to influence functions and P&P §3; I would bet on them for the paper's "twist." Claim 12 is the most natural closing move. Its exact form, whether stated as dispersion, accumulation or subgrouping, is the least certain.

---

## Phase 2: scoring abstract-v3.txt and idea-memo-v3.md (Thesis section) against Phase 1

Key: (P) = predicted by a numbered Phase 1 claim; (D) = a natural derivation a reader of these texts reaches within an hour; (N) = not predictable from them.

### Abstract

| # | Claim | Mark | Basis |
|---|---|---|---|
| A1 | In pooled (Stein/EB) assessment, the group's pull on a member and the member's pull on the group's estimate are one function. | **P** | Phase 1 #9 (Tweedie shrinkage = −f′/f = ψ(x_i − M) = the member's estimating-equation contribution). It is also in my predicted abstract almost word for word. |
| A2 | Individuality and Responsiveness are two anti-stereotyping norms, and they conflict. | **P** | #4 (individuality as bounded influence), #11 (resistance to counterevidence / R), #12 ("two norms, not one … can pull apart"). |
| A3 | A third norm, Own-record: whether an exceptional record is believed should not depend on whether earlier group members were exceptional. | **D** | Not on my list. But anyone who makes move #12 ("accumulated exceptions widen the fence") asks within minutes what happens to the first exception. It is also a direct corollary of exchangeable learning, which the memo's own Risk 1 concedes. |
| A4 | No coherent assessor satisfies all three. | **D** | This follows from A1 plus A3 plus the definition of learning in an exchangeable model. |
| A5 | Normal pooling sacrifices individuality: the exceptional pay to revise the group's image (tokenism). | **P** | #2 (unbounded pull; the ensemble's gain is paid by the exceptional) and #10 (under James–Stein an extreme case inflates the estimated variance and reduces shrinkage for everyone: "linear EB assimilates"). "Tokenism" is a label on predicted content. |
| A6 | Robust pooling lets exceptions escape while the generalisation stays intact ("you're not like the others"). | **P** | #8, #10. "You're not like the others" is the modern form of Allport's "there are nice Negroes, but…", which is the antecedent text itself. |
| A7 | Learning how common exceptions are honours both I and R. | **P** | #12 (hierarchical model with a heavy-tailed scale prior: single exceptions fenced, accumulated exceptions widen the fence) and #11(ii) (dogmatic scale hyperprior as the locus of prejudice). |
| A8 | …but only for those with predecessors: "pioneers pay." | **D** | My #12 wrongly said this horn "satisfies both" without noting the cost. That is a miss on my part, but the cost is the first objection to #12 and needs no new idea. It is also not specific to this horn (see the substantive note below). |
| A9 | Honouring all three requires assessing individuals by a different model from the one used to learn about the group (decoupling). | **D** | Once pull = push holds within one model, the obvious way out is to use two functions. Efron–Morris limited translation is already this in practice: hyperparameters come from the normal model and the per-unit translation is clipped. P&P call it "clever (and ad hoc)"; K&G show that the Huber/LT rule is not a proper Bayes rule. |
| A10 | Treating people as individuals is no remedy for stereotyping. | **P** | #8–#10, #12, and my predicted abstract ("the cure has a price … robust shrinkage is Allport's re-fencing"). It is also Allport's own point: excluding favoured cases keeps "the negative rubric … intact for all other cases." |

### Memo, Thesis section

| # | Claim | Mark | Basis |
|---|---|---|---|
| T0 | Trilemma: I, R and O cannot be jointly satisfied by a coherent assessor, and each concession has a recognisable social form. | **D** | Two of the three social forms are P (tokenism ≈ #2/#10; re-fencing = #8). The third (pioneers) is D. |
| T1 | Resolution 1, normal pooling (give up I): the exceptional are pulled back in proportion to their exceptionality and in exchange lift the generalisation for everyone. | **P** | #2, #10. |
| T2 | Resolution 2, fixed-shape robust pooling such as Huber/LT (give up R "in proportion as I is secured"): re-fencing implemented exactly. | **P** | #8, #9. "In proportion" is pull = push restated. The Cauchy/t case, where both pull and push vanish, is #9's redescending case. |
| T3a | Resolution 3, learned-scope pooling: exceptions revise the generalisation through its scope (how many exceptions there are), not its centre. | **P** | #12, #11(ii). |
| T3b | The mixture form of the coupling: responsibility r_i is at once the weight of her assessment on the group and the weight of her evidence about the typical. "Individuating her is reclassifying her evidential role." | **D** | EM responsibilities are textbook. Gershman & Cikara already say this qualitatively: membership probability governs both whether the stereotype is applied and whether it changes, and "anything that makes an individual unique relative to the group also reduces the probability of their membership." |
| T3c | Learned scope gives up O: pioneers pay, and individuality is borrowed from predecessors. | **D** | See A8. |
| T4 | Resolution 4, decoupling (give up coherence): a heavy-tailed score for individuals and a normal score for the generalisation. This is LT practice; LT is not the Bayes rule of any prior (K&G). It honours I, R and O at the cost of a gap between belief and assessment. | **D** | See A9. The "belief/assessment gap" cost is the standard incoherence objection to non-Bayes rules. |
| T5 | Recommendation: resolution 3 with a moral floor (a fixed minimal exception weight ε, so pioneers get resolution-2 protection), or resolution 4 for institutions. | **P/D** | The moral floor is a fixed ε-contamination of a learned prior. That is K&G §3.3 (restricted empirical Bayes: an NPMLE Ĝ with a Mallows ε-modification) given a normative label, and it is my #5/#6 (ε as the formal rule of consideration). Choosing it is D. |
| C | Corollary: "treat people as individuals" is not a remedy for stereotyping. Individuating the exceptional is compatible with, even partly constitutive of, keeping the stereotype. | **P** | #8, #10, #12. This is Allport ch. 2 restated with pull = push behind it. |

**Tally.** 10 P, 9 D (counting T5 as D), 0 N.

### What Phase 1 contained that the memo does not (calibration)

My list was broader than the memo:
- the prior/loss duality and the epistemic-versus-moral location of the norm (#6);
- accuracy-fairness convergence on the Efron–Morris data (#7);
- robust priors shrinking central members more than the normal does (#10, first half);
- the argument that "resistance to counterevidence" is not sufficient for prejudice (#11).

So the high P count does not come from scattershot over-prediction. The memo's core spine, pull = push ⇒ individuation is re-fencing ⇒ individual treatment does not cure stereotyping, is my #8–#10 + #12 and my predicted abstract. Everything the memo adds beyond that spine is one inferential step away.

### Substantive note (this bears on whether the one D-candidate is even true)

The memo's own table undercuts the clean "each resolution gives up exactly one norm" structure.

- **Normal EB also violates O.** The new exceptional member's estimate rises from 1.00 to 1.71 to 2.30 as predecessors go from 0 to 3 to 10, which is a larger dependence on predecessors than the mixture shows (1.09 → 2.06). So "pioneers pay" is not the signature of horn 3. It is just exchangeable learning, and horn 1 gives up I *and* O.
- **Huber keeps most aggregate responsiveness.** The centre moves from −0.93 to −0.33 with 10 exceptions, against −0.16 under the normal model, while O holds (2.01 → 2.03) and I holds. Bounded influence caps *per-capita* push, not *total* push. Read R the way the subtyping literature does, as yielding to accumulated or dispersed counterexamples (Weber & Crocker; G&C), and Huber approximately satisfies all three norms. The trilemma becomes a quantitative trade-off in how fast the generalisation yields.
- R only bites as a separate norm under the stronger reading: "each counterexample must move the generalisation in proportion to its extremity." That reading is contestable; arguably it is what licenses tokenism. The memo already concedes that "effects [are] modest at these settings."

### Verdict: EXPECTED

No claim in the abstract or the Thesis section is (N). The candidate for "new and important" is the Own-record norm and the trilemma/"pioneers pay" framing built on it. It fails on both counts:
- **Not new.** It is a one-step derivation, and violating O is constitutive of any exchangeable learner, as the memo's own Risk 1 admits.
- **Not important as stated.** O-violation also afflicts normal pooling, and the Huber horn nearly satisfies all three norms under the literature's own reading of responsiveness, so the trilemma is not clean.
- **Possible prior art.** The economics of group learning (Bohren–Imas–Rosenberg 2019; Fryer 2007) may already contain "pioneers pay."

What remains is a careful normative relabelling of pull = push (tokenism / re-fencing / pioneers / decoupling). That is competent and readable, but a reader of these five texts would predict it.
