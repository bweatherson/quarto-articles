I had read only question-brief-v3.md when I wrote Phase 1. No other file in the folder was opened and no web search was run.

# Predictability pretest v3-A

## PHASE 1 (brief only)

### (a) The papers a competent two-literature philosopher would write

**1. "Humeanism's epistemic advantage, formalised."** (Most likely; I'd put it at about 65%.)
*Thesis:* Humean chance makes expertise certifiable where primitive chance does not.
*Argument:* The manipulability results (O&S 2009 Prop. 1, Sandroni–Shmaya on exchangeables) run on convexity, i.e. Nature's mixture is again an admissible law. Under Humeanism a chance law is a function L(ω) of the mosaic. Good laws are (nearly) self-certifying, P(L = P) ≈ 1, so distinct possible laws are (nearly) mutually singular. A mixture of them is therefore far in total variation (TV) from each one, Pomatto's criterion holds, and the likelihood-ratio (LR) test exposes the randomiser. Primitivism puts no constraint on Λ. The Pólya urn, a Beta mixture of i.i.d. laws, is a legitimate primitive chance law, so convex paradigms are admissible and the minimax argument goes through.
*Signature example:* with primitive Pólya chances, the "expert" forecasts exactly Laplace's rule, which is what an uninformed Bayesian with a uniform prior forecasts. The expert and the ignoramus are literally the same forecaster.

**2. "Metaphysical neutrality."** (Likely, as the main rival or as the critique of #1; about 50%.)
*Thesis:* Metaphysics matters only through Λ, and Λ is fixed by physical theory and evidence, not by metaphysics.
*Argument:* A primitivist who accepts the same physics (i.i.d. or ergodic laws) has the same testable paradigm. The Humean's restriction needs knowledge of the particular best-system map L (the weights on simplicity, strength and fit), which is no more a priori than a physical theory. So any asymmetry is only an asymmetry of *default* paradigms.

**3. "Undermining is the measure of Humean manipulability."** (About 30%, often a section of #1.)
*Thesis:* The Humean advantage is bounded by the undermining probability.
*Argument:* if every P in Λ has P(L ≠ P) ≤ δ, then the class is roughly 2δ-testable but no better. The big bad bug resurfaces as manipulability, and the New Principle bears on how bad it is.

**4. "Expert testing as a decision-theoretic Earman–Roberts."** (About 30%, often folded into #1.)
*Thesis:* Manipulability theorems sharpen the empirical inaccessibility of non-Humean chance, from "underdetermined by evidence" to "unfalsifiable against a strategic opponent". The Pólya case is the paradigm.

**5. "Bayesian deflation" (Stewart-style).** (About 20%.)
*Thesis:* The worst-case, non-Bayesian framing is what produces manipulability. A tester with a prior, constrained by the Principal or New Principle, can test whatever her credences are over. Metaphysics changes only which hypotheses carry prior mass.

A minority variant, "Humeanism hurts" (about 10%), runs as follows. If chance is just pattern, expertise collapses into calibration-like pattern-matching, and Foster–Vohra shows calibration is manipulable. This is wrong, because a best-system law is far more than calibration. A reverse "transcendental" variant also turns up: we certify experts, so chance laws are not closed under mixture, which favours Humeanism.

### (b) My own answer

**Short version.** Humean chance helps, but only conditionally. It does not help because Humean chance is "about frequencies". It helps because supervenience plus self-certification turns the space of possible laws into an (almost) *identifiable* family. Identifiable families are known to be testable. The help is real only when four conditions hold:
- the tester knows the best-system map L;
- the record is the whole supervenience base;
- the world is infinite, or undermining is otherwise small;
- one adopts the *unconditional* reading of type-I error.

Relax any of these and the advantage shrinks or vanishes.

**Setting.** Following Belot, a Humean theory of chance is a measurable map L: Ω → Δ(Ω). Say P is δ-self-certifying for L if P(L = P) ≥ 1 − δ. Let S_L^δ be the set of such laws.

**Lemma (crux; trivial).** Let μ be a probability on S_L^δ and Q_μ = ∫P dμ. Then for every P ∈ S_L^δ:

  ||Q_μ − P||_TV ≥ 1 − 2δ − μ({P}).

*Proof.* Let A = {L = P}. Then P(A) ≥ 1 − δ. Also
Q_μ(A) = μ({P})·P(A) + ∫_{P'≠P} P'(A) dμ ≤ μ({P}) + δ,
because A ⊆ {L ≠ P'} for P' ≠ P. So P(A) − Q_μ(A) ≥ 1 − 2δ − μ({P}).

TV on the cylinder algebra F_n increases to TV on F_∞, so each P has a horizon n_P at which the bound holds up to any slack. Pomatto's LR test "pass iff P(ω^{n_P}) > Q_μ(ω^{n_P})" then has:
- type-I error ≤ ε;
- for every forecaster strategy ζ, average pass probability under μ equal to ∫ Q_μ(A_{P'}) dζ ≤ ε, so some P_ζ in supp μ holds the randomiser to ≤ ε.

Here ε = 2δ + max-atom + slack.

**Corollary.** If δ = 0 and S_L supports non-atomic measures, S_L is testable for every ε. One example is infinite worlds with L = the i.i.d. law at the limiting frequency, where the strong law of large numbers gives δ = 0. A more general one is ergodic laws identified by block frequencies, since distinct ergodic measures are mutually singular. Note that S_L is non-convex: a non-trivial mixture of members is not a member.

**Remark (finite paradigms).** A finite mutually singular family of k laws is *not* ε-testable for ε < 1/k: the charlatan who guesses uniformly passes with probability about 1/k. So "how much" also depends on the richness of Λ.

**Primitive side.** Every P ∈ Δ(Ω) can be realised by a mechanism whose state is the past record, with next-outcome propensity P(x | ω^t). The generalised Pólya urn is the instance. So primitivism imposes no constraint, convex Λ are admissible, and O&S Prop. 1 applies.

**Two observations weaken the result.**
1. *The New Principle removes δ.* Under the New Principle (NP), the tester's credence given "P is the chance" is P(·|L = P). These conditional measures have disjoint supports, so the corresponding bound is 1 − μ({P}), with no δ term. On the conditional reading of type-I error, a test failing P in a world where L(ω) ≠ P makes *no* error, since P was not the chance there. So "undermining costs 2δ" is an artefact of using the Old Principle's unconditional P.
2. *Uncertainty about L restores mixtures.* If the tester is uncertain about L, her paradigm is ∪_L S_L, and this union can contain a law together with its components. A simplicity-heavy L can make the Pólya(1,1) law self-certifying, since it is simple and fits every path to within O(√n). A fit-heavy L makes the i.i.d.(p) laws self-certifying. The union then contains Pólya, which is a mixture of members of the union, and that is exactly the configuration the charlatan exploits.

**Verdict.** Humeanism helps only for a tester who knows L. That is the same help a primitivist gets from knowing that the physics is ergodic. The lemma is trivial; the philosophical interest lies wholly in whether the assumptions are earned.

### (c) Traps any such paper must face

1. **Paradigm is epistemic, metaphysics is modal.** Λ is what the *tester* treats as possible. Metaphysics bears on Λ only through what she knows, and a Humean tester rarely knows L.
2. **Locality.** Chance supervenes on the *whole* mosaic, not on this forecaster's record. A local subsystem can deviate from its global best-system law at no Humean cost, so self-certification fails for local records. The real-world cases (weather, markets) are all local.
3. **Undermining, finite worlds and continuous families.** With a continuum of candidate laws in finite worlds, P(L = P) can be near 0, so δ ≈ 1. Infinite worlds rescue δ = 0 only via a limiting-frequency L, and Lewisian fit is undefined there (Elga's infinitesimals).
4. **Old versus New Principle** (above). Which notion of type-I error is the right one for a Humean?
5. **Triviality and priority.** "Mutually singular or identifiable classes are testable" is something an economist would regard as known:
   - Pomatto's own examples;
   - Kavaler–Smorodinsky's singularity condition;
   - Al-Najjar–Sandroni–Smorodinsky–Weinstein 2010 on learnable paradigms;
   - the general mutual singularity of ergodic measures.
6. **Primitivist parity.** A primitivist with the same physics gets the same result, so the claim must be about default or a priori paradigms.
7. **Time-indexing.** The economic framework presupposes one law P whose time-t chances are its conditionals. A primitivist whose chances at t+1 are not ch_t conditioned on x_{t+1} doesn't fit the framework at all. That threatens the comparison, not the primitivist's manipulability.
8. **Measurability.** The best-system map on X^∞ may not be Borel, and S_L may not be measurable.
9. **Finite-paradigm guessing** (the 1/k remark above).
10. **Audience.** The formal core fits on half a page. A generalist referee will ask what we learn about chance that the epistemic-access debate (Hoefer, Earman–Roberts, Strevens) didn't already say.

---

## PHASE 2 (after reading idea-memo-v3, Pomatto 2021, research/)

### 1. Predictability

| Claim | Mark | Basis |
|---|---|---|
| L1: δ-proper ⇒ TV ≥ 1−2δ | **P**, EXPECTED | Same lemma and proof as my Phase 1 crux. For δ = 0, it follows immediately from Belot 2024: Def. 2.8 defines "proper" as λ(Λ) = 1, and the proof of Prop. 3.4 notes that distinct laws' chance hypotheses "must be disjoint". |
| L2: uniform prior on n laws ⇒ 1−2δ−1/n; LR test | **P**, EXPECTED | I derived 1−2δ−μ({P}). A uniform prior on n orthogonal laws is exactly Pomatto's proof of Prop. 2 (pp. 141–2), with a single identifying map in place of his mixing hypothesis. |
| L3: mixtures of δ-proper laws self-undermine | **P**, EXPECTED | My Phase 1 remark that "S_L is non-convex". One line. |
| P: record-driven devices realise any law | **P**, EXPECTED | My "generalised Pólya" point. It is Ionescu-Tulcea, and the research file calls it textbook. |
| U: undermining is the price | **P** (the slogan itself is D) | My paper #3, plus my Phase 1 point that the δ term is an artefact of the Old Principle. |
| One-sentence thesis | **P** | This is my paper #1, the modal prediction at about 65%. |

Nothing in the memo is N. A specialist who knows both literatures writes this memo's core within an afternoon.

### 2. Mathematical check

**L1: correct.**
- {BS = P} is measurable, because singletons are Borel in Δ(Ω).
- P′(A_P) ≤ P′(Ω∖A_{P′}) ≤ δ, so ||P−P′|| ≥ P(A_P) − P′(A_P) ≥ 1−2δ.

**L2: correct, and slightly loose.**
- For P in the support of the uniform prior:
  P(A_P) − Q(A_P) ≥ (1−1/n)(1−δ) − ((n−1)/n)δ = (1−1/n)(1−2δ) = 1−2δ−1/n+2δ/n.
- For P ∈ Λ_H outside the support: Q(A_P) ≤ δ, so the gap is ≥ 1−2δ.
- This needs every law to be δ-proper for the *same* BS. That shared map is what does the work of Pomatto's mixing assumption.

**The ε-version.** I checked Pomatto's appendix (pp. 148–150). The sufficiency half uses only three things:
1. a μ with ||Q_μ−P|| > 1−ε for every P ∈ Λ;
2. measurability of Λ;
3. approximation of μ by finitely supported priors on Λ, which is trivial here because μ is already uniform on n members.

The hypothesis "Λ testable" plays no role, so the ε-version for fixed ε holds.

**Strictness.** Theorem 2 needs a strict inequality.
- With δ > 0, the tight bound (1−1/n)(1−2δ) exceeds 1−(2δ+1/n), so "type-I error < 2δ+1/n" holds.
- With δ = 0, support members sit at exactly 1−1/n, so n_P is undefined. The memo must say "any ε > 1/n".

**Arithmetic.**

| δ | n | ε = 2δ + 1/n |
|---|---|---|
| 0.003 | 100 | ≈ 0.016 |
| 0.115 | 10 | 0.33 |

Schwarz's figure checks: 1 − 252/1024 = 0.754.

**L3: the inequality is correct.** Each component P ≠ Q_μ, so {BS = Q_μ} ⊆ {BS ≠ P}, and the bound follows. **The gloss is false as stated.**
- "Mixtures of possible chance laws are not themselves possible chance laws" requires possible chance laws to be proper.
- But membership in range(BS) does not require properness. Lewis's own finite-world laws undermine with probability 0.754.
- The correct claim is that such mixtures are not δ′-proper for any δ′ < 1−δ.

**P: correct and trivial.** Full support isn't even needed, since one can assign arbitrary propensities on null histories. But the parity point cuts both ways:
- Humeanism as such restricts Λ only to range(BS).
- range(BS) is testable only if its members are proper.
- Properness is a further fact that depends on the standards and the world, not a constituent of Humean chance (§4b).

**Time-indexing (threat 5).**
- *It does not undermine P.* The Pólya device has no hidden state, so its chance at t is the law conditioned on ω^t, and one law is well defined.
- *It does narrow the comparison.* With hidden selection (two-stage set-ups), a chance-tracker's forecasts are not one law announceable at t = 0, so the announced-law framework misdescribes her. In the prequential framework, L2 delivers nothing, and for Δ(Ω) Shmaya bites both sides.
- *The Humean has the same problem.* When the selection outcome is in the mosaic but not in ω, the time-0 Humean chance is also a mixture (chance-ontology-check §1.2f).
- So threat 5 collapses into threat 1. It is not fatal to P, but it confines the comparison to processes with no hidden state, recorded in full.

### 3. Threats

1. **Locality: SERIOUS, and fatal to the headline for a generalist venue.**
   - What survives is this: if the theory of chance is known and proper, the cosmic history identifies the cosmic chance law. A demon who announces that law at t = 0 can then be told apart from a randomiser by initial segments of cosmic history.
   - That is Humean supervenience restated, plus Pomatto. Its interest is the conceptual Humean epistemic-access claim (Lewis 1994; Loewer; Hoefer; structurally Earman–Roberts), which is old.
   - Worse, the memo's own example concedes that local Humean chance can be exactly Pólya. So for every record anyone will ever hold, the Humean is in the primitivist's position.
   - The Charmides doctor-versus-pretender framing becomes inapposite.
2. **Finite worlds: SERIOUS.** It is worse than the memo says (§4c).
3. **Infinite horizon: MANAGEABLE, but the thesis must change.**
   - "No record can" is false, given O&S 2009 *AoS*. Restrict the claim to finite tests.
   - The residual contrast (measure-theoretic versus merely topological catching power) is a known contrast (Belot 2013, "orgulity"), and a referee will say so.
4. **Ties: MANAGEABLE by stipulating a sharp BS.**
   - A set-valued BS breaks the disjointness of the A_P, so L1 fails outright rather than degrading.
   - The stipulation must be stated as a cost.
5. **Time-indexing: MANAGEABLE.** See §2; it reduces to threat 1.
6. **Priority: MANAGEABLE for the connection, SERIOUS for the formal content.**
   - The research found no prior connection.
   - But the formal content has antecedents:
     - singularity is one step from Belot's disjointness remark;
     - L2 is Pomatto's Prop. 2 template;
     - Kavaler–Smorodinsky Thm 5 (an ideal comparison exists iff the laws are pairwise singular);
     - ANSSW 2010 on learnable paradigms.
7. **Triviality: SERIOUS, and decisive.**
   - L1–L3 and P are each one line.
   - Strip the formalism and the philosophical content is "Humean chance is empirically accessible in principle, primitive chance is not". That is the standard Humean selling point; strategic testing adds formal paint.

**Is "undermining is the price" right? No. It conflates two probabilities.**
1. The first is δ_P = P(BS ≠ P), a property of the map BS relative to P.
2. The second is the type-I error of the certifying test. For Pomatto's LR test this depends only on the TV geometry of Λ, and BS enters only by fixing which laws are in Λ.

L2 shows that small δ is *sufficient* for small error. The memo's "bounded below" claim is unproved, and it is false. A counterexample:
- Take infinite i.i.d. worlds with BS(ω) = iid(lf(ω)) if ω₁ = T, and BS(ω) = iid(lf(ω)+½ mod 1) if ω₁ = H, where lf is the limiting frequency.
- Every iid(p) lies in the range of BS, and P(BS = iid(p)) = 1−p, so δ approaches 1.
- Yet the i.i.d. class is pairwise singular and Pomatto-testable with error tending to 0.

The perverse map is deliberate: it shows that undermining is neither necessary nor a lower bound. The only test whose error *equals* δ is the whole-mosaic test "pass iff BS(ω) = P" under the unconditional standard. Under the New Principle, Cr(·|Ch = P) = P(·|BS = P). These conditional laws are exactly singular, and δ drops out. So the "price" is an artefact of scoring Humean type-I error with the Old Principle.

### 4. Flaws the memo does not list

**(a) Uncertainty about BS.**
- Properness is relative to one map. A tester unsure of the standards of simplicity and fit faces Λ = ∪_i Λ_{BS_i}.
- Across maps, proper laws need not be singular. Pólya(1,1) may be proper under one parameter-count standard and Pólya(2,2) under another, and those two are mutually absolutely continuous.
- So L1 fails across theories. Knowing which Humean theory is true is no more a priori than the primitivist's physics.

**(b) The asymmetry claim is false.** The memo says that "for the Humean, the restriction is part of what chance is".
- Supervenience is constitutive of Humean chance; properness is not. Lewis's own laws, at 0.754, show this.
- Assuming small δ is a contingent, standards-relative bet. It carries exactly the type-I risk the memo charges to the primitivist.
- The primitivist can also adopt Λ_H itself, which is just a set of measures, and get the identical test.
- What remains is a difference only in the *modal status* of the paradigm. Without the asymmetry the thesis is the expected one.

**(c) δ is misreported.**
- The figures 0.003–0.115 are the undermining probabilities of iid(½), the *cheapest* law. L2's δ is the supremum over Λ_H.
- In the same toy MDL model, most iid(p) are not in range(BS) at all, and the Laplace rule wins most worlds.
- So Λ_H at N = 10⁴ is a handful of laws, and the 1/n term dominates.
- The charlatan who announces Laplace is the uninformed Bayesian, yet he is the *chance-knower* in most worlds (research §1.2d–e, §4.4).
- Simplicity standards that favour mixtures are the most serious internal threat, and they are not on the list. On the standards Humeans actually like, the "advantage" may be that ignorance counts as knowledge.

**(d) The thesis sentence contradicts threat 3.**

**(e) The Humean "expert" knows inadmissible information** about the future mosaic. The thesis therefore certifies a demon, not a forecaster.

**(f) Minor points.**
- The strict inequality fails at δ = 0.
- Λ_H must be measurable.
- L2 needs at least 1/ε proper laws that are distinguishable within the test horizon.

### 5. Verdict

**STOP**, as a paper for a general philosophy audience. The reasons:
- All six claims were predicted (P), and every formal one is EXPECTED.
- The one non-obvious philosophical claim, that the restriction is constitutive for the Humean but a bet for the primitivist, is false (§4a–b).
- The positive residue holds only for the cosmic record under a known, proper, mixture-penalising theory of chance.

**If the author continues, there are two options.**
- **(i) A short note:** "Proper theories of chance are testable". It would connect Belot-properness to Pomatto testability, include the New Principle point (δ drops out) and the counterexample to "price", and flag the Laplace caveat. This suits a specialist outlet.
- **(ii) The less predictable negative thesis**, which I flagged only as a trap. The Humean's vaunted epistemic advantage does not survive strategic testing. It needs:
  - the cosmic record;
  - a known theory of chance;
  - a simplicity standard that penalises mixtures.

  Under the standards Humeans favour (MDL, parameter counts), the uninformed Bayesian *is* the chance-knower.

**Blind referee at a good generalist journal:** most likely **rejected as EXPECTED**. A specialist journal might accept a corrected version as a short formal note.

Sources consulted in Phase 2: Pomatto 2021 full text (scratchpad copy); research/chance-ontology-check.md and econ-report.md; Belot 2024, "Unprincipled", *RSL* (Def. 2.8; proof of Prop. 3.4), via https://www.cambridge.org/core/services/aop-cambridge-core/content/view/68A1057BD83B6FCD9DB14A33341F707C/S1755020323000151a.pdf/unprincipled.pdf.
