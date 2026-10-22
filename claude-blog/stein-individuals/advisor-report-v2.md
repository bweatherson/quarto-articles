# Advisor memo, round 2: "Not How Much, but Where" (idea memo v2)

## Verdict: (A). Do not draft this thesis.

**The good news.** The philosophical identification is still unclaimed. I found no source in philosophy, law, ML fairness or economics that identifies treating people as individuals with a tail condition on a prior. Nor did I find an economics paper noting that the Phelps group gap vanishes for extreme signals under heavy-tailed priors. But the identification alone will not carry the paper, for three reasons.

1. **The formal content is in print, including the memo's slogan and two of its five "apparently new" items.**
   - "Not how much, but where" is how Pericchi & Pérez frame their own proposal: inflating the prior variance "would certainly reduce the shrinkage, but to all batters in equal proportion, even to those who are not exceptional. We are not proposing an indiscriminate reduction of the shrinkage, but rather a differential shrinkage" (NEJSDS 2026, §1.3). The dilemma in §2(a) is that passage aimed at philosophers.
   - The Lipschitz bound, and the remark that it rules out a Gaussian prior, are in Johnstone & Silverman (2004).
   - "Credalised Moss" is ε-contamination of the prior. Hodges–Lehmann restricted Bayes is minimax over exactly that class, and its least-favourable exception component has roughly exponentially declining mass (Koenker & Gu 2026, §3). That is item (4).
   - The blow-up of the cap in tight groups is Carvalho, Polson & Scott's "nonrobustness bias".
2. **The thesis sentence fails formally.**
   - With a fixed cap L, it limits how concentrated the group prior can be, so it constrains "how much" after all.
   - With a cap that scales with the group's spread, the distributive face fails, and so does the escape face across groups.
   - On bounded scales the asymptotic condition is vacuous.
3. **The supporting arguments do not do the work.**
   - The "convergence" of the three faces is analytic: one property has three consequences.
   - Eidelson says the opposite of what §4(ii) needs.
   - "The demand is cheap" is false in exactly the cases where the demand has moral content of its own.
   - Admitting exceptions is the textbook mechanism by which stereotypes survive counterevidence (Allport's "re-fencing"; subtyping). In pooled assessment the memo's remedy implements that mechanism exactly.

**Expected marks if drafted as is.** A formal judge will most likely say EXPECTED: "Pericchi–Pérez plus O'Hagan, relabelled". A value theorist will at best say "interesting but rests on contested intuitions".

**What survives.** The neighbourhood holds one non-obvious result, which §4 proposes as the nearby paper. In Stein-type pooling, the group's pull on a member and her influence on the group's estimate are the same function. Making room for exceptions therefore *is* making generalisations unresponsive to them. That gives a real dilemma between two anti-stereotyping norms, and it uses Stein essentially.

---

## 1. Priority: the five "apparently new" claims

| Memo's claim | What is in print, or the problem | Residue |
|---|---|---|
| (1) The demand concerns tail shape: "where, not how much", against overall-weight and modal accounts | **The slogan and the variance-inflation dilemma** are P&P §1.3 (quoted above). **The identification with treating-as-individual is not in print.** **The contrast classes are mis-set** (§3a): Johnson King & Babic model no individual record; Liu & Liang fn. 8 endorses informative priors when data are noisy; Moss's rule is not a credal norm. | The identification only, and it fails as stated (§2.3–2.4). |
| (2) Epistemic, distributive and escape faces converge on one condition | **All three follow from one property:** a bounded prior score, plus a common slope and equal noise for escape. **The formal facts are credited elsewhere:** Johnstone & Silverman 2004; Carvalho, Polson & Scott 2009/2010; Koenker & Gu 2026 App. C; P&P. | Unification, not convergence (§3b). |
| (3) Escape: the group gap vanishes under exponential tails and is constant under the normal; the link to autonomy | **Not found in economics.** I checked Onuchic's survey (arXiv 2205.05994, incl. Escudé et al. 2025), Chambers & Echenique 2021, Bharadwaj, Deb & Renou 2024, and Bohren et al. **It is a one-line corollary of Tweedie:** gap(x) = s²·d/dx log[m_A(x)/m_B(x)]. **It fails in two common cases:** unequal noise (Aigner–Cain's central case), and unequal group spreads unless L is fixed in noise units (§2.5). **The autonomy link misreads Eidelson** (§3c). | An observation, not a result. |
| (4) Moss credalised as contamination; only heavy-tailed exception components honour it | **ε-contaminated priors** are Berger & Berliner 1986 (*Ann. Stat.* 14:461–486). **Hodges–Lehmann is minimax over {(1−ε)G₀+εH}** (K&G §3). Mallows's least-favourable H is discrete, with mass declining roughly exponentially (K&G Fig. 1). So the worst-case reading of "she might be an exception" already yields near-exponential tails in print. **Moss's rule is "not an epistemic norm".** | Only the label "Moss". |
| (5) Gendler's dilemma priced | **Pricing fairness constraints is routine:** "cost of fairness" (Corbett-Davies et al. 2017); Bertsimas, Farias & Trichakis 2011. **The dilemma itself is disputed:** Puddifoot 2017 (*Phil. Explorations* 20(sup1):73–93) argues it dissolves; Begby 2021, ch. 8 argues it is real for risk assessment. **Gendler's case is binary** (Cosmos Club), where tail shape has no grip (§3f). **The memo's price numbers overstate the gain** (§2.8). | A worked example, at most. |

