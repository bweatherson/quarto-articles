# Only a Fellow Craftsman: What a Track Record Can Certify

*Rough draft v1 (step 3). Quotations marked [CHECK] are from secondary sources or memory and must be verified.*

## 1. The doctor and the quack

Near the end of the *Charmides*, Socrates asks what use temperance would be if it were knowledge of knowledge and of
its lack. Could the temperate man, who knows nothing of medicine, tell a real doctor from a pretender? He could not:
to examine whether someone is a doctor he would have to examine what the man says and does about health and
disease, and that requires medical knowledge. Temperance so understood would not let him distinguish the doctor
"from the man who pretends" [CHECK, 170e], nor anyone who knows from anyone who does not -- except, Socrates adds,
"one's fellow-artist" [CHECK, 171c], as craftsmen usually can.

The question has a modern descendant, the novice/expert problem: how can someone who lacks expertise in a domain
rationally choose whom to trust in it? Goldman's influential answer (2001) lists five sources of evidence a novice
can use. The fifth, a putative expert's track record, is the one that seems to escape the Socratic difficulty.
Even if I cannot follow the doctor's reasoning, I can see whether his patients recover; even if I cannot evaluate an
astronomer's theory, I can see whether the eclipse comes when she said it would. Track records, Goldman suggests, may
be the novice's best evidence [CHECK]. Recent critics have doubted that novices can use the criterion: records are
disputed, their relevance requires expertise to judge, and "were the criterion useful, we'd already have used it by
now" (Levy 2025). Levy concludes that the criteria "extend" trust rather than "ground" it.

This paper argues that for an important class of experts -- those whose expertise consists in assigning
probabilities to uncertain events -- the difficulty is not one of access at all, and that Socrates' answer is
almost exactly right. The argument rests on a body of results in economics on "testing experts", which philosophers
have so far ignored. Their core says that no test of a single forecaster's record that a forecaster who knows the
chances is sure to pass, whatever the chances are, can screen out a forecaster who knows nothing but knows the test.
I draw from these results, and from the positive results that answer them, the following thesis:

> A record of probabilistic forecasts can certify expertise only relative to a standard of comparison that the
> evaluator supplies -- her own forecasts, the forecasts of a rival who is in fact informed, or a restriction on how
> the world could be -- and no record, however long, and no comparison among forecasters, can show that anyone
> knows the chances.

The second baseline is Socrates' fellow craftsman. The first shows that a novice is not as helpless as he feared:
she can learn that someone knows more than she does, though not that he knows. The thesis also yields a third
Socratic result the dialogue does not state: a guild of non-craftsmen cannot tell, from its members' records,
whether any of them is a craftsman.

The economists have drawn philosophical morals of their own: that falsifiability cannot screen strategic experts
(Olszewski & Sandroni 2011), and that "the only coherent notion of 'true' probabilities is relative" (Al-Najjar &
Weinstein 2008). I do not claim the mathematics, nor its general relativistic moral. What I add is an analysis of
what exactly a record certifies relative to each kind of baseline, a diagnosis of why every escape from the
impossibility takes this form, and the consequences for the epistemology of expertise -- in particular, that the
track-record criterion fails for reasons of identification rather than access, and what the novice can and cannot
do about it.

## 2. The theorems

A forecaster observes a sequence of outcomes -- rain or no rain each day -- and before each day announces a
probability of rain. A *test* is any rule that takes the forecasts and the outcomes and returns a verdict, pass or
fail. The question is which tests are good ones. A minimal requirement is that a test should not fail an expert: if
the forecaster's probabilities are the true chances, she should pass with high probability -- say at least 1 - ε --
whatever the true chances are. Call this *type-I control*.

