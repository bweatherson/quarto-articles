# Idea memo v2: three candidate papers on multiple guesses

Context: a first idea ("guesses are relative to a line of questioning; each later guess is made conditional on the
earlier ones; path dependence") was rejected by an advisor as EXPECTED/flawed: Fang (PPR 2026) considers and rejects it
(§6.2, fn 36); the conversational data follow from Stalnaker-Roberts context-set update; path dependence is a corollary
of Gold & List 2004 and of greedy decoding; a 60-ticket line (A .40, sixty tickets .01 each, asked one by one) makes
the view recommend "#60 will win". That report is at advisor-report-v1.md. What follows are three different candidate
papers. All are about guessing and about conversations in which more than one guess is asked for.

Background reading done in full: Fang 2026; Teague 2024 (preprint); Pearson 2025 (preprint); Hoek 2025 (§§I-IV, VI);
Holguín 2022 and Goodman & Holguín 2023 (by an assistant); Horowitz 2016 draft (assistant). Partially: Dorst &
Mandelkern 2022; Holguín's 2025 draft "What does weak belief tell us about full belief?" (toggling: "Toggling a weak
belief once is fine. Twice is borderline. Thrice or more is unacceptable"); Quillien, Bramley & Lucas 2025 (Cognitive
Psychology) and their OSF data.

---------------------------------------------------------------------------------------------------------------------

## Candidate A. "Where to look": guesses as search instructions

Phenomenon. When you get several guesses with feedback ("No -- guess again"), you name single answers in decreasing
order of probability; nobody answers "Yale or Harvard" in a guess-again game (that would be a question, not a guess).
When you get one guess and the asker will do the checking, coarse guesses ("Yale or Harvard") are natural. And when
told "you have three guesses", you name the top three.

Thesis. A guess tells the hearer where to look first. A coarse guess is a compressed list of guesses handed to someone
who will do the checking. The "informativity" that Dorst & Mandelkern, Skipper, Linnemann & Azhar trade off against
accuracy is the value of directing that search, not an intrinsic epistemic good.