---

## 2. The formal claims, checked

Scripts for my checks are in `/mnt/user-data/outputs/stein-paper/code/advisor2/`.

**2.1 The Lipschitz bound: true, and in print.** There are two proofs:
- shift the convolution, as the memo does;
- use E[θ|x] − x = s²·E[(log π)′(θ) | x].

Johnstone & Silverman (2004, *Ann. Stat.* 32:1594–1649) make the same assumption, sup|(log γ)′| = Λ < ∞ (their eq. 7). They draw the same consequence (eq. 8): "the tails of γ have to be exponential or heavier, and the Gaussian model for γ is ruled out". They prove the "bounded shrinkage property" for the posterior median (Lemma 2(v)) and the posterior mean (§5.5). Their Remark 1 says a sufficient condition is "that the tails of the prior be heavier than the tails of the noise distribution".

Carvalho, Polson & Scott (AISTATS 2009, PMLR 5:73–80; *Biometrika* 2010) call this the "bounded influence" property. They credit the representation to Polson (1991) and the Laplace bound to Pericchi & Smith (1992). Cite these; do not present the proof as yours.

**2.2 "Roughly iff for log-concave priors": in fact exactly iff, and narrower than the memo says.**
- Log-concave densities have tails no heavier than exponential. So for a log-concave prior, bounded pull holds iff log π is asymptotically linear, i.e. the tails are exactly exponential.
- Proof of "only if": the posterior mode satisfies x − mode = −s²(log π)′(mode) → ∞, and the mean–mode distance stays bounded when the posterior's curvature is at least 1/s².
- So the log-concavity rider in §3 excludes t and Cauchy priors. The admissible class gives bounded but never vanishing pull: Clemente is discounted by s²L for ever. The epistemic face ("shows through") holds only in that sense.
- The Cauchy reversal is correct (−0.167 at x = 4; I reran it). Give the reason, which is cleaner than the table.
  - For log-concave priors, Var(θ|x) ≤ s² (Brascamp–Lieb).
  - So ∂E[θ|x]/∂M = 1 − Var(θ|x)/s² ≥ 0: there is no reversal, and the posterior mean is monotone in x.
  - Cauchy posteriors can be bimodal, with variance above s².

**2.3 The thesis sentence is internally inconsistent, and the slogan is false.**
- **(a) "Lipschitz in the tails" does not give "nobody moved more than s²L".** The bound needs the global supremum of |(log π)′|.
  - With a normal bulk of sd τ out to R, the slope at the edge of the bulk is R/τ².
  - Log-concavity forces the tail slope to be at least that, so L ≥ R/τ². The bulk can therefore extend only to R ≤ Lτ².
  - Example: τ = 0.3 (noise units) and L = 1 put the end of the bulk at 0.09, under a third of a prior sd.
  - Keeping the bulk out to 2τ forces L = 6.67, a cap of 6.67 noise sd (`escape_failures.py`).
- **(b) A global L limits concentration, which is "how much".**
  - From π(t) ≥ π(t₀)e^{−L|t−t₀|} it follows that π ≤ L/2 everywhere, so P(|θ − M| ≤ r) ≤ Lr.
  - With L = 1 in noise units, the assessor may never put more than 20% on "within 0.1 noise sd of the group centre", whatever the data say.
  - The memo's homogeneous-batch result (average risk .32 against James–Stein's .03 at p = 200) is this constraint at work, not an incidental price.
- **(c) A cap in prior-sd units fails the other way.** Fix k, so L = k/τ.
  - The cap s²k/τ grows without bound as groups tighten. This is the "nonrobustness bias" of Carvalho, Polson & Scott: "when the vector β is sparse, τ will be estimated to be small, and this 'nonrobustness bias' a will be quite large".
  - Escape also fails between groups that differ in spread. With τ_A = 1, τ_B = 0.5 and k = 1, the gap tends to 1.0 and never closes; under the normal model it grows linearly.

