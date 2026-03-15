---
title: "New Work for Dempster-Shafer Functions"
abstract: |
 TBD
date: March 15 2026
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

How many cousins does Sherlock Holmes have? Does he have an odd or even number of cousins? If you're like me, untutored intuition says that (@holmesdisj) is true, while there is no fact of the matter about (@holmesodd) and (@holmeseven).

(@holmesdisj) Holmes has either an odd or even number of cousins.
(@holmesodd) Holmes has an odd number of cousins.
(@holmeseven) Holmes has an even number of cousins.

Intuition isn't the most reliable guide around here, and there are well known complications with trying to validate all these intuitions. Nevertheless, I'll argue these intuitions are correct. At least, I'll argue that the latter intuition is correct; for this paper I'll simply assume that (@holmesdisj) is true, and argue that there is no fact of the matter about (@holmesodd) and (@holmeseven).

In doing so, I'll be arguing against the orthodox view represented by David @Lewis1978b. His view is that sentences like (@holmesodd) and (@holmeseven) have an implicit operator, roughly _In the Holmes fiction_, and this operator is a normal necessity operator.^[Lewis's account of that operator uses counterfactual conditionals, but on the account of counterfactuals he endorses [@Lewis1973a], _If it were that A_ is a normal necessity operator, so we get back what I said in the text.] So just like $\Box (A \vee B)$ can be true while $\Box A$ and $\Box B$ are both false, Lewis says that (@holmesdisj) can be true while (@holmesodd) and (@holmeseven) are both false.

Recently, Kyle Blumberg and Ben Holguín [-@BlumbergHolguin2025] have argued that Lewis's account has implausible predictions about fictional claims embedded in attitude ascriptions. For instance, it implies that (@holmesknow) is true.

(@holmesknow) I know whether Holmes has either an odd or even number of cousins.

They argue that Lewis's view should be reject in favour of a 'realist' alternative. On their view, the Holmes stories pick out a particular possible world, though it is unknowable which one. So one of (@holmesodd) and (@holmeseven) is true. I'll argue against that, and in favour of anti-realism about fictions. As I said, I'll argue that there's no fact of the matter about how many cousins Holmes has.

What does it even mean to say there is 'no fact of the matter', and is this even coherent? I'll answer these questions by appeal to _possibility semantics_, as developed by Lloyd @Humberstone1981. In possibility semantics, the role of possible worlds is played by _possibilities_, which can be incomplete. Despite this incompleteness, the logic of truth preservation across possibilities is more or less classical.

I'm going to argue that a story does not pick out a possible world, but instead a Humberstone-style possibility. Which one does a particular story pick out? It's coherent to be unsure about that. Even with the text in front of them, a reader might not know the extra-textual information that settles some facts in the story. In such a situation, their credences about what's true in a story might be distributed across various posisbilities.

At this point we (at last) get to the Dempster-Shafer belief functions promised in the title. Measures on possibility frames do not always determine probability functions; rather, they might determine Dempster-Shafer belief functions. So, I'll conclude, it is rational for someone uncertain about what is true in a story to have credences that track one of these belief functions.

This conclusion might seem surprising. There is a famous argument, originally due to James @Joyce1998, that any non-probabilistic credence function is accuracy dominated. This argument seems to rule out exactly the view I put forward in the last paragraph. That argument, however, assumes exactly the kind of realism that is implausible in the case of thoughts about fiction. Someone who rejects fictional realism can happily use Dempster-Shafer belief functions without worrying about being excessively inaccurate.

Indeed, this last point generalises to any case where realism isn't clearly true. I'll suggest this opens up a response on behalf of the dogmatist to an important objection to dogmatism due to Roger @White2006. (What I say here builds on what James @Pryor2007 says in an unpublished but widely discussed note.)

So this paper lives at the intersection of possibility semantics, accuracy dominance arguments for probabilism, and theories of truth in fiction. The paper will work its way forward along this list of topics then back again. So @sec-humberstone and @sec-classical discuss possibility semantics. I'll start by setting out the details of them possibility semantics, and end by discussing the question, which will have become somewhat pressing by then, of whether the theory is really _classical_. @sec-joyce and @sec-realism will discuss accuracy dominance arguments, first discussing why accuracy dominance arguments are so important, and then coming back to why the anti-realist can reject them. And in the middle, in @sec-fiction, I'll endorse Blumberg and Holguìn's objections to Lewis's theory of truth in fiction, while rejecting their alternative in favour of an anti-realist model.

## Possibility Semantics {#sec-humberstone}

A Humberstone possibility frame (hereafter, just _possibility frame_) is a triple $\langle W, \leqslant, V\rangle$, where $W$ is a set of possibilities, $\leqslant$ is a _refinement_ relation on them, and $V$ is a valuation function. 

