Let me also read the section on modal operators and RDown.Good questions — these are closely connected to each other in a nice way. Let me work through them.

**On question 1: Revising CEM**

You're right, and the reason is sharper than just "spirit." If you want the conditional to behave like a proper modal operator on the frame, then for each proposition $A$, the selection function induces an accessibility relation $R_A$ where $xR_Ay$ iff $y \in f(A, x)$. That relation needs to satisfy **RDown**: if $y \in f(A, x)$ and $y \leqslant y'$, then $y' \in f(A, x)$. In other words, $f(A, x)$ must be upward-closed under refinement.

But notice what happens if you combine $|f(A, x)| \leq 1$ with upward closure. The only way a singleton set can be upward-closed is if its one element has no proper refinements — i.e., it's a world. So the current CEM forces the selection function to pick out maximally refined possibilities, which completely undermines the point of working with possibilities. The whole resolution of Goodman's puzzle about the two spheres depends on the nearest possibility being *incomplete*.

Your proposed replacement is exactly right. State CEM as: either $f(A, x) = \emptyset$ or there exists a unique $y$ such that $f(A, x) = \{z : z \geqslant y\}$. Your biconditional formulation $\exists y: (z \in f(A, x) \leftrightarrow z \geqslant y)$ captures the non-empty case. You might want to state it as a disjunction to handle vacuous truth explicitly, something like:

> **CEM** (revised): Either $f(A, x) = \emptyset$, or $\exists y: f(A, x) = \{z : z \geqslant y\}$.

An equivalent way to put it, once you already have RDown in place (which gives upward closure for free): $f(A, x)$ has at most one $\leqslant$-minimal element. That's clean and makes the structural point perspicuous — CEM says the selection picks out a single "root" possibility, and RDown fills in everything above it.

Note that this revised CEM still does the work you need. For any sentence $B$ in the language (which satisfies persistence and refinability), $f(A, x) \subseteq \llbracket B \rrbracket$ iff $B$ is true at the generating element $y$. So truth conditions for the conditional don't change from what you'd expect on a Stalnaker-style picture — it's just that the *structure* of the selection function now respects the frame.

**On question 2: Persistence and refinability for $\boxright$**

The conditions you need are exactly the analogues of Humberstone's three constraints on accessibility relations, applied to the selection function. For each proposition $A$, think of $f(A, \cdot)$ as defining an accessibility relation, and require:

**UpR for $f$**: If $x \leqslant x'$ and $y \in f(A, x')$, then $y \in f(A, x)$.

This is equivalent to what you suggested (just rewriting $v$ for $x$ and $x$ for $x'$): if $y \in f(A, x)$ and $v \leqslant x$, then $y \in f(A, v)$. Intuitively, refining the base point can only *shrink* the selection set. This gives you **persistence** directly: if $f(A, x) \subseteq \llbracket B \rrbracket$ and $x \leqslant x'$, then $f(A, x') \subseteq f(A, x) \subseteq \llbracket B \rrbracket$.

**RDown for $f$**: If $y \in f(A, x)$ and $y \leqslant y'$, then $y' \in f(A, x)$.

This is the upward-closure condition from question 1. It's needed for the same reason it's needed for $\Box$ — it ensures the target side of the accessibility relation is well-behaved.

**RRef++ for $f$**: If $y \in f(A, x)$, then there exists $x' \geqslant x$ such that for all $x'' \geqslant x'$, $y \in f(A, x'')$.

This is what you need for **refinability**. Here's the verification: suppose $A \boxright B$ fails at $x$. Then some $y \in f(A, x)$ has $B$ failing at $y$. By refinability of $B$, there's some $y^* \geqslant y$ where $\neg B$ is true (so $B$ fails at $y^*$ and all its refinements). By RDown for $f$, $y^* \in f(A, x)$. By RRef++ for $f$, there exists $x' \geqslant x$ such that for all $x'' \geqslant x'$, $y^* \in f(A, x'')$. Since $B$ fails at $y^*$, we have $f(A, x'') \not\subseteq \llbracket B \rrbracket$ for all such $x''$, so $A \boxright B$ fails at all refinements of $x'$. That's exactly refinability for $\boxright$.

So the three conditions together — UpR, RDown, RRef++ — are sufficient. And by the same "canonical model" style argument you give in the Modal Constraints section for $\Box$, they're also what you'd derive if you took the conditional truths as given and asked what $f$ must look like. So the justification runs in parallel to what you already have for the modal operators.