So "where, not how much" holds only for groups whose spread is at least about 1/L.

**2.4 On bounded scales the condition is vacuous.**
- On any bounded range, every smooth prior is L-Lipschitz for some L. Normal priors "violate" bounded incredulity only as a supremum over all x.
- At realistic ranges, all the content lies in the value of L. That makes the thesis a restricted-Bayes cap with a moral parameter, which advisor 1 already called Hodges–Lehmann with a moral label. §6(a)'s "the thesis fixes the form, not the size" gives up precisely the part that has content.
- Your own contaminated world (95% N(0,1) + 5% N(0,25)) shows the problem.
  - The Bayes-ideal prior there is a finite normal mixture, which is not Lipschitz.
  - Its pull is 0.60 at x = 5, 0.39 at x = 10, 0.77 at x = 20 and 1.54 at x = 40, tending to x/26.
  - Its worst risk out to θ = 30 is already 2.79, and it grows beyond that.
  - So the world you use to show that heavy tails pay is one where the best prior violates the condition, though only at absurd x.

If any version survives, state it on the relevant range. For example: beyond the bulk, the pull does not increase with |x − M|, and the group gap falls below ε within the range of records the institution actually sees.

**2.5 Escape needs equal noise and a common tail slope in noise units.**
- Aigner & Cain's central case is unequal reliability. Take s_A = 0.7, s_B = 1 and the same prior.
  - Normal model: the gap grows, 0.17/0.34/0.69/1.37 at x = 1/2/4/8.
  - Huber prior with L = 1: the gap tends to 0.51, bounded but never zero, because the caps are s_g²L.
- Groups differing in spread fail too (§2.3c).
- Use the identity gap(x) = s²·d/dx log[m_A(x)/m_B(x)]. The gap is the rate at which the record becomes evidence about group membership, so escape means the record stops discriminating between group hypotheses at the extremes. This is cleaner than the tables, and it shows how short the corollary is.

**2.6 "The Huber prior … is the Bayes rule Koenker & Gu identify with LT": wrong as stated.** K&G (arXiv 2603.00704 v3, 13 Oct 2026) say three things:
- (i) Hodges–Lehmann restricted Bayes is minimax over contaminations of the *prior*. Its Bayes solution is Mallows's, with a discrete least-favourable prior.
- (ii) The "Huber" procedure relaxes this to arbitrary contamination of the *marginal* of X. Tweedie's formula applied to Huber's least-favourable marginal gives exactly Efron–Morris limited translation (Prop. C.1, Gaussian G₀), with sup R = 1 + k_ε².
- (iii) "The Mallows rule has the obvious advantage that it yields a Bayes decision rule while the corresponding Huber procedure does not."

So limited translation is not the Bayes rule of any prior they name. Your "Huber prior" (Huber shape on θ) is a third object, whose posterior mean is a smoothed limited translation. Say exactly that. Pericchi & Smith and P&P say a double-exponential prior gives "essentially" limited translation.

**2.7 Risk bounds: correct, but attribute them.** (s + s²L)² follows from Minkowski. 1 + k² is right numerically for your Huber-prior posterior mean (2.0/3.25/5.0); its proof pattern is K&G App. C (Stein identity, score constant in the tail).

**2.8 Price numbers.** The "if the world is normal" figures are correct: 0.26% (k = 2), 1.8% (k = 1.5), 9.0% (k = 1).

**"If 5% are drawn from a 5x wider distribution, 0.80 → 0.585" is misleading.**
- 0.80 is the risk of a normal prior with the wrong variance (τ² = 1, when the truth has variance 2.2).
- Any empirical-Bayes fit would estimate τ² ≈ 2.2, giving risk 0.69 (exactly V/(1+V) = 0.6875).
- A Huber prior whose bulk is fitted the same way (τ = √2.2) gets 0.63 (k = 1.5) or 0.66 (k = 1).
- Your 0.585 uses an oracle bulk with τ = 1, matched to the 95% component. The Bayes oracle itself is 0.559.
- Honest version: a 4–9% gain with a moment-matched bulk; up to 15% with an oracle bulk (`contaminated_price.py`).

**2.9 The epistemic credentials in §5(i).**
- **(a) Deconvolution rates are beside the point.** Carroll & Hall 1988 and Fan 1991 do give logarithmic rates under normal noise.
  - But by Tweedie the posterior mean needs only the marginal's score, which is estimable at near-parametric rates where data exist (Jiang & Zhang 2009, *Ann. Stat.* 37:1647–84).
  - The real point is extrapolation: beyond the observed records, the marginal is not estimated at all.
