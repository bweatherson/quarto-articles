# The Record and the Account: What a Track Record Can Show About Knowing the Chances

*Draft v2 (after step-5 triage). [CHECK] marks quotations still to be verified against the original.*

## 1. Introduction

In the *Meno* Socrates observes that someone with a true opinion about the road to Larissa is as good a guide as
someone who knows the road; what makes knowledge more valuable is that it is tied down by an account of the reason
why (97a-98a). In the *Charmides* he draws a harder consequence for anyone who must choose a guide. To tell a
doctor from someone who only pretends to be one, you must examine what he says and does about health and disease;
knowing *that* someone has some knowledge, without knowing medicine, will not do it; the only person who can
make the examination is a fellow practitioner (170d-171c).

The modern descendant of Socrates' question is the novice/expert problem: how can someone who lacks expertise in a
domain rationally decide whom to trust in it? Goldman's (2001) influential answer lists five sources of evidence
available to the novice. The last of them, the putative expert's track record, seems to evade the Socratic
difficulty. I cannot examine the astronomer's reasoning, but I can check whether the eclipse came when she said;
I cannot follow the doctor, but I can count his patients who recover. Recent critics doubt that novices can use
this source -- records are disputed, and judging their relevance takes expertise (Levy 2025) -- but the doubt is
about access to records. The idea that a good enough record would settle who knows is rarely questioned.

This paper questions it for an important kind of expertise: knowing the chances. Weather forecasters, clinicians
giving prognoses, election modellers and actuaries are experts, when they are, because the probabilities they
assign match the chances. A body of results in economics shows that if a test of a forecaster's record is
guaranteed to pass anyone who announces the true chances, whatever they are, then someone who knows nothing but
knows the test can pass it too, whatever happens (Sandroni 2003; Olszewski & Sandroni 2008; Shmaya 2008).
Philosophers have so far ignored these results; the economists who proved them have drawn general morals of their
own -- that falsifiability cannot screen strategic experts (Olszewski & Sandroni 2011) and that "the only coherent
notion of 'true' probabilities is relative" (Al-Najjar & Weinstein 2008: 555). I argue for a more specific thesis,
which says what the relativity is relative to:

> A finite record of probabilistic forecasts can show that someone knows the chances only relative to an account,
> held fixed by whoever reads the record, of what the chances could be. Without such an account no record shows
> it; with one, what the record shows is fixed by the account; and neither the metaphysics of chance nor the
> record itself supplies the account.

In the *Meno*'s terms: a record cannot tie knowledge of chance down; only an account can, and the account must
come from outside the record. The rest of the paper says what the accounts can be (§3), what comparison between
forecasters can and cannot add (§4), where the strategic results bite in practice (§5), and what is left for the
novice (§6). The mathematics is not mine; what I add is the analysis of what certification is relative to, the
argument that the metaphysics of chance does not remove the relativity, and the consequences for expertise.

## 2. What the theorems say

A forecaster observes outcomes one at a time -- rain or no rain each day -- and before each announces a probability.
A *test* is any rule that takes forecasts and outcomes and returns a verdict, pass or fail. Two standards will be
used throughout, and I keep them apart. A test has *type-I control* if a forecaster whose forecasts are the true
conditional chances passes with probability at least 1 - ε under those chances -- for every possible chance
process. A test can be *ignorantly passed* if there is a randomised forecasting strategy, using no knowledge of
the process, that passes with probability at least 1 - ε (over its own randomisation) on every possible sequence
of outcomes.

Calibration is the familiar example. Of the days a calibrated forecaster calls 30%, about 30% are rainy. Calibration
has type-I control by the law of large numbers. But a forecaster who says 30% every day in a place where it rains
on 30% of days is calibrated and useless (Seidenfeld 1985), and Foster and Vohra (1998) showed something stronger:
a forecaster who knows nothing about the weather can, by randomising his forecasts in response to his past
calibration errors, be calibrated on every possible sequence, even one chosen by an adversary who knows his method
but not his coin flips.

