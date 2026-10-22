# Idea memo v1: "One Guess at a Time" (working title)

## The phenomenon
A conversation in which one person is asked for several guesses:

(1) A: Will Latif go to Yale? — B: No, I don't think so. — A: So where do you think he'll go? — B: Harvard, I'd guess.
(2) A: Where do you think Latif will go? — B: Yale. — A: So you think he'll go to Yale? — B: Yes.
(3) A: Who did it? — B: The butler. — A: With what? — B: The knife, then.
(4) A: Which horse wins race 1? — B: Alexander. — A: Race 2? — B: Bella or Beth. — (later, C asks A what B thinks
    about today's races) — A: He thinks Alexander wins the first and Bella or Beth the second.

Credences for (1)/(2): Yale .30, Harvard .28, Stanford .22, NYU .20. For (3): butler-knife .40, butler-gun .15,
gardener-gun .45, gardener-knife 0 (so P(butler)=.55, P(gun)=.60).

## Where the literature is
The recent "Guessing" literature (Holguín 2022 Phil Imprint; Dorst & Mandelkern 2022 PPR; Goodman & Holguín 2023 PPR;
Skipper 2023; Linnemann & Azhar 2025) takes a guess -- and, for the "belief camp", a weak belief -- to be relative to a
single question: you may think p relative to Q iff p is entailed by a filtered answer to Q (a union of the k most
probable cells, for some k). Everyone in this literature has noticed that sequences of questions behave differently,
but only in passing: D&M fn 6 ("stickiness" of the QUD: after 'Yale' to the where-question, 'yes' to the Yale-question);
Goodman & Holguín fn 24 ("Asking the questions in immediate succession tends to force the second answer to conform to
the first"); Holguín §9.2 (answering 'London' then 'Germany' sounds bad; put down to semantic blindness). Two recent
papers make sequences into problems: Teague (Analysis 2024) argues that a single line of inquiry requires guesses to
related (part/whole) questions to be compatible (his WTP and PTW principles), which Filtering violates, and says he
does not know what to say; Fang (PPR 2026) argues that Guessing is incompatible with Independent Closure (if you may
think q given Q and r given R, Q and R independent, you may think q∧r given QR), since the conjunction of two filtered
answers is often unfiltered on the product question. Fang considers (§6.2) the reply that in a "question-sequence
discourse" the agent is still answering the separate questions, and rejects it; in fn 36 she considers and rejects in
two sentences the reply that the later answer is to a conditional question ("Conditional on A winning..."), on the
ground that it would rule out the felicity of 'A vs D or B vs D' as an answer to the final-race question.

## Thesis
The parameter of a guess (and of the weak belief it expresses) is not a question but a *line of questioning*: an
ordered sequence of questions (plus any feedback or explicit suppositions). Along a line, each guess must be a
filtered answer to its question relative to one's credence *conditional on the earlier guesses in the line*. The
composite of the guesses is what one thinks relative to the line. Single questions are lines of length one.

## Why believe it (the argument)
1. Data that only it predicts. In (1), 'Harvard' is the natural answer; but it is unfiltered on the where-question
   (it skips Yale, the most probable cell), so every single-question version of Guessing says it is impermissible,
   and the 'stickiness' story predicts only the uninformative 'not Yale'. The line view predicts 'Harvard' (the top
   cell of P(·|not Yale)). (3) likewise: 'knife' is the answer given 'butler', though the gun is likelier overall.
2. It explains the conformity observations (D&M fn 6, G&H fn 24, Holguín's London/Germany) without semantic
   blindness or QUD-persistence: given the earlier guess, the coarser or overlapping later question has a cell of
   conditional probability 1.
3. It vindicates Independent Closure: for independent questions, P(·|q) = P on R, so q then r is a line whose
   composite is q∧r. Fang's '(A,D) or (A,E)' is the composite of the line (race 1, race 2). It is permissive, not
   mandatory: one can also open a fresh line with the product question, which yields Fang's fn-36 'A vs D or B vs D'.
   So fn 36's objection is answered.
4. It dissolves Teague's puzzle: WTP and PTW hold within any one line, and fail only across lines.
5. A rationale. A line of guesses is assessed as one composite answer (it is right only if every part is right). Given
   that the earlier guesses are already made, the expected answer-value of the composite is P(earlier) times the
   conditional expected value of the next guess, so the next guess should maximise expected value relative to
   P(·|earlier). With Skipper's log-specificity measure this factorisation is exact (informativity is additive over
   the product question); with D&M's proportion measure the effective informativity weight on later guesses shrinks
   (J becomes J^(1-a), a = proportion of cells the earlier guesses exclude) -- a footnote.

## The striking consequence: path dependence
For dependent questions, what one may think depends on the order in which they come up. (1) vs (2): the same person,
with the same credences, thinks Latif will go to Yale in one conversation and to Harvard in the other. (3) vs the
reverse order (weapon first: gun; then who: gardener): butler-with-knife vs gardener-with-gun. I argue this is right:
the data in (1) and (2) are both natural, and the alternative views predict worse things ('Yale' after 'not Yale').
Order-dependence here is a form of the permissivism Guessing already accepts (Holguín's Doxastic Choice), now located
in the path rather than in a tie-break; and one can always step back and answer the joint question afresh.

## Second guesses and feedback
"Guess again" after being told one is wrong, and "if not that, what?", fit the same model: feedback or an explicit
supposition (¬g1) is added to the line instead of g1. So a first guess, a second guess, and a follow-up guess are all
guesses relative to the suppositional state the conversation has built.

## Objections I expect
- Bootstrapping: one's own guess is not evidence, so conditioning on it is irrational. Reply: supposition, not
  evidence; the composite-assessment rationale; analogy with planning on an intention.
- The raffle line: 'Will #1 win? No. ... #8? No. #9?' The line view says that by #9 one can no longer guess 'no'
  (P(#9 loses | #1-#8 lose) = .5). Fresh answering ('no' to all ten) is natural too. Reply: the line view says a single
  line of guesses cannot contain 'no' for every ticket (it would be inconsistent with 'someone wins'), which is
  Holguín's own verdict for the join; the natural 'no' to each is a step back to assessing each ticket separately
  ('each probably won't'), which the view allows when marked.
- Path dependence is arbitrary. Reply above; plus Koralus's erotetic theory of reasoning and List's path-dependence
  in judgment aggregation as cases where order effects follow from sensible sequential procedures.
- Isn't this just Stalnakerian common-ground update with weak assertions? Partly -- and that is a point in its favour --
  but no one in the guessing literature has drawn the consequences, and it requires the controversial step of
  guessing relative to credences conditional on non-evidence.
- Preface: the book is a line; "something in here is false" answers a fresh question about the line.

## What it would add, in one sentence
Guesses and weak beliefs are relative to lines of questioning rather than to questions, which explains why successive
answers conform, restores closure across independent questions, resolves Teague's and Fang's puzzles, and has the
surprising but correct consequence that what one may think about dependent matters can depend on the order in which
they are asked.

## Not yet read (beyond what is listed above)
Teague in full (only fragments so far); Hoek 2022 (JPhil, "Questions in Action") and 2025 ("Minimal Rationality and
the Web of Questions"); Pearson 2025 (Analysis) in full; Koralus's erotetic theory; Yalcin 2018; Roberts on strategies
of inquiry; Lin & Kelly 2012; Bratman 1992 on acceptance; Horowitz's book ms *Guesswork*; Beddor 2025; Holguín's
unpublished manuscripts; Jovićević 2025.