- **(b) Andrews & Mallows 1974 characterise normal scale mixtures; they do not show that heterogeneity yields exponential tails.**
  - Heterogeneity with bounded variances leaves Gaussian tails; your §5(ii) concedes this for a normal exception component.
  - Exponential tails need unbounded heterogeneity in variances, with an exponential tail (exponential mixing gives the Laplace).
- **(c) A stronger, genuinely surprising version of your point: data-driven priors make incredulity worse.**
  - The Kiefer–Wolfowitz NPMLE, the modern nonparametric empirical Bayes used in teacher value-added and ranking, is discrete with support inside the range of the observations. Sources: Jiang & Zhang 2009; Koenker & Mizera 2014; Gilraine, Gu & McMillan 2020 (NBER w27094); Gu & Koenker 2023 (*Econometrica*).
  - So a new member's assessment is capped near the best member seen so far.
  - My check (`npmle_ceiling.py`; p = 500, N(0,1) truths): posterior means stay at or below 2.66 for records up to 10. The pull is 7.3 at x = 10, against 5.4 for normal empirical Bayes.
  - Use this whatever paper you write.

**2.10 Batch claims.** The numbers (1.98/12.07/25.79) are right, but the run used 400 replications; the header says 2000.

The growth of the exceptional's risk with p is Efron & Morris (1972, Part II): the maximum component risk of James–Stein is about p/4. Check the exact statement. My simulation gives 12.9 at p = 50 and 49 at p = 200. Cite it rather than presenting the growth as a finding.

**2.11 Clemente.** P&P's table matches the memo: .400 over 45 at-bats; .290 under normal empirical Bayes; .314 robust; .346 over the season. Correct.

---

## 3. The philosophical moves

**(a) The contrast with Johnson King & Babic and with Liu & Liang is only partly fair.**

*Johnson King & Babic.*
- Their model is a Beta-binomial on a group proportion. The moral prior moves the location and concentration of a group-level parameter, and there is no individual record.
- They give no account of combining a person's record with group information, so "they mislocate the demand" is unfair. Say instead that they treat naked statistical evidence, and that your question (record against group) is one they do not model.
- Babic & Johnson King 2023's own case (the sports-store employee) is binary (§3f).
- You still have not read JKB 2020 directly.

*Liu & Liang.* Partly a fair target.
- Their Recruitment case (Lin's tryout against School A's record) is a record-against-group case. Their account is about weight: individualised evidence is "prioritized", and gets "extra weight in the measure of appropriateness".
- But fn. 8 says informative priors are used "if the data are considered inaccurate or highly uncertain". So "glossed as objective/non-informative priors" overstates unless you quote fn. 8.
- Their cases are binary as well.

**(b) The convergence of the three faces is not an argument.**
- All three faces follow from a bounded prior score (escape also needs a common slope and equal noise). Their co-instantiation is guaranteed by construction, so it is not independent evidence.
- Worse, independently motivated versions of the three readings pick out different classes:
  - Moss's rule is satisfied by any contamination, even a normal one (your §5(ii)).
  - The bounded-risk reading is satisfied by non-Bayes rules (limited-translation clipping) and by the t and Cauchy priors you exclude.
  - Escape needs extra stipulations: a common L, equal noise, log-concavity.
- At most, one property explains three desiderata. Present that as unification, or drop it.

**(c) Eidelson is misread three times.** I checked against `research/texts/pc/eidelson.txt`.

1. **Discounted Performance.** Sally plays poorly and Kevin *selects* her. Eidelson uses the case because she is "a beneficiary, not a victim" (p. 207). The point is to separate the wrong of not treating someone as an individual from unfairness, and from inaccuracy at her expense. The memo's §1 leaves out that she gains. Your hurdle and escape argument is about burdens, and DP is Eidelson's counterexample to locating the wrong in burdens. Under bounded incredulity Kevin may still lift her by s²L, so DP is a "whether", not a "where", case.
2. **Kevin's inference concerns her record, not his prior.** "A dedicated musician who just had a bad day" is a heavy-tailed model of her *record* (bad days happen), applied because of her group.
   - In O'Hagan's conflict theory, whichever source has heavier tails is rejected. Kevin rejects her record.
   - A condition on prior tails alone, with Gaussian noise assumed, cannot touch this. The relevant condition is relative: prior tails must be heavier than the record's noise tails (Andrade & O'Hagan 2006; Johnstone & Silverman 2004, Remark 1).
   - For realistically fluke-prone records (auditions, hot streaks), that requires polynomial priors, which your log-concavity rider excludes.
