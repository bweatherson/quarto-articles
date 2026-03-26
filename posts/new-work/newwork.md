---
title: "New Work for Dempster-Shafer Functions"
abstract: |
 TBD
date: today
author:
  - name: Brian Weatherson 
    url: http://brian.weatherson.org
    affiliation: University of Michigan
    affiliation_url: https://umich.edu
    orcid_id: 0000-0002-0830-141X
categories:
  - epistemology
  - games and decisions
  - logic
  - language
  - vagueness
execute:
  echo: false
  warning: false
citation: false
format:
  html:
    css: ../trad_defn.css
    include-in-header:
      - text: |
          <script>
          MathJax = {
            tex: {
              macros: {
                llbracket: "⟦",
                rrbracket: "⟧",
                nmodels: "\\not\\models",
                boxright: "\\mathrel{\\Box\\!\\!\\to}"
              }
            }
          };
          </script>
  pdf:
    output-file: "New Work for Dempster-Shafer"
    keep-tex: true
    geometry: "left=1.8in,
                 right=1.8in,
                 top=1.5in,
                 bottom=1.5in,
                 includemp=TRUE,
                 marginparwidth=0in,
                 marginparsep=0in"
    include-in-header:
      - text: |
          \newcommand{\nmodels}{\mathrel{\ooalign{$\models$\cr\raisebox{-0.001ex}{\hss$\mkern-1mu/\hss$}}}}
          \newcommand{\llbracket}{[\![}
          \newcommand{\rrbracket}{]\!]}
          \setlength\heavyrulewidth{0ex}
          \setlength\lightrulewidth{0ex}
          \usepackage[lines=2]{lettrine}
          \cehead{Draft of February 28, 2026}
          \DeclareSymbolFont{symbolsC}{U}{txsyc}{m}{n}
          \DeclareMathSymbol{\boxright}{\mathrel}{symbolsC}{128}
          \cehead{
                 Brian Weatherson
                 }
    include-after-body: 
        text: |
          \noindent Draft for discussion.
draft: true
---

Conventional wisdom these day is that credences should be probabilistic, and this is because of accuracy considerations. I'm going to argue that this conventional wisdom relies on an assumption that we have reason to reject. The assumption is that we should be *realists* about anything we have credences about, in the sense that there is a fact of the matter about anything we should have a credence about. If we drop this assumption, if we even drop a priori certainty in there being a fact of the matter, it could be coherent for credences to not be probabilistic. The right coherence constraint for someone who is unsure about realism is not probability, but Dempster-Shafer belief functions. This isn't what belief functions were designed for; there isn't much evidence that the people who designed them intended to question realism. But it is work, new work, that these belief functions can do.

To motivate the idea that we should be uncertain about realism, I'll work through some questions about fiction. The particular questions aren't that important in themselves, in fact part of the point is that they aren't important, but they are questions where anti-realism seems plausible.

For example, how many cousins does Sherlock Holmes have?^[The usual example, following @Lewis1978b, involves how many hairs Holmes has. I prefer this question because it makes clear the issue is not vagueness.] Does he have an odd or even number of cousins? If you're like me, untutored intuition says that (@holmesdisj) is true, while there is no fact of the matter about (@holmesodd) and (@holmeseven).

(@holmesdisj) Holmes has either an odd or even number of cousins.
(@holmesodd) Holmes has an odd number of cousins.
(@holmeseven) Holmes has an even number of cousins.

Intuition isn't the most reliable guide around here, and there are well known complications with trying to validate all these intuitions. Nevertheless, I'll argue these intuitions are correct. At least, I'll argue that the latter intuition is correct; for this paper I'll simply assume that (@holmesdisj) is true, and argue that there is no fact of the matter about (@holmesodd) and (@holmeseven).

In doing so, I'll be arguing against the orthodox view represented by David @Lewis1978b. His view is that sentences like (@holmesodd) and (@holmeseven) have an implicit operator, roughly _In the Holmes fiction_, and this operator is a normal necessity operator.^[Lewis's account of that operator uses counterfactual conditionals, but on the account of counterfactuals he endorses [@Lewis1973a], _If it were that A_ is a normal necessity operator, so we get back what I said in the text.] So just like $\Box (A \vee B)$ can be true while $\Box A$ and $\Box B$ are both false, Lewis says that (@holmesdisj) can be true while (@holmesodd) and (@holmeseven) are both false.

