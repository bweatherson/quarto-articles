# Expanded Notes for Sections 3 and 4

These are expanded versions of the notes in `objection-notes.md`, written as draft prose that could be worked into `newwork.md`. The material here covers the transition into objections at the end of section 4, plus the objections themselves.

## Section 4 Opening: From Possibilities to Belief Functions

The previous section argued that what is true in a fiction is what is true at a possibility, not at a possible world. Now we need to connect this to the question of rational credences about fiction.

If a rational agent is uncertain about what is true in a fiction, their credal state is a measure over a space of possibilities. For any fiction, there is a possibility frame whose points represent the candidate possibilities the fiction might pick out. A credence function on such a frame assigns weights to these possibilities.

The key observation is that a measure over a possibility frame does not, in general, determine a probability function over propositions. To see why, consider any possibility $x$ in the frame. The set of propositions that $x$ makes true is, in general, a proper subset of the propositions settled by any world refining $x$. When we aggregate across all the possibilities with positive measure, we can generate a mass function $m$ from the measure: for each possibility $x$, the mass $m$ assigns to a set of propositions is just the measure of the points that make precisely those propositions true (and no more). This mass function is, by construction, a Dempster-Shafer belief function. The proof is trivial, since the axioms for belief functions are exactly what you get when you allow the focal elements to be sets of worlds rather than individual worlds.

So if the anti-realist picture of fiction from @sec-fiction is correct, and if rational credences about fiction are measures over the relevant possibility frame, then those credences are Dempster-Shafer belief functions. We have our conclusion: belief functions are the credence functions appropriate for anti-realists about a domain. But several objections deserve attention.

## Objection 1: This Doesn't Help Dempster and Shafer

One might worry that this conclusion is irrelevant to the broader debate about probabilism. After all, Dempster and Shafer proposed belief functions as a general theory of uncertain reasoning, not as a niche tool for reasoning about fiction. If the argument here only vindicates belief functions for domains where anti-realism holds, it does nothing for the original Dempster-Shafer programme.

That's correct, and I want to be upfront about it. This is, as the title says, *new work* for Dempster-Shafer functions. The claim is not that Dempster and Shafer were right all along; the claim is that their formal machinery finds a new and natural home once we take anti-realism seriously. If you are a realist about the subject matter of your credences, the accuracy dominance argument looks compelling. The argument of this paper is that there are domains — fiction prominently among them — where realism is not the right stance, and in those domains the accuracy dominance argument loses its force. Belief functions become rationally permissible precisely where realism fails.

## Objection 2: Dempster-Shafer Has No Update Rule

A standard complaint about Dempster-Shafer theory is that it lacks a satisfactory rule for updating on evidence. Dempster's own combination rule is widely regarded as problematic, and nothing else has won broad acceptance. If belief functions can't be updated, what good are they as a theory of rational credences?

The version of the theory developed here has a straightforward answer to this: the update rule is just conditionalisation. A credence function on a possibility frame can be conditionalised in exactly the way a probability function can. When you learn that some proposition $A$ is true, you restrict your measure to the possibilities compatible with $A$ and renormalise. This is ordinary Bayesian updating. The non-probabilistic character of the credences comes not from any exotic update rule but from the structure of the space of possibilities over which the measure is defined. The update rule is as classical as can be; what is non-classical is the domain.

## Objection 3: This Is Boring (It's Only About Trivial Questions in Fiction)

One might concede everything said so far but insist it doesn't matter much. Holmes's cousins are a philosopher's toy example. Nobody has real credences about this, and nothing of substance turns on whether those credences are probabilistic.

This objection underestimates the reach of the argument in three ways.

First, the argument is not confined to trivial questions about fiction. Consider any genuinely hard interpretive question about a work of fiction — whether Hamlet is truly mad, whether the governess in *The Turn of the Screw* is a reliable narrator, whether Deckard is a replicant. These are not questions with determinate answers that we happen not to know. A reasonable view is that, for at least some such questions, there is no fact of the matter: the fiction simply does not settle them. But then a rational agent's credences about these questions should allow some weight to the possibility that the question is unsettled — that is, some weight to a non-world possibility. And once any positive weight goes to a non-world possibility, the resulting credence function will be a belief function rather than a probability function.

Second, and more importantly, the argument is not restricted to fiction at all. The formal apparatus applies to any domain where anti-realism might be appropriate. Wherever there might be unsettled questions — wherever the space of live possibilities includes incomplete ones — the same reasoning goes through. Fiction is a clear case, but it need not be the only one.

