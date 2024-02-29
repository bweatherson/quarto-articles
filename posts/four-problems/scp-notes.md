In @tbl-???/@fig-???, Chooser has two possible choices to make. They will make at most one on them in any run through the game. But a strategy for Chooser has to settle two questions.

For the rest of this paper, I'm going to primarily focus on decision trees where there is only one possible decision for Chooser to make. Chooser might not get to make it; the game might end without Chooser making a move. But Chooser knows at the start of the game that if they do have to move, exactly what the situation will be in when they move. There is nothing they can learn between the start of the game and when they move, other than the fact that they do in fact have to move. That's to say, all the nodes where they move are epistemically indistinguishable; they are all in the same information set.

The point of this section is to argue that in any such game, dynamic-strategic equivalence holds. I'm going to defend what I'll call the **Single Choice Principle**.

> **Single Choice Principle (SCP)**    
> In any decision tree in which all the nodes where Chooser acts are in a single information set, an option is choice-worthy in the dynamic form of the game iff it is choice-worthy in the strategic form of the game.

There are two arguments for the SCP, one semantic and one intuitive. I'll start with the semantic.

Imagine the game-master asking Chooser for a strategy in the strategic form of the game. Normally, to ask someone for a strategy, one asks them a series of conditional questions: _If we get to here, what will you do?_, _And if we get to this other point, what will you do?_, and so on. Here there is just one question to ask: _If we get to the information set where you have to choose, what will you do?_

Now imagine the game-master asking Chooser for a move in the dynamic form of the game. By the rules of the game, they have to fill in Chooser on which information set we've reached. So they'll tell Chooser: _We've got to the information set where you have to choose_. And then they'll ask _What do you do?_

At a deep level, the game-master is asking the same question on each occasion. How does one figure out what to do if one reaches a situation? As @Ramsey1929 says, one adds the assumption that one reached that situation "hypothetically to [one's] stock of knowledge" [citation - RamseySEP] and reasons on that basis about what to do. Apart from the fact that it's hypothetical, that's exactly the same thing one does when one learns that one is in a particular situation. One adds the fact that one is in a situation to one's actual stock of knowledge, and reasons on that basis about what to do. It's true that here we are thinking about practical reasoning not theoretical reasoning, but the thought that these are just the same processes, and just the same outcomes to them are rationally permissible, is just as plausible here as in Ramsey's original case.

In general, the same answers are rationally permissible to the following two questions:

1. If *p*, what will you do?
2. *p*, now what will you do?

And the SCP is just a special case of the equivalence of these questions. Here *p* is that Chooser has reached the one-and-only information set in the tree where they must choose.

The intuitive argument comes from thinking about how strange violations of the SCP sound in practice. Here it's helpful to have an example. This is an example I'll return to frequently below, and if the SCP fails anywhere, this is as likely a candidate as any for a failure.

The game has three stages. At stage one, Demon predicts whether Chooser will play Up or Down at stage three (if it is reached). Demon's predictions are (and are believed by Chooser to be) arbitrarily accurate no matter what Chooser does. At stage two, if Demon predicts Up, a fair coin is flipped. If it lands Heads, the game ends, and Chooser gets 0. If lands Tails, or Demon predicts Down, we proceed to stage 3. At that point, Chooser selects Up or Down, and the payouts are given in @fig-asdasd/@tbl-asdfadf. In @tbl-asfasd, the states consist of pairs of what Demon predicts, and Nature's 'strategy', i.e., how the coin would land if flipped.

[Include figure]

|          | **Up-Heads** | **Up-Tails** | **Down-Heads** | **Down-Tails** |
|:--------:|:------------:|:------------:|:--------------:|:--------------:|
| **Up**   |     0        |      4       |       0        |       0        |
| **Down** |     0        |      0       |       3        |       3        |

:  The game table for @fig-asfasfs

If Chooser has to act, they'll know they are in the part of the tree shown in @fig-asfdasd, and are facing the table shown by @tbl-adfasdf

[Include figure]

|          | **Up-Tails** | **Down-Heads** | **Down-Tails** |
|:--------:|:------------:|:--------------:|:--------------:|
| **Up**   |      4       |       0        |       0        |
| **Down** |      0       |       3        |       3        |

: The game table for @fig-asdadfasdf

Conditional on playing Up, they'll have got some weak evidence against Demon's reliability, but that won't make a major difference if they started out thinking that Demon was arbitrarily accurate. So whether Chooser reaches @tbl-asfadfs as part of @fig-asdafds, or it was the first interaction they have with Demon shouldn't make a difference to how they act.
