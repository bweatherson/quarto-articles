# Go/no-go predictability test

## PHASE 1: Prediction (written before reading abstract-v2.txt or idea-memo-v2.md)

Texts read: Pericchi & Perez 2026 (all, closely §1, §3, §6); Babic & Johnson King 2023 (§§2-5, appendix); Liu & Liang 2020 (all); Moss, "Knowledge and Legal Proof" (§§3.2-3.5 and the internalism reply); Efron 2010 (§5, plus §§8-9 on relevance and Tweedie); Eidelson 2013 (opening cases, Character and Agency Conditions, §III clarifications). Background assumed: Efron-Morris limited translation estimators, Dawid/O'Hagan heavy-tail conflict resolution, the Phelps/Aigner-Cain normal signal-extraction model, and Gardiner's "working hypothesis ... easily dislodged".

### (a) Predicted abstract (about 150 words)

**Working title: "The Clemente Problem: Robust Priors and Treating People as Individuals"**

> Statistical discrimination in its standard Phelps-Aigner-Cain form is normal-normal shrinkage: each person's noisy signal is pulled toward her group's mean by a fixed proportion. Efron's "Clemente problem" is the statistical version of the same defect: conjugate shrinkage lowers total error but badly mispredicts exceptional cases. I argue that the complaint that such reasoning fails to treat people as individuals *is* the Clemente problem, and that it has the same solution. Heavy-tailed priors (Dawid, O'Hagan, Pericchi-Perez) let group information dominate when individual evidence is weak or typical, but cap it or throw it out when that evidence sharply conflicts with the group. That is exactly Gardiner's "working hypothesis, easily dislodged" and Moss's rule of consideration. Babic and Johnson King's moral encroachment works on where a prior is centred, and Liu and Liang retreat to diffuse priors. Unlike either, this constraint concerns the shape of the prior's tails. It costs little or no accuracy, and it explains Eidelson's Discounted Performance case. Its limit: when there is no individual evidence, the tails do no work.

### (b) Predicted claims, results and arguments

1. **Identification thesis.** The Phelps/Aigner-Cain model of statistical discrimination has the same structure as the normal hierarchical (Efron-Morris) model. The discriminator's estimate (1-B)M_g + Bx is the Bayes/James-Stein shrinkage estimator. So the "fails to treat me as an individual" complaint, in its evidence-weighting form, is the Clemente problem.

2. **Fixed-proportion penalty result.** Under a normal prior, the shrinkage |E - x| = (1-B)|x - M_g| grows linearly with how far a person is from the group mean. The most exceptional members of a group therefore pay the largest absolute penalty. Two people with the same individual signal x but different groups get estimates that differ by the constant (1-B)(M_A - M_B), however strong or extreme x is. In the normal model, group membership never "washes out".

3. **Diagnosis: the problem is not base rates.** Following Pericchi and Perez, the defect lies in conjugate (light-tailed) priors combined with squared loss, not in using group information. Stein's theorem, and the MLE's 350% relative MSE in the 1970 data, show that refusing indirect evidence altogether is inadmissible and costly. So the individualist cannot simply ban base rates.

4. **Remedy: bounded or vanishing group influence under heavy tails.** A double-exponential prior gives limited translation: the group's pull on any individual is bounded. A Cauchy or Student-t prior gives redescending influence: under conflict the prior is discarded, and the cross-group gap for identical evidence goes to 0 as the individual evidence becomes extreme. Stated as a small proposition: the "disparate treatment gap" is constant under the normal prior, bounded under DE, and vanishing under t.

5. **Philosophical mapping.**
   - Gardiner's "working hypothesis, easily dislodged" corresponds to redescending (discarding) influence.
   - Moss's rule of consideration (keep in mind that the person may be an exception), and Gatecrasher's "possibility that he is an individual not represented by features of the group", correspond to non-negligible prior tail mass, or a contamination/mixture component for being an exception.
   - Eidelson's "reasonable weight" corresponds to a weight on individual evidence that depends on the data rather than a fixed proportion.
   - Bonus point: the conjugate model's 80% interval that excludes Clemente is a formal case of wrongly "ruling out" the exceptional possibility.

6. **Convergence of the moral and the epistemic.** Pericchi and Perez get lower MSE than James-Stein and cover Clemente in 80% intervals. So respecting individuality, read as using robust priors, costs little or no accuracy. This supports Eidelson's claim that the Character Condition does not conflict with epistemic rationality, and undercuts the "tragic dilemma" framing (Gendler-style). The obvious caveat: if the population really is light-tailed, robustness costs a little, and moral considerations may pay for that.

