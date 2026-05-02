Eleanor Rigby, we are told, picked up the rice in a church where a wedding had been. Have you ever thought about that wedding? Who were the happy couple? What were their names? Did they stay together for years, eventually bounce grandchildren on their knees? The song says enough to make it possible to raise these questions, but not to answer them.

_Eleanor Rigby_, the song, is special in many respects, but this is not one of them. Works of fiction typically raise questions they do not answer. Mostly these questions are not worth even trying to answer, though in some cases at least trying to answer them feels important to engaging with the fiction. (_Blade Runner_ is a famous example of this.) Still, even the silly questions can be philosophically interesting. For while it's not important what the answers to those questions are, it is somewhat important what an answer to the questions looks like.

What's true in a fiction is sometimes settled by the words of the song. In realistic fictions, others are settled by what would have to be true for the text to make sense. For instance, the married couple in _Eleanor Rigby_ (hereafter, The Couple) must have names. How else would Father McKenzie marry them? Some are settled by the context the fiction was produced in. _Eleanor Rigby_ was released in 1966, and it feels like it's set in the reasonably recent past, so the wedding takes place probably in the 1960s, or perhaps the late 1950s. It's not meant to take place too far away, so it's certainly set in the UK, and probably in England. Others are settled by facts about the world which are imported in. For instance, we know Rocky Raccoon lives in _South_ Dakota (at least while he lives) because he lives in the Black Hills, and these are actually in South Dakota. Relatedly, because all church marriages in the UK in the 1960s were heterosexual, The Couple must consist of The Husband and The Wife. Perhaps the intent of the author also affects what's true in the story, beyond the factors already mentioned; we'll leave that question to one side.

What we will focus on is whether these questions must have answers. Is there a fact about what The Husband's name is? A fairly orthodox theory, developed in most detail by David @Lewis1976b, says that there is not. Lewis's theory has three parts. First, sentences like (@HusbandVincent) and (@HusbandHasName), have an implicit operator in them.

(@HusbandVincent) The Husband's name is Vincent.
(@HusbandHasName) The Husband's has a name.

We should understand these as saying

(@HusbandVincentOp) In the fiction, The Husband's name is Vincent.
(@HusbandHasNameOp) In the fiction, The Husband's has a name.

Second, the logic of this operator is that of a box in a normal modal logic which is not _functional_ in the sense described by @Standefer2018. In particular, it does not include (@FunctAxiom) as an axiom.^[Standefer is interested primarily in the logic which also has $\Diamond \top$ as an axiom. The designation of these logics as 'functional' makes sense in a possible worlds framework, but is somewhat misleading in the possibility frame setting of this paper.]

(@FunctAxiom) $\Box \Phi \vee \Box \neg \Phi$

For Lewis, there are many worlds which have an equally good claim to be the world of the fiction, and something is only true in the fiction if it is true at all of them. So the English sentence (@HusbandNotVincent) is ambiguous between (@HusbandOpNotVincent) and (@HusbandNotOpVincent), with (@HusbandOpNotVincent) false and (@HusbandNotOpVincent) true. Because (@HusbandVincentOp) and (@HusbandOpNotVincent) are both false, (@FunctAxiom) fails.

(@HusbandNotVincent) The Husband's name is not Vincent.
(@HusbandOpNotVincent) In the fiction, The Husband's name is not Vincent.
(@HusbandNotOpVincent) It is not the case that in the fiction, The Husband's name is Vincent.

Third, Lewis thinks that this 'in the fiction' operator can be understood in terms of counterfactuals. Roughly, what's true in the fiction is what would be true were the text of the story told as known truth.

In this paper, I'll accept the first of Lewis's claims (that there is an operator), reject the second (that it has a non-functional logic), and mostly set aside the third. In 'Fictional Reality', [@BlumbergHolguin2025], Kyle Blumberg and Ben Holguìn run a series of arguments against this second assumption of Lewis's. I'll briefly mention a handful that I find most compelling.

