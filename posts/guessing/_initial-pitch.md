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