7. **Contrast with Babic and Johnson King.** Their encroachment acts on the location and concentration (alpha, beta) of a prior over a *group proportion*. Their model has no individual-level parameter or evidence: the person is just "the next draw". It therefore cannot represent exceptions; it can only move everyone's credence together. Treating people as individuals is a constraint on the *tails* of a prior over individual parameters, not on its location. A possible side claim: their hyperprior over (alpha, beta) is a scale mixture that thickens the marginal tails. Their "spinelessness collapses into the jerk" result would then be partly an artifact of putting all the data at group level.

8. **Contrast with Liu and Liang (diffuse is not robust).** Liu and Liang read objective Bayes as using non-informative priors to prioritise individual data. But inflating the prior variance cuts shrinkage for *everyone* (Pericchi and Perez: "not a fix") and gives up the Stein gain. Heavy tails give *differential* prioritisation: they keep group information for typical cases and drop it for exceptions. That is what their "prioritization account" needs.

9. **Loss-prior duality as the home for moral encroachment.** Pericchi and Perez's Result 2 shows that a weighted loss penalising large errors more heavily is equivalent to a heavy-tailed prior. Babic and Johnson King derive priors from scoring rules in a parallel way. So a moral concern about grossly misjudging individuals can be put in the loss, where it is orthodox Bayesian. If moral encroachment happens at all, it acts on the shape of the tails or the loss, not on the centre of the prior.

10. **Discounted Performance reconstructed.** Kevin's reasoning is normal shrinkage of a strongly discordant signal (a poor audition) toward a *positive* stereotype. A robust prior would largely throw out the stereotype for Sally. Positive stereotypes and downward exceptions are covered symmetrically (compare Munson and Alvis in Pericchi and Perez's Table 2). Eidelson's remark that Kevin "ignores obvious evidence that cuts against the probative value of the generalization" is exactly prior-data conflict.

11. **Limits and costs.**
    - (a) With no individual evidence (Gatecrasher, Blue Bus, Dog Bite), tail shape makes no difference to the point credence. Robust priors answer the *weighting* complaint, not the bare-statistics complaint, which still needs Moss's knowledge account or duties to gather evidence (Eidelson and Liu-Liang on "reasonable availability").
    - (b) People with noisy individual signals stay heavily shrunk. Aigner-Cain's lower-reliability signals for minorities, and Alvis's 70 at-bats, are examples.
    - (c) Robust priors shrink typical cases *more* near the centre. Protecting exceptions has a distributive cost that falls on ordinary members, who are treated more as group members.

12. **Aggregate versus individual risk, and relevance.** James-Stein dominates in *total* risk but can have large risk for individual outlying components. Efron-Morris limited translation was designed to cap the maximum component risk. WAIC and LOO prefer the conjugate models even though those miss Clemente, so aggregate metrics cannot see the individual's complaint (a contractualist versus aggregative reading). Efron's own framing of the Clemente problem as one of *relevance* (which others are relevant to this case?) ties it to the reference class problem. A heavy-tailed or mixture prior lets the person's own data partly decide whether the group is relevant to her.

