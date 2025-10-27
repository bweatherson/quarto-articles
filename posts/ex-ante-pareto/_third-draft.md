# Introduction

A central challenge in social choice theory is finding a welfare aggregation function that works when the population is unbounded. The general case presents considerable difficulty. Approaches like the sum-difference framework discussed by Goodman and Lederman point in promising directions, but the technical details become formidable quickly.

We can make progress by introducing two simplifying assumptions. First, we assume that each person’s welfare takes one of only two values: Good (represented as 1) or Bad (represented as 0). Second, we assume that at most finitely many people have welfare level 1 in any given distribution.

A **distribution** assigns a welfare level to each person. We focus on the space of binary distributions—those where welfare is either 0 or 1—that are finite in the sense that they assign 1 to only finitely many people. Our aim is to develop a social comparison function ≿~∀~ that operates over these simple binary distributions and lotteries defined on them. As usual, we can derive a strict social preference relation (≻~∀~) and a social indifference relation (~~∀~) from ≿~∀~ in the standard way.

At first glance, this might appear to be a trivial problem. The natural solution would be to say that the value of a distribution equals the number of people with welfare 1, and the value of a lottery equals its expected value under this assignment. Unfortunately, as we will demonstrate, variants on the St. Petersburg paradox show that this seemingly obvious solution violates plausible dominance principles.

# A Contradiction

We will establish that the following four principles are jointly inconsistent:

- **Strong Pareto**
- **Ex Ante Pareto Indifference**
- **Finite Anonymity**
- **Partitionwise Dominance**

The definitions of these principles can be found in §@sec-principles of the main paper. Our strategy proceeds in two stages. First, we prove a key lemma showing that under these principles, a risky lottery can be preferable to a sure thing even when the sure thing guarantees positive welfare to some people. Second, we use this result to construct a two-envelope paradox that generates the desired contradiction.

## Lemma: Risky Equality Beats Certainty

Consider any six people: *a*, *b*, *c*, *d*, *e*, and *f*. We assume that all lotteries under consideration agree on the welfare of everyone except these six individuals. Define two lotteries as follows:

**Only** ***a***
:    Person *a* receives welfare 1; persons *b* through *f* receive welfare 0.

**Risky Equality**
:    With probability 1/3, all six people (*a* through *f*) receive welfare 1; with probability 2/3, all six receive welfare 0.

**Claim**: Risky Equality ≻~∀~ Only *a*.

*Proof*: We establish this through a chain of comparisons involving three intermediate lotteries. Let *S*~1~, *S*~2~, and *S*~3~ denote three equiprobable states, each with probability 1/3.

**Three-Way Spread**
:    With probability 1/3 each: (*i*) person *a* gets 1, everyone else gets 0; (*ii*) person *b* gets 1, everyone else gets 0; (*iii*) person *c* gets 1, everyone else gets 0.

By **Finite Anonymity**, each outcome of Three-Way Spread is socially equivalent to Only *a*. By **Partitionwise Indifference** (the indifference version of **Partitionwise Dominance**), this means Three-Way Spread ~~∀~ Only *a*.

**Three-Way Equal**
:    With probability 1/3, persons *a*, *b*, *c* all receive 1 and persons *d*, *e*, *f* receive 0; with probability 2/3, all six receive 0.

By **Ex Ante Pareto Indifference**, Three-Way Equal ~~∀~ Three-Way Spread, since each of persons *a*, *b*, *c* has probability 1/3 of receiving welfare 1 under either lottery, while *d*, *e*, *f* certainly receive 0 under both. By transitivity, Three-Way Equal ~~∀~ Only *a*.

**Half-Risk**
:    If *S*~1~: persons *a*, *b*, *c*, *d* receive 1, persons *e*, *f* receive 0. If *S*~2~: person *e* receives 1, everyone else receives 0. If *S*~3~: person *f* receives 1, everyone else receives 0.

In each state, the outcome under Half-Risk is strictly Pareto superior to the outcome under Three-Way Equal. In state *S*~1~, four people receive 1 instead of three. In states *S*~2~ and *S*~3~, one person receives 1 instead of zero. Therefore, by **Strong Pareto** applied to each state, and then **Partitionwise Strict Dominance**, we have Half-Risk ≻~∀~ Three-Way Equal.

