# Pretest v3-B (independent predictability test)

**Phase 1 was written having read only `question-brief-v3.md`. No other file in the folder, no web search.**

---

## PHASE 1

### (a) The natural papers

**N1. "Humean chance is certifiable; primitive chance is not."** (Most likely: ~70% that a competent philosopher who knows both literatures writes this first.)
Thesis: The manipulation theorems need the paradigm Λ to be closed under mixing (Al-Najjar–Weinstein reducibility; O&S 2009 Prop. 1). Lewis's undermining is exactly the fact that a chance law gives positive probability to histories whose best system is another law; a *mixture* ∫P dμ of best systems is almost never the best system of a history it makes probable, so Humean paradigms are not mixture-closed, Pomatto's separation condition holds, and the LR test certifies the Humean expert. A primitivist admits history-dependent propensities (Pólya urn), and every P ∈ Δ(Ω) factors into one-step conditionals, so the primitivist paradigm is all of Δ(Ω), convex, manipulable. Metaphysics matters a lot.

**N2. The deflationary reply: "Only the paradigm matters, and metaphysics does not fix the paradigm."** (~60%, often as section 2 of N1 or as a reply.)
Thesis: Pomatto's theorem is interpretation-free. The paradigm is *the tester's knowledge* ("summary of preexisting knowledge"); a primitivist tester who knows the set-up is a coin uses the iid class and certifies; a Humean tester who does not know whether the world is iid or Markov faces a huge range(f) whose separation properties nobody has established. The Humean/primitivist contrast is really an identifiable/non-identifiable contrast, a familiar statistical distinction (mutual singularity; Kavaler–Smorodinsky's pairwise singularity; Doob consistency) available to both camps.

**N3. "The big bad bug is a certifiability result."** (~45%.)
Thesis: the undermining probability δ_P = P({ω : BS(ω) ≠ P}) is simultaneously the size of Lewis's bug and the type-I error floor of any track-record test of P. The New Principle's correction term and the tester's error are the same number. Worlds where undermining is likely are worlds where the chance-expert cannot be told from a charlatan. Mostly conceptual; the formal part is a two-line TV bound.

**N4. "Contact with the chancy nomic" (Earman–Roberts for chance).** (~35%.)
Thesis: Earman–Roberts set chance aside; the testing literature fills the gap. With Λ = Δ(Ω) no finite test works (Sandroni; O&S; Shmaya), and infinite future-dependent tests have only topological catching power (O&S AoS 2009), so non-Humean chance is empirically inaccessible in precisely the E&R sense; Humean chance, being supervenient and (allegedly) nearly self-certifying, is accessible by finite record.

**N5. The anti-Humean counter: "Mixtures can be best systems."** (~30% as a first paper; very likely as a referee objection to N1.)
Thesis: Laplace's rule (the de Finetti mixture of iid Bernoulli) is simpler than "iid with p = 0.4937" and, by the MDL/BIC fact that two-part codes and Bayesian mixture codes have the same (k/2)·log n regret, fits essentially as well. So the BSA has no principled reason to exclude mixtures, and hierarchical/many-coin worlds plausibly have mixture best systems. The Humean advantage evaporates.

### (b) My own answer

Formal frame (Belot's): a theory of chance is a measurable map f: Ω → Δ(Ω); the paradigm it induces is range(f). For P ∈ range(f) write A_P = f⁻¹(P); the A_P partition Ω. Call P **δ-proper** if P(A_P) ≥ 1−δ (undermining probability ≤ δ). Λ_δ = δ-proper laws.

*Lemma A (trivial).* Distinct P, P' ∈ Λ_δ have ‖P−P'‖_TV ≥ P(A_P) − P'(A_P) ≥ (1−δ) − δ = 1−2δ.

*Lemma B (trivial).* For any prior μ on Λ_δ and any P ∈ Λ_δ, Q_μ(A_P) = ∫P'(A_P)dμ ≤ μ{P} + (1−μ{P})δ ≤ μ{P} + δ, so ‖Q_μ − P‖_TV ≥ 1 − 2δ − μ{P}. With μ uniform on n laws this is 1−2δ−1/n on the support and 1−2δ off it. Hence Λ_δ meets Pomatto's condition for every ε > 2δ + 1/n: it is ε-testable at those levels, by Pomatto's own LR test. (Note: it is *not* "testable" in Pomatto's for-all-ε sense unless δ = 0 and Λ_δ is infinite.)

*Corollary C (trivial).* A non-degenerate mixture of δ-proper laws is not δ-proper (Q_μ(A_{Q_μ}) ≤ δ + μ{Q_μ}). So *if* Humean laws are δ-proper, Humean paradigms exclude mixtures.

That is the whole formal content I expect, and it is a one-hour derivation from the brief. The crux is not the lemma but the premise: **are Humean best-system laws δ-proper for small δ?** Supervenience gives only that f is a function; δ-properness is a quantitative non-undermining claim that Lewis *hoped* holds in long worlds but never established. My assessment:

- *Infinite iid/ergodic worlds*: δ = 0 (SLLN/ergodic theorem make the law a.s. recoverable; distinct ergodic laws are mutually singular). But here Lewis's "fit = probability of the actual history" is 0 for every law; one needs Elga-style or typicality fit. And the identified parameter is an arbitrary real, so simplicity pushes toward *coarse* or *mixture* systems.
- *Finite worlds X^N*: fit is sensitive to p at resolution ~1/√N (a frequency deviation of 0.01 over N = 10⁶ trials changes fit by e^{80}). Unless simplicity dominates fit at that scale, the best-system grid has spacing ~c/√N and the undermining probability is a *constant* (≈ 2Φ(−c/2σ), e.g. 0.3). Then 1−2δ−1/n ≈ 0.4 and the test is nearly useless. Small δ requires a coarse grid, i.e. a simplicity exchange rate that refuses to chase frequency. That is a substantive, unargued assumption about the BSA.
- *Mixtures as best systems*: by the MDL tie (two-part code ≈ mixture code to O(1)), a history drawn from Q_μ is about as well systematised by Q_μ as by its "true" component. L3-type claims hold only for an exchange rate under which a √n fit advantage beats a fixed parameter cost, i.e. only for long worlds with fixed (non-scaling) simplicity costs.

Primitivism: the claim that primitivists get Λ = Δ(Ω) is right about what primitivism does *not* exclude but wrong as a description of what primitivists *assert*. Propensities are grounded in set-ups; the space of possible chance laws is whatever physics allows, which is contingent, not convex by fiat. And time-indexing matters: in a hidden-selection world the t=0 chance is the mixture and the post-selection chance is the component; the expert who knows the chances *now* reports the component. The primitivist is therefore not barred from identifiable paradigms; a Humean is not guaranteed one.

**Verdict on mechanism**: metaphysics matters only through the identifiability structure of the paradigm. Humeanism supplies a *reason* to want identifiability (otherwise the law is undermined) but not the *fact* of it; primitivism supplies neither. The "help" is conditional and smaller than N1 suggests.

### (c) Traps

1. Fit on X^∞ is zero; the paper must say which fit notion it uses and keep it consistent with the finite-test horizon n_P.
2. δ-properness is a property of f on the *whole* mosaic; Pomatto's test looks at n_P outcomes. On X^∞ TV = sup_n TV_n so this is fine; on X^N it means the test reads the whole world.
3. The record is not the mosaic. If anything in the mosaic is unobserved, marginals of δ-proper laws over the observed part can be mixtures (many-coin worlds with hidden selections). The result then needs "the tested sequence is the entire Humean base", a strong idealisation.
4. Belot 2024 already models chance as a map from worlds to laws; the author must check whether a self-certification/non-undermining notion and its relation to mutual singularity are already there.
5. Stewart 2011 is already the LR test against a prior over laws; "Humean tester = Bayesian with prior over best systems" is Stewart + Pomatto with a different Λ.
6. Pólya urn = Laplace rule = exchangeable mixture: the brief's paradigm case of *primitive* chance is extensionally the manipulator's tool. The paper should make this point; a referee will if the author does not.
7. The MDL tie (N5) and hierarchical worlds: mixtures can be best systems; δ-properness is not a general feature of the BSA.
8. Convexity is sufficient for manipulability, not necessary; "Humean paradigm is not convex" does not by itself give testability. Only separation does. Make sure the positive result is stated via Pomatto, not via "non-convex".

---

## PHASE 2 (after reading idea-memo-v3, Pomatto 2021 full text, research/, and web checks)

### 1. Claim table

| Claim | Mark | Basis |
|---|---|---|
| L1 (δ-proper ⇒ pairwise TV ≥ 1−2δ) | **P / EXPECTED** | Identical to my Lemma A. Belot 2024 Def. 2.8 defines "proper" and the proof of his Prop. 3.4 states that "chance hypotheses corresponding to distinct chance laws must be disjoint"; δ=0 case is therefore implicit in Belot, and the δ-version is one line. |
| L2 (uniform prior on n ⇒ TV ≥ 1−2δ−1/n ⇒ ε-testable) | **P / EXPECTED** | Identical to my Lemma B. The construction is Pomatto 2021 Prop. 2's proof verbatim with δ-slack: partition E₁…Eₙ, uniform μ, Q_μ(E_i)=1/n, P(E_{i_P})=1 ⇒ TV ≥ 1−1/n. An economist would call L2 an exercise; the only novelty is replacing Pomatto's mixing + 0–1 law with a common partition given by the chance map. |
| L3 (mixtures of δ-proper laws are ≤δ-self-certifying) | **P / D** | My Corollary C. Formally correct and trivial. The philosophical gloss ("mixtures are not Humean chances") is the contestable premise, not the lemma (see §2). |
| P (primitivism supplies no restriction; urns realise any law) | **P** | My N1 and (b). Right about what primitivism does not exclude; misdescribes what primitivists assert (§2). |
| U (undermining probability is the price) | **P** | My N3. Correct under the economists' probabilistic type-I clause; accounting-relative (§2, §5). |
| One-sentence thesis | **P** | It is N1 with my own conditional antecedent ("rarely undermine") built in. Nothing in the memo lies outside Phase 1's list. |

Priority check (web + research/): no philosopher connects the testing-experts theorems to Humean vs primitive chance; the slot is empty. But Belot has "proper" and disjointness, Pomatto Prop. 2 has the partition/uniform-prior argument, and Al-Najjar–Sandroni–Smorodinsky–Weinstein 2010 already show that *learnable* parametric classes are finitely testable. "Identifiable ⇒ testable" is known to economists; "proper" is identifiability under another name. Unoccupied is not the same as unobvious.

### 2. Metaphysical check

**Is δ-proper the right Humean notion?** It formalises Lewis 1994's *hope* that undermining futures have small chance. It is not a Humean notion: it is a property of a chance map L (Belot's sense). Non-Humean maps can have it (Belot's Super-Determinism is proper; any ergodic primitivist class is proper under ergodic identification) and Humean maps can lack it (every finite-world BSA is improper; an MDL BSA with universal mixtures is proper only because its range collapses onto one mixture). Properness = a.s. identifiability of the law from the world. The real asymmetry is proper vs improper; Humeanism supplies a *motive* for properness (an improper law is one the world disowns) but not the fact.

**Do Lewis-style best systems in finite worlds get near small δ?** Only for cheaply statable laws. With fit sensitive at resolution 1/√N and a grid of spacing 2c standard errors, δ = 2Φ(−c): 0.32 at c=1, 0.046 at c=2, 0.003 at c=3. The memo's 0.003 at N=10⁴ (iid ½) needs the nearest rival six standard errors away, which holds only because ½ is cheap and rivals pay bits. In the same toy, iid(0.3) has δ≈1 (Laplace is its world's best system): it is not in the range at all. Two omitted consequences: (i) Λ_δ for small δ is the set of *cheap* laws, and a tester who adopts it rejects out of hand an expert whose world has an expensive best system; Pomatto's type-I clause does not count this misspecification cost; (ii) the range of an MDL BSA contains the Pólya/Laplace mixture as a δ-proper law, so the rhetoric that urns are the primitivist's non-Humean tool is false under the simplicity measure the author's own research favours.

