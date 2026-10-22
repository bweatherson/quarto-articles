# Idea memo v2: "Not How Much, but Where" (working title; alt. "Room to Be Exceptional")

Subject (BW's choice from a shortlist): Stein's paradox and the right to be judged as an individual.
History: memo v1 (Stein as an aggregation paradox; the right = a bounded stand-alone guarantee) was rejected by
advisor 1 (advisor-report-v1.md, verdict A): the aggregation reading is in Vassend, Sober & Fitelson 2017 fn 27; the
bounded guarantee is Hodges & Lehmann 1952 restricted Bayes (Koenker & Gu 2026 tie it to limited translation (LT) and
to "individuals"); Pareto-admissibility is not distinctive; the v1 memo reversed Eidelson p. 209. Advisor 1 offered a
"riskier, possibly more surprising" alternative -- Moss's rule of consideration -> heavy-tailed priors -> LT -- "check
before pursuing". This memo pursues it after a priority check (research/priority-tails-report.md) and new
computations (code/tails.py, code/huber.py + huber.out.txt, code/eb_batch.py + eb_batch.out.txt).

## The problem

Assessors routinely combine information about a group (or about a batch of co-assessees) with a person's own,
noisy record: Kelley's formula in testing, Phelps/Aigner-Cain statistical discrimination in hiring, empirical-Bayes
(James-Stein) value-added ratings of teachers and hospitals, credit scoring of thin files. Almost all of this uses a
normal (conjugate) model: x | theta ~ N(theta, s^2), theta ~ N(M, tau^2), so E[theta|x] = x - c(x - M), c = s^2/(s^2+tau^2).
Three features of this model are the target:
1. **The group's pull grows with exceptionality.** The amount by which a person's assessment is dragged back toward
   the group is c|x - M|: the more strongly her record conflicts with the group expectation, the harder she is pulled
   (Clemente: .400 over 45 at-bats predicted at .290 by normal EB; Pericchi & Perez's "Clemente problem").
2. **The group gap never closes.** Two people with the same record, from groups with means M_A > M_B, are assessed
   c(M_A - M_B) apart at *every* level of performance; to reach any threshold the B-member needs a record
   (M_A - M_B)c/(1-c) better (with c = .5 and a 1-sd group difference: a full extra sd, at every threshold; huber.out.txt).
   No performance on a test of given precision escapes the group discount; only more evidence (smaller s) does.
3. **In Stein pooling, the exceptional pay more the larger the batch.** Positive-part grand-mean James-Stein; one
   person at theta = 6, everyone else at 0: her risk (stand-alone = 1) is 2.0 at p = 10, 12.1 at p = 50, 25.8 at
   p = 200 (eb_batch.out.txt). And her assessment depends on how tightly the strangers cluster (batch dependence).

These are known statistical facts (Efron & Morris 1971-75; Aigner & Cain 1977; Efron 2010; Pericchi & Perez 2026).
What philosophy lacks is an account of what, exactly, the demand to treat people as individuals requires of such
assessments.

## Thesis

**Treating someone as an individual, when her own record is combined with information about others, constrains not
how much weight the group information gets but where it gets it: the assessor's prior may be fully informed by the
group in the bulk, but its incredulity toward exceptionality must be bounded -- its log-density may fall off no
faster than linearly away from the group's centre (log pi is L-Lipschitz in the tails). Normal models violate this.**

The condition has three faces, which coincide (formal facts below, all credited to statisticians):
- **Epistemic:** the group-based expectation is held as "a working hypothesis ... that could be easily dislodged"
  (Gardiner 2018): a sufficiently exceptional record shows through. This is a precise credal counterpart of Moss's
  rule of consideration ("keep in mind the possibility that they might be an exception").
- **Distributive:** nobody's assessment is moved more than s^2 L from her own record, whatever her true value and
  however large or tight the batch; so everyone's risk is bounded (<= (s + s^2 L)^2; 1 + k^2 in the Huber/Bayes case),
  and batch dependence is bounded. This is Efron-Morris limited translation / Hodges-Lehmann restricted Bayes.
- **Anti-discriminatory ("escape"):** group membership ceases to matter for sufficiently exceptional records: the
  group gap and the extra hurdle vanish at the extremes (normal: gap .50 at every x; Huber k=1: .34/.18/.05/.006/.000 at
  x = 1/2/3/4/6; extra hurdle to reach posterior mean T = .5/1/2/3/5: normal 1.0 throughout; Huber .46/.27/.06/.006/0).

## Argument (section plan, ~6,000 words)

**§1 Three cases** (700). Clemente; Eidelson's "Discounted Performance" (Sally's audition reinterpreted through
her ethnicity and sex -- a group prior overriding an individual record); a Phelpsian hiring case. One table.

**§2 Existing accounts mislocate the demand** (1,300).
(a) *Overall-weight accounts.* Johnson King & Babic 2020 and Babic & Johnson King 2023 put moral encroachment into the
prior's location/concentration (lower alpha in a Beta-binomial about a group proportion; no individual record);
Y. Liu 2026 adjusts priors for salient individuals; Liu & Liang 2020 say respecting individuality requires that
"individualized evidence be prioritized", glossed as objective/non-informative priors; Eidelson's "reasonable weight".
Dilemma: turning down the group's weight across the board either (i) discards group information for typical
cases, where using it is unobjectionable (Eidelson himself: declining to use the brother's record "would hardly have
constituted a failure to treat me as an individual"; a flat prior has risk 1 vs 0.5) -- Pericchi & Perez's point that
inflating prior variance cuts shrinkage "to all batters in equal proportion, even to those who are not exceptional" --
or (ii) leaves the structure intact: under *any* normal prior, however diffuse, the pull still grows linearly and the
gap never closes. Lowering c shrinks the hurdle; it never removes it.
(b) *Modal/attentional accounts.* Moss's rule works at the level of knowledge and relevant alternatives and is "not an
epistemic norm"; Bolinger 2020 holds proportional credence permissible; Smartt 2022 reads the rule as a disposition
to update. A normal-prior updater satisfies all three -- she updates, she "considers" the exception -- yet no record
ever escapes her group discount. So these accounts do not yet say what the rule requires of assessment.

**§3 Bounded incredulity** (1,000). Tweedie: E[theta|x] - x = s^2 (log m)'(x), m the prior predictive. If log pi is
L-Lipschitz then m(x+h) <= e^{L|h|} m(x), so |E[theta|x] - x| <= s^2 L for every x (three-line proof; surely known --
Pericchi & Smith 1992 give the double-exponential case). Among log-concave priors, bounded pull holds roughly iff
tails are no thinner than exponential. Natural realisation: the "Huber prior" (normal in the bulk, exponential
tails): it reproduces normal shrinkage for typical records and LT for the exceptional; it is the Bayes rule Koenker &
Gu identify with LT. The three faces follow. Distinguish: bounded vs vanishing pull (Laplace/Huber vs t/Cauchy);
distance vs precision (normal priors let precise records escape; the claim concerns exceptionality at fixed
precision); Cauchy-type priors are non-monotone and can *reverse* the group gap (-0.17 at x = 4), so require
log-concavity.

**§4 Why this is the content of the right** (1,200).
(i) Convergence: the epistemic reading (Moss/Gardiner) and the distributive/complaint reading (a guarantee owed to
each person; advisor 1's "baseline guarantee") pick out one condition. Each reading alone faces known objections
(moral encroachment controversy; "why that baseline?"); their coincidence is evidence that the condition is what
the ordinary demand was tracking.
(ii) Escape and agency: Eidelson grounds the demand in respect for autonomy -- giving weight to how a person has
shaped her life. Under a normal model her own performance can never free her from her group's discount; only the
assessor's choosing to gather more evidence can. Bounded incredulity is the minimal condition under which what she
does can make her group irrelevant. 
(iii) Reply to "a fixed proportion for everyone is equal treatment": what is equal is the proportion, not the
burden; decisions are made at absolute thresholds, where the normal model imposes a constant group-indexed hurdle.

**§5 Epistemic credentials and price** (900).
(i) Tail shape is what group data least determine: extremes are by definition sparsely observed, and recovering the
distribution of true values from noisy records is a badly ill-posed deconvolution problem (logarithmic rates under
normal noise: Carroll & Hall 1988, Fan 1991 -- check). Unmodelled heterogeneity (scale mixtures) fattens tails
(Andrews & Mallows 1974). So the normal tail is a substantive assumption -- that no one is very far from the group --
held with super-exponential confidence (Fuquene, Cook & Pericchi 2009: conjugate analysis is "dogmatic").
(ii) Credalising Moss: "she might be an exception" = a contamination component in the prior. Only a component with
tails at least exponential yields escape; a wider *normal* exception component reduces but never bounds the pull. So
Moss's rule underdetermines the credal requirement; bounded incredulity is its minimal credal content.
(iii) Price: if the world is in fact normal (tau = s), Huber priors cost 0.3% (k=2), 1.8% (k=1.5), 9% (k=1) in average
squared error; if 5% of people are drawn from a 5x wider distribution, they *gain* (0.80 -> 0.585). So the demand
operates mainly as tie-breaking among evidentially permissible priors (moderate encroachment, Fritz 2020), and where
it does override a well-supported normal tail its price is explicit -- an exact version of Gendler's (2011) dilemma.
Two readings kept apart: a norm on institutional assessment models (no credal encroachment needed) and a norm on
individual credence (moderate encroachment).

**§6 Objections** (800). (a) Homogeneous groups: with a cap fixed in noise units, the price can be large when the
group is truly tight (p = 200, everyone at 0 but one: average risk .32 vs .03-.17 for JS, still far below the
stand-alone 1.0); with the cap in prior-sd units the price stays small but protection weakens in tight groups. The
cap L is a moral parameter; show the frontier; the thesis fixes the form, not the size. (b) Unequal noise: the bound
is s^2 L, so thin records may be moved further (Kane & Staiger's counter-concern). (c) Bounded scales: state the
condition on the logit scale. (d) Symmetry: bounded incredulity also stops the group rescuing the exceptionally bad
member of a high-mean group -- a feature (treating as an individual cuts both ways) but it answers advisor 1's
self-interest asymmetry only partly. (e) "This is just robust statistics": the moral content is in which errors
are made to whom when the tail is uncertain, and in the price accepted when it is not.

**§7 Conclusion** (200). Stein's "Clemente problem" and statistical discrimination are one problem; the right to be
treated as an individual is a demand on tail shape.

## Claimed as new / not new

Not new (credit): normal shrinkage is unbounded and pulls the exceptional most; heavy-tailed priors bound or remove
the pull (Dawid 1973; O'Hagan 1979, 1990; Pericchi & Smith 1992; Pericchi & Sanso 1995; Andrade & O'Hagan 2006;
Fuquene, Cook & Pericchi 2009; O'Hagan & Pericchi 2012; Pericchi & Perez 2026); LT and restricted Bayes (Efron &
Morris 1971-75; Hodges & Lehmann 1952; Koenker & Gu 2026); casual fairness talk in statistics ("unfair 'pulling
down'", "tyranny of the majority", COPSS-CMS "unfair to move their SMRs"); moral encroachment via priors (Johnson
King & Babic; Y. Liu); individualised evidence first (Liu & Liang). Phelps's constant gap (Aigner & Cain: "within-group
discrimination is inevitable").

Apparently new (priority agent found nothing): (1) locating the demand to treat people as individuals in the tail
shape of the prior ("where, not how much"), against overall-weight and modal/attentional accounts; (2) the
convergence of epistemic, distributive and escape readings on one condition; (3) the escape condition for statistical
discrimination (group gap vanishing for exceptional records under exponential tails vs constant under normal) and
its link to autonomy; (4) Moss's rule credalised as contamination, and the result that only heavy-tailed exception
components honour it; (5) Gendler's dilemma priced.

## Risks

- EXPECTED: "robust Bayes + moral encroachment". A formal judge who knows Pericchi & Perez may predict it.
- The moral-encroachment controversy (Gardiner; Smith 2025 rejects encroachment). Mitigation: institutional reading;
  tie-breaking reading.
- The price is not always small (homogeneous groups, caps in noise units).
- Reading thin: Johnson King & Babic 2020 not read directly; Moss PAS page numbers; Dawid 1973, O'Hagan 1979,
  Pericchi & Smith 1992 known via abstracts and secondary statements.
- Stein's specific role shrinks: Stein pooling becomes one instance (the prior estimated from strangers). The
  Stein-specific points (batch size and batch dependence) stay in §1 and §6.

## 150-word abstract (for the go/no-go test)

Statistical assessment of persons usually combines group information with a person's own noisy record through a
normal model. In such models the group's pull on an assessment grows with how exceptional the record is, and the gap
between equally performing members of different groups never closes. I argue that the demand to treat people as
individuals concerns not how much weight group information receives but where it receives it: the prior may be fully
informed by the group in the bulk, but its incredulity toward exceptionality must be bounded, so that its log-density
falls off no faster than linearly. This one condition is at once epistemic (group expectations become easily
dislodged working hypotheses, a credal version of Moss's rule of consideration), distributive (no one is moved more than
a fixed distance from her own record) and anti-discriminatory (group membership stops mattering for exceptional
records). Because tails are what group data least determine, the demand is cheap.