Recently, Kyle Blumberg and Ben Holguín [-@BlumbergHolguin2025] have argued that Lewis's account has implausible predictions about fictional claims embedded in attitude ascriptions. For instance, it implies that (@holmesknow) is true.

(@holmesknow) I know whether Holmes has either an odd or even number of cousins.

They argue that Lewis's view should be rejected in favour of their *fictional reality* view. On their view, the Holmes stories pick out a particular possible world, though it is unknowable which one. So one of (@holmesodd) and (@holmeseven) is true. This seems incredible; it's more plausible that there is no fact of the matter about how many cousins Holmes has.

What does it even mean to say there is 'no fact of the matter', and is this even coherent? I'll answer these questions by appeal to _possibility semantics_, as developed by Lloyd @Humberstone1981. In possibility semantics, the role of possible worlds is played by _possibilities_, which can be incomplete. Despite this incompleteness, the logic of truth preservation across possibilities is more or less classical.

I'm going to argue that a story does not pick out a possible world, but instead some Humberstone-style possibilities. Which ones does a particular story pick out? It's coherent to be unsure about that. Even with the text in front of them, a reader might not know the extra-textual information that settles some facts in the story. In such a situation, their credences about what's true in a story might be distributed across various posisbilities.

At this point we get (back) to belief functions. Measures on possibility frames do not always determine probability functions; rather, they might determine Dempster-Shafer belief functions. So, I'll conclude, it is rational for someone uncertain about what is true in a story to have credences that track one of these belief functions.

This conclusion might seem surprising. There is a famous argument, originally due to James @Joyce1998, that any non-probabilistic credence function is accuracy dominated. This argument seems to rule out exactly the view I put forward in the last paragraph. That argument, however, assumes exactly the kind of realism that is implausible in the case of thoughts about fiction. Someone who rejects fictional realism can happily use Dempster-Shafer belief functions without worrying about being excessively inaccurate.

Indeed, this last point generalises to any case where realism isn't clearly true. I'll suggest this opens up a response on behalf of the dogmatist to an important objection to dogmatism due to Roger @White2006. (What I say here builds on what James @Pryor2007 says in an unpublished but widely discussed note.)

So this paper lives at the intersection of possibility semantics, accuracy dominance arguments for probabilism, and theories of truth in fiction. The paper will work its way forward along this list of topics then back again. So @sec-humberstone and @sec-classical discuss possibility semantics. I'll start by setting out the details of them possibility semantics, and end by discussing the question, which will have become somewhat pressing by then, of whether the theory is really _classical_. @sec-joyce and @sec-realism will discuss accuracy dominance arguments, first discussing why accuracy dominance arguments are so important, and then coming back to why the anti-realist can reject them. And in the middle, in @sec-fiction, I'll endorse Blumberg and Holguìn's objections to Lewis's theory of truth in fiction, while rejecting their alternative in favour of an anti-realist model.

## Possibility Semantics {#sec-humberstone}