Formally, possibilities are anything that can play the possibility role, but to picture these models it helps to have a more filled in picture of them. Humberstone both suggests that we start by thinking of them as sets of possible worlds, and that we shouldn't always think of them this way, because they should replace possible worlds. So I'll think of them, somewhat tendentiously in light of what's to come, as _stories_. A possibility, like a story, is something which settles some facts, while possibly leaving others open.

Following Humberstone, I'll write $x \leqslant y$ to mean that $y$ is a **refinement** of $x$.^[$y \geqslant x$ will just mean the same thing as $x \leqslant y$.] To say $y$ refines $x$ is to say that $y$ makes true everything that $x$ makes true, and possibly some more things besides. If possibilities are sets of possible worlds, then $y$ is a subset of $x$. (This makes the notation confusing, which is why @Holliday2025 prefers to write $y \sqsubseteq x$ when $y$ is a refinement of $x$.) If possibilities are stories, then $y$ is a refinement of $x$ if $y$ fills in part of what $x$ leaves open. This is how I'll, intuitively, think of refinements.

Finally, $V$ is a **valuation** function. It tells us where the atomics are true. Formally, it is a function from $\mathcal{P}$, the set of atomics, to $\wp(W)$, , satisfying these two constraints:

- For all $x$, if $x \in V(p)$ and $x \leqslant y$, then $y \in V(p)$. Intuitively, truth for atomics is **persistent** across refinements.
- For all $x$, if $\forall y \geqslant x\;\, \exists z \geqslant y: z \in V(p)$, then $x \in V(p)$. This is what @Humberstone2011 [900] calls **refinability**. It means that $p$ only fails to be true at $x$ if there is some refinement of $x$ where it is settled as being untrue.

Humberstone then proposes the the following theory of truth at a possibility. (We'll treat $\rightarrow$ as a defined connective, with $A \rightarrow B =_{df} \neg A \vee B$.)

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

It's useful to work through a couple of these. First, the negation introduction rule. One natural formulation of this is that if $\Gamma \cup \{A\} \vdash_{CL} B$ and $\Gamma \cup \{A\} \vdash_{CL} \neg B$, then $\Gamma \vdash_{CL} \neg A$. Let's show that the same principle holds for $\vDash_{pf}$.

Take any model $\mathcal{M}$ and any possibility $x$ where all members of $\Gamma$ are true. We need to show $\mathcal{M} \models_x \neg A$, i.e., that for all $y \geqslant x$, $\mathcal{M} \nmodels_y A$. Suppose for reductio that for some $y \geqslant x$, $\mathcal{M} \models_y A$. Since all members of $\Gamma$ are true at $x$, and truth is persistent, all members of $\Gamma$ are true at $y$. So every member of $\Gamma \cup \{A\}$ is true at $y$. By our two assumptions, $\mathcal{M} \models_y B$ and $\mathcal{M} \models_y \neg B$. But $\mathcal{M} \models_y \neg B$ means that for all $z \geqslant y$, $\mathcal{M} \nmodels_z B$. Taking $z = y$ (since $\leqslant$ is reflexive), we get $\mathcal{M} \nmodels_y B$. Contradiction.

Second, the rule for conditional introduction. This says that if $\Gamma \cup \{A\} \vdash_{CL} B$ then $\Gamma \vdash_{CL} A \rightarrow B$. As @Williamson1994 shows, the counterpart of this principle does not hold in supervaluational logic. But it does hold in possibility frames.

Since $A \rightarrow B$ is defined as $\neg(A \wedge \neg B)$, we need to show that at any possibility $x$ where all of $\Gamma$ is true, $\mathcal{M} \models_x \neg(A \wedge \neg B)$. By the clause for negation, this requires showing that for all $y \geqslant x$, $\mathcal{M} \nmodels_y A \wedge \neg B$. Suppose for reductio that for some $y \geqslant x$, $\mathcal{M} \models_y A \wedge \neg B$. By the clause for conjunction, $\mathcal{M} \models_y A$ and $\mathcal{M} \models_y \neg B$. By persistence, all members of $\Gamma$ are true at $y$. So all members of $\Gamma \cup \{A\}$ are true at $y$, and hence by assumption, $\mathcal{M} \models_y B$. But $\mathcal{M} \models_y \neg B$ means that for all $z \geqslant y$, $\mathcal{M} \nmodels_z B$. Taking $z = y$, we get $\mathcal{M} \nmodels_y B$. Contradiction.

## Accuracy Dominance {#sec-joyce}

## Fictional Anti-Realism {#sec-fiction}

## Accuracy for Anti-Realists {#sec-realism}

## Is This Still Classical Logic {#sec-classical}

Test

::: {.content-visible unless-format="html"}
## References {-}
:::
