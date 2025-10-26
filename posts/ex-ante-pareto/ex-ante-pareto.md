---
title: "Against Ex Ante Pareto"
abstract: |
 Given two lotteries over social outcomes, does the fact that everyone in the society thinks that one is at least as good as the other suffice to conclude that the first is at least as good as the other? I'm going to argue that, somewhat surprisingly, the answer is no. The principle that it does always suffice is called the Ex Ante Pareto principle, and it's been used to derive some striking consequences in recent work. The point of this note is to suggest that rather than accept those consequences, we should be sceptical of the Ex Ante Pareto principle. Or, more precisely, we should be sceptical of the precisification of the principle that has the most interesting consequences.
date: October 16 2025
author:
  - name: Brian Weatherson 
    url: http://brian.weatherson.org
    affiliation: University of Michigan
    affiliation_url: https://umich.edu
    orcid_id: 0000-0002-0830-141X
draft: true
image: "envelopes.jpg"
categories:
  - ethics
  - games and decisions
format:
    html: 
      css: 
        - ..\trad_defn.css
        - color.css
    pdf:
        output-file: "Against Ex Ante Pareto"
        filters:
          - color-spans.lua
        mainfontoptions: 
          - ItalicFont=EB Garamond Italic
          - BoldFont=EB Garamond SemiBold
        include-after-body: 
          text: |
            \noindent Draft of October 2025.
        include-in-header:
          text: |
            \usepackage{multirow}
---

Consider the kind of problem that Kenneth @Arrow1950 was interested in when he developed his famous impossibility result. We have some citizens: *c*~1~, …, *c~n~*. Each citizen *c~i~* has a preference has a preference relation ≿~*i*~ over the possible outcomes, which is assumed to be symmetric, transitive, and complete. Our task is to find a social preference relation ≿~∀~, which is also symmetric, transitive, and complete, as a function of those individual relations. The problem is that some weak-ish looking desiderata concerning how the social ordering relates to the individual ordering entail that the job cannot be done. There are some familiar moves to make next, in my opinion by far the best is to deny to desirability of the Independence condition Arrow uses, but all I need for now is that it's a familiar problem.

In recent philosophy there has been some interest in a variant on Arrow's original problem. The variant folks are interested in differs from Arrow's in three dimensions. 

First, we assume that the citizens are self-interested, or at least differentially interested enough that we can which of them have their preferences satisfied can vary freely. This violates Arrow's condition of Unrestricted Domain. In several of the cases we'll look at, the violation of this condition is so extensive that all the other conditions he described can be satisifed.

Second, we drop the assumption that ≿~∀~ is complete. Maybe for some social outcomes, neither is at least as good as the other. Amartya @Sen1970sec had originally noted that was enough to avoid the impossibility theorem that Arrow developed. Unfortunately, as Allan @Gibbard2014 quickly showed, there are other plausible principles that you still have to violate even without this assumption. Still, it's going to be important here.

Third, we make life much harder for ourselves by dropping the assumption that there are finitely many citizens. We will assume that there are countably many citizens, but there may not be finitely many. It turns out that once we allow this all sorts of new impossibility results come into play. 

This note will be about the distinctive kind of impossibility results we get when we assume that ≿~*i*~ and ≿~∀~ have in their domain not just social outcomes, but lotteries over social outcomes. Just like with Arrow, there are some very plausible looking principles that can't all be true in this setting. One of those principles says that for any two lotteries *X* and *Y*, if *X* ≿~*i*~ *Y* for all *i*, then *X* ≿~∀~ *Y*. That looks pretty plausible! How could *X* not be better than *Y* if everyone is just as happy with it? And I agree, it is pretty plausible. But, I'll argue, the things it clashes with are more plausible still.

I do not expect anything like agreement with that comparative plausibility claim; there is a lot of room for reasonable disagreement about which plausible principles should be given up when they are shown to clash. But I hope the clash is interesting.