A Humberstone possibility frame (hereafter, just _possibility frame_) is a triple $\langle W, \leqslant, \mathbb{R}, f, V\rangle$, where $W$ is a set of possibilities, $\leqslant$ is a _refinement_ relation on them, $\mathbb{R}$ is a countable family of accesibility relations (with $R_i$ as the $i$'the member), $f$ is a selection function, and $V$ is a valuation function. I'll set aside $\mathbb{R}$ and $f$ until later, since they only play a role in interpreting modal statements and counterfactual conditionals respectively. I'll focus first on $W, \leqslant$ and $V$.

One way to think about the possibilities in $W$, suggested by @Humberstone1981 and used extensively by Wesley @Holliday2025, is that they are sets of possible worlds. I prefer to think of them as _stories_, at least on the assumption that stories are incomplete.^[This assumption is part of what's at issue in the paper, but I'm not begging any questions here. Whether one pictures possibilities as stories or sets of worlds does not bear any argumentative weight.] A possibility, like a story, is something which settles some facts, while possibly leaving others open.

Following Humberstone, I'll write $x \leqslant y$ to mean that $y$ is a **refinement** of $x$.^[$y \geqslant x$ will just mean the same thing as $x \leqslant y$.] To say $y$ refines $x$ is to say that $y$ makes true everything that $x$ makes true, and possibly some more things besides. If possibilities are sets of possible worlds, then $y$ is a subset of $x$. (This makes the notation here confusing, which is why @Holliday2025 prefers to write $y \sqsubseteq x$ when $y$ is a refinement of $x$.) If possibilities are stories, then $y$ is a refinement of $x$ if $y$ fills in part of what $x$ leaves open. This is how I'll, intuitively, think of refinements.

Finally, $V$ is a **valuation** function. It tells us where the atomics are true. Formally, it is a function from $\mathcal{P}$, the set of atomics, to $\wp(W)$, , satisfying these two constraints:

- For all $x$, if $x \in V(p)$ and $x \leqslant y$, then $y \in V(p)$. Intuitively, truth for atomics is **persistent** across refinements.
- For all $x$, if $\forall y \geqslant x\;\, \exists z \geqslant y: z \in V(p)$, then $x \in V(p)$. This is what @Humberstone2011 [900] calls **refinability**. It means that $p$ only fails to be true at $x$ if there is some refinement of $x$ where it is settled as being untrue.

Humberstone then proposes the the following theory of truth at a possibility for the language of propositional logic. (We'll treat $\rightarrow$ as a defined connective, with $A \rightarrow B =_{df} \neg A \vee B$.)

\begin{align*}
[\text{Vbls}] \quad & \mathcal{M} \models_x p_i \text{ iff } x \in V(p_i); \\
[\neg] \quad & \mathcal{M} \models_x \neg A \text{ iff } \forall y \geqslant x, \, \mathcal{M} \nmodels_y  A; \\
[\wedge] \quad & \mathcal{M} \models_x A \wedge B \text{ iff } \mathcal{M} \models_x A \text{ and } \mathcal{M} \models_x B; \\
[\vee] \quad & \mathcal{M} \models_x A \vee B \text{ iff } \forall y \geqslant x \;\, \exists z \geqslant y : \mathcal{M} \models_z A \text{ or } \mathcal{M} \models_z B. \\
[\rightarrow] \quad & \mathcal{M} \models_x A \rightarrow B \text{ iff } \mathcal{M} \models_x \neg(A \wedge \neg B)
\end{align*}

The first two clauses are familiar, and the third looks much like the intuitionist treatment of negation. The final clause amounts to treating $\rightarrow$ as a defined connective. The surprising one is $[\vee]$. It says that a disjunction is true iff at any refinement, at least one of the disjuncts could become true. This is not the most obvious understanding of $\vee$, but it allows Humberstone to prove three striking results.

First, every sentence in the language is persistent. If $\mathcal{M} \models_x A$ and $x \leqslant y$, then $\mathcal{M} \models_y A$. For any sentence, truth is always preserved when moving to a refinement. 

Second, refinability holds for all sentences in the language. Once we've added negation to the language, we can restate refinability as the condition that, for any $A$, if $\mathcal{M} \nmodels_x A$, there is some refinement $y$ of $x$ such that $\mathcal{M} \models_y \neg A$. Intuitively, if a sentence is not true, then at some refinement its negation is true.

The third point is the most important. Say that $\Gamma \vDash_{pf} A$ iff at any point in any possibility frame where all the members of $\Gamma$ are true, $A$ is also true. And say that $\Gamma \vdash_{CL} A$ if $\Gamma$ classically entails $A$. Then Humberstone shows that all of the canonical inference rules for $\vdash_{CL}$ also hold for $\vDash_{pf}$, and hence $\vdash_{CL}$ and $\vDash_{pf}$ exactly overlap.

It's useful to work through one of these rules to show how the system works. Because it will play a role in what follows, I'll show that disjunction elimination holds just as one would expect. One natural formulation^[There are other formulations which make weaker structural assumptions, but this one will do to show that we're preserving classical logic.] of this is that if $\Gamma \cup \{A\} \vdash_{CL} C$, $\Delta \cup \{B\} \vdash_{CL} C$, and $\Phi \vdash_{CL} A \vee B$ then $\Gamma \cup \Delta \cup Phi \vdash_{CL} C$. Let's show that the same principle holds for $\vDash_{pf}$.

Assume that $\Gamma \cup \{A\} \vDash_{pf} C$, $\Delta \cup \{B\} \vDash_{pf} C$, and $\Phi \vDash_{pf} A \vee B$. We want to show that $\Gamma \cup \Delta \cup \Phi \vDash_{pf} C$. So take any possibility $x$ where all members of $\Gamma \cup \Delta \cup \Phi$ are true, and suppose for reductio that $\mathcal{M} \nmodels_x C$. By refinability, there is some $y \geqslant x$ such that $\mathcal{M} \models_y \neg C$, i.e., for all $z \geqslant y$, $\mathcal{M} \nmodels_z C$. By persistence, all members of $\Gamma \cup \Delta \cup \Phi$ are true at $y$. Since all of $\Phi$ is true at $y$, we have $\mathcal{M} \models_y A \vee B$. By $[\vee]$, there is some $z \geqslant y$ such that $\mathcal{M} \models_z A$ or $\mathcal{M} \models_z B$. By persistence again, all members of $\Gamma \cup \Delta$ are true at $z$. If $\mathcal{M} \models_z A$, then all of $\Gamma \cup \{A\}$ are true at $z$, so $\mathcal{M} \models_z C$. If $\mathcal{M} \models_z B$, then all of $\Delta \cup \{B\}$ is true at $z$, so $\mathcal{M} \models_z C$. Either way, $\mathcal{M} \models_z C$. But $z \geqslant y$ and $\mathcal{M} \models_y \neg C$, so $\mathcal{M} \nmodels_z C$. Contradiction.

Humberstone's system looks non-classical. It includes points that make true neither $A$ nor $\neg A$ for some $A$. It includes a rule for negation that looks more like intuitionistic negation than classical negation. But the system is still classical. All the sequents, and all the admissible rules on sequents, carry over from classical logic. We have a non-standard semantics for a very standard logic. 

Possibility frames have attracted some attention recently as an interesting classical alternative to possible worlds semantics. Humberstone's original application of them was to modal logic, and Wesley @Holliday2025 has written a thorough study of that application, differing in some key respects from Humberstone's original picture.^[The differences are largely about the relationship between the $R$-relation in modal semantics and $\leqslant$, so they aren't relevant to our story.] Matthew @HarrisonTrainor2019 has shown how to extent the semantics to first-order logic. Brian @WeathersonHoPF applies possibility frame semantics to a puzzle about counterfactuals. And Fabrizio @CarianiUnpub uses possibility frames to model the open future. This paper extends that list; I'm going to use them to provide a better way of talking about fictional truth.

Since many theories of fiction involve modals or counterfactuals, we need to say more about $\mathbb{R}$ and $f$. First we'll talk about modals.

In order to make sure persistence and refinability hold in the modal part of the language, Humberstone puts some constraints on what can go into $\mathbb{R}$. (As noted above, Holliday prefers weaker constraints, but the difference won't be important here.) Any accessibility relation $R_i$ has to satisfy these constraints.^[The names are taken from Holliday; Humberstone uses less descriptive names.]

**UpR**:
:    If $x \leqslant x'$ and $x' R_i y$, then $x R_i y$.

**RDown**:
:    If $x R_i y$ and $y \leqslant y'$, then $x R_i y'$.

**RRef++**:
:    If $x R_i y$, then there exists $x' \geqslant x$ such that for all $x'' \geqslant x'$, $x'' R_i y$.

**UpR** says that accessibility is never gained by refinement; if $x$ can access $y$, so can any coarsening of $x$. **RDown** is the converse: if $x$ can access $y$, it can access every refinement of $y$. To understand **RRef++**, it helps to have one new concept. Say that $a$ determinately accesses $b$ if for any refinement $c$ of $a$, $cR_ib$. Then **RRef++** says that if $x$ accesses $y$, some refinement of $x$ determinately accesses $y$. Finally, we add a familiar truth condition for $\Box_i$:

\begin{align*}
[\Box_i] \quad & \mathcal{M} \models_x \Box_i A \text{ iff } \forall y \, (x R_i y \Rightarrow \mathcal{M} \models_y A)
\end{align*}

In words, $\Box_i A$ is true at $x$ iff $A$ is true at every $R_i$-accessible possibility.

Humberstone treats $\Diamond$ as a defined connective, $\Diamond_i A$ just means $\neg \Box_i \neg A$, and I'll do the same. It is easy to show that if $R_i$ satisfies these three constraints, then even after adding $\Box_i$ and $\Diamond_i$ to the language, all sentences will satisfy persistence and refinability.

@WeathersonHoPF describes a theory of counterfactuals in possibility semantics that validates conditional excluded middle. That's what we're going to need, but unfortunately that semantics doesn't guarantee persistence and refinability. Here is a modified version of his semantics that does.

We posit a selection function $f$ as in the semantics for counterfactuals suggested by @Stalnaker1968. We assume that the selection function follows the these constraints.

**Conditional Excluded Middle**
:   Either $f(A, x) = \emptyset$, or $\exists y: f(A, x) = \{z : z \geqslant y\}$.

**Truth**
:   $f(A, x) \subseteq A$

**Centering**
:   $x \in f(A, x)$ whenever $x \in A$

**Nearness**
:   If $f(A, x) \subseteq B$ and $f(B, x) \subseteq A$, then $f(A, x) = f(B, x)$

**UpR for $f$**
:    If $x \leqslant x'$ and $y \in f(A, x')$, then $y \in f(A, x)$

**RDown for $f$**
:    If $y \in f(A, x)$ and $y \leqslant y'$, then $y' \in f(A, x)$

**RRef++ for $f$**
:    If $y \in f(A, x)$, then there exists $x' \geqslant x$ such that for all $x'' \geqslant x'$, $y \in f(A, x'')$

Then the truth condition for counterfactuals is:

\begin{align*}
[\boxright] \quad & \mathcal{M} \models_x A \boxright B \text{ iff } \forall y \in f(A, x) \, \mathcal{M} \models_y B 
\end{align*}

I'll say that $f(A, x)$ are the nearest $A$-worlds; it will become clear why this is a reasonable locution.

**Conditional Excluded Middle** says that there are no nearest $A$-worlds, or they are all and only the refinements of some particular possibility. So it can't be that neither $B$ nor $\neg B$ holds throughout the nearest $A$-possibilities: if there is a nearest $A$-possibility $y$, then by refinability for $B$, either $\mathcal{M} \models_y B$ (in which case persistence gives $\mathcal{M} \models_z B$ for all $z \geqslant y$, so $A \boxright B$ is true), or there is some $y' \geqslant y$ with $\mathcal{M} \models_{y'} \neg B$ (in which case persistence gives $\mathcal{M} \models_z \neg B$ for all $z \geqslant y'$, and since $\{z : z \geqslant y'\} \subseteq \{z : z \geqslant y\} = f(A, x)$, there is a nearest $A$-possibility where $\neg B$ holds). This validates Conditional Excluded Middle for counterfactuals: $\mathcal{M} \models_x (A \boxright B) \vee (A \boxright \neg B)$.

The other principles are more straightforward. **Truth** says that the nearest $A$-worlds have to actually make $A$ true. **Centering** says that if $A$ is true at $x$, then $x$ is one of the nearest $A$-worlds. This system doesn't quite have Strong Centering, since there could be other nearby $A$-worlds, but it is close. The nearest $A$-worlds to an $A$-world can only be coarsenings or refinements of it. **Nearness** says that if the nearest $A$-worlds are all $B$-worlds, and the nearest $B$-worlds are all $A$-worlds, then the nearest $A$-worlds just are the nearest $B$-worlds. That has to be true if $f$ is really measuring nearness. Finally, the last three clauses ensure that if we define $R_A$ such that $xR_Ay$ iff $y \in f(A, x)$, then $R_A$ is an acceptable accessibility relation. This in turn guarantees that the language is still persistent and refinable, even with $\boxright$ added.

## Accuracy Dominance {#sec-joyce}

Over the twentieth century, there were several important pragmatic arguments for probabilism, the thesis that credences are coherent only if they are probabilistic. The most important of these were Dutch Book arguments and representation theorem arguments. These arguments were problematic in two respects. First, they were *pragmatic* arguments. Second, they were arguments *for probabilism*. The first problem was that these seemed to show at most that non-probabilistic credences were pragmatically sub-optimal, not that they violated a distinctive doxastic norm. The second problem was that these arguments didn't engage, at all, with non-probabilistic alternatives. It's worth pausing on this because it brings up something rather distinctive about the literature on probabilism.

Most philosophical arguments engage at length, some would say inordinate length, with rival views. Pick up a work arguing for this or that functionalist thesis in philosophy of mind, and you expect to see extensive treatment of the flaws of non-functionalist rivals. And that's the normal case. Sometimes, a philosopher will put forward a purportedly sound deductive for a distinctive conclusion, as Frank @Jackson1982 did with the knowledge argument. Those arguments don't turns on comparative considerations weighing up, in this case, dualism vs physicalism. But in those cases, the arguments will be carefully crafted to be maximally compelling to people tempted by the opposing view.

The arguments for probabilism have none of that. Some premises are suggested, and they are shown to entail probabilism. There is no consideration of which of these premises might be more compelling to someone tempted by this or that non-probabilist view. Indeed, in most of these papers there is no sense of which non-probabilistic view the author is most concerned to argue against. Or, in many cases, whether there is *any* non-probabilistic view that the author thinks is worth careful consideration.

The risk of this approach is that the arguments will be question-begging. As Patrick @Maher1997 showed, that's exactly what happened. While there are many ways to not be a probabilist, the most widely discussed in the modern literature is that credences should be Dempster-Shafer belief functions (hereafter, simply *belief functions*). Maher showed that these arguments for probabilism were question-begging against the view that credences should be belief functions.

David @Christensen1996 provided the first important attempt to deal with the first problem, i.e., that these arguments showed that non-probabilistic credences violated the wrong kind of norm. He argued that the non-probabilist was committed to valuing the same thing two different ways under different modes of presentation, and this was a genuinely doxastic incoherence. This does, I think, deal with the first problem, but the cost is that it makes the second problem worse. A key premise of Christensen's argument is that the value of a book of bets which can't both win is the sum of the values of each bet. And there is no reason for the belief functions theorist to accept that. The argument is just clearly question-begging against them.^[This premise is also rejected by some opponents of expected value maximisation, like Lara @BuchakRisk.]

This is the 

## Fictional Anti-Realism {#sec-fiction}

- Agreement with Lewis and with BH - hidden operator
- Agreement with BH against Lewis - the wonder cases are problems
- Disagreement with BH - realism is literally incredible
- First, appeal to intuition - especially about songs
- Second, appeal to possibility of consistent but incompatible fanfics
- Conclusion, what's true in a story is what's true in a *possibility*

## Accuracy for Anti-Realists {#sec-realism}

- Start with 1/3 p, 1/3 ~p
- Accuracy dominance says in any world, you'll be better with 1/2, 1/2
- Illustrate with Brier score
- But in a possibility, you're better with 1/3, 1/3
- In general, any belief function is optimal wrt some possibility frame
- Conclusion: The accuracy dominance argument assumes realism, and anti-realists can reject it. Belief functions are credence functions for anti-realists
- Compare Horowitz's guessing framework. Even clearer that the realist assumption is being made.
- Objection 1: This doesn't save Arthur Dempster and Glenn Shafer. Sure, it doesn't.
- Objection 2: This rests on a strange way of understanding disjunction. Sure, but disjunction is strange. We shouldn't have a hundred times as many books and papers on conditionals as on disjunction. This is why possibilities are in the disjunction chapter of _The Connectives_.
- Objection 3: This is only relevant to fiction, and to trivial questions about fiction.
- First, it's not just trivial. Any hard question about a fiction should have a possibility that there is no fact of the matter, so some weight to a non-world possibility, so non-probabilistic credences.
- Second, it's not just fiction. It's anything where realism might fail.
- In low evidence situations, that might include *anything*. We might not be external world realists with no evidence.
- That gives us a response to White on dogmatism
- Objection 4. This doesn't explain the unreasonable effectiveness of probabilism
- Reply. Probabilism given realism. In many cases, realism is a safe assumption. Compare Priest on how classical logic is the right logic for situations known to be consistent. I say the same thing, except for me it's situations known to be complete.

## Is This Still Classical Logic? {#sec-classical}

- What is a logic?
- Option 1. A set of theorems. PF preserves the theorems
- Option 2. A set of axioms plus rules for generating theorems. Still good, we get the axioms and we get modus ponens.
- Option 3. A set of single-conclusion sequents. We get that, as shown in @sec-humberstone
- Option 4. A set of basic sequents (i.e., $\Gamma \vdash A$ whenever $A \in \Gamma$) plus rules for generating more. We get that too, as also shown. This distinguishes possibility semantics from supervaluationism. The supervaluationist does not get, e.g., conditional proof, as Williamson showed.
- Option 5. A set of multiple-conclusion sequents. We do not get that. Hence we don't get option 6; basic multiple conclusion sequents plus rules
- Include a pair of 3 by 2 tables, showing what possibility semantics preserves from classical logic, and what supervaluationism preserves, with one key difference
- But what to say about the last row, with multiple conclusions
- On the one hand, multiple conclusion logic is weird; cite Dummett, Wright, etc on how weird it is
- On the other hand, that's really what folks have commonly assumed. It's a common part of accuracy based arguments that one or other complete state is true. Inferring that from zero premises is a multiple-conclusion argument.
- So there is a sense in which this is a non-classical response to accuracy dominance. But I think it's a kind of non-classicality which we have reason to accept at least some of the time.

::: {.content-visible unless-format="html"}
## References {-}
:::
