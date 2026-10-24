# Me

Here's a view about guessing (in the Mandelkern/Dorst/Holguín sense) that I'd like us to work on.

The standard view is that when asked for a guess, you should give the answer that has highest probability. I think I have a counterexample to that.

Here's the history. A thing Premier League shows will do at the start of the season is to get panelists to predict the final standings of the league, from 1 to 20. This is a bit silly, no one has a probability distribution over the 20! possible orderings in their head, but it's a bit fun and useful.

Let's imagine that a panelist has the following in their head. For each team, they have a distribution of points the team might end up with, which is normal, with a particular mean and standard deviation. Obviously the means are different, Arsenal is expected to get more points than Hull City, but so are the standard deviations. Some teams are high floor/low ceiling; we know that they are roughly a 60-point teams. Other teams have a lot more variance, perhaps because they have a lot of new players who might not fit together, or they rely on one or two stars who could get injured.

Here's my conjecture: a perfectly reasonable guess to the asked question - what will the final table be - orders the teams by the mean of their expectations. But this need not be the most probable table ordering.

I'm happy defending the point about ordering by means as a claim about the pragmatics of guessing. What I'd like help with is coming up with an example where I'm right that the ordering by means is not the most probable ordering.

The real case, with 20 teams, is too complicated to use I think. Here's something that might work, and I'd like you to build either a Monte Carlo simulation or a fully worked out example.

- There are 6 teams.
- Each team $t$ has a real quality $q_t$.
- Each team will play 5 games, one against each of the others.
- Each game is normal soccer, 3 points for a win, 1 for a draw.
- In the model, if the teams are tied on points after five games, flip a coin to decide the ordering on goal difference or whatever; we're not simulating that precisely.
- When team $t_1$, with quality $q_1$, plays team $t_2$, with quality $q_2$, there is some reasonable formula that tells you the probability of each outcome ($t_1$ wins, draw, $t_2$ wins) given the team qualities.
- Each panelist has a distribution for the $q_i$ that is a bunch of normal distributions, with means $m_i$ and standard deviations $d_i$; crucially some teams are high variance and some are low.
- Given the panelist's views, the most probable of the 720 possible distributions of teams after 5 games is *not* the ordering of the teams by the means of their quality distributions.

Could you work out a model for that, and see if it's possible for the last bullet point to be satisfied?

# Claude

I'll build the model and search for parameters where the modal table differs from the means ordering.

I'll prototype the simulation in Python (no R in this workspace), then give you a tidyverse version to run yourself.

Requiring SD ≈ 3 is quite extreme. A cleaner mechanism: sandwich the wild team between two close, reliable teams, so "in between them" is a narrow target.

Sandwich works at modest variance (wild SD 1.0 vs 0.3). Now a high-precision run for the headline numbers, plus pairwise and marginal-rank checks.

Strong result. Now the tidyverse version for you to run.

Yes, the last bullet can be satisfied, and fairly comfortably. Here is a version that works with modest variance differences.

**Model**

- Each game is an ordered probit. Let z = q₁ − q₂ + ε, with ε ~ N(0,1). Team 1 wins if z > 0.4, team 2 wins if z < −0.4, and otherwise it's a draw. That gives about 31% draws between equal teams, which is roughly realistic.
- Each season draws qualities once from the panelist's distributions, then plays all 15 games. Ties on points are broken by coin flip.
- The panelist's views are:

| Team | A | B | C | D | E | F |
|---|---|---|---|---|---|---|
| mean | 3.0 | 2.8 | 2.9 | 1 | 0 | −1 |
| sd | 0.3 | 0.3 | **1.0** | 0.3 | 0.3 | 0.3 |

So C is expected to finish between two reliable top teams, but C is the boom-or-bust side.

**Result** (10 million simulated seasons; Monte Carlo error about ±0.0002)

| Table | Probability |
|---|---|
| C-A-B-D-E-F | 0.133 |
| A-B-C-D-E-F | 0.115 |
| C-B-A-D-E-F | 0.103 |
| **A-C-B-D-E-F (means order)** | **0.092** |
| B-A-C-D-E-F | 0.089 |

The means ordering is only the fourth most probable table. The modal table puts C first.

The intuition is that "between A and B" is a narrow band of quality, and a high-variance team rarely lands in a narrow band. C's marginal distribution over places shows this: 1st 0.378, 2nd 0.234, 3rd 0.311. C's expected place is 2nd, and 2nd is C's *least* likely place among the top three.

**What I think is the most useful finding for you**