Confidence: items 1-6, 8 and 10 are near-certain to appear in any competent version. Items 7, 9, 11 and 12 are likely, though which of them gets emphasis will vary. The side claim in 7 (Babic and Johnson King's hyperprior as robustification) is the least certain.

---

## PHASE 2: Scoring against abstract-v2.txt and idea-memo-v2.md

Key: **P** = predicted in my Phase 1 list. **D** = a natural derivation a reader of these texts would reach within an hour. **N** = not predictable from these texts.

### Claims in the abstract

| # | Claim | Score | Where in Phase 1 / why |
|---|---|---|---|
| A1 | Statistical assessment of persons usually combines group information with an individual's noisy record through a normal model. | **P** | Item 1 (Phelps/Aigner-Cain = normal hierarchical model). |
| A2 | In normal models the group's pull grows with how exceptional the record is. | **P** | Item 2: "shrinkage (1-B)\|x-M\| grows linearly ... the most exceptional pay the largest penalty." This is stated verbatim in P&P §3. |
| A3 | The gap between equally performing members of different groups never closes. | **P** | Item 2: "differ by the constant (1-B)(M_A-M_B) ... group membership never washes out." |
| A4 | The demand to treat people as individuals is about *where* group information gets weight, not *how much*. The prior may be fully group-informed in the bulk, but its tails are constrained. | **P** | Predicted abstract: "this constraint concerns the shape of the prior's tails." Item 7 (tails, not location) and item 8 (differential, not diffuse). "Where, not how much" is a better slogan for the same claim. |
| A5 | The exact condition: log-density falls off no faster than linearly (log-prior Lipschitz, i.e. at least exponential tails). | **D** | I predicted "heavy tails; DE gives limited translation" but not the necessary-and-sufficient threshold. Efron 2010 §9 prints Tweedie's formula, E[mu\|z] = z + f'(z)/f(z). Combine that with P&P's DE/limited-translation result and "bounded pull iff (log m)' bounded iff exponential-or-heavier tails (for log-concave priors)" takes a few lines. The memo itself says the result is "surely known." |
| A6 | Epistemic face: group expectations become "easily dislodged working hypotheses", a credal version of Moss's rule of consideration. | **P** | Item 5, nearly word for word (Gardiner and Moss mapped to redescending influence and tail mass). |
| A7 | Distributive face: no one is moved more than a fixed distance from her own record. | **P** | Item 4 (limited translation, bounded pull) and item 12 (cap on maximum component risk, contractualist reading). Only the "distributive" label is new. |
| A8 | Anti-discriminatory face: group membership stops mattering for exceptional records. | **P** (with a **D** refinement) | Item 4: "the cross-group gap for identical evidence goes to 0." I said this vanishes under t and is only *bounded* under DE. Under equal-scale exponential tails it in fact vanishes too, since both groups translate by the same constant s^2/b. The memo has this right and my prediction was slightly off. Spotting it is a one-line check. |
| A9 | The demand is cheap. | **P** | Item 6 (little or no accuracy cost; P&P's lower MSE). |
| A9' | ...*because* tails are what group data least determine. | **D** | Not in my list, but P&P's Table 3 shows WAIC/LOO can barely tell normal from heavy-tailed models, i.e. the data underdetermine the tails. Item 6's caveat ("if the population is light-tailed, robustness costs a little, and morality may pay") is this point's other half. |

### Memo, "Apparently new" list

| # | Claim | Score | Comment |
|---|---|---|---|
| N1 | The demand to treat people as individuals is located in the tail shape of the prior ("where, not how much"), against overall-weight accounts (Babic & Johnson King, Liu & Liang, Eidelson's "reasonable weight") and modal/attentional accounts (Moss, Bolinger, Smartt). | **P** (overall-weight part); **D** (modal part) | The overall-weight dilemma is items 7 and 8 nearly exactly. It even uses the same P&P quotation ("not a fix ... equal proportion, even to those who are not exceptional"). The modal-account critique is that a normal-prior updater "considers" the exception yet never escapes the group discount, so Moss's rule underdetermines what is required. That follows at once from item 5 plus A2/A3. |
| N2 | The epistemic, distributive and escape readings converge on one condition, and the convergence is evidence that this condition is what the ordinary demand tracks. | **P** (components); **D** (packaging) | All three faces are in items 4, 5 and 12, and item 6 is a convergence claim. Presenting them as "three faces of one condition" is a framing choice. It is not a finding. |
| N3 | Escape condition: the group gap vanishes for exceptional records under exponential tails but is constant under the normal. Link to autonomy: under a normal model, nothing she *does* frees her from the group discount; only the assessor gathering more evidence (smaller s) can. | **P** (gap); **D** (autonomy link) | The gap result is item 2 plus item 4. The autonomy link is the most philosophically interesting move in the memo, and I did not predict it in this form. But it is an hour's work for anyone holding Eidelson's "statistical fate" and "unfolding narrative" passages next to A3: distance (her performance) cannot help her, while precision (the assessor's investment) can. |
| N4 | Moss's rule credalised as a contamination component, and only a component with exponential-or-heavier tails honours it; a wider *normal* exception component reduces the pull but never bounds it. | **P** (contamination); **D** (the result) | Item 5 says "a contamination/mixture component for being an exception." That a two-normal mixture still has a quadratic log-tail, and so a linearly growing pull, follows at once from A5's criterion and from P&P's "inflating sigma_0^2 is not a fix." |
| N5 | Gendler's dilemma priced: a Huber prior costs 0.3% / 1.8% / 9% in a truly normal world and gains under 5% contamination. | **P** (idea); **D** (numbers) | Item 6 names both the Gendler-dilemma framing and the "small cost if the world is light-tailed" caveat. The numbers are a short simulation. |

### Other memo content, for completeness (not claimed as new)

- **Stein batch effect.** The outlier's risk grows with batch size p (2.0 at p=10, 25.8 at p=200). **P/D**: item 12 (large component risk for outliers); growth with p is standard Efron-Morris material.
- **Huber prior** (normal in the bulk, exponential tails) as the natural realisation, matching Koenker & Gu's Bayes rule for limited translation. **D**. It is a sensible design choice: it avoids the extra central shrinkage of DE/Cauchy that I flagged as a distributive cost in item 11(c). The memo never raises that cost, but its prior choice quietly sidesteps it.
- **Cauchy priors are non-monotone and can *reverse* the group gap** (-0.17 at x=4), so log-concavity is needed. **D**. P&P say outright that the Cauchy posterior mean is "not monotonic." The reversal is a short calculation, and it is a neat normative wrinkle.
- **"Equal proportion is not equal burden"** at absolute thresholds. **D** from item 2.
- **Thin records are moved further (s^2 L), and the condition cuts both ways (it also stops rescuing the bad member of a high-mean group).** **P**: items 11(b) and 10.
- **Institutional versus credal readings; tie-breaking among evidentially permissible priors (Fritz-style moderate encroachment).** **D**, given A9'.

Predicted but *absent* from the memo:
- the loss-prior duality (P&P Result 2) as the orthodox home for moral weight (item 9);
- the zero-individual-evidence limit (Gatecrasher, Blue Bus), where tail shape is idle (item 11a);
- WAIC/LOO favouring the conjugate models (item 12);
- Efron's framing of the Clemente problem as one of *relevance* or reference class (item 12).

The second of these is a real gap. A referee who knows the legal-proof literature will ask why a theory of "treating people as individuals" says nothing about the paradigm cases of that literature.

### Tally

- **Abstract:** 9 distinct claims. 7 P (one with a D refinement), 2 D, 0 N.
- **"Apparently new" list:** 5 claims. Every one has a P core; the novel-looking extensions (the Lipschitz threshold, the autonomy link, the normal-contamination-fails result, the pricing numbers) are all D. 0 N.

### Verdict: **EXPECTED**

The paper's thesis is what a competent formal philosopher would write after reading these six texts. That thesis: treating people as individuals is a demand on the tails of the prior, not on its location or overall weight; heavy tails make group expectations "easily dislodged working hypotheses", bound the pull, close the group gap, and cost little.

My Phase 1 abstract and the actual abstract match almost sentence for sentence:
- the normal-model diagnosis;
- the pull growing with exceptionality;
- the gap that never closes;
- tails rather than weight or location;
- Gardiner's phrase;
- Moss's rule as tail mass;
- cheapness.

The differences are in sharpness, not substance:
1. The paper states an exact threshold (log-Lipschitz, i.e. exponential tails) where I said "heavy tails".
2. It picks a better example prior (Huber).
3. It gets the DE gap behaviour right where I got it slightly wrong.
4. It adds the autonomy/escape gloss.

Each is a derivation within an hour for this reader.

**Is there one non-obvious claim that is both new and important?** No. The best candidate is the escape/autonomy point: under a normal model a person's own performance can never free her from her group's discount, at any level of performance; only the assessor's choosing to collect more precise evidence can. That is the one place where the memo says something a reader might not have *stated*, even if they could have derived it. It is philosophically pointed, because it turns Eidelson's autonomy grounding into a structural objection to normal models specifically. But it is D, not N: it follows directly from A3 plus the fact that B depends on s. The memo also lists it as part of a new item rather than as the paper's centre.

The next strongest candidate is the claim that Moss's rule *underdetermines* the credal requirement: a normal "exception" component satisfies the letter of the rule but never lets anyone escape. That is a crisp, citable result for the Moss literature, but it is also D.

**Bottom line.** As framed, this is a well-executed EXPECTED paper: the connection is the obvious one, and its value would lie in precision (the Lipschitz criterion, the pricing) and clean presentation. It would not surprise a reader of Pericchi & Perez plus the moral-encroachment literature. The memo's own risk list names this outcome ("EXPECTED: 'robust Bayes + moral encroachment'"), and this test confirms it. To get past EXPECTED, the paper would need to lead with something not derivable from these texts. Possible routes:
- an impossibility or trade-off result. For example, no prior satisfies escape, monotonicity, bounded pull and a stated price bound in tight groups all at once; that would make "the cap L is a moral parameter" into a theorem about a frontier.
- a genuine answer to the zero-individual-evidence cases. As it stands, tail shape is silent there, so the account does not reach the paradigm cases of the statistical-evidence literature.
- promoting the escape/autonomy point from a gloss to the main argument, with a defence of why escaping by *distance* (the person's own performance) rather than by *precision* (the assessor's choice to gather evidence) is what respect for autonomy requires.