The difficulty is not peculiar to calibration. Sandroni (2003) showed that every test on records of a fixed finite
length that has type-I control can be ignorantly passed. Olszewski and Sandroni (2008) extended this to tests on
unbounded records that reject at a finite time, provided the test is *future-independent*: whether a forecaster is
rejected at a time depends only on his forecasts about data already observed. Shmaya (2008) extended it to every
(Borel) test that looks only at the forecasts actually made, even if it delivers its verdict at infinity. These
results concern tests that respect, or nearly respect, Dawid's *prequential* principle, that forecasts should be
assessed only by the forecasts made and the outcomes that occurred. And Olszewski and Sandroni (2009b, Prop. 1) showed that if there is a bound on how much
data the tester will wait for, then over any convex and compact class of processes, *every* test with type-I
control can be ignorantly passed, including tests that make the forecaster commit in advance to his whole theory.

Three features of these results matter.

*The engine.* The proofs use a minimax theorem. Suppose Nature picks a process and the forecaster picks a strategy,
and the forecaster is paid when he passes. Against any process the forecaster has a good reply: announce it.
Against any *lottery* over processes he also has a good reply, because a lottery over processes is observationally
a single process -- the mixture -- which he can announce. Al-Najjar and Weinstein (2008: §6) call this the
"reducibility of Nature's compound lotteries", and it is the key. The minimax theorem then yields one randomised
strategy that does well against every process at once, hence on every sequence.

*Who the charlatan is.* He needs to know the test; no single strategy passes all future-independent tests at once
(Olszewski & Sandroni 2008). He needs no knowledge of the weather. And his forecasts are not secretly good: they
differ from the chances; only the verdicts coincide. A *sincere* non-expert, who forecasts by some fixed method of
his own without regard to the test, is not covered by the theorems, and §5 returns to the difference.

*What escapes.* There are tests that cannot be ignorantly passed. They violate the prequential principle, using the
forecaster's predictions about histories that have not occurred, and they need unbounded data (Dekel & Feinberg
2006; Olszewski & Sandroni 2009a). Even then the charlatan can only be shown to *fail on some* sequences; for any
probability measure fixed in advance, there is a strategy that passes with high probability on all but a set of
sequences of small measure (Olszewski & Sandroni 2009b, Prop. 3). I will not rely on these tests: no finite record
uses them.

## 3. Accounts of what the chances could be

### 3.1 The diagnosis

The engine of §2 has one substantive premise: that a mixture of possible chance processes is itself a possible
chance process, so that a test which must protect anyone who knows the chances must protect anyone who announces a
mixture. With bounded data, convexity (with compactness) of the protected class is what the impossibility uses (Olszewski &
Sandroni 2009b, Prop. 1), and some non-convex classes escape it. Suppose the tester counts only i.i.d. processes as
possible, and the forecaster must announce his bias in advance. A test that fails him if the observed frequency
strays far from his bias has type-I control for every bias, and no lottery over biases passes it on every sequence,
since no lottery can put high probability near every frequency at once. The mixture of two biases -- the charlatan's
natural reply -- is not a possible chance process by the tester's lights, so the reducibility fails.

What does the tester bring when she brings such a restriction? Not a credence about outcomes. Her credence about
outcomes, if she is uncertain which i.i.d. process obtains, is itself a mixture; and a decision-maker who evaluates
options by their worst expected value over a set of probability functions cannot distinguish that set from its
convex hull, so if the restriction were merely part of her uncertainty about outcomes, convexity would return. The
restriction concerns how her uncertainty is decomposed into hypotheses about the chances. It is a commitment about
what counts as a chance hypothesis -- an account of what the chances could be. The thesis of this paper
is that some such account is needed to certify knowledge of chance from a record, and that the account determines
what is certified. There are three candidates for supplying it: the evaluator, the world, and computation.

### 3.2 The evaluator's hypotheses

Suppose the evaluator is a Bayesian with a prior over the processes that might be generating the data. Stewart
(2011) shows that a test then works: pass a forecaster if, in the long run, his forecasts are more likely than hers
on the data and differ from hers non-negligibly often. A forecaster who knows the true process passes with
probability 1 - ε by her lights, where ε is her prior probability of learning the truth quickly without help; and
any forecaster who knows only what she knows passes with probability zero by her lights.