Every pairwise majority agrees with the means ordering. A finishes above C with probability 0.534, C above B with 0.526, and A above B with 0.581. Ordering by expected finishing place gives the same result: A 1.90, C 2.10, B 2.13.

As a consequence, the means ordering maximizes the expected number of correctly ordered pairs (Kendall agreement). Its expected score is 13.15 of 15 correct pairs, compared with 13.09 for the modal table.

That gives you a positive account of why ordering by means is a good guess. It isn't the most probable cell, but it is the answer that is expected to be *closest* to the truth under the natural metric on rankings. So the case is a clean separation between "most probable answer" and "answer with the best expected closeness to the truth."

It also seems to bite against Dorst and Mandelkern's Filtering constraint. If I'm remembering it right, Filtering says a guess can't exclude a cell that is more probable than one it includes. The guess A-C-B-D-E-F excludes the more probable C-A-B-D-E-F, so it violates that. Check my statement of Filtering against the paper before relying on it.

**Weaknesses**

- The example works partly because A, B and C have close means. A critic can say the means ordering among them is close to a three-way tie, and that the intuition "A-C-B is a fine guess" is weaker than in the 20-team case.
- I also tried the less contrived setup: equal 1-point gaps between means, with the wild team exactly mid-table. The flip does happen there, but only when the wild team's SD is about 3, ten times everyone else's. Even then the margin is thin (0.128 vs 0.122). So the result is robust only when the wild team's "slot" in the means ordering is narrow relative to its spread.
- One thing I can't fully explain: in the main example, C on top beats C at the bottom of the top three (0.133 vs 0.115), even though C's quality distribution is symmetric about the midpoint of A and B. It's well outside sampling error. I'd want to understand it before putting the numbers in print.

# Me

That's interesting about the last point. Can you dig more into why C is doing so well? Here's a precise question.

* When C's quality is 3.9 (1 sd above mean), how many points on average does it get against A,B and how many points on average does it get against D,E,F
* When C's quality is 1.9 (1 sd below mean), how many points on average does it get against A,B and how many points on average does it get against D,E,F

# Claude

Here are the exact expected values. I computed these analytically: with C's quality fixed, each opponent's quality is still N(mean, 0.3), so each game is an ordered probit with total noise sd √1.09.

| C's quality | vs A, B | vs D, E, F | Total |
|---|---|---|---|
| 3.9 (+1 sd) | 4.68 | 8.98 | 13.67 |
| 2.9 (mean) | 2.70 | 8.82 | 11.52 |
| 1.9 (−1 sd) | 0.93 | 8.08 | 9.01 |

Moving C from its mean to +1 sd gains about 2.0 points against A and B, but only 0.17 against D, E and F, because C is already near the 9-point ceiling there. Moving C to −1 sd loses about 1.8 against A and B and 0.74 against D, E and F. At 1.9, C versus D is like a top team playing a middling one, and those points start to leak. So C's points are a concave function of its quality: the downside is bigger than the upside.

That's the opposite of what I'd have guessed, since it seems to favour C finishing *below* A and B. And in fact it does. I also checked the breakeven qualities, meaning the quality at which C's expected total equals A's or B's. They are 2.99 and 2.80, essentially A's and B's means, so there is no hidden schedule advantage to C. Going back to the 10M-season marginals:

- P(C finishes above both A and B) = P(C 1st) = **0.378**
- P(C finishes below both A and B) = P(C 3rd or lower) = **0.388**, made up of 3rd at 0.311 and 4th or lower at 0.077.

So C is actually slightly *more* likely to end up below both than above both. The puzzle comes from how that probability is spread over tables. "C above A and B" is essentially one place, 1st. "C below A and B" is split between 3rd and, in 7.7% of seasons, below D as well (A-B-D-C-E-F and so on). That leakage comes from the vulnerability against D that shows up in the table above. The full-table comparison C-A-B-D-E-F 0.133 vs A-B-C-D-E-F 0.115 tracks the 1st-vs-3rd marginal of 0.378 vs 0.311.

So I was wrong to frame it last time as C on top beating C at the bottom of the top three. The underlying events are roughly symmetric. The bad half just gets divided among more tables.

Two things this means for your example:

- The core result doesn't depend on this wrinkle. The means table (0.092) loses to A-B-C-D-E-F (0.115) as well as to C-A-B-D-E-F, and that is purely the narrow-band effect.
- But the size of the gap to the modal table is partly an artefact of where D sits. If you move D further down, the leakage shrinks, and C-A-B and A-B-C should end up close to level. If you want the modal table to be unambiguous, it might be cleaner to report "the means table isn't even second" rather than leaning on which C-extreme table wins.

