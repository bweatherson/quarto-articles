# Idea memo v3: "Not Like the Others" (working title; alt. "The Exception and the Rule")

Subject (BW's choice): Stein's paradox and the right to be judged as an individual.
History: v1 (Stein as aggregation; bounded stand-alone guarantee) rejected by advisor 1 (Hodges-Lehmann; VSF fn 27).
v2 (treating as an individual = bounded incredulity / tail shape) failed a go/no-go predictability test
(gonogo-prediction.md: EXPECTED) and was rejected by advisor 2 (advisor-report-v2.md): slogan in Pericchi & Perez
§1.3; bound in Johnstone & Silverman 2004; a global Lipschitz cap is itself a "how much" constraint; Eidelson
misread; "cheap" false where it matters. Advisor 2 proposed the core of this memo ("pull equals push"); this memo adds
a correction (the scope channel, §3) that turns their dilemma into a trilemma, and new computations
(code/scope.py, scope.out.txt; advisor's code/advisor2/pull_equals_push.py, refencing_bias.py).

## The observation

Pooled (Stein-type, empirical-Bayes) assessment: x_i = theta_i + e_i, e_i ~ N(0, s^2), theta_i ~ pi(. - M), M estimated
from the batch that includes the person. Write psi = -(log m)' for the marginal score.
- **Pull** on member i (Tweedie): x_i - E[theta_i | x_i] = s^2 psi(x_i - M).
- **Push** of member i on the group estimate: type-II ML solves sum_i psi(x_i - M) = 0, an M-estimator whose influence
  function is proportional to psi. So each member pushes the group's estimate exactly as hard as it pulls her; the
  group centre sits where the pulls sum to zero.
- Normal/James-Stein: full pull, full push. Huber/Laplace: both capped. t/Cauchy: both vanish.

In mixture models with a learned exception weight eps -- theta_i ~ (1-eps) N(M, tau^2) + eps H -- the same coupling
appears via EM responsibilities r_i = P(i typical | x_i): her assessment is r_i x (shrunk toward M) + (1 - r_i) x
(her own record, roughly); she pushes the centre with weight r_i and pushes eps with weight (1 - r_i). **The degree
to which she is assessed as typical is the degree to which she counts as evidence about the typical.** Individuating
her is reclassifying her evidential role: from evidence about what the group's members are like, to evidence about
how many exceptions it has.

All formal content is elementary and must be credited (Tweedie/Efron 2011; M-estimation and influence functions,
Huber; robust random-effects models: Lange, Little & Taylor 1989, Pinheiro, Liu & Wu 2001; EM). The claim to novelty
is the normative reading.

## The problem it creates

Two norms are standardly treated as allies against stereotyping:
- **(I) Individuality.** An exceptional record should be able to escape the group's expectation (Moss's rule of
  consideration; Eidelson; Liu & Liang; Lippert-Rasmussen; the statisticians' "Clemente problem").
- **(R) Responsiveness.** Generalisations about groups must yield to counterexamples; failure to do so is the
  mark of prejudice (Allport's "re-fencing"; subtyping in social psychology -- Weber & Crocker 1983, Kunda & Oleson
  1995, Gershman & Cikara 2023; prejudice as resistance to counterevidence -- Begby 2021, Napolitano 2023).
And a third, implicit in "judged on her own record":
- **(O) Own-record.** Whether a person's exceptional record is believed should not depend on whether others in
  her group have been exceptional before (no borrowed individuality).

## Thesis

**In pooled assessment, these three cannot be jointly satisfied by a coherent assessor, and each way of giving one
up has a recognisable social form:**
1. **Normal pooling (give up I):** the exceptional are pulled back in proportion to their exceptionality; in
   exchange they lift the generalisation for everyone (tokenism: the exceptional member pays to represent the group).
2. **Fixed-shape robust pooling, Huber/LT (give up R, in proportion as I is secured):** exceptions escape and
   leave the generalisation intact -- "you're not like the others", re-fencing implemented exactly.
3. **Learned-scope pooling (give up O):** exceptions escape *and* revise the generalisation, through its scope (how
   many exceptions) rather than its centre -- but only once the group has a track record of exceptions. Pioneers
   pay; individuality is borrowed from predecessors.
4. **Decoupling (give up coherence):** assess individuals with a heavy-tailed score, revise the generalisation with
   the normal one. This is what limited-translation practice does (LT is not the Bayes rule of any prior: Koenker &
   Gu 2026). It honours I, R and O at the price of a gap between what the assessor believes about the group and how
   she assesses its members.
I will argue (tentatively) for (3) with a moral floor -- a fixed minimal exception weight, so pioneers get
(2)-level protection -- or for (4) for institutions; the paper's main claim is the structure, not the choice.

Corollary for the ethics of discrimination: "treat people as individuals" is not a remedy for stereotyping in pooled
assessment; individuating the exceptional is, of itself, compatible with -- indeed partly constitutive of -- keeping
the stereotype (cf. Beeghly 2018 on whether failing to treat persons as individuals is what is wrong with
stereotyping; the microaggression literature on "you're not like other X": Rini 2021, McTernan 2018).

## Numbers (code/scope.py, 40 reps; batch of 50: 50-k typical from N(-1,1), k exceptional at theta = 3; assess a
NEW member with record 3, and one with record -1)

| k | normal EB: centre / new x=3 / new x=-1 | Huber (fixed): centre / x=3 / x=-1 | mixture (learned eps): centre / eps / x=3 / x=-1 |
|---|---|---|---|
| 0 | -0.94 / 1.00 / -0.96 | -0.93 / 2.01 / -0.97 | -0.94 / .007 / 1.09 / -0.97 |
| 3 | -0.75 / 1.71 / -0.91 | -0.82 / 2.01 / -0.92 | -0.84 / .089 / 1.58 / -0.92 |
| 10 | -0.16 / 2.30 / -0.81 | -0.33 / 2.03 / -0.71 | -0.44 / .343 / 2.06 / -0.75 |

Reading: normal -- exceptions move the centre most (and widen tau); the new exceptional member is pulled to 1.00
with no predecessors. Huber -- she gets ~2.0 regardless of history; centre moves less. Mixture -- with no
predecessors she is treated almost as under the normal model (1.09; P(typical) .96); with 10 predecessors, 2.06; the
centre is most protected. Advisor 2's biased-belief case (hyperprior on centre at -3, truth 0): after 20 records,
centre -0.84 (normal) vs -1.09 (Huber) -- robust pooling also protects a biased generalisation. Effects modest at
these settings; need cases where they are large.

## Plan (6,000 words)
1. Two cases (Clemente in a batch; a hiring panel's prior estimated from past applicants, with one exceptional
   applicant). Pull and push in one table. (700)
2. Three norms, with sources; the usual assumption that (I) and (R) are allies. (1,000)
3. The coupling: location (pull = push) and mixture (responsibilities). Credit throughout. (900)
4. The trilemma and its four resolutions, each with its social form (tokenism; re-fencing; pioneers pay;
   decoupling). Numbers. (1,500)
5. Which to choose: coherence vs institutional decoupling; the moral floor. (1,000)
6. Objections: binary traits (no tails; the coupling still holds for the log-odds of a base rate?); bounded scales;
   unequal noise; law (protected classes: 42 USC 2000e-2(l) -- restrict to non-protected reference classes or say
   what law already chooses); "this is just exchangeability". (700)
7. Conclusion. (200)

## Risks
- "Exchangeability means others' records matter; of course you can't have learning without dependence" -- the
  trilemma may look trivial to formal judges. The weight must be on the identification of (I), (R), (O) with
  distinct, widely held anti-stereotyping norms and on the social forms.
- Exception-tolerance protecting generalisations is discussed for generics (Leslie 2008, 2017) and in social
  psychology; the normative tension may be anticipated there.
- Economics of learning about groups (Bohren, Imas & Rosenberg 2019; Fryer 2007; Coate & Loury 1993) may contain
  "pioneers pay".
- Effects modest numerically.

## 150-word abstract (go/no-go)
When an assessor pools records -- as in Stein shrinkage and empirical-Bayes ratings -- the group's pull on a member
and that member's pull on the group's estimate are one function. I use this to show that three norms commonly
invoked against stereotyping conflict. Individuality: an exceptional record should escape the group's expectation.
Responsiveness: generalisations must yield to counterexamples. Own-record: whether an exceptional record is believed
should not depend on whether others in the group were exceptional before. No coherent assessor satisfies all three.
Normal pooling sacrifices individuality: the exceptional pay to revise the group's image (tokenism). Robust pooling
lets exceptions escape while leaving the generalisation intact ("you're not like the others"). Learning how common
exceptions are honours both, but only for those with predecessors: pioneers pay. Honouring all three requires
assessing individuals by a different model from the one used to learn about their group. Treating people as
individuals is no remedy for stereotyping.