The simplest candidate is calibration: of the days on which the forecaster said 30%, about 30% should be rainy, and
so on. Calibration has type-I control: by the law of large numbers, someone who announces the true chances is
calibrated with probability one. But calibration is cheap. A forecaster who announces 30% every day in a place
where it rains on 30% of days is calibrated, though his forecasts say nothing about which days are rainy (Seidenfeld
1985's "one-note weatherman" [CHECK wording]). More strikingly, Foster and Vohra (1998) showed that a forecaster
who knows nothing whatever about the weather can be calibrated on every possible sequence of weather, with
probability as high as he likes, by randomising his forecasts in a way that responds to his past calibration
errors. The weather can be chosen by an adversary who knows his method; only the outcome of his coin flips is
hidden from it.

Calibration might seem a poor test. But Sandroni (2003) showed that the problem is not calibration's. Take any test
whatever, on records of a fixed finite length, with type-I control. Then there is a randomised forecasting strategy,
requiring no knowledge of the process, which passes the test with probability at least 1 - ε on every possible
sequence of outcomes. Olszewski and Sandroni (2008) extended this to tests on unboundedly long records that reject
at some finite time, provided they are *future-independent*: whether a forecaster is rejected at a given time
depends only on the forecasts he has made about data observed so far. Shmaya (2008) extended it to all (Borel) tests
that look only at the forecasts actually made, even if they deliver their verdict at infinity. And Olszewski and
Sandroni (2009b) showed that if the data are bounded -- if there is any fixed number of observations beyond which
the tester will not wait -- then every test with type-I control can be passed by an ignorant forecaster, even tests
that ask the forecaster to commit in advance to his whole theory.

Three features of these results matter for what follows.

*Why they hold.* The engine is a minimax theorem. Consider a game in which Nature chooses a process (or a lottery
over processes) and the forecaster chooses a (randomised) forecasting strategy, the forecaster's payoff being the
probability of passing. Against any single process, the forecaster has a good reply: announce that process, which
passes with probability 1 - ε by type-I control. Against a lottery over processes, he has a good reply too, because
a lottery over processes is observationally just another process -- the compound process -- and he can announce
that. Al-Najjar and Weinstein (2008, §6) identify this "reducibility of Nature's compound lotteries" as the key.
The minimax theorem then delivers a single randomised strategy that does well against every process at once, and so
against every sequence of outcomes.

*What the charlatan needs.* He needs to know the test. Olszewski and Sandroni show that no single strategy passes all
future-independent tests at once [CHECK: their eq. 5.3 / §8]. He does not need to know anything about the weather.
Nor are his forecasts good: they are not close to the true chances, and he is not a disguised expert. The forecasts
differ; only the verdicts coincide.

*What "non-manipulable" can mean.* There are tests that cannot be passed by an ignorant forecaster in this way, but
they require the forecaster to commit, before the data come in, to his predictions about histories that have not
yet occurred and may never occur (Dekel & Feinberg 2006; Olszewski & Sandroni 2009a), together with unboundedly much
data. And even then the guarantee is weak: for any probability measure fixed in advance, there is a strategy that
passes on all but a set of measure ≈ 0 of the paths (Olszewski & Sandroni 2009b, Prop. 3). Such tests can catch a
charlatan on a topologically large set of paths, never with high probability by any fixed standard.

## 3. Identification, not access

Goldman's track-record criterion is usually criticised on grounds of access. The novice may not be able to tell
whether a prediction came true; the experts may dispute the record; and judging which past predictions are relevant
to the present question may itself require expertise (Goldman 2001; Levy 2025). These are real problems. But the
theorems show that they are not the deepest one. They grant the tester everything access could give: perfect
observation of every outcome, an unlimited number of them, and perfect knowledge of every forecast. The difficulty
that remains is one of identification. A record of probabilistic forecasts does not carry, in any form a test can
extract, the information that its author knew the chances.

This explains why Goldman's examples look so persuasive. The astronomer predicts that the eclipse will occur at a
stated time; the prediction is deterministic. A deterministic forecaster stakes everything on a single outcome, and
a test that passes him only if that outcome occurs has type-I control and cannot be passed by an ignoramus with
probability above what his luck allows. The theorems do not touch such cases. In the terms used below, sharp
predictions restrict the class of processes in a way that defeats the reducibility on which the impossibility
depends. The trouble begins when the expert's competence is probabilistic -- when what she knows is that the chance
of rain is 30%, or that the chance that this patient survives is 0.8, or that the chance that this candidate wins is
0.6. Most expertise that matters for policy is like this.

Nguyen (2020) calls a domain a *cognitive island* when there is no test for expertise available to the inexpert.
The theorems show that probabilistic domains are cognitive islands even when outcomes are fully observable, so long
as the tester demands type-I control and has no other source of discrimination. What other sources could she have?

## 4. Three baselines

Every positive result in this literature adds something to the setting of the impossibility theorems. I classify
them by what is added, and say in each case what the record then certifies.

### 4.1 Your own forecasts

Suppose the tester is a Bayesian: she has a prior over the processes that might be generating the data, and hence
her own forecasts. Stewart (2011) shows that a simple test then works. Pass the forecaster if, in the long run, his
forecasts are more likely than hers on the data (his likelihood ratio against her predictive stays above 1) and they
differ from hers non-negligibly often. A forecaster who knows the true process passes with probability 1 - ε by
her lights, where ε is her prior probability of learning the truth quickly on her own; and any forecaster who does
not know the process -- who knows, at most, her prior -- passes with probability zero by her lights.

Two features of this result matter. First, the guarantee is relative to her prior: she is certain that charlatans
will fail, but a world in which her prior is badly wrong is one in which someone with no special knowledge but a
better prior can pass. Second, the test fails genuine experts when the tester would have learned the truth herself;
as Stewart notes, "the additional value of the expert's forecasts becomes small even when they are correct" [CHECK
exact]. What the test certifies is not that the forecaster knows the chances, but that he knows something she would
not soon have learned. Olszewski (2015, §9.1) puts the general point: a tester with a prior "will find the expert's
forecasts valuable only when these forecasts are more precise than her own."

This is a real form of certification, and it is available to any novice who can state her own forecasts. Its
content, though, is relational: "he knows more than I do", not "he knows". And it inverts one half of the Socratic
worry. The tester who could most easily have learned the truth herself is least able to certify by this route; the
tester whose own forecasts would never converge is best placed. A non-doctor can certify that someone knows more
medicine than she does. What she cannot do is certify a doctor.

### 4.2 A fellow craftsman

Suppose instead that two forecasters are tested against each other, and that one of them knows the true process.
Al-Najjar and Weinstein (2008) show that a likelihood-ratio comparison then works: with high probability, either
the informed forecaster wins or the two forecasts were close in all but a bounded number of periods, the bound
depending only on the tolerance and not on the process, the horizon or the rival's strategy. Feinberg and Stewart
(2008) give an infinite-horizon "cross-calibration" test that a truthful forecaster passes with probability one
whatever the others do, and that a false forecaster passes, in the presence of a true one, only for a topologically
small set of processes. Kavaler and Smorodinsky (2019) show that the likelihood-ratio comparison is essentially the
only comparison test with certain natural properties.

This is the fellow craftsman of 171c. Its condition is that the rival is in fact informed -- not merely honest: an
honest rival who knows nothing is no help. What it certifies is relative superiority: "A forecasts better than B".
If B is a craftsman, A's winning shows that A is not a quack; if neither is, the verdict ranks two quacks.

Comparison has a further weakness that matters in practice. A forecaster who can see a rival's current forecasts can
beat the rival's score by the rival's calibration error without any knowledge of the domain, by recalibrating the
rival's forecasts against their past performance ("calibeating": Foster & Hart 2023). He cannot do better than the
rival's refinement -- the part of the rival's score that reflects sorting rainy from dry days -- so what he exploits
is a defect in the rival, not a lack of knowledge in himself. But a tournament in which forecasters see each other's
current forecasts will credit to the recalibrator knowledge that belongs to the rival. Comparative certification
requires that forecasters forecast independently.

### 4.3 A restriction on the world

Suppose finally that the tester knows something about the process: that it is deterministic, or independent and
identically distributed, or learnable in a certain sense. Then tests that pass every expert within the class and
screen out ignorant forecasters can exist, sometimes with finite data (Al-Najjar, Sandroni, Smorodinsky & Weinstein
2010; Olszewski & Sandroni 2009b, Prop. 2). The deterministic case is Goldman's eclipse. In the i.i.d. case, a
forecaster who must announce a bias at the outset and is failed if the observed frequency strays from it cannot pass
by randomising, since no lottery over biases puts high probability on every frequency.

What is certified here is knowledge beyond what the restriction builds in. The restriction must be non-convex, at
least for finite data (Olszewski & Sandroni 2009b, Prop. 1; Sandroni & Shmaya 2014): it must refuse to treat some
mixtures of admissible processes as admissible. And because the test is public, whatever the restriction presupposes
is available to the charlatan. Suppose a test is designed so that every honest forecaster who knows the class of
possible processes, but not which member is actual, expects to pass -- a natural requirement if we want to protect
honest learners. Then it protects every mixture of processes in the class, so the class it protects is convex, and
with bounded data it can be passed by someone who knows only what the test itself encodes. Knowledge of the right
model, as opposed to the right parameter, cannot be certified this way.

### 4.4 The common structure

The three baselines have a common form. Each supplies something the tester holds fixed -- her own predictive, an
informed rival's forecasts, or a non-convex class of admissible processes -- against which Nature's compound
lotteries do not reduce. Against her predictive, a forecaster who knows only what she knows is a forecaster who
adds nothing; against an informed rival, the charlatan's best reply to a lottery is no longer good enough, since the
rival knows which process the lottery selected; against a non-convex class, the compound process is not admissible.
In each case what is certified is a difference: between the forecaster and the tester, between two forecasters, or
between the forecaster and the restriction. That is the precise sense in which certification of expertise by track
record is relative.

There is a fourth route which adds no baseline but restricts the charlatan: if he must compute his forecasts
efficiently, there are tests he cannot pass (Fortnow & Vohra 2009; Hu & Shmaya 2013). This route matters for
evaluating algorithms, but it assumes that the genuine expert is handed the true probabilities rather than having to
compute them (Olszewski 2015), and the tests used in practice -- calibration, Brier scores against thresholds -- are
passed by efficient procedures. I set it aside.

## 5. A guild of non-craftsmen

The fellow-craftsman route requires that a craftsman be present. Can a comparison among several forecasters at least
tell whether any of them is informed? Al-Najjar and Weinstein (2008, Thm 7) show that it cannot, for tests on records
of finite length: any test meant to say "at least one of these two is informed" that passes when one of them is
truthful can be passed by two uninformed forecasters, the second responding to the first's strategy. Olszewski and
Sandroni (2009c) show that independently randomising uninformed experts can jointly pass any comparative
future-independent test with type-I control [CHECK: PNAS; known via Olszewski 2015]. Feinberg and Stewart (2008)
make joint passing by uninformed experts topologically rare, but only by sacrificing type-I control: their strict
cross-calibration test fails some true experts.

The consequence is that a field cannot certify itself by its members' records. Within a field that contains a
craftsman, records can sort its members; within a field of non-craftsmen, they sort quacks against quacks, and no
amount of mutual comparison reveals that this is what they are doing. Levy's worry that a whole domain may be
corrupt, and that novices extend trust from institutions they already trust, is not merely a worry about access to
records. It has a formal core: whether a field knows anything is not something its forecasting record can settle.

## 6. What the novice can do

Levy's slogan -- the criteria extend trust rather than ground it -- is vindicated in a precise form: every way a
record can certify expertise depends on something the evaluator brings. But his reasons are not the right ones, and
his pessimism about regulative advice is too strong.

First, one of the baselines is available to every novice: her own forecasts. By section 4.1 she can certify, by her
own lights, that a forecaster knows something she would not soon learn. That is what deference needs. I do not need
to know that my doctor knows the chances of my recovery; I need to know that she knows them better than I do.

Second, the novice need not identify anyone to benefit from expertise. If she forms her forecasts as a
performance-weighted mixture of her own and the candidates' forecasts -- a Bayesian mixture over forecasters -- then
on every sequence of outcomes her cumulative log score is within log(1/w) of the best forecaster in the mix, where w
is the prior weight she gave him, whatever the forecasters do (the aggregating bound; cf. Herrmann 2022 on prediction
with expert advice for novices; Olszewski & Pęski 2011 on contracts that extract the value of advice without
learning the expert's type). The same minimax mathematics that makes identification impossible makes this
exploitation possible. She defers to forecasts, not to persons.

Third, the limits are also clear. These routes require repeated, verifiable forecasting; most of Levy's cases
(climate science, disputed policy) are not like that. And the guild result applies: if no one in the pool knows
anything, the novice who mixes their forecasts does as well as the best of the quacks.

## 7. Objections

*The type-I requirement is too strong.* Requiring a test to pass the expert whatever the process may seem
unreasonable; Stewart argues that a decision-maker would impose it only if extremely averse to ambiguity. I agree,
and this is the thesis: dropping the requirement means supplying a prior, and with it a baseline. The theorems show
what happens if the tester supplies nothing.

*Real charlatans do not randomise strategically.* True. A sincere non-expert -- someone who forecasts by some fixed
method of his own -- will fail good tests for all but a topologically small set of processes (Dekel & Feinberg 2006;
Stewart 2011, Cor. 1). What the theorems show cannot be screened out is a forecaster who knows the test and forecasts
against it. That is a realistic threat in two places: pundits and institutions whose standing depends on a known
metric, and machine-learning systems trained or recalibrated against the evaluation they will face.

*Records can discredit forecasters.* They can. If a forecaster's probabilities are the chances, no rival can outscore
her by a factor c with probability above 1/c (Ville's inequality), so being decisively outscored discredits a claim
to know the chances (Shafer 2021, 2023). But discrediting is not certifying. The asymmetry is old (Popper; Olszewski
& Sandroni 2011) and does not help the novice choose.

*Non-manipulable tests exist.* They do, but they need unbounded data, commitment to forecasts about histories that
may never occur, and they deliver only topological guarantees (§2).

## 8. Conclusion

Socrates was right that temperance, as knowledge of knowledge, cannot tell the doctor from the quack, and right that
the fellow craftsman can. The economics of testing experts shows why, for expertise about chances: a record certifies
only a difference between its author and something the evaluator holds fixed. The evaluator may hold fixed her own
forecasts, and then she can learn that someone knows more than she does. She may hold fixed an informed rival, and
then she can learn which of two is better. She may hold fixed a restriction on the world, and then she can learn
what the restriction leaves open. What she cannot do is learn, from records alone, that anyone knows the chances --
nor, if she is one of a guild, whether any of its members does.