**Map from the record to laws?** Legitimate as Belot's idealisation (worlds = 2^ω); "world ↦ time-0 law" is Lewis's complete theory of chance, with ch_t by conditioning. But only when the forecasted sequence *is* the supervenience base. Once the base exceeds the record, local Humean chance is a marginal, and marginals mix: TV(Pólya(1,1), Pólya(2,2)) = TV(Beta(1,1), Beta(2,2)) = 0.19 (computed). Local Humean paradigms are nowhere near Pomatto-separable. Threat 1 is correctly stated and confines the thesis to the whole base.

**Does P misdescribe primitivism?** Partly. Primitivists do not say every P ∈ Δ(Ω) is a possible chance law; the space is fixed by physics (set-ups, chancy dynamics). "No a priori restriction" is right only in that nothing in the *concept* excludes mixtures. A nomic primitivist (Maudlin-style dynamics, Markov in the full state) has a unique law per world, like the Humean; her paradigm over the record is the set of hidden-state marginals, rich but not convex by fiat. The honest P: the single-case chance of a one-off or hidden selection is a parameter no pattern fixes, so two-stage laws differing in the selection chance λ form a class convex in λ and TV-close; the Humean has no such parameter because a one-off event gets no chance from the best system. That is Lewis 1994 and Earman–Roberts in game-theoretic clothing; say so rather than claim an "a priori" difference.

