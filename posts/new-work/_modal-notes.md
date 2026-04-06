# Appendix A: Modality

To include modal operators in the language, we add another parameter to the model: $\mathcal{R}$. $\mathcal{R}$ is a countable set of binary relations $R_i$ on $W$, each of which satisfies a condition @Holliday2025 calls **R-Win**.

**R-Win**
$xR_iy \leftrightarrow \forall y' \geqslant y \exists x' \geqslant x \forall x'' \geqslant x' \exists y'' \geqslant y': x''R_iy''$

Given this, we can add a familiar truth condition for $\Box_i$:

\begin{align*}
[\Box_i] \quad & \mathcal{M} \models_x \Box_i A \text{ iff } \forall y \, (x R_i y \Rightarrow \mathcal{M} \models_y A)
\end{align*}

In words, $\Box_i A$ is true at $x$ iff $A$ is true at every $R_i$-accessible possibility. Humberstone treats $\Diamond$ as a defined connective, $\Diamond_i A$ just means $\neg \Box_i \neg A$, and I'll do the same. It is easy to show that if each $R_i$ satisfies **R-Win**, then even after adding $\Box_i$ and $\Diamond_i$ to the language, all sentences will satisfy persistence and refinability.

**R-Win** has a number of consequences, the most important for our purposes being these two. (Both of these are discussed by Humberstone, though I'll use Holliday's more evocative names for them.)

**Up-R**:
:    If $x \leqslant x'$ and $x' R_i y$, then $x R_i y$.

**R-Down**:
:    If $x R_i y$ and $y \leqslant y'$, then $x R_i y'$.

In other words, if *a* can access *b*, any coarsening of *a* can access *b*, and *a* can access any refinement of *b*. The latter plays a crucial role in the discussion of epistemic modality in the text.

The principle **R-Win** is not immediately intuitive, and we might wonder why it should be imposed. One argument could be that it simply works; the model requires persistence and refinability, and this gets us persistence and refinability. This isn't particularly convincing for two reasons. One is that it feels rather ad hoc; like this is a puncture and **R-Win** is the patch. The other, as @Holliday2025 [$\sectionmark$2.30] demonstrates, you don't need anything this strong to get persistence and refinability. In particular, you don't need anything that entails **R-Down**.

A more convincing argument comes from thinking of possibilities as sets of possible worlds. Holliday develops a kind of model he calls the "powerset possibilization" of a familiar possible worlds model, where we assume that model has its own family of accessibility relations. In these models, every possibility just is a set of worlds, and the truths at the possibilities are those things true throughout the set. In these models, $xR_iy$ holds just in case $\forall w' \in y \exists w \in x: wRw'$. Given that definition of $R_i$, it is easy to prove that **R-Win** holds. If we do think possibilities are just sets of possible worlds, this seems like a very good reason to accept **R-Win**. But I'd rather have possibilities as more fundamental than possible worlds, and possibly do without the assumption that possibilities are maximally refinable.

The motivation for **R-Win** I prefer starts with the idea of possibilities as stories. Say a possibility $x$ is a finite set of propositions. These propositions will include modal operators, and we assume each such operator comes with an attached logic. Say $C(x)$ is the set of propositions entailed by the propositions in $x$. We're going to build a model where the truths at $x$ are the propositions in $C(x)$, and $y \geqslant x$ iff $C(y) \supseteq C(x)$. Say that $xR_iy$ iff whenever $\Box_i A_1 \vee \dots \vee \Box A_n \in C(x)$, then $A_1 \vee \dots \vee A_n \in C(y)$. It's common to build accessibility relations between sets of propositions like this using a version of this construction, but restricted to the case $n=1$; we need the more general version here because a disjunction can be in $C(x)$ without any disjunct being in $C(x)$. It takes some work to go through the details, but it turns out that this model satisfies all the constraints listed so far, including **R-Win**. The proof isn't important to the argument of this paper, and is left as an exercise for the interested reader. 

@Humberstone1981 adds a somewhat stronger condition than **R-Win**, but for reasons @Holliday2025 [Appendix B.1] goes over, this is too strong for what we need. This condition says that if $xR_iy$, then there is some successor $x'$ of $x$ such that every successor $x''$ of $x'$ can access $y$. This fails in some powerset possibilizations, and it fails in the model described in the previous paragraph, so it's hard to motivate it.

# Appendix B: Counterfactuals

It's a little trickier to add conditionals to the model.

We posit a selection function $f$ as in the semantics for counterfactuals suggested by @Stalnaker1968. We assume that the selection function follows the these constraints.

**Conditional Excluded Middle**
:   Either $f(A, x) = \emptyset$, or $\exists y: f(A, x) = \{z : z \geqslant y\}$.

**Truth**
:   $f(A, x) \subseteq A$

**Centering**
:   $x \in f(A, x)$ whenever $x \in A$

**Nearness**
:   If $f(A, x) \subseteq B$ and $f(B, x) \subseteq A$, then $f(A, x) = f(B, x)$

**Upf**
:    If $x \leqslant x'$ and $y \in f(A, x')$, then $y \in f(A, x)$

**fDown**
:    If $y \in f(A, x)$ and $y \leqslant y'$, then $y' \in f(A, x)$

**fRef+++**
:    If $y' \in f(A, x)$, then there exists $x' \geqslant x$ such that for all $z: z \in f(A, x')$ iff $z \geqslant y'$.

Then the truth condition for counterfactuals is:

\begin{align*}
[\boxright] \quad & \mathcal{M} \models_x A \boxright B \text{ iff } \forall y \in f(A, x) \, \mathcal{M} \models_y B 
\end{align*}

I'll say that $f(A, x)$ are the nearest $A$-worlds to $x$; it will become clear why this is a reasonable locution.