# Me

The 8.98 worries me. That's really high for anything that people might think looks like soccer. Saudi Arabia beating Argentina at the 2022 World Cup actually happened! Can we rerun the original with a more random game model; increasing the standard deviation in the error considerably?

# Claude

The result survives a much noisier game model, and in relative terms it gets stronger. But the mechanism changes, and one of the nice features from before is lost.

**Noisier model.** I tripled the game noise (sd 3 instead of 1) and scaled the draw band with it, so equal teams still draw 31% of the time. Under that model:

- The best team beats the worst only 82% of the time.
- C at +1 sd averages 7.7 points against D, E and F, down from 8.98.
- D beats C-at-−1-sd 24% of the time.

That looks a lot more like soccer. I kept the team means as before (A 3.0, C 2.9, B 2.8, then D, E, F at 1, 0, −1), with C's sd at 1.5 against 0.3 for everyone else. Results from 8M simulated seasons, with sampling error about ±0.0001:

| Table | Probability |
|---|---|
| C-A-B-D-E-F | 0.0373 |
| C-B-A-D-E-F | 0.0341 |
| **A-C-B-D-E-F (means order)** | **0.0285** |
| A-B-C-D-E-F | 0.0282 |
| B-A-C-D-E-F | 0.0255 |

The means ordering is third, and the modal table beats it by about 30%. Across the grid I scanned, the flip held everywhere. With C's sd at 1.0 the means order is third; with sd 3.0 it drops to eighth.

**What changed**

- **The narrow-band effect has mostly washed out.** A-C-B and A-B-C are now essentially tied. Game noise blurs "C lands between A and B" so much that the narrowness of that band no longer matters.
- **The leakage effect now does the work.** With more upsets, a weak C falls below D, E or F much more often. C finishes 4th or lower 22% of the time, compared with 8% before. That probability is spread over many tables, whereas strong-C seasons pile into C-first tables.

**Pairwise majorities still agree with the means order**, though only barely: A above C 0.519, C above B 0.512, A above B 0.537. So the means order is still the guess that maximizes the expected number of correctly ordered pairs.

**But expected finishing place now disagrees.** The expected places are A 2.21, B 2.37, C 2.43. So you now have three candidate guesses that come apart:

1. The most probable table, C-A-B.
2. The pairwise-majority table, which is also the means table, A-C-B.
3. The expected-place table, A-B-C.

That could be useful for the paper, since it lets you test intuitions about which one is "the" good guess. It also means you can no longer say the means order is supported by every natural closeness measure.

**One caution.** At this noise level, no single table is very likely. The modal table has under 4% probability, and the pairwise margins are 51–54%. A critic might say a panelist with these beliefs has no strong preference between the top candidate tables. I don't think that undermines the counterexample, since the standard view says to give the most probable answer however low its probability is. It does mean the intuition that A-C-B is a good guess has to come from somewhere other than its being clearly better.

# Me

I'm worried about the critic who says that when the person thinks C is the most likely winner, it's really weird to not guess a table starting with C. Could you re-run with the following kind of set up.

A is easily the best team, and F easily the worst. C is squeezed between B and D, though it's only about 1.5 standard deviations above E, so it could lose there as well.

# Claude

Works, but the margins are thin. Let me tighten the squeeze a little and get precise numbers.

The new setup still breaks the standard view, and it handles your critic. A is the clear favourite to win, the modal table starts with A, and the means table is still not the most probable.

**Setup** (game noise sd 3, as last time)

| | A | B | C | D | E | F |
|---|---|---|---|---|---|---|
| mean | 5.7 | 3.2 | 3.0 | 2.8 | 0.75 | −1.75 |
| sd | 0.3 | 0.3 | **1.5** | 0.3 | 0.3 | 0.3 |

C sits 0.2 from B and from D, and E is exactly 1.5 of C's standard deviations below C's mean.

**Results** (8M simulated seasons, sampling error about ±0.0001)

| Table | Probability |
|---|---|
| A-C-B-D-E-F | 0.0686 |
| A-B-D-C-E-F | 0.0655 |
| **A-B-C-D-E-F (means order)** | **0.0634** |
| A-C-D-B-E-F | 0.0572 |
| A-D-B-C-E-F | 0.0547 |

A wins the league 71% of the time; C wins it 13%. The means table comes third, about 8% less probable than the modal table. The gap is small in absolute terms but far outside sampling error.

**All the closeness measures now line up with the means order.** This fixes the three-way split from last time.