3. **Eidelson's account coincides with epistemic rationality.** The character condition "does not create or suggest a conflict between moral and epistemic norms … its prescription coincides with demands of epistemic rationality" (p. 218). "There is nothing wrong per se with making use of such information" (p. 217). The employer "does not have to blind himself to the candidate's sex, or to its genuine predictive relevance".
   - A normal-model assessor who gives the record its evidentially correct weight, 1 − c, satisfies the Character Condition.
   - "Bounded incredulity is the minimal condition under which what she does can make her group irrelevant" adds a desideratum Eidelson does not hold. Where it departs from the evidence, his account explicitly disowns it.
   - Eidelson's only usable hook is his comparative remark: an employer disrespects women if he "affords a greater role to autonomous reflection in considering the choices of men" (p. 219). That concerns reading the evidence differently by group, i.e. Aigner–Cain unequal noise, which is where your escape fails.

**(d) Moss: the memo flags the reinterpretation, which is good, but three problems remain.**
- (i) The credal device is not new (ε-contamination; Hodges–Lehmann/Mallows); only the label is.
- (ii) The faithful credal model of "keep in mind the possibility" is an imprecise credal set (Walley 1991; Berger–Berliner's class), not one precise mixture. With arbitrary contamination H, the upper posterior mean tends to x for extreme records while the lower one stays at the normal answer. A formal judge will ask why you chose a precise mixture.
- (iii) Moss's paradigm cases, like Gendler's, Basu's and Bolinger's, are binary.

Check "not an epistemic norm" against *PAS* 118 directly; the report obtained it only through WebFetch.

**(e) "It's just good robust statistics" and "it asks for inaccuracy": as stated, the view does not survive. It faces a dilemma.**
- **Where group data leave the tail open,** robust statistics already prescribes heavy tails: O'Hagan; Fúquene, Cook & Pericchi's "dogmatic"; P&P; K&G. The moral demand is idle, or at most a tie-breaker among permissible priors.
  - Tie-breaking by moral considerations is moderate encroachment. Gardiner 2018 rejects it (the "working hypothesis" you quote is her *evidentialist* point), as do Smith 2025 and Begby 2021.
- **Where the evidence supports thin tails or tight groups,** the demand is expensive (ten times the average risk in your own p = 200 batch). It requires group-invariant tail slopes against evidence that groups differ in spread. That is radical encroachment.
- The abstract's last sentence ("because tails are what group data least determine, the demand is cheap") is false in exactly the second case, the only one where the demand has moral content of its own.
- §6(e)'s reply ("which errors are made to whom when the tail is uncertain") restates the first horn.
- **The institutional reading avoids encroachment, but at a cost.**
  - The content becomes a design constraint on an assessment rule, and the minimal such rule is limited translation, which is not Bayes (K&G). Hodges–Lehmann with a moral label again.
  - "A constraint on the tail shape of a prior" does no work on that reading.
- The NPMLE fact (§2.9c) helps a little: there is always a region, beyond the data, where evidence is silent and any commitment is non-evidential. But it points toward the different thesis in §4.

**(f) Objections the memo does not anticipate, in order of seriousness.**
1. **Re-fencing.** In social psychology, admitting exceptions is how stereotypes survive counterevidence.
   - Allport 1954, ch. 2: the "re-fencing" device. Verify the exact wording and page.
   - Subtyping: Weber & Crocker 1983; Kunda & Oleson 1995; Maurer, Park & Rothbart 1995.
   - Bayesian versions: Gershman & Cikara 2023 (*Psychon. Bull. Rev.*, doi 10.3758/s13423-023-02252-y), where deviant members are split off, "thus protecting the group's stereotype". Lu & Lin 2026 (CogSci): "atypical members are treated as outliers and thus preserve the original belief". Both are descriptive only.
   - In pooled assessment this is exact (§4). The heavy tails that let Clemente escape also stop his record from moving the group estimate. Credalised your way, Moss's rule *is* re-fencing.
   - A value-theory judge will reach first for the view of prejudice as resistance to counterevidence (Allport; Begby 2021; Napolitano 2023, *Inquiry*).
2. **Binary traits.** For a yes/no trait, the base rate adds a constant to the posterior log-odds at every strength of individual evidence. No prior tail shape removes that hurdle; only the shape of the likelihood can.
   - The paradigm moral-encroachment cases are binary. So the thesis covers graded assessment only.
   - You owe an account of why a constant hurdle is wrongful in graded cases but unavoidable, or permitted, in binary ones.
3. **Law.** Where the group is a protected class, US employment testing forbids any group-based score adjustment. 42 U.S.C. §2000e-2(l) (Civil Rights Act 1991, §106) bars adjusting scores, using different cutoff scores, or otherwise altering test results on the basis of race, sex and the like. In law, Phelps-with-race is "how much = zero". Restrict "group" to non-protected reference classes (school, cohort, batch, region), or address the point.
4. **Terminology.** "Lipschitz" next to "treating as individuals" will make ML-literate judges think of Dwork et al. 2012 individual fairness, which is a Lipschitz condition in a similarity metric. Distinguish the two in a sentence.

---

## 4. What nearby might work

### The one non-obvious fact: pull equals push

Take the exchangeable location model: x_i = θ_i + e_i, with e_i ~ N(0, s²) and θ_i ~ π(· − M), so the marginal of each x_i is m(x_i − M). Write ψ = −(log m)′.
- **Pull.** By Tweedie, the group's pull on member i is pull_i = x_i − E[θ_i | x_i, M] = s²·ψ(x_i − M).
- **Push.** Type-II maximum likelihood for the group centre solves Σ ψ(x_i − M) = 0. That is an M-estimator, and member i's influence on M̂ is proportional to ψ(x_i − M̂).
- **So the group's estimate sits where the pulls on its members sum to zero, and each member pushes the group estimate exactly as hard as it pulls her.** My run gives Σ pulls = 0.0000 under both priors (`pull_equals_push.py`).
- With a hyperprior on M, full Bayes uses the same ψ.

How the three prior families behave:
- **Normal / James–Stein:** full pull and full push. Clemente is pulled hard, but he drags the group mean up.
- **Huber / Laplace:** both are capped.
- **t / Cauchy:** both vanish. Perfect individuation means zero influence on the generalisation.

**The consequence.** Philosophers treat two norms against stereotyping as allies:
- **(I) Individuality.** An exceptional record should be able to escape the group's expectation (Moss; Eidelson; Liu & Liang; your bounded incredulity).
- **(R) Responsiveness.** Group generalisations must yield to counterexamples (Allport; prejudice as resistance to counterevidence; Begby; Napolitano).

For any coherent pooled assessor these are one dial. Bounded incredulity toward exceptions just *is* bounded responsiveness of the generalisation to them.

**Illustrations** (mine, rough):
- **(i) Ten per cent exceptional.** A batch of 60: 10% have θ = 3, the rest are drawn from N(−1, 1).
  - Normal empirical Bayes pulls the exceptional by 1.92 (estimates ≈ 1.03) and centres the group at −0.89.
  - A Huber prior pulls them by 0.99 (estimates ≈ 1.97) but centres the group at −1.03.
- **(ii) A biased starting belief.** The assessor's hyperprior on the group centre is −3 (sd 0.5); the truth is 0 (`refencing_bias.py`).
  - After 20 records the group centre is −0.84 under the normal model and −1.09 under the Huber.
  - After 80 records it is −0.29 and −0.38.
  - Robust pooling protects the exceptional and the biased generalisation alike.

These effects are modest. Find where they are large: more exceptions, larger initial bias, and "inaccurate statistical discrimination" (Bohren, Haggag, Imas & Pope; discrimination reversal in Bohren, Imas & Rosenberg 2019).

**Why this might work.**
- It addresses a problem, not one exchange.
- Stein is essential. The group estimate is formed from a batch that includes the person; with a fixed external prior (Kelley) there is no push.
- It turns the encroachment-friendly remedy (heavy tails, Moss's exceptions) into one horn of a dilemma.
- It joins two literatures that rarely meet: treating as individuals, and prejudice as resistance to evidence.
- It gives formal judges a coherence question.
  - Decoupling the two (assess her with a heavy-tailed score, update the group with the normal one) honours both norms.
  - But it is incoherent: no single prior generates it.
  - K&G's remark that the Huber procedure, i.e. limited translation, "does not" yield a Bayes rule becomes a point in your favour: limited-translation practice already decouples.
  - Is a split assessor's incoherence a price worth paying? That is a good question for this panel.

**Draft thesis.**
> When an assessor pools records (Stein, empirical Bayes), the group's pull on a member and the member's pull on the group's estimate are one function. So the two standard demands against stereotyping — that individuals be able to escape group expectations, and that group expectations yield to counterexamples — cannot both be met by any coherent assessor: making room for exceptions is re-fencing. Either the exceptional pay to revise the generalisation, or the generalisation is protected by their exceptionality, or the assessor gives up coherence between what she believes about the group and how she assesses its members. I argue for the third and say what it costs.

**Ceiling and risks.**
- Most likely "interesting"; perhaps a 20–25% chance of "surprising" if the coherence result is clean and the re-fencing reading is handled with care.
- **Risk 1, formal judges: "Tweedie plus the ML-II score; trivial."** Present the identity as a two-line observation, credit it, and put the weight on the dilemma.
- **Risk 2, value theorists: "no real conflict".** When the bulk of the generalisation is right, robust pooling is more accurate for typical members too.
  - You must show the dilemma bites when the generalisation is biased or contested.
  - You must argue that (R) is a norm on assessors and not merely a matter of accuracy.
- **Risk 3, priority.** Robust hierarchical modelling knows that heavy-tailed random effects make hyperparameter estimates robust to outlying units; that is the push half (Lange, Little & Taylor 1989, *JASA*; Pinheiro, Liu & Wu 2001, *JCGS*; Gagnon). The coupling identity is probably folklore; the normative dilemma appears not to be in print. Check Gershman & Cikara and Lu & Lin for any normative remark; the abstracts I saw are descriptive.

**Structure for 6,000 words.**

| § | Content | Words |
|---|---|---|
| 1 | Clemente, plus a group-level case: hiring or an orchestra, with the prior estimated from past applicants. Show pull and push in one small table. | 700 |
| 2 | Two anti-stereotyping norms, (I) and (R), with sources. Both are widely held and usually assumed to agree. | 1,000 |
| 3 | The identity. Corollaries: normal, Huber, Cauchy, and the NPMLE ceiling. Credit the statisticians throughout. | 900 |
| 4 | The dilemma. No conflict when the bulk is right; when the generalisation is biased, robust pooling preserves it and normal pooling corrects it at the exceptional's expense. Optional link to tokenism (Kanter 1977): under normal pooling the exceptional literally pay to represent the group. | 1,300 |
| 5 | The decoupling option and its price in coherence; limited translation as practised decoupling; an institutional reading versus a credal one. | 1,200 |
| 6 | Objections: bounded scales; unequal noise; binary traits; law. | 700 |
| 7 | Conclusion. | 200 |

Cut: the Lipschitz condition as a thesis (a footnote at most), the "three faces", Gendler pricing, and the JKB critique (one paragraph of positioning).

**Must-reads (\* = priority or novelty).**
1. \*Allport 1954, ch. 2 (re-fencing; verify the quote); Kunda & Oleson 1995; Gershman & Cikara 2023; Lu & Lin 2026. Look for any normative claim about exception-making.
2. \*Begby 2021, chs. 4–5 and 8–9; Napolitano 2023. Look for what "resistance to counterevidence" requires, and whether resisting an exception counts.
3. \*P&P 2026, §§1.3 and 6; K&G 2026, §3 and App. C; Johnstone & Silverman 2004, §§2.1–2.3 and 5.5; Carvalho, Polson & Scott 2009/2010. Read these so every formal statement is credited correctly.
4. \*Lange, Little & Taylor 1989; Pinheiro, Liu & Wu 2001; Morris 1983 (*JASA* 78:47–65). Look for whether pull = influence is stated.
5. Eidelson 2013, pp. 206–07 and 216–20; Beeghly 2018 (*Ergo*) and her 2025 book; Moss 2018 (*PAS*), §III; Bolinger 2020; Gardiner 2018.
6. Bohren, Haggag, Imas & Pope (inaccurate statistical discrimination); Bohren, Imas & Rosenberg 2019; Escudé et al. 2025 (via Onuchic). For when generalisations are wrong.
7. Johnson King & Babic 2020 (read it directly this time); Y. Liu 2026. One paragraph of positioning.

**Obligations (priority order).**
1. State the identity with its assumptions: known noise, location family, type-II ML or full Bayes. Say what happens when the scale is also estimated: exceptions also widen a normal prior, which is a second push channel.
2. Show a case where (R) matters for accuracy: a biased initial group belief.
3. Make the decoupling precise, and say exactly what incoherence it involves.
4. Argue why (R) binds assessors, not only believers.
5. Scope: graded traits only; give the binary contrast in one paragraph.
6. Bounded scales: state everything on the relevant range, not asymptotically.
7. Law: restrict to non-protected reference classes.

**Go/no-go test.** Give the 150-word abstract to a fresh reader together with P&P §1.3, Allport's re-fencing passage, K&G §3 and Gershman & Cikara's abstract. If they predict both the coupling and the coherence horn, stop.

**A fallback I do not recommend.** A negative paper arguing that prior-based accounts of treating people as individuals are "idle or radical" (§3e). Its ceiling is "expected" to "interesting", and it reads as a reply to the moral-encroachment debate.

---

## 5. Numbers and statements in memo v2 to correct (summary)

- The slogan "where, not how much" is P&P's "not … indiscriminate … but … differential shrinkage". Credit it.
- "Three-line proof; surely known": it is Johnstone & Silverman 2004 and Carvalho, Polson & Scott 2009 (also Pericchi & Smith 1992; Polson 1991).
- "L-Lipschitz in the tails" plus a bound of s²L is inconsistent unless the condition is global; under log-concavity the bulk is then at most Lτ² (§2.3).
- "Roughly iff" should be "exactly iff", and the class is exactly exponential tails (§2.2).
- "The Huber prior is the Bayes rule K&G identify with LT" is wrong (§2.6).
- 0.80 → 0.585 is against a misspecified normal; use 0.69 → 0.63–0.66 (§2.8).
- "The demand is cheap" is false for tight or homogeneous groups (§2.3b, §3e).
- Escape requires equal noise and a common slope in noise units; Aigner–Cain's own case gives a bounded, non-vanishing gap (§2.5).
- The scale-mixture and deconvolution claims are overstated; replace them with the extrapolation and NPMLE points (§2.9).
- Huber "reproduces normal shrinkage for typical records": for k = 1 it shrinks them less (0.43 against 0.50 at x = 1). Say "approximately, for k ≥ 1.5".
- eb_batch used 400 replications, not 2000. The growth of the exceptional's risk with p is Efron & Morris 1972 (≈ p/4).
- Eidelson's DP: Sally is a beneficiary; Eidelson's account coincides with epistemic rationality (pp. 217–18).
- Liu & Liang fn. 8 endorses informative priors for noisy data; JKB has no individual record.

---

### Sources checked this session
- Koenker & Gu, [Robustifying Empirical Bayes, arXiv 2603.00704 v3](https://arxiv.org/abs/2603.00704). Read §§2–3 and App. C from the PDF.
- Johnstone & Silverman 2004, [arXiv math/0410088](https://arxiv.org/abs/math/0410088). Assumption (7)–(8), Lemma 2(v), §5.5 and Remark 1 checked in full text.
- Carvalho, Polson & Scott, [Handling sparsity via the horseshoe (AISTATS 2009)](https://proceedings.mlr.press/v5/carvalho09a). The "bounded influence" and "nonrobustness bias" passage checked.
- Pericchi & Pérez, NEJSDS 2026 (local `nejsds_text.txt`). The §1.3 "differential shrinkage" passage and the Clemente table checked.
- Eidelson 2013 (local `eidelson.txt`), pp. 206–07 and 216–20, checked.
- Liu & Liang 2020 (local `liu.txt`), §3 and fn. 8, checked.
- Economics checked, with no tail or escape result found:
  - [Bharadwaj, Deb & Renou 2024](https://econ.gatech.edu/sites/default/files/seminars/202402/154_StatisticalDiscrimination.pdf)
  - [Chambers & Echenique](https://arxiv.org/pdf/1808.01351)
  - Onuchic's survey (local `onuchic.txt`, incl. Escudé et al. 2025)
- Prejudice and stereotypes:
  - [Begby, *Prejudice* (NDPR review)](https://ndpr.nd.edu/reviews/prejudice-a-study-in-non-ideal-epistemology/)
  - [Napolitano 2023](https://philarchive.org/rec/NAPPGA)
  - [Beeghly 2018](https://philarchive.org/rec/BEEFTT)
  - [Puddifoot 2017](https://dc2.philarchive.org/rec/PUDDTE)
  - [Gershman & Cikara 2023](https://par.nsf.gov/biblio/10405467)
  - [Lu & Lin 2026, CogSci](https://escholarship.org/uc/item/0hw9m9r0)
- Law: [Sackett & Wilk 1994 outline](https://web.pdx.edu/~mccunee/quant_621/Outlines/Sackett_Wilk_1994.doc) and the section 106 search results. Cite the statute text directly.
- Searches that turned up nothing relevant: "rule of consideration" with credal/contamination/imprecise; "treating people as individuals" with heavy tails or shrinkage; ML fairness with hierarchical shrinkage and tails.
- Not verified: Allport's exact re-fencing wording and page; the exact p/4 statement in Efron & Morris 1972; Moss's "not an epistemic norm" page in *PAS* 118.
- My scripts are in `/mnt/user-data/outputs/stein-paper/code/advisor2/`:
  - `contaminated_price.py`: the price comparison and the mixture prior's pull.
  - `escape_failures.py`: unequal spreads, unequal noise, and the tight-group cap.
  - `npmle_ceiling.py`: the NPMLE ceiling.
  - `pull_equals_push.py`: Σ pulls = 0 and the re-fencing batch.
  - `refencing_bias.py`: correcting a biased group belief.