What this test is relative to is not the evaluator's forecasts but her prior over chance hypotheses. The same
forecasts can come from very different priors. Suppose she forecasts 1/2 every day. She may do so because she is
certain the process is a fair coin; then ε = 1: no one can add to what she knows, and the test fails every true
expert. Or she may do so because she is uniformly uncertain which deterministic sequence will occur; then ε = 0,
and a pass certifies a prophet. Likewise an evaluator certain that the coin has bias 0.3 or 0.7 learns which so
quickly that ε is 1, while one with a diffuse prior over all biases has ε = 0.
What the test certifies is "knows which of my hypotheses about the chances is true, and knows it before I would
have learned it". The second clause matters: when her prior would eventually have led her to the truth, the
expert's advantage is one of speed (Pomatto, Al-Najjar & Sandroni 2014 tie testability to the merging of opinions).
And the guarantee holds by her lights: she is certain that charlatans fail; in a world her prior treats as
negligible, someone with no special knowledge but a better prior will pass.

This is real certification, available to anyone with a prior. But its demand on the novice is heavier than it first
appears. She must have not just forecasts but a view of the space of possible chance hypotheses, and lacking such a
view is a large part of what it is to be a novice.

### 3.3 Not the world

Can the metaphysics of chance supply the account, so that what is certified is knowledge of the chances simpliciter?
The two main views both say no, for different reasons.