# Why Are We Doing This {#sec-why}

There are actually two questions here. Why should we care about relations like ≿~∀~, and why should we care about how they behave in worlds where there are infinite populations. Let's take those in order.

Jake @Nebel2025, who developed one of the impossibility results I'll be discussing here, starts by inquiring into what preferences a *benevolent* agent would have. Since some of us are benevolent, and we may for all we know be living in an infinite world, that's a reason to take the problems seriously.

While that's a perfectly good reason to be interested in these problems, it's not the only reason, and it's not really my reason. I'm going to be less interested in benevolence than in governance. Assume we have a basically pleasant bureaucrat who has to make a decision that will affect many people in various, not entirely predicatable, ways. To make it concrete, assume there is a moderately busy intersection that isn't working as it stands, and the bureaucrat's job is to redesign it. In theory we might say that in a democracy what matters should be what people want the intersection to look like. In practice, we've settled on representative democracy as our form of government, and approximately no one changes their vote on the design of a moderately busy intersection, so really the bureaucrat is unconstrained by the democratic system. (At least, they are unconstrained as long as they don't do anything particularly egregious.) In practice, the good bureaucrat is, with respect to this problem, a well meaning dictator. That doesn't mean they do what they want. Most traffic engineers care about safety, and traffic flow, and noise, and cost, and everything else that might be relevant, and try really hard to balance the competing interests when designing intersections. That is, they try do turn the various preferences users have into a social ordering and pick the best option. But how do they manage this alchemy, of turning the many orderings into one? That's the kind of project we're interested in here. It's got the same formal structure as Nebel's project of creating a benevolent preference ranking, but the differences might matter once we have to make hard choices about which plausible principle to give up.

But bureaucrats don't have infinite populations to deal with. Well, maybe they don't. We actually don't know how big the universe is, and how large the population of human, or otherwise morally salient, people is or will be. And the 'will be' part matters. Our imagined traffic engineer has to think about people who don't yet exist. If in ten years a tree near the intersection will have grown in such a way that if they use design *d* then the intersection will be unsafe for young children, that's a reason to not implement *d*, even if none of the people put at risk are yet born. Once we think about possible future people, the task of our bureaucrats gets much trickier.