For many questions that seem to be left open by a fiction, it makes sense to wonder about them. This can range from questions that are central to how one understands a fiction, like _Is Decker a replicant?_, to trivial questions like _Do The Couple have grandchildren?_. But on Lewis's picture, there isn't anything to wonder about. We know that it's not true that, in the fiction, that they have grandchildren, and it's also not true that, in the fiction, they do not have grandchildren. Intuitively, (@CoupleWhether) is true, but there isn't any sensible way to insert an _In the fiction_ operator that makes it true on Lewis's theory.

(@CoupleWhether) I don't know whether The Couple had grandchildren.

It isn't defective to wonder about this, in the way it is defective to wonder about things that are settled by the fiction.

(@CoupleWonder) I wonder whether The Couple had grandchildren.
(@HolmesWonder) #I wonder whether Sherlock Holmes met Napoleon.

For Lewis, once we know all there is to know about the fiction, all worlds are sorted into two buckets; those that are consistent with the fiction and those that are not. There is no way to make sense of relative likelihoods within those buckets. So we can't make sense of (@CoupleLikelyChildren), but it feels intuitively true.

(@CoupleLikelyChildren) The Couple might have had five grandchildren, and they might have had ten, but given the social norms at the time, and in the generation following, it's more likely they had five.

Blumberg and Holguìn infer from facts like these that there is a fact of the matter about any question raised by the fiction. As they note, this strikes many people as absurd. I'm one of those people, so I'd like to set out a theory in which there need not be any such facts, without falling into the traps besetting Lewis's theory.

One might wonder whether we need such detail on trivial questions like the future of The Couple. This concern is in part a function of my choosing a trivial question; many questions more natural questions about fictions have the same shape. Who hasn't wondered what becomes of the broken hearted? More generally, the logical and epistemological issues that this topic raises have implications far beyond fiction. Any time we can coherently wonder about something without being certain whether there is a fact of the matter, the same issues will arise. Our subject is nothing less than the epistemology of the not clearly factual.

We can have graded uncertainty about questions where we aren't sure there is a fact of the matter. This raises questions about the rational constraints on this uncertainty. There are several familiar arguments that all uncertainty should, ultimately, be probabilistic. I'll argue that these arguments rest on an assumption that all the questions we're uncertain about are (certainly) about matters of fact. When there might be no fact of the matter, it is rational for one's uncertainty to be represented not by a probability function, but by a Dempster-Shafer belief function. (This is the 'New Work' for these functions the title promised.)

