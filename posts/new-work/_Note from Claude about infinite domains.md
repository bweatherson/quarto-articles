Note from Claude about infinite domains


-----
Both added, no key collisions:

Kelley2023 — Philosophy of Science 90(1), 2023, 92–128, 10.1017/psa.2021.37; preprint at arXiv:2007.14490
Pruss2022 — Synthese 200(6), 2022, art. 444, 10.1007/s11229-022-03938-x; preprint at PhilSci-Archive 21251

Both have free preprints, so the footnote can point somewhere readable.

For what you actually want the footnote to say: these two don't just extend the finite results, they complicate them, which makes the scoping decision easier to justify. Kelley proves coherence remains necessary to avoid accuracy dominance in the countably infinite case, but finds that coherent credence functions on infinite sets can themselves be dominated — so sufficiency fails, and the biconditional you're relying on breaks. Pruss is starker: in a range of natural infinite finitely additive settings there are no strictly proper scoring rules at all, so the argument has no premises to run on. Countable additivity restores strictly proper continuous rules, but he says they support Bayesian updating without vindicating probabilism.

So the honest footnote isn't "the infinite case is left for future work" but something closer to: the equivalence between non-domination and membership in the convex hull is a finite-domain result, and in infinite domains it is known to fail in both directions for identifiable reasons — cite Kelley for the failure of sufficiency and Pruss for the non-existence of strictly proper rules. That turns a limitation into a reason, and it's a reason your non-atomic models would inherit rather than escape.

-----

From Claude about Williams's papers

----

Both PDFs extract as scrambled text (broken font encoding). Let me check whether it's a recoverable substitution.Recoverable — it's a monotonic substitution (`a` is byte 0x1C). Building the map from the known abstract as crib.This decoded cleanly and the RSL §7 material is directly on point. Let me pull the other key sections.That settles it, and it reverses what I told you. **RSL is the paper**, and my earlier ranking was wrong in both directions.

(The PDFs extract as scrambled text — broken font encoding — so I reconstructed the substitution and decoded them. Quotes below are from that decode, so treat exact wording as approximate.)

**RSL §5 states your result, in your words.** Let $\mathcal{C}$ be the "perfect match" credence functions — one per truth-value distribution, assigning each proposition its truth value there — and $\mathcal{C}^+$ their weighted averages. Then:

> For any $b \in \mathcal{B} - \mathcal{C}^+$, there is some $c \in \mathcal{C}^+$, such that for every $w \in \mathcal{C}$, $I(b,w) > I(c,w)$.

And §6 gives the generality clause explicitly:

> That $\mathcal{C}^+$ is the convex closure of $\mathcal{C}$ is crucial to the proof, but no assumptions are necessary about which points are or aren't included in $\mathcal{C}$… Begin with $\mathcal{C}$ any kind of 'truth-value distributions' you like — degree theoretic, supervaluational, gappy, whatever.

That's "in any structure, the undominated credences are the mixtures of the possibly perfectly accurate ones," almost verbatim.

**RSL §7 has the DS axiomatisation too**, so my "JPL for the theorem, RSL for the axioms" split was simply false — RSL has both. He writes that the gap-supervaluational case is "the one case the pattern breaks down," that it's covered by Paris's theorem drawing on Shafer (1976) and Jaffray (1989), and that "convex combinations of such truth values are exactly the Dempster-Shafer belief functions," with axioms: $\vDash A \Rightarrow b(A)=1$; $A \vDash\ \Rightarrow b(A)=0$; $A \vDash B \Rightarrow b(A) \le b(B)$; plus monotonicity of all orders.

**And §7 makes your $D$ point, citing Williamson ch. 5.** He notes that adding a determinately operator "introduces non-classical behaviour into the 'no drop' gap supervaluational logic," gives $v \wedge \neg Dv \vDash$ / $\nvDash \neg(v \wedge \neg Dv)$ as a failure of reductio, and concludes that axiomatisations "over a set of propositions that don't include determinately operators may fail when we take them into account." So the $D$-free restriction isn't only your route around Williamson on or-elimination — it's a precondition for the DS characterisation itself.

**The opening this leaves you is precise.** Immediately before that, he writes:

> These later results are proved for specific languages rather than whole classes of languages. We do not have a guarantee that adding expressive resources preserves the result. For the gap-supervaluational settings, this is absolutely crucial.

You add $\Box_{ER}$. That is exactly an added expressive resource with no guarantee, and Williams flags the gap rather than closing it. Showing the DS characterisation survives the modal extension under **R-Win** is a well-posed question he leaves open — a better statement of your contribution than anything about DS functions generally.

**One thing to check before you rely on any of this.** The JPL paper states the Paris/Shafer/Jaffray theorem with three conditions (p. 2): truth values in $\{1,0\}$; consequence as 1-preservation; and constraints on the distributions which, as I read the decode, include $V(A)=0 \wedge V(B)=0 \Leftrightarrow V(A \vee B)=0$ as a *biconditional*. Your $[\vee]$ clause violates the left-to-right direction — at $x_1$ neither $\Box p$ nor $\neg\Box p$ is true while the disjunction is. If that really is a biconditional the theorem doesn't apply to your frames as stated. I suspect I'm misreading a $\Rightarrow$ as a $\Leftrightarrow$, since supervaluationism has the same feature and Williams says it's covered — but it's on p. 2 of the JPL paper and your whole DS route runs through it, so check the arrow yourself.

**What JPL is still for**: the Dutch Book side and the geometry — that every accuracy-domination point induces a Dutch Book but not conversely without scaling, §6's demonstration that the full converse fails, and the appendix on updating DS belief functions, which is where to look if you ever want dynamics.

I have both papers decoded to readable text if that's useful to you.