On propensity and other primitivist views, the chances are physical single-case tendencies, and mixtures of chance
processes are chance processes. The standard example is Pólya's urn: draw a ball, return it with another of the
same colour, repeat. The urn's chances at each draw are fixed by its current composition, which is a function of
the draws so far; there is no hidden parameter. Yet the process is an exchangeable mixture of i.i.d. processes (a
Beta mixture, by de Finetti's theorem). Nothing about the example is special. A mechanism whose state records the
draws so far, and which at each step produces an outcome with a chance computed from that state, can realise any
process whatever as its chance process. So on such views the class of possible chance processes is closed under
mixture, the reducibility holds, and the impossibility applies with full force: someone who knows the mechanism and
someone who knows the test are indistinguishable by any bounded record.

On the best-system analysis (Lewis 1994), the chances are fixed by the whole history of the world, as the
probability function in the system that best balances simplicity, strength and fit, where fit is the probability
the system gives the actual history. Here mixtures are disfavoured but not excluded. A mixture's fit is a weighted
average of its components' fits, so it never fits better than its better component; whether a mixture can be best
then depends on how simplicity is measured. If simplicity penalises forming mixtures of distinguishable systems, the
half-and-half mixture of a 30% coin and a 70% coin is never best, and the class of best-system chance functions is
not convex. But some mixtures are best on any reasonable measure: the chance functions of statistical mechanics are
mixtures over deterministic histories (Loewer 2004), and on description-length measures of simplicity, which Schwarz
(2016) recommends, the parameter-free Laplace rule (Pólya's urn again) often beats every coin of fixed bias.

More decisively, on the best-system view the chances depend on the whole history, including the part not yet
observed. Knowing them is partly knowing the future pattern of outcomes. A test that sees only a finite record, and
is required to pass the forecaster who announces the best system of the actual history whatever that history is,
must pass every forecaster whose announced system is best for some continuation of the record; when most of the
history is still to come, that is nearly everyone. The best-system analysis makes knowledge of chance certifiable
by the whole history and by nothing less. So both views agree that no finite record certifies knowledge of the
chances. On the propensity view this is because a knower and a mixer leave the same kind of record; on the
best-system view it is because the chances outrun the record. (There is a nearby argument by Earman and Roberts
(2005) that laws must supervene on the Humean base if they are to be empirically testable; the present point is
that, for chances, supervenience on the whole history does not buy testability by any part of it.)

### 3.4 Not computation, except in the limit

A third candidate is computational. If the charlatan must compute his forecasts efficiently, there are tests he
cannot pass (Fortnow & Vohra 2009; Hu & Shmaya 2013), and if the chances are themselves computable, any two computable
forecasting systems that are calibrated with respect to every computable way of selecting days must asymptotically
agree (Dawid 1985 [CHECK]; Dawid 2017). That is identification of the chances from the record alone, relative to a
computational class. But the agreement is asymptotic -- on any finite record, two such systems can disagree
arbitrarily -- and topologically typical sequences have no computable calibrated forecaster at all (Belot 2013). The
computational account says what the chances are in the limit of an infinite record; it does not say what a finite
record certifies.

## 4. Comparison

The evaluator's own account is one baseline. Another forecaster is a second. Here the formal results confirm
Socrates and also correct a natural reading of him.

Suppose B's forecasts are the true chances, and A is any rival whose forecast each day is fixed before the outcome.
Then the ratio of the probabilities A and B gave to what happened is, under the true chances, a nonnegative
martingale with mean one, so the probability that A ever outscores B by a factor c is at most 1/c, whatever A does
(Ville's inequality; it is the core of Al-Najjar and Weinstein's Theorem 1). A known craftsman, then, cannot be
beaten except by luck. What he can do is discredit rivals: a rival whose forecasts differ substantially from the
chances will typically be outscored by him. And a rival who is not beaten is shown only to forecast close to him.
The fellow practitioner of the *Charmides* examines what the other says and checks it against what he knows; the
formal analogue certifies by agreement and discredits by beating, and it never crowns anyone as knowing more.

Crowning a winner needs a different premise: that one of two forecasters knows the chances, though the evaluator
does not know which. Then, if A outscores B by a factor c, A is the informed one unless an event of probability at
most 1/c has occurred. This is the case for which Al-Najjar and Weinstein designed their comparative test, and
Feinberg and Stewart (2008) give an infinite-horizon analogue. What is certified is relative to the pair: given that
one of us knows, it is A.

Two further limits on comparison deserve emphasis.

*Provenance.* Comparative certification assumes that each forecaster's forecasts reflect what he knows. A forecaster
who sees a rival's current forecast can beat the rival's score by the rival's calibration error, without any
knowledge of the domain, by recalibrating the rival's forecasts against their past performance ("calibeating":
Foster & Hart 2023). He cannot do better than the rival's refinement -- the part of the score that reflects sorting
rainy days from dry -- so he exploits a defect in the rival rather than adding knowledge; but a comparison will
credit him with knowledge that is the rival's. Whether one forecast draws on another is a fact about provenance that
the record does not contain. Rules can forbid seeing rivals' current forecasts; they cannot forbid two forecasters'
drawing on the same public model.

*The guild.* Can comparison at least tell whether anyone in a group knows the chances? Al-Najjar and Weinstein
(2008, Thm 7) show that, on records of finite length, any test meant to say "at least one of these two is informed"
that passes when one is truthful can be passed by two uninformed forecasters. Olszewski and Sandroni (2009c) show
that independently randomising uninformed forecasters can jointly pass any comparative future-independent test with
type-I control [CHECK: PNAS; known via Olszewski 2015]. Feinberg and Stewart's strict cross-calibration test makes
joint passing by uninformed forecasters rare only at the price of failing some true experts. So a field cannot
certify itself by its members' records. Within a field that contains a knower, records sort its members; within a
guild of non-knowers, they sort non-knowers, and nothing in the comparison reveals which situation obtains.

## 5. Where the strategic results bite

The impossibility theorems concern a forecaster who knows the test and forecasts against it. A sincere non-expert
forecasting by a fixed method of his own is not their target, and a Bayesian evaluator with a suitable prior will,
by her lights, fail him (§3.2). It would be a mistake to conclude that the novice facing two sincere, disagreeing
doctors is in the charlatan predicament. Her problem is §3's: whatever their sincerity, she can certify knowledge
of the chances only relative to an account of what they could be.

But test-aware forecasting is not exotic, and it is becoming the norm. Institutions whose standing depends on a
published metric, and forecasters paid according to one, have reason to optimise against it. The clearest case is
machine-learning systems. When an AI system's forecasting is evaluated on a public benchmark, the test is known by
construction: it is published, earlier leaderboards are in the training data, and models are tuned against the
metric. No intent is required for the theorems' condition to be met. Two consequences follow. First, an absolute
pass mark -- a calibration threshold, a Brier score below some level -- certifies nothing against such a system,
since calibration-type tests can be passed by efficient procedures (Foster & Vohra 1998; Foster & Hart 2021).
Second, comparison against human forecasters is vulnerable to provenance failure when systems can see the crowd's
forecasts, as they often can (benchmark designers already run systems with and without crowd forecasts in context:
Karger et al. 2025). Copying the crowd inherits the crowd's resolution, and recalibrating it removes the crowd's
calibration error; neither is knowledge of the domain. What can be certified is resolution beyond the crowd's: value added over
the crowd forecast as a baseline, which is the structure of §3.2 with the crowd in the evaluator's place.

## 6. The novice

Levy (2025) argues that the novice's criteria "extend" trust rather than "ground" it [CHECK exact]. The argument
here vindicates the slogan, but for a different reason and in a different form. The reason is not access: the
theorems grant the evaluator every outcome, every forecast and unlimited data, and the difficulty remains. It is
identification: a record of probabilistic forecasts does not carry, in a form any test can extract without an
account of the possible chances, the information that its author knows them. And what is extended is not trust in
persons or institutions but an account of what the chances could be -- which the novice usually lacks.

The novice is not left with nothing, however, because she does not need to identify experts in order to benefit
from them. Suppose she forms her forecasts by mixing her own and the candidates' forecasts, weighting each by how
well it has done -- a Bayesian mixture over forecasters, not over chance hypotheses. Then on every sequence of
outcomes her cumulative logarithmic score is within log(1/w) of the best forecaster in the mix, where w is the
weight she started him with, whatever the forecasters do (the aggregating bound; for its use by novices see
Herrmann 2022; cf. Olszewski & Pęski 2011 on contracts that extract the value of advice without learning the
expert's type). This needs no account of the chances and no assumption about provenance; it is the same minimax
mathematics that makes certification impossible, put to the novice's use. She defers to forecasts, not to persons,
and never learns who, if anyone, knows the chances.

The limits are plain. The bound is only as good as the best forecaster in the pool, and by §4 she cannot tell
whether anyone in the pool knows anything. And it needs repeated, verifiable forecasts; most of Levy's cases --
disputes about climate or policy -- are not like that.

## 7. Objections

*"The type-I requirement is too strong."* Requiring a test to protect experts whatever the chances may seem
excessive; Stewart (2011: §3.1) notes that a tester facing a decision problem would impose it only under extreme
ambiguity aversion. I agree. The thesis is that relaxing it means supplying an account of the possible chances; the
theorems show what happens when none is supplied.

*"Records can discredit."* They can: by Ville's inequality, being outscored by a factor c discredits a claim to know
the chances at level 1/c, and Shafer (2021, 2023) builds a theory of testing forecasters on this. But discrediting is
not certifying, and what the novice wants is to know whom to trust. The asymmetry is the elenchus's: examination
convicts, it does not crown.

*"Real experts cannot commit in advance."* The tests that resist manipulation require forecasters to commit to
predictions about histories that never occur, and the Eleatic Stranger argues that the true expert should not be
bound by rules laid down in advance (*Statesman* 294a-295b). The point bears on those tests, which I have not relied
on; it strengthens the conclusion that finite records alone do not certify.

*"Calibration and Brier scores are what we actually use, and they work."* They work comparatively: a forecaster with
a lower Brier score than a rival forecast better on these days. That is §4's certification, with its limits.

## 8. Conclusion

A good enough record seems as if it should settle whether someone knows the chances. It does not. Whoever reads a
record of probabilistic forecasts must bring to it an account of what the chances could be -- her own hypotheses, a
restriction she commits to, or a computational class in the limit -- and what the record certifies is relative to
that account: knowledge of which hypothesis is true, sooner than she would have learned it; knowledge beyond what
the restriction builds in; agreement with a known practitioner, or superiority within a pair one of whom knows.
Neither the metaphysics of chance nor the record supplies the account. Socrates' fellow practitioner is one way of
bringing it; for the rest of us, the better course is to use experts' forecasts without pretending to have
certified them.
