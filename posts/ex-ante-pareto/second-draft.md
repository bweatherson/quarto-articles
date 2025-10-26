**New Idea for paper**

Each numbered point is roughly a paragraph

# Intro

- Challenge, find a welfare aggregation function that works when the population is unbounded
- The general case is incredibly hard. Something like the sum difference approach that Goodman and Lederman discuss seems roughly right, but the details get hard.
- We simplify in two ways. First, assume everyone's welfare is Good or Bad, i.e., 1 or 0. Second, assume that at most finitely many people have welfare 1. 
- Call a mapping from people to welfare levels a distribution. We're interested just in the space of binary distributions (i.e., 0 or 1), which are finite (i.e., they have finitely many non-zeros).
- The aim is to find a social comparison function ≿~∀~ that ranges over these simple binary distributions, and lotteries defined on them. (Given ≿~∀~ we can define a strict social preference, and social indifference, in the usual way.)
- This might seem like a trivial problem. The value of a distribution is the number of 1s. The value of a lottery is its expected value.
- Unfortunately, variants on the St Petersburg Problem show that this solution violates some plausible dominance principles.

# A Contradiction

- Assume Strong Pareto, Ex Ante Pareto Indifference, Finite Anonymity, and Partitionwise Dominance. 
- Include the definitions of these from ex-ante-pareto.md
- First thing is to prove that n people getting 1 for sure and 5n getting 0 for sure is socially worse than a 1/3 chance of all 6n people getting 1, no matter what happens elsewhere. The argument in three-six-proof.md shows that, but it is very informal. I'd like better names for the lotteries, and a lot of the text replaced with math.
- Then set up a two-envelope game. Number the people x1, x2, ..., in some way. Two coins, green and brown. Toss the brown coin once. Toss the green coin repeatedly until it comes up heads once. Let k be the number of tails, or 0 if the coin lands heads forever. Then there are two lotteries, Red and Blue. The table below shows how many people get welfare 1 given (a) which lottery we chose, and (b) which way the coins landed.
 
| Lottery | Brown Coin | k = 0 | k = 1 | k = 2 | ...   | k = n | ... |
|:-------:|:----------:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
| Red     | Heads      |   1   |  6    |  36   |       |  6^n  |      |
| Red     | Tails      |   6   |  36   | 216   |       | 6^(n+1) |     |
| Blue    | Heads      |   6   |  36   | 216   |       | 6^(n+1) |     |
| Blue    | Tails      |   1   |  6    |  36   |       |  6^n  |      |

- First partition the states according to how many people get 1 according to Red. If that's 1, Blue means 6 people get 1, so that's better. Otherwise, if 6^n people get 1 given Red, then there is a 2/3 chance that Blue gives 1 to 6^(n-1) people, and a 1/3 chance that Blue gives 1 to 6^(n+1) people. By what we showed in three-six-proof.md, the latter is better. So by partitionwise dominance, Blue is strictly better than Red.
- Now partition the states according to how many people get 1 according to Blue. Same argument shows that Red is strictly better than Blue. Contradiction.