Argument/results. (1) If the hearer checks the named answers first (in random order among them) and then the rest,
at unit cost per check, the guess minimising expected checks is exactly the set of answers whose probability exceeds
the average 1/n. Proof is two lines: expected checks = [(n+k+1) - nP(G)]/2, so including cell i helps iff p_i > 1/n.
This is parameter-free and entails Filtering, Improbable Guessing, and ties at the threshold. (2) If the hearer can
check only b answers, the best guess is the top b; so Optionality (any filtered top-k) = uncertainty about the
hearer's search budget. (3) Data: in Quillien et al.'s Study 2 (100 people x 14 urns of 12 balls, 4 colours),
responses split between including and excluding a colour exactly when it has 3 balls (= 1/n): [7,3,1,1] 68/31;
[6,3,2,1] 59/35; [5,3,2,2] 49/46; colours with 4 balls are mostly included, with 2 almost never. My refits: search
rule with one noise parameter NLL 1727 vs Dorst-Mandelkern (2-3 params) 1765-1890 vs compression model (3 params) 1558;
a mixture "45% name the single best answer, 55% use the 1/n rule" gets 1546 -- but D&M + the same mixture gets 1488,
so the data do not clearly favour the search rule once a single-best-guess type is allowed. (4) Philosophical upshot:
good guessing is audience-relative (depends on the searcher's budget); so if thinking is guessing (Holguín), thinking
inherits pragmatic encroachment -- or thinking is not guessing.

Risks: the 1/n rule is the gamma -> 1 limit of Quillien et al.'s compression model (KL between speaker distribution and
listener decoding); "informativity is instrumental" may be old (value of information; Grice's Quantity); the
empirical edge is fragile.

---------------------------------------------------------------------------------------------------------------------

## Candidate B. Pairwise coherence: how a sequence of guesses hangs together

Phenomenon (data that the advisor called new to the literature):
 (1) "Will Latif go to Yale?" "No." "So where will he go?" "Harvard." [Yale .38, Harvard .30, Stanford .20, NYU .12]
 (2) "Who'll win?" "The favourite." "Who'll come second?" "One of the others." [favourite .5, three others 1/6 each;
     the favourite is also the single likeliest runner-up, .3 vs .23]
 (3) Bond: "Which city?" "London." "Which country?" "The UK" ("Germany" is bad; Holguín §9.2).
 (4) Raffle: "Will #1 win?" "No." ... "Will #10 win?" "No." -- and the 60-ticket line ends "No" too.
 (5) Rain: "Monday? No ... Sunday? No." "Will it rain at all this week?" "Probably, yes."
 (6) Fang's tournament: after "A" and "D or E", both "A vs D or E" and "A vs D or B vs D" are fine (her fn 36).

Thesis. Guesses in one conversation must be pairwise compatible -- no guess may contradict any single earlier guess --
but need not be jointly consistent or closed; and each guess is filtered on its question as narrowed by that
constraint (cells contradicting some earlier guess are removed). Fresh answering fails (1)-(3); Stalnaker update /
conditioning on all earlier guesses fails (4)-(6); pairwise coherence fits all six. It generalises Teague's
part-whole compatibility principles (WTP, PTW) to arbitrary pairs of questions, answers his "so what's going on?",
and restores Fang's independent closure for answers built in sequence without forbidding the fresh answer. It
accepts limited path dependence (only where pairwise clashes arise, as in (1) vs the reverse order).
Payoff for weak assertion: weak assertions do not enter the common ground as premises; they enter as pairwise
constraints on later contributions -- a distinct kind of conversational commitment.

Risks: data delicate (3-ticket raffle "no, no, no" sounds bad -- so maybe "few-wise" rather than pairwise; "With what?"
after "the butler" gets the conditional answer "the knife", which pairwise coherence alone does not predict --
explained by the anaphoric question); pairwise consistency looks ad hoc (Hoek calls pairwise consistency for
fragments ad hoc; Lockean belief above 1/2 gets it for free); path dependence is still a Gold & List corollary.

---------------------------------------------------------------------------------------------------------------------

## Candidate C. Asking again: a guess is a property of a distribution of answers

Phenomenon. Ask someone the same question twice (no new evidence) and they often give a different answer; averaging
their two numerical estimates beats either (Vul & Pashler 2008; Herzog & Hertwig 2009; van Dolder & van den Assem
2018, 1.2 million estimates). Ask a language model the same question many times and you get different answers;
taking the most frequent final answer ("self-consistency", Wang et al. 2023) beats the single greedy answer; and the
greedy answer can differ from the answer the model gives most probability to (probability split across phrasings:
Holtzman et al. 2021; the "inadequacy of the mode", Eikema & Aziz 2020; semantic entropy clusters samples into
answer-cells, Kuhn et al. 2023 / Farquhar et al. 2024).

Thesis. A single answer is a sample, not a guess. In the sense the theory of guessing describes (Filtering etc.), an
agent's guess at Q is a property of its distribution of answers to Q -- roughly, the filtered top of the distribution
of answers it would give over repeated askings, with answers grouped into Q's cells. So (i) individual answers can be
unfiltered without irrationality; (ii) asking again is a way of finding out what someone thinks, not pestering, and
differing answers are not toggling in Holguín's sense; (iii) for language models: neither a sampled answer nor the
greedy answer is the model's guess; a chain of thought is a line of token-by-token guesses each conditional on the
last, and is path-dependent in exactly the way the rejected idea was, which is why marginalising over chains
(self-consistency) does better; so an AI can deterministically say B while its best guess is A, with no deception --
bearing on AI assertion, honesty and belief attribution (Keeling & Street; Herrmann & Levinstein; Levinstein &
Herrmann "Still no lie detector").

Risks: may read as obvious to ML readers; Icard 2016 ("subjective probability as sampling propensity") is close for
the human half; Horowitz's "credences model our dispositions to guess" (Noûs) is close in spirit; moves from the human
guessing literature to AI, which may be a change of subject.