This paper has a snake-like structure. In sections [1](#sec-sec1) and [5](#sec-sec5) I discuss _possibility frames_. This is a system, introduced by Lloyd @Humberstone1981 and recently discussed in detail by Wesley @Holliday2025, which lets us preserve something like classical logic while allowing that there might not be a fact of the matter about some questions. I'll introduce the theory in section [1](#sec-sec1), and return to the slightly vexed question of whether this is really _classical_ logic in section [5](#sec-sec5). In sections [2](#sec-sec2) and [4](#sec-sec4) I'll discuss Dempster-Shafer functions. In section [2](#sec-sec2) I'll set out what they are, and the standard arguments against using them. In section [4](#sec-sec4) I'll come back to why these arguments aren't compelling when the subject matter might be non-factual. In the middle, I'll come back to Blumberg and Holguìn's arguments about fiction, and defend the position already sketched, that while their objections to Lewis are successful, their proposed remedy is implausible and should be rejected.

# Possibility Frames {#sec-sec1}

A Humberstone possibility frame (hereafter, just _possibility frame_) is a triple $\langle W, \leqslant, \mathbb{R}, f, V\rangle$, where $W$ is a set of possibilities, $\leqslant$ is a _refinement_ relation on them, $\mathbb{R}$ is a countable family of accesibility relations (with $R_i$ as the $i$'the member), and $V$ is a valuation function.^[One might expand frames even further, e.g., by adding a selection function that enters into the semantics for counterfactuals. Counterfactuals will be sitting just under the surface at many points in this paper, but to keep things focussed I'll defer discussion of counterfactuals to another day.] 

One way to think about the possibilities in $W$, suggested by @Humberstone1981 and used extensively by Wesley @Holliday2025, is that they are sets of possible worlds. I prefer to think of them as _stories_, at least on the assumption that stories are incomplete. A possibility, like a story, is something which settles some facts, while possibly leaving others open.

Following Humberstone, I'll write $x \leqslant y$ to mean that $y$ is a **refinement** of $x$.^[$y \geqslant x$ will just mean the same thing as $x \leqslant y$.] To say $y$ refines $x$ is to say that $y$ makes true everything that $x$ makes true, and possibly some more things besides. If possibilities are sets of possible worlds, then $y$ is a subset of $x$. (This makes the notation here confusing, which is why @Holliday2025 prefers to write $y \sqsubseteq x$ when $y$ is a refinement of $x$.) If possibilities are stories, then $y$ is a refinement of $x$ if $y$ fills in part of what $x$ leaves open. This is how I'll, intuitively, think of refinements.

$V$ is a **valuation** function. It tells us where the atomics are true. Formally, it is a function from $\mathcal{P}$, the set of atomics, to $\wp(W)$, , satisfying these two constraints:

- For all $x$, if $x \in V(p)$ and $x \leqslant y$, then $y \in V(p)$. Intuitively, truth for atomics is **persistent** across refinements.
- For all $x$, if $\forall y \geqslant x\;\, \exists z \geqslant y: z \in V(p)$, then $x \in V(p)$. This is what @Humberstone2011 [900] calls **refinability**. It means that $p$ only fails to be true at $x$ if there is some refinement of $x$ where it is settled as being untrue.

That's enough to provide a theory of truth for the language of propositional logic, and Humberstone proposes the following clauses.

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

Third, if we define validity on possibility frames, written as $\vDash_{pf}$, as truth preservation, then we get a very classical theory. It's not just that, within this language, $\vdash_{CL}$ and $\vDash_{pf}$ exactly overlap. It's also that, in any expanded language, as long as persistence and refinability hold, the introduction and elimination rules for $\vdash_{CL}$ also hold for $\vDash_{pf}$.

It's useful to work through one of these rules to show how the system works. Because it will play a role in what follows, I'll show that disjunction elimination holds for $\vDash_{pf}. One natural formulation^[There are other formulations which make weaker structural assumptions, but this one will do to show that we're preserving classical logic.] of disjunction elimination says that $\Gamma \cup \{A\} \vdash_{CL} C$, $\Delta \cup \{B\} \vdash_{CL} C$, and $\Phi \vdash_{CL} A \vee B$ together imply $\Gamma \cup \Delta \cup Phi \vdash_{CL} C$. Let's show that the same principle holds for $\vDash_{pf}$.

Assume that $\Gamma \cup \{A\} \vDash_{pf} C$, $\Delta \cup \{B\} \vDash_{pf} C$, and $\Phi \vDash_{pf} A \vee B$, and assume for reduction that for some possibility $x$ where all members of $\Gamma \cup \Delta \cup \Phi$ are true,  $\mathcal{M} \nmodels_x C$. By refinability, there is some $y \geqslant x$ such that $\mathcal{M} \models_y \neg C$, i.e., for all $z \geqslant y$, $\mathcal{M} \nmodels_z C$. By persistence, all members of $\Gamma \cup \Delta \cup \Phi$ are true at $y$. Since all of $\Phi$ is true at $y$, we have $\mathcal{M} \models_y A \vee B$. By $[\vee]$, there is some $z \geqslant y$ such that $\mathcal{M} \models_z A$ or $\mathcal{M} \models_z B$. By persistence again, all members of $\Gamma \cup \Delta$ are true at $z$. If $\mathcal{M} \models_z A$, then all of $\Gamma \cup \{A\}$ are true at $z$, so $\mathcal{M} \models_z C$. If $\mathcal{M} \models_z B$, then all of $\Delta \cup \{B\}$ is true at $z$, so $\mathcal{M} \models_z C$. Either way, $\mathcal{M} \models_z C$. But $z \geqslant y$ and $\mathcal{M} \models_y \neg C$, so $\mathcal{M} \nmodels_z C$. Contradiction.

Humberstone's system looks non-classical. It includes points that make true neither $A$ nor $\neg A$ for some $A$. It includes a rule for negation that looks more like intuitionistic negation than classical negation. But looks are misleading; the system is still classical. All the sequents, and all the admissible rules on sequents, carry over from classical logic. We have a non-standard semantics for a very standard logic. 

Possibility frames have attracted some attention recently as an interesting classical alternative to possible worlds semantics. Wesley @Holliday2025 studied the use of possibility frames in modal logic, differing from Humberstone about what the relationship between $\leq$ and $\mathbb{R}$ should be; we'll have more to say about this presently. Matthew @HarrisonTrainor2019 has shown how to extent the semantics to first-order logic. Brian @WeathersonHoPF applies possibility frame semantics to a puzzle about counterfactuals. And Fabrizio @CarianiUnpub uses possibility frames to model the open future. This paper extends that list; I'm going to use them to provide a better way of talking about fictional truth.

Since we need modal operators, we need to say more about $\mathbb{R}$. First we'll talk about modals. We start a familiar truth condition for $\Box_i$:

\begin{align*}
[\Box_i] \quad & \mathcal{M} \models_x \Box_i A \text{ iff } \forall y \, (x R_i y \Rightarrow \mathcal{M} \models_y A)
\end{align*}

In words, $\Box_i A$ is true at $x$ iff $A$ is true at every $R_i$-accessible possibility. Humberstone treats $\Diamond$ as a defined connective, $\Diamond_i A$ just means $\neg \Box_i \neg A$, and I'll do the same. 

That alone isn't enough to guarantee that boxed sentences are persistent and refinable. There are a few ways to constrain how $\mathbb{R}$ and $\leq$ relate to get that guarantee; I'll use one suggested by Holliday. He calls this constraint **R-Win**.

**R-Win**
:    $xR_iy \leftrightarrow \forall y' \geqslant y \exists x' \geqslant x \forall x'' \geqslant x' \exists y'' \geqslant y': x''R_iy''$

It is easy to show that if each $R_i$ satisfies **R-Win**, then even after adding $\Box_i$ and $\Diamond_i$ to the language, all sentences will satisfy persistence and refinability. **R-Win** has several consequences; the one that will be most important here is that each $R_i$ is carried downwards along refinement. That is, if $x R_i y$ and $y \leqslant y'$, then $x R_i y'$. More colloquially, if *a* can access *b*, *a* can access any refinement of *b*. This will be important when we get to epistemic modality.

@Holliday2025 [\sectionmark 6.3] notes that one upside of adding **R-Win** is that it means we get back _some_ familiar results from the traditional possible worlds semantics for modal logic. A possibility frame validates $\Box_i \Phi \rightarrow \Phi$ iff $R_i$ is reflexive; it validates \Box_i \Phi \rightarrow \Box_i_ \Box_i_ \Phi$ iff $R_i$ is transitive. What's more important here, and what Holliday also notes, is that we don't get the same parallel for all axioms. 

In possible world semantics, the frame condition for $\Box_i \Phi \vee \Box_i \neg \Phi$, or equivalently, $\Diamond_i \Phi \rightarrow \Box_i \Phi$, is that each point accesses at most one point. That is, $\forall x, y, z ((xRy \wedge xRz) \rightarrow y = z$. But in a possibility frame semantics, @Holliday2025 [229] shows that what it takes to validate $\Diamond_i \Phi \rightarrow \Box_i \Phi$ is (@FunctionalConstraint):

@Holliday2025 [\sectionmark 6.3]

(@FunctionalConstraint) $\forall x, y (xR_iy \rightarrow \exists x^\prime \geq x \forall z (x^\prime \geq z \rightarrow \exists x^{\prime\prime} (x^{\prime\prime} \geq y \wedge x^{\prime\prime} \geq z))


```{tikz}
#| label: fig-frame
#| fig-cap: "Possibility frame with refinement and accessibility relations"
#| fig-align: center
#| fig-ext: svg
#| additional-preamble: |
#|   \usetikzlibrary{arrows.meta, positioning, calc}

\begin{tikzpicture}[
    >={Stealth[length=2mm]},
    node distance=2cm,
    poss/.style={circle, draw, inner sep=1.5pt, minimum size=6mm, font=\small},
    Rarrow/.style={->, thick},
    refine/.style={dashed, thick, -}, % refinement edges (no arrowhead)
]

% x-possibilities on the left
\node[poss] (x1) at (0, 2.5) {$x_1$};
\node[poss] (x2) at (-1.2, 0) {$x_2$};
\node[poss] (x3) at (1.2, 0) {$x_3$};

% y-possibilities on the right
\node[poss] (y1) at (6, 2.5) {$y_1$};
\node[poss, label=right:{\small $p$}] (y2) at (4.8, 0) {$y_2$};
\node[poss] (y3) at (7.2, 0) {$y_3$};

% Refinement relations (dashed, no arrowheads)
\draw[refine] (x1) -- (x2);
\draw[refine] (x1) -- (x3);
\draw[refine] (y1) -- (y2);
\draw[refine] (y1) -- (y3);

% R-relations (solid arrows)
\draw[Rarrow] (x1) -- (y1);
\draw[Rarrow] (x1) to[bend left=10] (y2);
\draw[Rarrow] (x1) to[bend left=20] (y3);
\draw[Rarrow] (x2) -- (y2);
\draw[Rarrow] (x3) -- (y3);

% Legend
\node[anchor=west, font=\small] at (-1.5, -1.8) {%
    \begin{tikzpicture}[baseline]
        \draw[Rarrow] (0,0.4) -- (0.6,0.4); \node[anchor=west] at (0.7,0.4) {$R$};
        \draw[refine] (2,0.4) -- (2.6,0.4); \node[anchor=west] at (2.7,0.4) {$\geq$};
    \end{tikzpicture}};

\end{tikzpicture}
```


----







The principle **R-Win** is not immediately intuitive, and we might wonder why it should be imposed. One argument could be that it simply works; the model requires persistence and refinability, and this gets us persistence and refinability. This isn't particularly convincing for two reasons. One is that it feels rather ad hoc; like this is a puncture and **R-Win** is the patch. The other, as @Holliday2025 [$\sectionmark$2.30] demonstrates, you don't need anything this strong to get persistence and refinability. In particular, you don't need anything that entails **R-Down**.

A more convincing argument comes from thinking of possibilities as sets of possible worlds. Holliday develops a kind of model he calls the "powerset possibilization" of a familiar possible worlds model, where we assume that model has its own family of accessibility relations. In these models, every possibility just is a set of worlds, and the truths at the possibilities are those things true throughout the set. In these models, $xR_iy$ holds just in case $\forall w' \in y \exists w \in x: wRw'$. Given that definition of $R_i$, it is easy to prove that **R-Win** holds. If we do think possibilities are just sets of possible worlds, this seems like a very good reason to accept **R-Win**. But I'd rather have possibilities as more fundamental than possible worlds, and possibly do without the assumption that possibilities are maximally refinable.

The motivation for **R-Win** I prefer starts with the idea of possibilities as stories. Say a possibility $x$ is a finite set of propositions. These propositions will include modal operators, and we assume each such operator comes with an attached logic. Say $C(x)$ is the set of propositions entailed by the propositions in $x$. We're going to build a model where the truths at $x$ are the propositions in $C(x)$, and $y \geqslant x$ iff $C(y) \supseteq C(x)$. Say that $xR_iy$ iff whenever $\Box_i A_1 \vee \dots \vee \Box A_n \in C(x)$, then $A_1 \vee \dots \vee A_n \in C(y)$. It's common to build accessibility relations between sets of propositions like this using a version of this construction, but restricted to the case $n=1$; we need the more general version here because a disjunction can be in $C(x)$ without any disjunct being in $C(x)$. It takes some work to go through the details, but it turns out that this model satisfies all the constraints listed so far, including **R-Win**. The proof isn't important to the argument of this paper, and is left as an exercise for the interested reader. 

@Humberstone1981 adds a somewhat stronger condition than **R-Win**, but for reasons @Holliday2025 [Appendix B.1] goes over, this is too strong for what we need. This condition says that if $xR_iy$, then there is some successor $x'$ of $x$ such that every successor $x''$ of $x'$ can access $y$. This fails in some powerset possibilizations, and it fails in the model described in the previous paragraph, so it's hard to motivate it.
------




In order to make sure persistence and refinability hold in the modal part of the language, we need constraints on $\mathbb{R}$. Holliday recommends the following constraint.
(As noted above, Holliday prefers weaker constraints, but the difference won't be important here.) Any accessibility relation $R_i$ has to satisfy these constraints.^[The names are taken from Holliday; Humberstone uses less descriptive names. The ++ in **RRef++ is because Holliday considers two weaker refinement conditions.]

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

**Conditional Excluded Middle** says that there are no nearest $A$-worlds, or they are all and only the refinements of some particular possibility. It plays a central role in the proof that CEM, $(A \boxright B) \vee (A \boxright \neg B)$ is true at all points.  Given that regular excluded middle holds everywhere, to prove this it suffices to prove that if $\neg(A \boxright B)$ is true at $x$, so is $A \boxright \neg B$. So assume that $\neg(A \boxright B)$ is true at $x$. If $f(A, x)$ is empty, it follows trivially that $A \boxright \neg B$ holds. Assume that's not the case, so $f(A, x)$ is non-empty. For $A \boxright \neg B$ to fail to hold at $x$, $B$ must be true at some point in $f(A, x)$. Call some such point $y'$. By **fRef+++**, there is some $x' \geqslant x$ such that $f(A, x')$ consists of all and only refinements of $y'$. Since $B$ is true at $y'$, and is persistent, it follows that $B$ is true everywhere in $f(A, x')$. Hence $A \boxright B$ is true at $x'$, contradicting the assumption that $\neg(A \boxright B)$ is true at its coarsening, $x$.

The other principles are more straightforward. **Truth** says that the nearest $A$-worlds have to actually make $A$ true. **Centering** says that if $A$ is true at $x$, then $x$ is one of the nearest $A$-worlds. This system doesn't quite have Strong Centering, since there could be other nearby $A$-worlds, but it is close. The nearest $A$-worlds to an $A$-world can only be coarsenings or refinements of it. **Nearness** says that if the nearest $A$-worlds are all $B$-worlds, and the nearest $B$-worlds are all $A$-worlds, then the nearest $A$-worlds just are the nearest $B$-worlds. That has to be true if $f$ is really measuring nearness. The last three clauses ensure that if we define $R_A$ such that $xR_Ay$ iff $y \in f(A, x)$, then $R_A$ is an acceptable accessibility relation. This in turn guarantees that the language is still persistent and refinable, even with $\boxright$ added. Though note that **fRef+++** is stronger than we need for merely that purpose; the stronger rule is needed for the proof of CEM.^[The name follows Holliday's convention, though he was more interested in weakening Humberstone's original refinement condition.]