Finally, observe that under **Ex Ante Pareto Indifference**, Half-Risk ~~∀~ Risky Equality. To see this, note that:

- Persons *a*, *b*, *c*, *d* each have probability 1/3 of receiving welfare 1 under both lotteries
- Persons *e*, *f* each have probability 1/3 of receiving welfare 1 under both lotteries

Combining our results via transitivity:
$$\text{Risky Equality} \sim_{\forall} \text{Half-Risk} \succ_{\forall} \text{Three-Way Equal} \sim_{\forall} \text{Only }a$$

Therefore, Risky Equality ≻~∀~ Only *a*. ∎

This proof generalizes straightforwardly. By replacing each individual with a group of *n* people and applying the same structure, we can show that a lottery giving 6*n* people a 1/3 chance of welfare 1 is strictly preferable to *n* people receiving welfare 1 with certainty.

## The Two-Envelope Paradox

We now use the lemma to construct our contradiction. Let *x*~1~, *x*~2~, … be an enumeration of all people. We employ two independent fair coins: a brown coin and a green coin.

**Procedure**: Flip the brown coin once. Flip the green coin repeatedly until it comes up heads. Let *k* denote the number of tails before the first heads (or 0 if heads appears on the first flip, and let *k* = ∞ if the coin never comes up heads, though this has probability 0).

Define two lotteries, **Red** and **Blue**, that determine how many people receive welfare 1 based on the outcomes of these coin flips. The following table specifies the number of people receiving welfare 1:

|Lottery |Brown Coin|*k* = 0|*k* = 1|*k* = 2|…  |*k* = *n*|…  |
|:------:|:--------:|:-----:|:-----:|:-----:|:-:|:-------:|:-:|
|**Red** |Heads     |1      |6      |36     |   |6^*n*^   |   |
|**Red** |Tails     |6      |36     |216    |   |6^*n*+1^ |   |
|**Blue**|Heads     |6      |36     |216    |   |6^*n*+1^ |   |
|**Blue**|Tails     |1      |6      |36     |   |6^*n*^   |   |

More precisely, for each outcome (*B*, *k*) where *B* ∈ {Heads, Tails}, the lotteries assign welfare 1 to the first *m* people in our enumeration, where *m* is given by the table entry.

We now derive two contradictory conclusions.

**First Comparison**: Partition the state space according to how many people receive welfare 1 under Red.

- If Red assigns welfare 1 to exactly one person, then Blue assigns welfare 1 to six people. By **Strong Pareto**, Blue is strictly better in this case.
- If Red assigns welfare 1 to exactly 6^*n*^ people (for *n* ≥ 1), then conditional on this event, there is a 2/3 probability that Blue assigns welfare 1 to 6^*n*−1^ people, and a 1/3 probability that Blue assigns welfare 1 to 6^*n*+1^ people. By our lemma, this lottery is strictly preferable to 6^*n*^ people receiving welfare 1 with certainty. Therefore, conditional on each element of this partition, Blue is strictly better.

By **Partitionwise Strict Dominance**, we conclude Blue ≻~∀~ Red.

**Second Comparison**: Now partition the state space according to how many people receive welfare 1 under Blue. The same reasoning applies:

- If Blue assigns welfare 1 to exactly one person, then Red assigns welfare 1 to six people, so Red is strictly better.
- If Blue assigns welfare 1 to exactly 6^*n*^ people (for *n* ≥ 1), then conditional on this event, Red offers the same lottery structure as Blue did in the previous comparison: a 2/3 probability of 6^*n*−1^ people receiving welfare 1, and a 1/3 probability of 6^*n*+1^ people receiving welfare 1. This is again strictly preferable to the certainty of 6^*n*^ people receiving welfare 1.

By **Partitionwise Strict Dominance**, we conclude Red ≻~∀~ Blue.

Since we have both Blue ≻~∀~ Red and Red ≻~∀~ Blue, we have reached a contradiction. Therefore, our four initial principles cannot all hold simultaneously.