Still, it is pretty uncommon for any bureaucrat to make decisions that affect infinitely many people. Those are the decisions we'd expect to be made through the democratic process. But, and this is a point Frank Hong and Jeffrey Sanford Russell [-@HongRussell2025] are careful to stress, some of these principles we're interested in have strange consequences about how we compare infinite worlds even if the worlds being compared only differ in finitely many ways. (Hong and Russell developed the other big impossibility result we'll be talking about here.) It turns out that looking hard at the infinite cases has lessons for how we build up ≿~∀~, even if we don't think anything that might be done has infinitely large consequences. Those lessons will be the focus here.

# Formalism {#sec-formalism}

For the most part we'll be interested in these infinite worlds, though in @sec-buchak I'll return to what happens in finite worlds. We have our infinitely many citizens, the *c~i~*. To keep things simple, we'll assume that the citizens only have one of two welfare levels. Nebel denotes these with sad and happy faces, but we'll just use 0 and 1. That's not as charming, but we don't want our traffic engineers to be too whimsical. Besides, it simplifies the presentation in a few ways. To get some lotteries going, we'll also assume that there are infinitely many fair coins.

A world specifies the welfare level of each of the citizens, and the results of each of the coin tosses. We'll denote these with two sequences. I'll use *x*, or when expanded out $\langle$*x*~1~, … *x~i~* $\ldots \rangle$ for the values of the citizens. And I'll use *n*, or when expanded out $\langle$*n*~1~, … *n~i~* $\ldots \rangle$ for the values of the coins. So a **world** is a pair $\langle$*x*, *n*$\rangle$, and a **proposition** is a set of worlds. There are three kinds of propositions that will be especially important.

- A **distribution** is a proposition that settles everyone's welfare levels and nothing else. So if *p* is a proposition, and $\langle$*x*~1~, *n*~1~$\rangle$ and $\langle$*x*~2~, *n*~2~$\rangle$ are both in *p*, then *x*~1~ = *x*~2~, and if $\langle$*x*~1~, *n*~1~$\rangle$ is in *p*, so is $\langle$*x*~1~, *n*~2~$\rangle$.
- A **state** is a proposition that settles how some of the coins land and nothing else. So if *p* is a proposition, so is $\langle$*x*~2~, *n*~1~$\rangle$.
- A **lottery** is a proposition that says what distribution is actual given some  coin flips. So if *p* is a lottery, then there is some set *N* of outcomes of the coin flips, and for each *n* ∈ *N*, there is a unique $\langle$*x*, *n*$\rangle$ in *p*. One consequence of this definition is that distributions are degenerate lotteries.

I'll use capital letters *X*, *Y*, etc., for lotteries, and lower case letters *x*, *y*, etc. for distributions. I'll assume that the comparisons we're interested in, ≿~*i*~ and ≿~∀~ are defined over pairs of lotteries. But sometimes I'll write *x* ≿~∀~ *y*; that means that the degenerate lottery which returns *x* for sure is at least as good (socially) as the degenerate lottery that returns *y* for sure.

I'll say that a lottery is **unconditional** if it includes a pair $\langle$*x*, *n*$\rangle$, and **conditional** if it does not. Each lottery determines a probability for each state consistent with it, and hence for each distribution. If the lottery is unconditional, these probabilities are fairly obvious. The probability of *n~i~* = 1 is 0.5 for any *i*, for example. But for conditional lotteries, the probability might be less obvious. If *N* is the set of coin landings such that *n*~1~ = 1 or *n*~1~ = 2, and *X* is a lottery defined in *N*, then Pr(*n*~1~ = 1 | *X*) = 2/3, while Pr(*n*~2~ = 1 | *X*) = 1/3.

I'll say that a lottery is **finite** if the set of distributions consistent with it is finite, and infinite otherwise.

# Dramatis Personae {#sec-principles}

A lot of the philosophical moves start by showing that some combination of constraints on ≿~∀~ cannot be jointly satisfied. Before the proofs and arguments start, it helps to have these constraints on the table.

## Preference Constraints

As noted earlier, we're going to mostly assume that people are self-interested. Alternatively, we're going to assume that ≿~∀~ doesn't aggregate the citizens' preferences, but their interests. Formally, these two assumptions come to the same thing.

Self-Interestedness
:    *x* ≿~*i*~ *y* iff *x~i~* ≥ *y~i~*

Stochastic Self-Interestedness
:    *X* ≿~*i*~ *Y* iff Pr(*x~i~* = 1 | *X*) ≥ Pr(*x~i~* = 1 | *Y*)

The second of these is similar to what Nebel calls "Simple Stochasticism for Individuals" and what Hong and Russell call "Stochastic Compensation". It's a little stronger than either of their principles, but hardly less plausible.

There are weaker versions of **Stochastic Self-Interestedness** that only quantify over unconditional and/or finite lotteries (as Nebel's principle does), but I won't focus on either distinction in what follows.

## Dominance Principles

These principles constrain how ≿~∀~ treats related conditional and unconditional lotteries. In the principles, a **partition** is a set of sets of worlds, such that every world is in exactly one of the sets. I'll write *E* for a generic partition, and *E*~1~, … for the members of it. I'll say that a partition is consistent with a lottery iff for each cell of the partition, the intersection of it with the lottery is non-empty.

Partitionwise Dominance
:    For any unconditional lotteries *X* and *Y* and partition *E*, if for each *E~i~*, *X* ∧ *E~i~* ≿~∀~ *Y* ∧ *E~i~*, then *X* ≿~∀~ *Y*.

Statewise Dominance
:    The principle **Partitionwise Dominance** holds for each partition where for each *i*, only one distribution is consistent with *X* ∧ *E~i~*, and only one distribution is consistent with *Y* ∧ *E~i~*.

Given the way I've defined lotteries in general, and in particular conditional lotteries, *X* ∧ *E~i~* ≿~∀~ *Y* ∧ *E~i~* just means that *X* is better than *Y* conditional on *E~i~*. That is, it means that between the lotteries we get by just looking at the worlds in *E~i~*, by taking *E~i~* as given, *X* still does better than *Y*.

Both Nebel, and Hong and Russell, use **Statewise Dominance**. I'm going to use the somewhat stronger **Partitionwise Dominance**, which means the results I get are going to be weaker. That said, I'll use slightly weaker principles elsewhere, and the way I'll get the core contradiction will be simpler, so that hopefully makes up for using a somewhat stronger principle. It's also a little hard to see what could motivate **Statewise Dominance** but not **Partitionwise Dominance**; the arguments they each give for these principles don't seem to rely in any particular way on the members of the partition being states.

In real life cases, we don't want something as weak as **Statewise Dominance** anyway. Go back to our traffic engineer. They think it's 50/50 whether a new housing estate will be built just east of the intersection in the next ten years. But after running the model, they decide that design *d*~1~ will be better than *d*~2~ whether or not the estate is built. That seems to settle that they should do *d*~1~ rather than *d*~2~. But the little partition we've used, {Estate built, Estate not built}, does not settle all issues about the welfare of road users. Still, it seems like a good bit of reasoning on the engineer's part.

But now we should worry that **Partitionwise Dominance** hasn't quite got what our engineer needed either. All it says is that *d*~1~ is at least as good as *d*~2~. We need a stricter version of it. For this principle we'll use the standard notation *X* ≻~∀~ *Y* means *X* ≿~∀~ *Y* and not *Y* ≿~∀~ *X*.

Strict Partitionwise Dominance
:    For any unconditional lotteries *X* and *Y* and partition *E*, if for each *E~i~*, *X* ∧ *E~i~* ≻~∀~ *Y* ∧ *E~i~*, then *X* ≻~∀~ *Y*.

Strict Statewise Dominance
:    The principle **Strict Partitionwise Dominance** holds for each partition where for each *i*, only one distribution is consistent with *X* ∧ *E~i~*, and only one distribution is consistent with *Y* ∧ *E~i~*.

These are the dominance principles we'll mainly be using.

## Pareto Principles

We now turn to principles relating individual good and social good. The first three of these seem fairly obvious given the assumption that there are only two welfare levels, but actually they seem reasonable more broadly. We'll write *X* \~ *Y*, with any subscript, to mean *X* ≿ *Y* ∧ *Y* ≿ *X*.

Pareto Indifference
:    If for all *i*, *x* \~~i~ *y*, then *x* \~~∀~ *y*.

Pareto Superiority
:    If for all *i*, *x* ≽~i~ *y*, then *x* ≽~∀~ *y*.

Pareto Strict Superiority
:    If for all *i*, *x* ≻~i~ *y*, then *x* ≻~∀~ *y*.

That is, for any two distributions, for any of the three key relations, if the relation holds with respect to all individuals, it holds socially. We're going to primarily use something slightly stronger than **Pareto Strict Superiority**, which we'll follow convention in calling **Strong Pareto**.

Strong Pareto
:    If for all *i*, *x* ≽~i~ *y*, and for some *i*, *x* ≻~i~ *y*, then *x* ≻~∀~ *y*.

This makes sense again given our traffic engineer. There are these two designs, *d*~1~ and *d*~2~, and *d*~1~ will make some people better off and no one worse off. That seems to settle that *d*~1~ is strictly better. It doesn't matter whether the city is embedded in a finite or infinite universe, that still looks like a good inference. And that's what **Pareto Superiority** says.

We get **Ex Ante** versions of all four principles by quantifying not just over distributions, but over arbitrary lotteries. I won't write all four of them out, because there is really only one that we'll focus on. If it fails, the other four look pretty implausible.

Ex Ante Pareto Indifference
:    If for all *i*, *X* \~~i~ *Y*, then *X* \~~∀~ *Y*.

The big aim of this paper is to argue that this principle, weak as it is, is false. Note that each Ex Ante principle entails the corresponding simple principle, because we can just take the gambles to be degenerate gambles, i.e., states.

## Equality Principles

Next we turn to principles which play the same role as Arrow's non-dictatorship condition. They are all principles that say that in principle, the welfare of some group can be outweighed by the welfare of others.

The first three principles involve *permutations*. A distribution *y* is a permutation of *x* if there is a function π: $\mathbb{N} \rightarrow \mathbb{N}$ and *y~i~* = *x*~π(*i*)~. Abusing notation a bit, we'll write that as *y* = π(*x*). The *support* of π is the set {*n*: π(*x*) ≠ *x*}.

Anonymity
:    *x* ~ π(*x*)

Finite Anonymity
:    If π has finite support, then *x* ~ π(*x*)

**Anonymity** is usually rejected because it conflicts with **Strong Pareto**. So **Finite Anonymity** is a natural fallback. And it's what we're mostly going to be interested in here. But you might worry, as @GoodmanLederemanArXiV do, that we really should have infinitary equality principles for an infinite world. They take as their primary equality principle **Permutation Invariance**.

Permutation Invariance
:    *x* ≽~∀~ *y* ↔︎ π(*x*) ≽~∀~ π(*y*)

These are all principles that require treating everyone alike. But we can get some interesting results, as Arrow did, but simply requiring that we not treat people too differently. Hong and Russell use a principle they call **Interpersonal Allocation**.

Interpersonal Compensation
:    If *x* has finite support, then there is some *y* with finite support, whose support is entirely distinct from *x*'s, such that *y* ≻~∀~ *x*.

What this says is that for any group of citizens who could get welfare 1, it could be better for some other (presumably larger) group of citizens to get welfare 1.

I'm going to use a principle that's a little harder to state, but hopefully just as plausible. To state it, I need some terminology. Let *x* be a distribution with support *S*, *G* a subset of *S*, and *G*^′^ set of citizens such that *G*^′^ ⊃ *G* and *G*^′^ ∩ *S* = *G*. (That is, all the others in *G*^′^ get 0 in *x*.) Let *x*[*G*, *G*^′^, *p*] be a lottery such that:

- Everyone in *G*^′^ has chance *p* of getting 1;
- Everyone else gets, with chance 1, the same welfare they get in *x*.

Then the equality principle I'll use is:

Stochastic Interpersonal Compensation
:    Let *G* be any subset of the support of *x*. There is some *G*^′^ such that *x*[*G*, *G*^′^, 1/3] ≻~∀~ *x*.

This isn't nearly as immediately plausible as the other axioms we've looked at. It is, however, useful as a waystation in some proofs. Its significance will mostly come from how easy it is to derive from other principles given **Ex Ante Pareto Indifference**.

## Structural Principles

I mentioned at the start that I wasn't going to assume **Completeness**.

Completeness
:    *X* ≿~∀~ *Y* ∨ *Y* ≿~∀~ *X*

Indeed, as @GoodmanLederemanArXiV notes, following @Askell2018, **Completeness** conflicts with **Strong Pareto** and **Permutation Invariance**. What's more plausible, as they also note, is **Finite Completeness**.

Finite Completeness
:    If *x* and *y* are distributions with finite support, then *x* ≿~∀~ *y* ∨ *x* ≿~∀~ *y*.

As they note, **Finite Completeness** plus **Permutation Invariance** entails **Finite Anonymity**. I'll explore later a stronger principle.

Finite Evaluability
:    The restriction of ≿~∀~ to finite lotteries with finite support is representable by a cardinal utility function *v*.

That is, expected value maximisation is the right theory for comparing lotteries that have finitely many outcomes, each of which has finitely many happy people. Again, this is the kind of thing that we'd need to assume if we wanted to use expected utility maximisation as our choice rule around here, while being unsure whether we are part of a finite or infinite universe.

# A Contradiction {#sec-contradiction}

The following three principles are inconsistent:

1. **Strong Pareto**
2. **Partitionwise Strict Dominance**
3. **Stochastic Interpersonal Compensation**

Here's the proof. First we define two sequences of sets as follows. Let *G*~1~ be ∅, and *G*~2~ be {*x*~1~}. For any *i*, *H~i~* will be *G*~1~ ∪ … ∪ *G~i~*. For any group *G*, *x*(*G*) is the assignment of 1 to the members of *G* and 0 to everyone else. Finally, for *i > 2*, *G*~*i*+1~ will be such that *x*(*G~i~*)[*G~i~*, *G~i~* ∪ *G*~*i*+1~, 1/3] ≻~∀~ *x*(*G~i~*). By **Stochastic Interpersonal Compensation**, such a group must exist, and be finite.

We then use the coin flips as follows.^[What follows is a version of the familiar two envelope paradox, as discussed in @TwoEnvelope.] If the sequence 〈*n*~2~, *n*~3~, …〉is all zeroes, then *k* = 0. Otherwise, *k* is the number of zeroes before the first 1. We define two gambles, called [Red]{.text-red} and [Blue]{.text-blue}. @tbl-red-blue shows which people get value 1 for each gamble, and each result of the coin flips.

::: {.context-visible when-format="pdf"}
\begin{table}[h]
\caption{The Red-Blue choice}
\label{tbl-red-blue}
\centering
\begin{tabular}{llcccccc}
\hline
 & & $k=0$ & $k=1$ & $k=2$ & … & $k=i$ & … \\
\hline
\multirow{2}{*}{\textcolor{red}{Red}} & $n_0 = 1$ & $H_1$ & $H_2$ & $H_3$ & & $H_{i+1}$ & \\
 & $n_0 = 0$ & $H_2$ & $H_3$ & $H_4$ & & $H_{i+2}$ & \\[3pt]
\multirow{2}{*}{\textcolor{blue}{Blue}} & $n_0 = 1$ & $H_2$ & $H_3$ & $H_4$ & & $H_{i+2}$ & \\
 & $n_0 = 0$ & $H_1$ & $H_2$ & $H_3$ & & $H_{i+1}$ & \\
\hline
\end{tabular}
\end{table}
:::

::: {.content-visible unless-format="pdf"}

|      |          | *k*=0  | *k*=1  | *k*=2  | …   | *k*=*i*    | …   |
|------|----------|------|------|------|-----|--------|-----|
| [Red]{.text-red}  | *n*~0~ = 1   | *H*~1~   | *H*~2~   | *H*~3~   |     | *H*~*i*+1~   |     |
|      | *n*~0~ = 0   | *H*~2~   | *H*~3~   | *H*~4~   |     | *H*~*i*+2~   |     |
| [Blue]{.text-blue} | *n*~0~ = 1   | *H*~2~   | *H*~3~   | *H*~4~   |     | *H*~*i*+2~   |     |
|      | *n*~0~ = 0   | *H*~1~   | *H*~2~   | *H*~3~   |     | *H*~*i*+1~   |     |

:    The Red-Blue choice {#tbl-red-blue}
:::

The next step is easiest to understand with a little story. The coins are flipped, and the payouts that result from each gamble are written inside two envelopes, whose colour matches the gamble's name. Then whichever choice the bureaucrat makes, they are shown that envelope. A quick argument, which we'll spell out presently, shows that whatever they see in the envelope, they'd prefer to have selected the other envelope. So by **Partitionwise Strict Dominance**, the other gamble is better. But that holds whichever choice they make. So each gamble is preferable to the other. Contradiction.

More formally, we'll show that [Blue]{.text-blue} ≻~∀~ [Red]{.text-red}. We'll use ⟨*x*, *y*⟩ to mean *n*~0~ = *x* and *k* = *y*. Partition the possible results of coin flips as follows. The first cell is just ⟨0, 0⟩. The second cell is ⟨1, 0⟩ ∨ ⟨0, 1⟩. And so on, with the *i*'th cell being ⟨*i*–1, 0⟩ ∨ ⟨*i*–2, 1⟩. In the first cell, [Red]{.text-red} returns *H*~1~ (i.e., gives value 1 to all and only those in *H*~1~), and [Blue]{.text-blue} returns *H*~2~, so [Blue]{.text-blue} is better. For any later cell *i*, [Red]{.text-red} returns *H~i~* for sure. Conditional on being in that cell, [Blue]{.text-blue} has a 2/3 chance of returning *H*~*i*–1~ and a 1/3 chance of returning *H*~*i*+1~. By the construction of the *H*, that's a better gamble than *H~i~* for sure. So [Blue]{.text-blue} is better on every cell, so it is better. But the case is completely symmetric, so exactly the same style of argument shows [Red]{.text-red} is better than [Blue]{.text-blue}.

# Other Contradictions {#sec-other-contradictions}

This result might seem underwhelming for two reasons. First, **Stochastic Interpersonal Compensation** is very complicated, and it isn't clear what's wrong with simply denying it. Second, this is an argument against **Ex Ante Pareto Indifference**, and that's not one of principles we've used! Happily, we can deal with both these problems at once.

The argument in @sec-contradiction is a way of unifying the apparently different arguments in @Nebel2025 and in @HongRussell2025. Nebel shows that these principles are inconsistent.

- **Finite Anonymity**
- **Statewise Dominance**
- **Ex Ante Strong Pareto**
- **Stochastic Self-Interestedness**
- **Individual Statewise Dominance** (i.e., **Statewise Dominance** with individual orders in place of social orders)

Given **Finite Anonymity**, **Statewise Dominance** and **Ex Ante Strong Pareto** we can easily prove **Stochastic Interpersonal Compensation**. I'll show this with one example; it's more enlightening than the general case and the generalisation is trivial. Assume that the support of *x* is {*x*~1~, …, *x*~10~}, and *G* is {*x*~9~, *x*~10~}. Then {*x*~11~, …, *x*~16~} works as a witness for *G*^′^. Here's why. The gamble *x*[*G*, *G*^′^, 1/3] is equivalent, given just **Ex Ante Pareto Indifference** to the gamble that has 1/3 chance of given value 1 to each of the following sets.

- {*x*~1~, …, *x*~8~, *x*~9~, *x*~10~}
- {*x*~1~, …, *x*~8~, *x*~11~, *x*~12~, *x*~13~}
- {*x*~1~, …, *x*~8~, *x*~14~, *x*~15~, *x*~16~}

Either way, the first 8 people get 1 for sure, and the next 8 get 1 with probability 1/3. The first of those just is *x*, and by **Finite Anonymity** plus **Strong Pareto** (which is entailed **Ex Ante Strong Pareto**) the other two states are better than *x*. So by **Statewise Dominance**, the lottery is better than *x*. In general, as long as *G*^′^ is the union of *G* with two  sets each bigger than *G*, and disjoint from each other and *G*, we can use this style of argument to show *x*[*G*, *G*^′^, 1/3] is better than *x*.

So given Nebel's premises we can derive **Interpersonal Stochastic Compensation**, and hence the contradiction. To be clear, Nebel only uses **Statewise Dominance**, and I've used **Partitionwise Dominance**, so his result is stronger in that respect. But I don't think a lot turns on this distinction. What does matter is that there is a natural argument from **Ex Ante Strong Pareto** to **Interpersonal Stochastic Compensation**.

Hong and Russell derive a contradiction from these four principles. (Actually they use something a bit weaker than **Stochastic Self-Interest**, but the difference between their principle and this one doesn't matter if welfare is either 0 or 1.)

- **Ex Ante Pareto Superiority**
- **Strict Statewise Dominance**
- **Interpersonal Compensation**
- **Stochastic Self-Interest**

It's a bit more work, but a similar kind of argument to the one just given shows that the first three of these entail **Interpersonal Stochastic Compensation**, and hence can get to the same kind of contradiction as in @sec-contradiction. (In fact we just need **Ex Ante Pareto Indifference**.)

Rather than run through the proof of that, I'm going to go over an argument which is less mathematically interesting, because it uses stronger premises, but more revealing about how **Ex Ante Pareto** has such strong conclusions. Start with the relatively strong assumption **Finite Evaluability**, i.e., every distribution with finite support has a value. Again somewhat abusing notation, we'll write *v*(*G*) to mean the value of the distribution that gives 1 to everyone in *G* and 0 to everyone else.

Then it turns out all you need to get **Interpersonal Stochastic Compensation** is **Ex Ante Pareto Indifference**, **Statewise Dominance**, and that *v*(*G*) goes to infinity as *G* gets arbitrarily large. The key point is that given the first two, we can prove for disjoint *G*~1~, *G*~2~ that *v*(*G*~1~ ∪ *G*~2~) = *v*(*G*~1~) + *v*(*G*~2~). The proof is due to Roger @Myerson1981, and we'll come back to his remarks on why this is a reason to reject **Ex Ante Pareto Indifference**. To understand why the proof works, it suffices to look at the special case when *v*(*G*~1~) = *v*(*G*~2~). Consider the two gambles *X* and *Y*, both of which rely on the flip of the same coin. The people who get 1 from each gamble are shown in @tbl-myerson.

|     |  Heads   |  Tails  |
|:----|:--------:|:-------:|
| *X* | *G*~1~ ∪ *G*~2~ | ∅ |
| *Y* | *G*~1~   |  *G~2~  |

: Two gambles {#tbl-myerson}

By **Ex Ante Pareto Indifference**, *X* \~~∀~ *Y*, since everyone in *G*~1~ ∪ *G*~2~ has chance 1/2 of getting a good outcome. By **Statewise Dominance**, or indeed just the indifference version of it, *v*(*Y*) = *v*(*G*~1). So *v*(*X*) = *v*(*G*~1). So *v*(*G*~1~ ∪ *G*~2~) = 2*v*(*G*~1) = *v*(*G*~1~) + *v*(*G*~2~). The general case isn't much harder to prove, and uses the same kind of gamble as in @tbl-myerson.

Given this additivity result, it's easy to see how **Interpersonal Compensation** and **Stochastic Interpersonal Compensation** follow if *v*(*G*) is unbounded as *G* grows. For any *G*, there will be *G*~1~, *G*~2~ which both have higher value than *G*. By additivity, *v*(*G* ∪ *G*~1~ ∪ *G*~2~) = *v*(*G*) + *v*(*G*~1~) + *v*(*G*~2~) > 3*v*(*G*). And that suffices (again given additivity) for **Stochastic Interpersonal Compensation**.

That's going to be the key in what follows. Given **Ex Ante Pareto Indifference** values are additive. If values are unbounded, that will lead to contradiction. Another way of looking at Nebel's result is that given **Strong Pareto**, *v*(*G*) is always positive, and given **Finite Anonymity**, all singletons have the same value, and those results plus additivity entail that values are unbounded. So again we end up in a contradiction.

Given all these contradictions, some very plausible looking principles are going to have to be given up. It's now time to look at why **Ex Ante Pareto** should be the first one to go.