**Time-indexing.** Relocates the asymmetry, does not destroy it. After a hidden selection both camps give the component as ch_t; they differ on whether the mixture was ever a *law*. A primitivist who reports post-selection announces a component, and that class is not convex. The Pólya urn is the right case because there is no selection event (research §2). Pomatto's LR test is prequential-implementable (his §5.1), so "announced law" vs "prequential" is not a fork. The paper must say when the report is made.

**L3 and conditionalisation / hierarchies.** L3 survives. Ch₀ = Σ_h Ch₀(h)·Ch_t^h, but the conditionals P(·|h) are cylinder-concentrated and not best systems (if they were, L3 would make P non-δ-proper; so a δ-proper BSA must refuse to let laws hard-code initial segments, a substantive but defensible constraint). In many-coin worlds the hierarchical H_K is δ-proper and is a mixture of laws ("selections s, then iid") that are not best systems, so L3 is untouched. What dies is the slogan "mixtures are not Humean chances": Laplace, H_K and statistical-mechanical chance are Humean mixtures of non-chances. L3 is stated carefully; the prose around it must match.

### 3. Mathematical check (L1, L2, bound)

L1: A_P ∩ A_{P'} = ∅; P(A_P) ≥ 1−δ; P'(A_P) ≤ 1−P'(A_{P'}) ≤ δ; TV ≥ 1−2δ. Correct, and tight (P = (1−δ)U_A + δU_B, P' = δU_A + (1−δ)U_B).

L2: for P in supp μ (uniform on n): Q_μ(A_P) = (1/n)P(A_P) + (1/n)Σ_{P'≠P}P'(A_P) ≤ 1/n + δ(n−1)/n ≤ 1/n + δ. TV ≥ (1−δ) − (1/n + δ) = 1−2δ−1/n. For P ∈ Λ_H off the support: Q_μ(A_P) ≤ δ, TV ≥ 1−2δ. Correct (slightly loose; exact is 1 − 1/n − δ(2n−1)/n).

Pomatto: Thm 1's "iff" quantifies over the weak*-closure Λ̄ and over Δ(Λ̄); the memo is right that the Thm 2 (sufficiency) proof uses only a μ with TV > 1−ε on Λ, and with finitely supported μ the witness P_ζ lies in supp μ ⊆ Λ_H, so no closure issue. Two corrections: (i) n_P is defined by ρ_{n}(Q_μ,P) ↑ TV with a *strict* threshold, so the result is "ε-testable for every ε > 2δ + 1/n", not "type-I error < 2δ+1/n"; (ii) Λ_H must be a measurable subset of Δ(Ω) (range of a measurable map is analytic, not necessarily Borel); choose Λ_H Borel or say so. δ=0 with infinitely many laws ⇒ testable: correct, and it is exactly "every Belot-proper theory with infinitely many laws induces a testable paradigm" — a clean one-line theorem that the paper should state as such and credit to Pomatto Prop. 2 + Belot Def. 2.8.

Numbers: Schwarz's 0.754 = 1 − 252/1024 is under *frequentism* ("chance = exact frequency"), not under any BSA; do not present it as a BSA figure. Bound at (δ,n): (0.754,10) → −0.61 (useless); (0.115,10) → 0.67; (0.035,20) → 0.88; (0.01,50) → 0.96; (0.003,100) → 0.984. So the Humean advantage is practically real only for δ ≲ 0.01, i.e. long worlds and cheap laws.

### 4. Threats

1. Locality: **SERIOUS**. Confines the thesis to whole-base records; local Humean paradigms mix (TV 0.19 above). Not fatal because the thesis sentence already says "whole pattern", but the "track record" framing must go or be flagged as in-principle.
2. Finite worlds: **SERIOUS**. δ is hostage to the simplicity measure, and under MDL the range contains the urn. Plus the unlisted misspecification cost of Λ_δ.
3. Infinite horizon: **MANAGEABLE**. Shmaya 2008 already shows infinite *prequential* tests fail on Δ(Ω); only future-dependent tests certify primitivists, and those are not track records. State the asymmetry for prequential/finite tests.
4. Ties/imprecise chance: **MANAGEABLE**. Inter-world disjointness of A_P survives set-valued laws; needs a paragraph on set-valued announcements.
5. Time-indexing: **MANAGEABLE** (§2).
6. Priority: **SERIOUS for the formal part** (Belot Def. 2.8 + disjointness; Pomatto Prop. 2; Al-Najjar et al. 2010 "learnable ⇒ testable"), **MANAGEABLE for the connection** (empty slot).
7. Triviality: **SERIOUS**. The formal content is an exercise and the thesis is the first paper a competent reader would write (my N1). This is the main risk.

### 5. Flaws not listed

- **Misspecification.** Restricting the paradigm to Λ_δ (small δ) excludes the expensive best systems; the true expert in such a world is rejected out of hand. Pomatto's framework does not count this. The Humean tester trades type-I error for coverage exactly as the primitivist "bets on physics", which erodes the memo's P-contrast ("for the Humean the restriction is part of what chance is").
- **Framing mismatch.** The quantitative δ story lives in finite worlds X^N; the finite-test theorem lives in X^∞ (where TV = sup_n ρ_n). In X^N, "finite test" with n_P = N reads the whole world; in X^∞, Lewis's fit is 0 and you need Elga-typicality or Belot's toy BSA. Pick one model and stay in it.
- **Accounting of U.** At an undermining world ω with BS(ω) = P' ≠ P, rejecting the announcer of P is not an error by Humean lights. δ is a cost only under the economists' P-indexed clause; the memo should say that a finite record cannot condition on A_P, which is why δ leaks in anyway (research §4.3).
- **Record length is law-dependent.** Pomatto's n_P is per law and unbounded over Λ_H (iid ½ and iid ½+10⁻⁹ are both best systems), so fixed-horizon certifiability (Pomatto Prop. 5) fails for every BSA range. "A track record certifies" means "for each law, some record length".
- **The best contribution is buried.** Research §1.2(d)–(e): code-length simplicity crowns Laplace or universal mixtures, so on that BSA a charlatan who announces the universal mixture *is* a chance-knower. Turned around, certifiability is a constraint on the BSA's simplicity measure: a new argument in the Woodward 2014 / Schwarz 2016 / Hoefer "smoothing" debate. The memo lists it as a threat.

### 6. Verdict

**PROCEED WITH CHANGES** — and without changes 1–2 below, treat it as STOP.

1. State the formal core once, as a corollary: *every Belot-proper theory of chance with ≥ n laws is ε-testable for ε > 2δ + 1/n* (Pomatto Prop. 2's argument with the chance map supplying the partition). Credit Pomatto and Belot; do not present L1–L2 as results.
2. Re-centre on the simplicity-measure consequence: certifiability as a desideratum on BSAs. Code-length simplicity ⇒ mixture best systems ⇒ either uncertifiable (local) or trivially certifiable (universal mixture). A Humean who wants chance-expertise to be testable must penalise mixture-formation. Make the toy-MDL tables the paper's evidence.
3. Delete "Pólya urns are not Humean chances". Keep L3 verbatim; say that Laplace, H_K and SM chance are Humean mixtures of non-chances.
4. Rewrite P as the game-theoretic form of Lewis 1994 / Earman–Roberts: single-case chances of one-off or hidden selections are unfixed by the pattern; two-stage classes are convex in the selection chance. Address the nomic primitivist and the time of report.
5. Put locality first, with the Pólya TV computation; drop "track record" from the title or say "in principle".
6. Fix: strict ε > 2δ+1/n; Borel Λ_H; closure in Thm 1; the 0.754 attribution; the misspecification cost; one world-model (X^∞ with Elga-typicality or Belot's toy BSA).
7. Cite Al-Najjar et al. 2010 ("learnable ⇒ testable") and Belot's Prop. 3.4/Cor. 3.6 ("proper + countable ⇔ CCP-satisfiable") as the two nearest formal neighbours; the paper's theorem sits between them.

**Referee guess.** As the memo stands: **NOT READY**, with a real chance of "rejected as EXPECTED" at a generalist journal (the formal part is an exercise and the thesis is the obvious first paper). With changes 1, 3–7: **publishable as a short formal note** (Analysis/Thought length, or Phil Sci/BJPS/Synthese). With change 2 executed well: a **real contribution**, because it turns the testing theorems into a constraint on what a best-system simplicity measure may be.