Third, this observation opens up a response to an important objection to epistemological dogmatism. Roger @White2006 argued that the dogmatist faces a problem: prior to having any perceptual experience, the dogmatist's credences must already be such that a particular experience will raise their credence in the corresponding proposition. White argued this is a problematic kind of question-begging. But the dogmatist can reply, building on a suggestion by James @Pryor2007, that in a situation of very low evidence it is not clear that realism about the external world is warranted. If we are not external world realists — if, prior to experience, the space of live possibilities includes incomplete ones — then our credences need not be probabilistic, and White's argument, which assumes a probabilistic framework, does not go through. In a low-evidence situation, it is not obvious that we should be realists about anything, and without realism, the accuracy dominance argument that underwrites White's objection loses its force.

## Objection 4: The Bivalence Objection

Blumberg and Holguín [-@BlumbergHolguin2025] press a challenge against anti-realism about fiction that deserves careful treatment. On the anti-realist view, there is no fact of the matter about whether Holmes has an odd number of cousins. But, the objection goes, can't we simply *say* that there is no such fact? And doesn't the truth of that claim vindicate anti-realism in a way that is straightforwardly expressible?

There are three things to say in response.

First, on the semantics developed here, you cannot really say what the objection supposes you can say. In a possibility frame, every well-formed sentence has a definite semantic status at every possibility: it is either true there or not. The claim that *there is no fact of the matter about p* is not itself a sentence in the object language. Possibility semantics gives us a framework in which some questions are unsettled at some possibilities, but the language of the framework does not include a predicate for "unsettledness." You literally cannot express it.

Second, even if the claim could somehow be expressed, it could not be *known*. To know that there is no fact of the matter about $p$ would require knowing that the fiction picks out a possibility at which $p$ is unsettled. But the kind of uncertainty we have about fiction is precisely uncertainty about which possibility the fiction picks out. We might have high credence that $p$ is unsettled, but that falls short of knowledge.

Third, and perhaps most speculatively, this unknowability follows naturally from the Humberstone principles governing possibility frames. Persistence and refinability together ensure that truth and falsity are always "reachable" from any possibility: if a sentence fails to be true, some refinement makes its negation true. This means that from within the frame, every possibility looks as if it *might* be a world. The framework allows for incompleteness but does not let you, from inside, definitively detect it. This might seem like an overreaction — surely we can tell that the Holmes stories are incomplete! — but the universal naturalness of "wondering whether" locutions suggests otherwise. We wonder whether Holmes has an odd number of cousins in much the same way we wonder about any unknown fact. The phenomenology of fictional uncertainty does not come with an "incompleteness" marker. That, I think, is evidence that the Humberstone framework is capturing something real about the structure of fictional thought.

## Objection 5: The Expressive Power Objection

It is admittedly odd that the view I am defending says something about the world — namely, that there is no fact of the matter about certain fictional claims — which cannot be stated in the object language of the theory. This looks like an expressibility gap, and expressibility gaps tend to be signs of trouble.

There are three responses worth making.

First, we live with exactly this kind of gap in Tarski-style theories of truth. A Tarskian truth predicate for a language $L$ cannot be defined within $L$ itself. The semantic facts about $L$ must be stated in a metalanguage. This is a well-known limitation, and while it has generated a vast literature, almost no one thinks it shows that Tarski's approach is fundamentally misguided. The expressibility gap in possibility semantics is structurally similar: certain semantic facts about the possibility frame (facts about which possibilities are incomplete) must be stated from outside the object language.

Second, in the special case where we are talking about actuality, there is a way to recover some of the lost expressive power. We can add an *actually* operator $A$ to the language, interpreted so that $Ap$ is true at a possibility $x$ iff $p$ is true at the actual world. This lets us say things like: it is not the case that $Ap$, and not the case that $A\neg p$. If $p$ is the claim that Holmes has an even number of cousins, then $\neg Ap \wedge \neg A\neg p$ says, in effect, that there is no actual fact of the matter.

Third, this $A$ operator behaves in some unusual ways. In the modal logic literature following Davies and Humberstone [-@DaviesHumberstone1980], the biconditional $Ap \leftrightarrow p$ is standardly taken to be a priori even if not necessary. In possibility semantics, this biconditional can fail even at the actual world, if the actual world is replaced by an actual *possibility* that is incomplete. So $Ap \leftrightarrow p$ is not a priori on this framework. That is a cost, but it comes with a benefit: the operator lets us truly say (or at least, assign very high credence to the claim) that there is no fact of the matter about Holmes's cousins. If $p$ is the proposition that Holmes has an even number of cousins, then $\neg Ap$ and $\neg A\neg p$ are both extremely probable. We can thus express our anti-realism, at least approximately, even if the framework does not make the relevant claims knowable with certainty.