- **Pairwise:** every majority agrees with the means order, including B above C (0.532) and C above D (0.530). So the means table still maximizes expected correctly ordered pairs.
- **Expected place:** this agrees again too: B 2.91, C 3.08, D 3.20.

So the clean contrast is: the most probable table is A-C-B-D-E-F, but the table that is expected to be closest to the truth is A-B-C-D-E-F.

**Robustness.** With C's sd at 1.5, a wider squeeze (0.3 instead of 0.2) still flips, but the means table rises to second. With C's sd at 2, the means table is third behind two near-tied tables. With C's sd at 1, the means table is modal. So you need C's sd to be at least about five times the others', and a tight squeeze.

**The critic's worry moves down a level rather than disappearing.** Here are C's place probabilities: 1st 0.128, 2nd 0.248, 3rd 0.232, 4th 0.230, 5th 0.133. C's single most likely place is 2nd. B's most likely place is actually 3rd (0.308, against 0.296 for 2nd). So the means table puts both B and C in places that aren't their individual modes. A critic can now say: "You think C is likelier to finish 2nd than 3rd, and B likelier 3rd than 2nd, so why guess B 2nd and C 3rd?"

That version of the objection is much weaker than the old one. The margins are a few percentage points, rather than "C is your favourite to win the league." But you'll still need the pragmatic story to explain why people don't guess team by team.

If you want, I can update the R script to these parameters and have it also print the pairwise and place tables.

# Me

Could you do all that?

# Claude

R installed, so I can test the script this time.

Good catch from testing: inside `tibble()`, the new `place` column shadows the matrix. Fixing that.

Works end to end. One fix: the correct-pairs column rounds to 12.5 for every table, which hides the differences. I'll print more digits.

I've updated `guess_tables.R` and this time ran it in R, so it's tested. It uses the squeezed-C parameters and the noisier game model (game noise sd `s = 3`, draw band `c = 0.4 * s`), and prints four things:

- the top six tables, with standard errors and ranks;
- where the means table ranks;
- the matrix of pairwise "finishes above" probabilities;
- each team's place probabilities and expected place (the `P1` column is the chance of winning the league).

It finishes with expected correct pairs out of 15 for the top three tables. That's always the means table at 12.52, against 12.46 for the modal table.

At the default 2 million seasons the R run reproduces the Python numbers to within sampling error: A-C-B-D-E-F 0.0684, A-B-D-C-E-F 0.0658, and the means table third at 0.0637.

It takes about three minutes, mostly in the two row-wise `apply` calls. Drop `n` to `2e5` for quick parameter exploration. At that size the means table still comes out third, but the gaps between the top three are only a few standard errors.

# Me

That's great. Can you write a variant of the code which has a free parameter for whether a particular team's star player is available? So I want a version where I can set the mean of A's quality as being either x, if the star is available, with probability (to be set by me), or y, if the star is unavailable, with probability 1-p.

I've written `guess_tables_star.R`, which adds the star player. I ran it in R and it works.

**How it works.** You give the star as a list:

```r
star <- list(team = "A", mean_with = 6.2, mean_without = 4.2, p_star = 0.75)
```

At the start of each simulated season, a draw with probability `p_star` decides whether the star is available. A's quality is then drawn from N(`mean_with`, sd) or N(`mean_without`, sd), using A's sd from `d` either way. Any team can have the star, not just A.

**Choices I made that you might want to change:**

- **Availability is set once per season, not game by game.** That matches your question, which treats the star as shifting the team's mean. Game-by-game availability would be a different and much weaker effect, because it averages out over five games.
- **The means table uses A's overall mean**, i.e. `p_star × mean_with + (1 − p_star) × mean_without`. The script prints the overall means so you can check which ordering counts as "the means table."
- I wrapped the analysis in a `report()` function, so trying new parameters is one line.
- I also replaced the slow row-wise `apply` calls. The run now takes about 15 seconds instead of three minutes, which will help when you scan parameters. This version gives the same answers as the old one.

**Example settings.** I chose 6.2 with the star, 4.2 without, and p = 0.75. That keeps A's overall mean at 5.7, so the rest of the setup is the same as the squeezed-C case. The result barely moves: A-C-B-D-E-F 0.067, A-B-D-C-E-F 0.064, and the means table still third at 0.062. A is far enough clear that the star mostly changes how often A wins (70%), not the ordering below it.

To make the star matter, put the star on one of the squeezed teams (B or D), or lower `mean_without` until a starless A falls into the B–C–D pack. The star-out case then gives A a narrow bimodal distribution, which is a cleaner version of the high-variance effect from before.