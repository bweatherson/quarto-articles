# Final claims check (12 items)

Prepared 2026-10-20 for the track-record paper.

**Status labels**
- **READ**: I read the primary text myself this session. The version is stated.
- **ABSTRACT**: I saw only the abstract or metadata, or a tool's reading of a text I could not open directly. Quotations from such tool readings are flagged.
- **MEMORY**: my background knowledge, not verified this session. Check before printing.
- **SECONDARY**: a statement taken from another source I READ. The source is named.

Every DOI below was checked against Crossref (api.crossref.org) this session. Where Crossref metadata is odd, I say so.

---

## Summary table

| # | Claim | Verdict | Status |
|---|---|---|---|
| 1 | Dorst et al., Total Trust | **Partly wrong.** Total Trust ranges over *random variables*, not propositions. P(A \| E(A) ≥ t) ≥ t is *Simple Trust*, which is strictly weaker and is **not** equivalent to Value. Equivalence (ii) holds only for "generally strictly proper" *estimate* scoring rules. Modest experts: yes. | READ (Feb 2021 accepted MS) |
| 2 | Kavaler & Smorodinsky, Thm 5, Prop 1, Cor 1 | **Correct** as stated. | READ (arXiv v3) |
| 3 | Genin & Kelly 2017 | **Correct, with caveats.** It is an exact characterisation, under stated conditions, for **i.i.d.** samples. A point hypothesis is unverifiable only if it is not isolated in W. | READ (EPTCS PDF) |
| 4 | New Principle | Lewis's form **confirmed**: (NP) C(A\|HT) = P(A\|T), p. 487. Hall's own wording **not read**. | Lewis READ; Hall MEMORY |
| 5 | "If nature is kind" | **Confirmed**, p. 479. Lewis says the standards *may seem* to come from us, and that they are "only partly a matter of psychology". He does **not** say they are ours. | READ |
| 6 | Hoefer: simplicity standards are ours | Hoefer **2007** §4.3 says "best for us" (tool-extracted quotation). Hoefer **2019** not read. | 2007 ABSTRACT; 2019 MEMORY |
| 7 | Earman & Roberts | The supervenience base is the **whole** Humean base. They explicitly **refuse** to concede inductive scepticism, and they leave chance open. | READ (published scans) |
| 8a | Distinct ergodic measures are mutually singular | **True.** | MEMORY for the theorem number |
| 8b | Blackwell–Dubins | **True** as stated. | SECONDARY (Belot 2020) |
| 8c | Laplace mixture: (½) log n + O(1), P-a.s. | **False as an almost-sure claim.** True in expectation, and O(1) in probability. Almost surely the error term is O(log log n) (law of the iterated logarithm). Fails at q ∈ {0, 1}. | Own derivation and simulation; Clarke–Barron ABSTRACT; Grünwald READ |
| 9 | Anderson 2011 | Citation confirmed. Her criteria are expertise, honesty and epistemic responsibility, applied to judge **consensus**. | ABSTRACT + SECONDARY (Levy) + MEMORY |
| 10 | Plato Stephanus numbers | **All seven confirmed.** Two loci can be tightened (see §10). | READ (Perseus TEI: Lamb/Fowler and Burnet) |
| 11 | Dawid 1985 | The abstract confirms asymptotic agreement. The computability conditions come from secondary sources. | ABSTRACT + SECONDARY |
| 12 | Levy 2025 | Pages 2077–2094 confirmed. The sentence is verbatim, on **p. 2089**. | READ (text); page via tool reading of publisher PDF, cross-checked |

---

## 1. Dorst, Levinstein, Salow, Husic & Fitelson, "Deference Done Better"

**Citation [Crossref]:** Dorst, K., Levinstein, B. A., Salow, B., Husic, B. E., & Fitelson, B. (2021). Deference Done Better. *Philosophical Perspectives* 35(1): 99–150. doi:10.1111/phpe.12156. Online 23 Oct 2021; issue dated Dec 2021. The year 2021 is right.

**Status: READ.** I read the accepted manuscript dated "February 2021" from ORA (Oxford). Page numbers below are **manuscript pages**: Wiley's PDF returned 403. Check theorem numbers and pagination against the journal version before final citation.

**The claim as stated, "P(A | E(A) ≥ t) ≥ t", is not Total Trust.**
- For propositions, that is **Simple Trust**: "Simple Trust: π(q | P(q) ≥ t) ≥ t" (MS p. 10).
- **Total Trust** quantifies over arbitrary *random variables* (real-valued functions on a finite set of worlds W):
  > "Total Trust: For any variable X: Eπ(X | E(X) ≥ t) ≥ t" (MS p. 12)
- The ≤ analogue is derived, not stipulated: "Like Trust, Total Trust is again symmetric: π totally trusts a frame iff for all Y, s: Eπ(Y | E(Y) ≤ s) ≤ s." (MS p. 13)
- In the variable-relative form used for the accuracy theorem, both clauses are written in: π totally trusts P with respect to X "iff for all t: Eπ(X|E(X) ≥ t) ≥ t and Eπ(X|E(X) ≤ t) ≤ t" (MS p. 22).
- The difference matters. Simple Trust, and even the conditional version "Trust", do **not** imply Value: "Fact 2.1. There are π, ⟨W, P⟩ such that π trusts ⟨W, P⟩ without valuing it." (MS p. 11)
- So if the paper defines "Total Trust" by the proposition-level inequality and then claims equivalence with Value, the claim is false. Use the random-variable form.

**(i) Equivalence with Value: confirmed.**
- Value: "If S is recommended for O, then for all O ∈ O: Eπ(S) ≥ Eπ(O)." Gloss: "For any decision problem, prefer to giving the expert power of attorney" (MS p. 8).
- "Theorem 2.2. π totally trusts ⟨W, P⟩ iff π values ⟨W, P⟩." (MS p. 13)
- Two caveats:
  - The preference is **weak** (≥).
  - Frames are **finite**: "our frames our [sic] finite" (MS p. 19, fn. 40).

**(ii) Equivalence with expected accuracy: true only for a broadened class of accuracy measures.**
- "Theorem 3.2. π totally trusts P with respect to X iff π epistemically values P with respect to X." (MS p. 22)
- Epistemic Value is defined over **"generally strictly proper" (gsp) estimate-inaccuracy measures** for arbitrary variables, following Campbell-Moore 2020: "Epistemic Value: For any X and gsp I_X, Eπ(I_X(P)) ≤ Eπ(I_X(π))", with equality iff π(E(X) = Eπ(X)) = 1. Gloss: "Always expect the expert's estimates to be more accurate than your own." (MS p. 22)
- For the *standard* class (additive, truth-directed, strictly proper scoring rules for credences in propositions), expected-accuracy dominance is equivalent only to Simple Trust: "Levinstein (2019) shows that this version of Epistemic Value is equivalent to Simple Trust." (MS p. 20; their Theorem 3.1)
- Hence, on that standard class, "Epistemic Value is strictly weaker than Value" (MS p. 21).
- **Correct wording:** "always expect the expert's estimates to be *at least as* accurate, on every generally strictly proper estimate-scoring rule."
- Saying "more accurate" without the gsp qualifier is wrong.

**Modest experts: yes.** This is the paper's whole point.
- Abstract: "many experts are modest: they're less than certain that they are worthy of deference."
- "Unlike Reflection, Value allows modesty." (MS p. 2)
- Figure 3 (MS p. 9) gives a modest frame that π values.
- Characterisation: "Theorem 4.1. π totally trusts ⟨W, P⟩ iff each P_i ∈ C_π is modestly informed and π is in their convex hull." (MS p. 27)

---

## 2. Kavaler & Smorodinsky 2019, "On comparison of experts"

**Citation [Crossref]:** Kavaler, I., & Smorodinsky, R. (2019). On comparison of experts. *Games and Economic Behavior* 118: 94–109. doi:10.1016/j.geb.2019.08.005. (No issue number in Crossref; print date Nov 2019.)

**Status: READ** (arXiv:1710.09461v3, 28 Aug 2019, the local text). Page numbers are arXiv pages. The DOI suffix (.08.005) suggests August 2019 acceptance, so v3 is probably the accepted text. Numbering is unchecked against the GEB print.

**Setting.**
- Two experts with forecasting strategies f₀, f₁. The pair induces measures P₀^f, P₁^f on Ω^∞ (binary outcomes "for expository reasons", extending to finite sets).
- A test is T: Ω^∞ × F × F → {0, ½, 1}, where ½ means inconclusive.
- "Hereafter we restrict attention to anonymous and non-counterfactual tests." (p. 9)

**Definitions** (verbatim, notation simplified):
- Def. 3 (p. 9): "A test T is error-free if for all f and i ∈ {0,1}, P^f_{1−i}({T(·, f) = i}) = 0."
- Def. 8 (p. 19): T is *ideal* w.r.t. W ⊆ F if for all f ∈ W × W and i with P_i ≠ P_{1−i}, P_i({T(·, f) = i}) = 1.
- Def. 9 (p. 19): W is *pairwise mutually singular* if every pair with P₀ ≠ P₁ has P₀ ⊥ P₁.

**Prop. 1 and Cor. 1 (p. 9): confirmed.**
- "Proposition 1. Let f be such that P₁ ≪ P₀. If T is error-free then P₀({T(·, f) = 0}) < 1."
- "Corollary 1. Let f be such that P₁ ≪ P₀. If T is error-free then P₀({T(·, f) = ½}) > 0."
- Gloss (p. 9): "expert 0, from his own perspective, cannot be confident that the test will identify him as better informed."
- So the paper's wording, "any error-free test is inconclusive with positive P₀ probability," is accurate. These results sit within the stated restriction to anonymous, non-counterfactual tests.

**Theorem 5 (p. 20): confirmed verbatim.**
> "There exists a non-counterfactual anonymous ideal test with respect to W if and only if W is pairwise mutually singular."
- Sufficiency is witnessed by their likelihood-ratio "derivative test" D (via Lemma 4 and Thm 1).
- They also note (p. 19) that "it is a straightforward corollary of Proposition 1 that there exists no ideal test" when one induced measure is absolutely continuous w.r.t. the other.

---

## 3. Genin & Kelly 2017, "The Topology of Statistical Verifiability"

**Citation [Crossref]:** Genin, K., & Kelly, K. T. (2017). The Topology of Statistical Verifiability. In J. Lang (Ed.), *Proceedings of the Sixteenth Conference on Theoretical Aspects of Rationality and Knowledge (TARK 2017)*, *Electronic Proceedings in Theoretical Computer Science* 251: 236–250. doi:10.4204/EPTCS.251.17. Also arXiv:1707.09378.

**Status: READ** (arXiv v1 = EPTCS PDF, with EPTCS pagination).

**Exact statement (Theorem 4.1, p. 241):**
- Hypothesis: "Suppose that W is a set of Borel measures on S = (Ω, T), a metrizable sample space with countable, almost surely clopen basis I."
- Then the following are equivalent:
  1. "H ⊆ W is α-verifiable in chance for some α > 0;"
  2. "H ⊆ W is almost surely verifiable;"
  3. "H ⊆ W is open in the weak topology."
- Companion results:
  - Thm 4.2: limiting verifiability ⇔ countable union of weakly closed sets (F_σ).
  - Thm 4.3: solvability ⇔ partition into F_σ sets.

**Point hypotheses (p. 241):** "That hypothesis is almost surely refutable, but it is not almost surely verifiable." This refers to "the sharp hypothesis that the bias of the coin is exactly .5".
- Also (p. 239): "no feasible test of H = {µ} achieves power strictly greater than its significance level."

**Caveats the paper should state.**
1. **The data are i.i.d. samples.** The error probabilities are µⁿ (n-fold product). Applying the result to a single dependent sequence of forecast outcomes is an *analogy*, not this theorem.
2. **"Roughly" can be dropped** under the stated conditions: the characterisation is exact. They add that "the weak topology is the unique topology that characterizes statistical verifiability" (p. 241).
3. **A point hypothesis {µ} is unverifiable only if µ is not isolated in W.** If W contains only finitely many well-separated measures, {µ} is weakly open, hence verifiable.
4. **Only "feasible" tests count**: acceptance regions must be almost surely clopen (p. 239).

---

## 4. The New Principle: Hall 1994 and Lewis 1994

**Citations [Crossref]:**
- Lewis, D. (1994). Humean Supervenience Debugged. *Mind* 103(412): 473–490. doi:10.1093/mind/103.412.473.
  - Crossref files the title as "Symposium: Chance and Credence", the symposium heading. Use the real title.
- Hall, N. (1994). Correcting the Guide to Objective Chance. *Mind* 103(412): 505–517. doi:10.1093/mind/103.412.505.
  - Crossref gives 505–518. The next item in the issue starts at 519. Most bibliographies, including PhilPapers, give 505–517.
- Also in the symposium: Thau, M. (1994). Undermining and Admissibility. *Mind* 103(412): 491–504. doi:10.1093/mind/103.412.491.

**Lewis 1994: READ** (JSTOR scan with journal pagination).

Notation (p. 487):
- H_tw is "the complete history of world w up to, and including, time t".
- T_w is "the complete theory of chance for world w".
- P_tw is "the chance distribution at time t and world w".
- C is introduced on p. 483 as "a rational credence function for someone whose evidence is limited to the past and present". This is not quite Lewis 1980's "reasonable initial credence function".

The principles, with subscripts dropped "by way of abbreviation" (p. 487):
> (OP) C(A|HT) = P(A).
> (NP) C(A|HT) = P(A|T).

So the exact form is **C(A | H_tw T_w) = P_tw(A | T_w)**.
- If the paper writes Cr(A | H_tw T_w) = Ch_tw(A | T_w), that is a faithful notational variant.
- Keep the t-subscript on the chance function.
- Supporting quotes:
  - "Here I shall present only a special case of the correction I favour" (p. 487).
  - "To remove the discrepancy, we conditionalise the right-hand side as well as the left" (p. 487).
  - On the general case: "the new version gets quite messy" (p. 489, fn. 10).
  - "Ned Hall and I proposed the same correction independently." (p. 487)

**Hall 1994: NOT READ.** Mind/JSTOR/PhilArchive all refused. Lewis's sentence above (READ) confirms that Hall proposes the same correction.
- [MEMORY] Hall 1994 states it in the same H_tw/T_w form.
- The fully general "conditional-chance" form is due to **Hall 2004**, not 1994 (attribution per Schwarz's blog, READ via tool):
  - It reads Cr(A | Ch = f ∧ E) = f(A | Ch = f ∧ E).
  - Citation: Hall, N. (2004). Two Mistakes About Credence and Chance. *Australasian Journal of Philosophy* 82(1): 93–111. doi:10.1080/713659806 [Crossref].
  - If the paper uses that general form, cite Hall 2004.
- [SECONDARY, Dorr's NYU seminar notes, READ] NP does **not** entail C(· | the t-chances are P_t) = P_t(· | the t-chances are P_t). The t-chance hypothesis is a disjunction of H-and-T hypotheses. Avoid writing NP in that form.

---

## 5. Lewis 1994: "if nature is kind"

**Status: READ** (pp. 478–479, 481, 489).

**The passage is on p. 479.**
- The problem (p. 479) is where the standards of simplicity, strength and balance come from: "the answer may seem to be that they come from us."
- Lewis rejects rigidification as "a cosmetic remedy only" (p. 479).
- Answer (p. 479):
  - "if nature is kind to us, the problem needn't arise."
  - "I suppose our standards of simplicity and strength and balance are only partly a matter of psychology."
  - "If nature is kind, the best system will be robustly best"
  - "it will come out first under any standards of simplicity and strength and balance."
  - "We have no guarantee that nature is kind in this way, but no evidence that it isn't."
  - If nature were unkind, "lawhood might be a psychological matter, and that would be very peculiar."
  - "I'd blame the trouble on unkind nature, not on the analysis".
- Related lines:
  - p. 478: "How good a balance that is will depend on how kind nature is."
  - p. 481: chances "should depend on how kind nature has been in providing a decisive front runner."
  - p. 489: "If nature is kind to us," best-system chances "will obey the old Principle to a very good approximation in commonplace applications."

**Correction.** If the paper says Lewis held that the standards of simplicity are *ours*, that misdescribes him. Lewis grants that the standards *seem* to come from us. He holds they are "only partly a matter of psychology", and he relies on nature's kindness to make the choice of standards idle.
- Fair: "Lewis concedes the standards may seem to be ours, and hopes nature is kind enough that it does not matter."

---

## 6. Hoefer, *Chance in the World* (2019)

**Citation [Crossref]:** Hoefer, C. (2019). *Chance in the World: A Humean Guide to Objective Chance*. New York: Oxford University Press. doi:10.1093/oso/9780190907419.001.0001.
- The book has a **subtitle**; include it.
- The relevant chapter is probably ch. 3, "Humean Objective Chance", pp. 63–97 (doi:10.1093/oso/9780190907419.003.0003).

**Status: 2019 NOT READ.**
- The OUP chapter page was rate-limited (HTTP 429) and I was told not to retry.
- Google Books quota was exhausted.
- The only full copy found online was a pirate site, which I did not use.
- [MEMORY] In the book Hoefer defends a pragmatic, agent-relative Best System for chance: chances are "best for us", and simplicity and related virtues are understood relative to human epistemic interests. Treat this as unverified for the 2019 book.

**Verifiable substitute: Hoefer 2007.**
- Citation [Crossref]: Hoefer, C. (2007). The Third Way on Objective Probability: A Sceptic's Guide to Objective Chance. *Mind* 116(463): 549–596. doi:10.1093/mind/fzm549.
- Status: ABSTRACT-level. A tool reading of the PhilSci preprint returned these verbatim snippets; I could not open the PDF myself because of a certificate error on philsci-archive. All are from §4.3:
  - "First, the 'best' in Best System means best for us (and for creatures relevantly similar)."
  - "But for an account of chances alone, there is no need to insist on this kind of Platonic objectivity."
  - He contrasts this with Lewis's view, on which simplicity and strength "are meant to be timeless, objective notions unrelated to our species or our scientific history".

**Suggested sentence:** "Pragmatic Humeans hold that the Best System is 'best for us' (Hoefer 2007, §4.3; see Hoefer 2019, ch. 3), so that the standards of simplicity are ours, not nature's."
- Get the Mind page number for "best for us" from the journal PDF.
- Check the 2019 chapter yourself before citing it for a specific claim.

**For "pragmatic Humeanism" as a label**, the usual citations [Crossref] are:
- Dorst, C. (2019). Towards a Best Predictive System Account of Laws of Nature. *BJPS* 70(3): 877–900. doi:10.1093/bjps/axy016
- Jaag, S., & Loew, C. (2020). Making Best Systems Best for Us. *Synthese* 197(6): 2525–2550. doi:10.1007/s11229-018-1829-1

---

## 7. Earman & Roberts 2005, "Contact with the Nomic", Parts I–II

**Citations [Crossref]:**
- Earman, J., & Roberts, J. T. (2005a). Contact with the Nomic: A Challenge for Deniers of Humean Supervenience about Laws of Nature. Part I: Humean Supervenience. *Philosophy and Phenomenological Research* 71(1): 1–22. doi:10.1111/j.1933-1592.2005.tb00428.x
- Earman, J., & Roberts, J. T. (2005b). … Part II: The Epistemological Argument for Humean Supervenience. *PPR* 71(2): 253–286. doi:10.1111/j.1933-1592.2005.tb00449.x

**Status: READ** (published PPR scans, journal pagination).

**The thesis (I, abstract, p. 1):** HS says "two possible worlds cannot differ on what is a law of nature unless they also differ on the Humean base."

**The Humean base is defined epistemically (II, §4.1, p. 260).** Evidence statements must be "ascertained to be true by means of a spatiotemporally finite, nomologically reliable measurement or observation procedure". Hence "it is necessary that all veridical empirical evidence statements belong to the Humean base."

**The argument (II, §2, p. 256).**
- The rival theories:
  - T: "L is a law of nature, and X"
  - T*: "L is true but it is not a law, and X"
- Premise 1: "If HS is false, then no empirical evidence can favor T or T* over the other."
- Premise 2 (quoted in part): if semantic realism about laws is true and no empirical evidence can favour T or T* over the other, "then we cannot be epistemically justified on empirical grounds in believing that T is true."
- Conclusion (p. 257): "If you want to maintain realism about laws, you must embrace HS."
- On Premise 1, they hold that "no empirical evidence" means **no possible evidence**: "Premise 1 quantifies over all possible evidence" (p. 259).

**How Premise 2 is defended (II, §3, pp. 258–259).** It is **not** defended by the "No-Alternative-Left-Standing Argument". They reject that argument because it "effectively rules out all justified non-demonstrative inference" (p. 258). They defend it instead by a van Fraassen-style norm (p. 259): science licenses epistemic risks, "but not pointless ones that can never conflict with experience".

**Total versus partial evidence, and Hume (II, §6, pp. 278–279).**
- They frame the argument so that lawhood must supervene "on the whole Humean base" (p. 278). That is all possible evidence, not the evidence in hand.
- They raise the objection that the same reasoning, applied to "that part of the Humean base that we are aware of", would yield inductive scepticism (p. 278).
- They **deny** that it would (p. 279): "our argument would not work just as well if we replaced HS with" supervenience on the part of the base we are aware of.
  - A partial-evidence Premise 2 would need a principle "which forbids taking any epistemic risks at all".
  - Such a principle "would, of course, already impose inductive skepticism."
- **So they do not concede Hume's inductive scepticism.** Ordinary ampliative risk is fine. Only risk that no possible evidence could ever test is "pointless".
- If the paper says they "concede Hume" in the sense that finite evidence cannot settle the laws, that is misleading. They accept underdetermination by evidence in hand as ordinary inductive risk, and they argue that it does not generalise.

**Chance is explicitly left open (II, p. 263).** T and T* agree on frequencies "and even on single-case objective chances (which might not supervene on the Humean base)."

**Status of HS (II, §7, pp. 281–283):** "we suspect that we are really engaging in what van Fraassen thinks of as advocating a stance".

---

## 8. Standard probability facts

### (a) Distinct ergodic invariant measures are mutually singular: TRUE

**Textbook:** Walters, P. (1982). *An Introduction to Ergodic Theory*. Graduate Texts in Mathematics 79. New York: Springer. doi:10.1007/978-1-4612-5775-2 [Crossref].
- **Theorem 6.10(iv)** [MEMORY for the numbering]: if μ, m ∈ M(X, T) are both ergodic and μ ≠ m, then μ ⊥ m.
- Ch. 6, "Invariant Measures for Continuous Transformations", pp. 146–163 [Crossref, chapter DOI …_7].
- The shift on {0,1}^ℕ is a continuous map of a compact metric space, so the theorem applies directly.

**One-line proof, so you need not rely on the numbering.** Pick a cylinder A with μ(A) ≠ m(A). By Birkhoff's theorem, the visit frequency of A converges to μ(A) μ-a.s. and to m(A) m-a.s. The two convergence sets are disjoint and have full measure under each.

### (b) Blackwell–Dubins merging: TRUE as stated

**Citation [Crossref]:** Blackwell, D., & Dubins, L. (1962). Merging of Opinions with Increasing Information. *Annals of Mathematical Statistics* 33(3): 882–886. doi:10.1214/aoms/1177704456

**Status: SECONDARY.** The original (Project Euclid) is bot-protected. [MEMORY: the result is their Theorem 2.]
- Statement READ in Belot 2020, Prop. 4.2: if λ ≪ µ, then with λ-probability 1, lim_n sup_{A∈B} |µ(A | σ[n]) − λ(A | σ[n])| = 0.
- In the paper's notation: if P ≪ Q, then Q's conditionals merge with P's, **P-a.s.**
- The convergence is in total variation over **all** future events, not only the next outcome.
- The converse is due to Lehrer & Smorodinsky (Belot 2020, Prop. 4.3): strong merging implies absolute continuity.

### (c) Laplace mixture versus the true Bernoulli(q): the almost-sure "+O(1)" is FALSE

Let q ∈ (0,1), k = the number of 1s in xⁿ, and q̂ = k/n. Write Q for the Laplace (uniform-Beta) mixture, so Q(xⁿ) = k!(n−k)!/(n+1)!. Stirling's formula gives (my derivation; natural logs):

> log[P_q(xⁿ)/Q(xⁿ)] = ½ log n − ½ log(2π q̂(1−q̂)) − n·D(q̂ ‖ q) + o(1).

The term n·D(q̂‖q) ≈ n(q̂−q)²/(2q(1−q)) is what breaks the a.s. claim:
- **In expectation (correct):** E_P log(P/Q) = ½ log(n/2πe) + ½ log(1/(q(1−q))) + o(1). This is Clarke & Barron's result with d = 1 and a uniform prior.
- **In probability (correct):** log(P/Q) − ½ log n converges in distribution to −½ log(2πq(1−q)) − χ²₁/2. So it is O_P(1).
- **Almost surely (the claim is false):**
  - n·D(q̂‖q) is unbounded. By the LIL, limsup n·D(q̂‖q)/log log n = 1, P-a.s.
  - So almost surely log(P/Q) ≤ ½ log n + O(1).
  - But it also falls to ½ log n − (1−ε) log log n infinitely often.
  - The correct a.s. statement is **log(P/Q) = ½ log n + O(log log n)**, or simply log(P/Q)/log n → ½ a.s.
- **At the boundary:** if q ∈ {0,1}, then log(P/Q) = log(n+1), not ½ log n.
- **Simulation check** (q = 0.3, 200,000 runs at n = 10³, 10⁵, 10⁷): the mean of log(P/Q) − ½ log n was −0.637/−0.637/−0.638, against a predicted −0.6386. The SD was ≈ 0.705, matching χ²₁/2. The script is at `/tmp/claude-0/-home-claude/5e4308f6-fe95-539b-ad49-78c9865c2ca8/scratchpad/laplace_check.py`.
- **Where "+O(1)" is right, pointwise:** for *regret against the maximum-likelihood fit*, not the true q.
  - Grünwald 2005, eq. (2.23) [READ, arXiv math/0406077]: −log P̄_Bayes(xⁿ) − [−log P(xⁿ | θ̂(xⁿ))] = (k/2) log(n/2π) − log w(θ̂) + log √|I(θ̂)| + o(1), for exponential families with θ̂ in a compact interior set.

**Citations [Crossref]:**
- Clarke, B. S., & Barron, A. R. (1990). Information-theoretic asymptotics of Bayes methods. *IEEE Transactions on Information Theory* 36(3): 453–471. doi:10.1109/18.54897 [ABSTRACT]
  - Abstract: the relative entropy between the true density and the Bayes mixture is asymptotically "(d/2)(log n)+c".
- Grünwald, P. D. (2007). *The Minimum Description Length Principle*. Cambridge, MA: MIT Press. doi:10.7551/mitpress/4643.001.0001.
  - Ch. 8, "Parametric Models: Bayes", pp. 231–256 [Crossref; content MEMORY].
- Grünwald, P. D. (2005). Minimum Description Length Tutorial. In P. D. Grünwald, I. J. Myung & M. A. Pitt (Eds.), *Advances in Minimum Description Length*, pp. 23–80. MIT Press. doi:10.7551/mitpress/1114.003.0005 [READ, arXiv version].
- Rissanen, J. (1986). Stochastic Complexity and Modeling. *Annals of Statistics* 14(3): 1080–1100. doi:10.1214/aos/1176350051 [ABSTRACT: a lower bound on code length; not the a.s. upper statement].

**Recommended wording:** "the log-likelihood advantage of the true Bernoulli(q) over the Laplace mixture is ½ log n + O(1) in expectation (Clarke & Barron 1990), and grows like ½ log n almost surely."

---

## 9. Anderson 2011

**Citation [Crossref]:** Anderson, E. (2011). Democracy, Public Policy, and Lay Assessments of Scientific Testimony. *Episteme* 8(2): 144–164. doi:10.3366/epi.2011.0013. (Cambridge now hosts it; online 3 Jan 2012.)

**Status:**
- ABSTRACT: read via OpenAlex.
- SECONDARY: page-cited quotations in Levy 2025 (READ).
- MEMORY: the full list of criteria.

**Abstract (verbatim):**
- Legitimacy holds "provided citizens can make reliable second-order assessments of the consensus of trustworthy scientific experts."
- "I develop criteria for lay assessment of scientific testimony".
- The case study is anthropogenic global warming.

**Criteria.**
- [MEMORY; partly confirmed by Levy] The criteria assess the testifier's:
  - **expertise**: credentials and place in a "hierarchy of expertise" (p. 146, via Levy);
  - **honesty**: conflicts of interest, record of fraud or misrepresentation;
  - **epistemic responsibility**: peer review, data sharing, and what she calls dialogical rationality (p. 146, via Levy).
- These are used to judge whether there is a **consensus** among trustworthy experts.
- Levy also quotes her saying credentials are checkable by "a simple Google search" (p. 150).

**One-sentence summary:** Anderson argues that lay citizens can make reliable *second-order* judgments of scientific testimony. They assess experts' expertise, honesty and epistemic responsibility, and from that the consensus among trustworthy experts. Doing so is "easy for anyone of ordinary education with access to the Web" (abstract).

---

## 10. Plato: Stephanus checks

**Status: READ.** Source: the Perseus Digital Library TEI files (PerseusDL/canonical-greekLit on GitHub, the same texts Perseus serves).
- English: Lamb (Loeb) for *Meno*, *Charmides* and *Gorgias*; Fowler (Loeb) for *Statesman*.
- Greek: Burnet's OCT.
- I checked each locus in both, since the milestones in the English translations sometimes drift by a few lines.

| Reference | Verdict | Evidence |
|---|---|---|
| *Meno* 97a–c (road to Larisa) | **Confirmed** | 97a: "If a man knew the way to Larisa…" (Gk. ὁδὸν τὴν εἰς Λάρισαν, 97a). 97b: "true opinion is as good a guide to rightness of action as knowledge". 97c: "right opinion is just as useful as knowledge". Daedalus' statues follow at 97d–e. |
| *Meno* 98a (*aitias logismos*) | **Confirmed** | Gk. 98a: ἕως ἄν τις αὐτὰς δήσῃ αἰτίας λογισμῷ. Lamb: "until one makes them fast with causal reasoning". |
| *Meno* 99b–d (statesmen as soothsayers / oracle-chanters) | **Confirmed. 99b–d is fine; the comparison itself is at 99c, with the "divine" gloss at 99c–d.** | 99b: statesmen ruled not "by any wisdom". 99c: they have "nothing more to do with wisdom than soothsayers and diviners" (Gk. οἱ χρησμῳδοί τε καὶ οἱ θεομάντεις, 99c; χρησμῳδοὺς καὶ μάντεις, 99d). |
| *Meno* 86e–87b (geometers' method of hypothesis) | **Confirmed** | 86e: "examined by means of hypothesis… what the geometricians often do" (Gk. ἐξ ὑποθέσεως… οἱ γεωμέτραι). The triangle-in-circle example runs 87a–b, then the application to virtue at 87b. |
| *Charmides* 170d–171c (doctor and pretender; fellow craftsman) | **Confirmed** | The pretender is at 170e: "the man who pretends to be a doctor, but is none" (Gk. τὸν προσποιούμενον ἰατρὸν εἶναι). The fellow craftsman is at 171c: "one will only distinguish one's fellow-artist" (Gk. τὸν αὑτοῦ ὁμότεχνον). |
| *Gorgias* 459a–c (rhetorician more persuasive than doctor among the ignorant) | **Confirmed** | 459a: "the orator will be more convincing than the doctor… to the crowd". 459b: "he who does not know will be more convincing to those who do not know than he who knows". 459c: appear "to know better than those who know". (Gorgias's anecdote about his brother's patients is earlier, at 456b.) |
| *Statesman* 294a–c (law like an obstinate, ignorant man) | **Confirmed. The simile itself is at 294b–c.** | 294a: "the best thing is not that the laws be in power, but… the man who is wise and of kingly nature". 294b–c (Fowler): law is "like a stubborn and ignorant man who allows no one to do anything contrary to his command". Greek (294c in Burnet's numbering): ὥσπερ τινὰ ἄνθρωπον αὐθάδη καὶ ἀμαθῆ. "Obstinate, ignorant" is a fair rendering of αὐθάδη καὶ ἀμαθῆ. |

---

## 11. Dawid 1985, "Calibration-Based Empirical Probability"

**Citation [Crossref]:** Dawid, A. P. (1985). Calibration-Based Empirical Probability. *Annals of Statistics* 13(4): 1251–1274. doi:10.1214/aos/1176349736.
- The discussion and rejoinder run to p. 1285. Schervish's discussion is pp. 1274–1282 (per the earlier chance-ontology check).

**Status:**
- Main text NOT READ: Project Euclid's bot check blocked automated access, and I did not try to get around it.
- ABSTRACT: read via OpenAlex.
- SECONDARY: Belot 2013 (READ); Dawid 2017 (READ, arXiv v1); Roth, Tolbert & Weinstein 2023 (READ).

**Abstract (verbatim, p. 1251):** "It is shown that any two sequences of forecasts which both meet this criterion must be in asymptotic agreement."

**Exact statement, from secondary sources:**
- **Setting** (Belot 2013, §1, citing Dawid 1985 §5):
  - A *selection rule* chooses whether day k counts, "depending only on a₁, … a_{k−1} and on the forecast probability π_k".
  - A forecaster is *calibrated* for sequence a w.r.t. a rule if the mean discrepancy aₖ − πₖ on the selected days → 0 (or only finitely many days are selected).
  - A forecaster is *computably calibrated* if it is calibrated w.r.t. every computable selection rule.
- **Result:** if two **computable** forecasting systems are both computably calibrated for the same outcome sequence, then pₖ − qₖ → 0.
  - Dawid 2017, §8.1.4 (arXiv p. 24): "as k increases without limit, the difference between pk and qk must approach 0. We may term this result asymptotic identification."
  - There Dawid cites his 1982 JASA paper for this and formalises "H-based" "through the theory of computability (Dawid 1985a)".
- **Why computability matters:** to show the forecasts agree, the proof selects the days where pₖ > qₖ + ε. That rule is computable only if both forecasters are.

**Qualifications to state.**
1. **Agreement is asymptotic only.** Dawid 2017 (arXiv p. 25): one "could typically change their values for a finite number of individuals, without affecting H-validity."
2. **Existence is not guaranteed.** Dawid 2017, fn. 7: "which is however not guaranteed (Schervish 1985; Belot 2013)".
3. **The result is non-constructive.** Dawid 2017 (arXiv p. 25): "entirely non-constructive"; "there is no H-based system that can be guaranteed to be H-calibrated". §9: values available "only 'at infinity,' and even then these asymptotic values are uncomputable."
4. **The selection rules are von Mises–Church style**, weaker than Martin-Löf randomness (RTW 2023, fn. 10). Dawid himself notes this.
5. **Do not use RTW's gloss.** Roth, Tolbert & Weinstein's "agree … except on a finite subset of the data" is loose: the forecasts converge, they need not coincide eventually. Prefer Dawid's own "approach 0".

**Secondary citations [Crossref]:**
- Dawid, A. P. (2017). On individual risk. *Synthese* 194(9): 3445–3474. doi:10.1007/s11229-015-0953-4
- Belot, G. (2013). Failure of calibration is typical. *Statistics & Probability Letters* 83(10): 2316–2318. doi:10.1016/j.spl.2013.06.024

---

## 12. Levy 2025, "No Trespassing!"

**Citation [Crossref]:** Levy, N. (2025). No Trespassing! Abandoning the Novice/Expert Problem. *Erkenntnis* 90(5): 2077–2094. doi:10.1007/s10670-024-00794-8. First published online 8 March 2024; open access.

**Status:**
- READ: local PMC text.
- **Page:** from a tool reading of the publisher PDF. Springer and PMC PDF downloads were blocked by bot challenges.

**The sentence is verbatim and confirmed:**
> "We actually deploy the criteria to extend our trust, rather than in a way that could ground it." (p. **2089**, §4 "Trusting the Expert")

**Cross-check of the page.**
- The tool reported that p. 2089 begins "…as well as we can be expected to. We can't deploy them better because it…". That is the end of the paragraph immediately before the target sentence in the local text.
- It reported that p. 2090 begins "…because they extend their trust from unreliable sources, institutions, and people to the new case." That comes two paragraphs later.
- Both boundary strings match the local text and bracket the sentence. So p. 2089 is reliable.

---

## Consolidated references (Crossref-checked)

- Anderson, E. (2011). Democracy, Public Policy, and Lay Assessments of Scientific Testimony. *Episteme* 8(2): 144–164. doi:10.3366/epi.2011.0013
- Belot, G. (2013). Failure of calibration is typical. *Statistics & Probability Letters* 83(10): 2316–2318. doi:10.1016/j.spl.2013.06.024
- Blackwell, D., & Dubins, L. (1962). Merging of Opinions with Increasing Information. *Annals of Mathematical Statistics* 33(3): 882–886. doi:10.1214/aoms/1177704456
- Clarke, B. S., & Barron, A. R. (1990). Information-theoretic asymptotics of Bayes methods. *IEEE Transactions on Information Theory* 36(3): 453–471. doi:10.1109/18.54897
- Dawid, A. P. (1985). Calibration-Based Empirical Probability. *Annals of Statistics* 13(4): 1251–1274. doi:10.1214/aos/1176349736
- Dawid, A. P. (2017). On individual risk. *Synthese* 194(9): 3445–3474. doi:10.1007/s11229-015-0953-4
- Dorst, C. (2019). Towards a Best Predictive System Account of Laws of Nature. *BJPS* 70(3): 877–900. doi:10.1093/bjps/axy016
- Dorst, K., Levinstein, B. A., Salow, B., Husic, B. E., & Fitelson, B. (2021). Deference Done Better. *Philosophical Perspectives* 35(1): 99–150. doi:10.1111/phpe.12156
- Earman, J., & Roberts, J. T. (2005). Contact with the Nomic … Part I: Humean Supervenience. *PPR* 71(1): 1–22. doi:10.1111/j.1933-1592.2005.tb00428.x
- Earman, J., & Roberts, J. T. (2005). Contact with the Nomic … Part II: The Epistemological Argument for Humean Supervenience. *PPR* 71(2): 253–286. doi:10.1111/j.1933-1592.2005.tb00449.x
- Genin, K., & Kelly, K. T. (2017). The Topology of Statistical Verifiability. *EPTCS* 251 (TARK 2017): 236–250. doi:10.4204/EPTCS.251.17
- Grünwald, P. D. (2005). Minimum Description Length Tutorial. In *Advances in Minimum Description Length*, pp. 23–80. MIT Press. doi:10.7551/mitpress/1114.003.0005
- Grünwald, P. D. (2007). *The Minimum Description Length Principle*. MIT Press. doi:10.7551/mitpress/4643.001.0001
- Hall, N. (1994). Correcting the Guide to Objective Chance. *Mind* 103(412): 505–517. doi:10.1093/mind/103.412.505 (Crossref: 505–518)
- Hall, N. (2004). Two Mistakes About Credence and Chance. *Australasian Journal of Philosophy* 82(1): 93–111. doi:10.1080/713659806
- Hoefer, C. (2007). The Third Way on Objective Probability: A Sceptic's Guide to Objective Chance. *Mind* 116(463): 549–596. doi:10.1093/mind/fzm549
- Hoefer, C. (2019). *Chance in the World: A Humean Guide to Objective Chance*. Oxford University Press. doi:10.1093/oso/9780190907419.001.0001
- Jaag, S., & Loew, C. (2020). Making Best Systems Best for Us. *Synthese* 197(6): 2525–2550. doi:10.1007/s11229-018-1829-1
- Kavaler, I., & Smorodinsky, R. (2019). On comparison of experts. *Games and Economic Behavior* 118: 94–109. doi:10.1016/j.geb.2019.08.005
- Levy, N. (2025). No Trespassing! Abandoning the Novice/Expert Problem. *Erkenntnis* 90(5): 2077–2094. doi:10.1007/s10670-024-00794-8
- Lewis, D. (1994). Humean Supervenience Debugged. *Mind* 103(412): 473–490. doi:10.1093/mind/103.412.473
- Rissanen, J. (1986). Stochastic Complexity and Modeling. *Annals of Statistics* 14(3): 1080–1100. doi:10.1214/aos/1176350051
- Thau, M. (1994). Undermining and Admissibility. *Mind* 103(412): 491–504. doi:10.1093/mind/103.412.491
- Walters, P. (1982). *An Introduction to Ergodic Theory*. GTM 79. Springer. doi:10.1007/978-1-4612-5775-2

---

## Sources consulted online

- Dorst et al., accepted manuscript (ORA): https://ora.ox.ac.uk/objects/uuid:b9883828-b536-4ed5-b043-fb1f66b5a10e
- Genin & Kelly (arXiv/EPTCS): https://arxiv.org/abs/1707.09378
- Lewis 1994 (JSTOR scan on a course page): https://mail.joelvelasco.net/teaching/3865/
- Earman & Roberts I–II (course page scans): https://mail.joelvelasco.net/teaching/5330/earmanroberts05-contactwithnomic1.pdf and https://mail.joelvelasco.net/teaching/5330/earmanroberts05-contactwithnomic2.pdf
- Hoefer 2007 preprint (tool reading only): https://philsci-archive.pitt.edu/3415/1/Thirdway-Final-Mind.pdf
- Dawid 2017 (arXiv): https://arxiv.org/abs/1406.5540
- Grünwald MDL tutorial (arXiv): https://arxiv.org/abs/math/0406077
- Levy 2025 (Springer OA PDF, tool reading for pagination): https://link.springer.com/content/pdf/10.1007/s10670-024-00794-8.pdf
- Perseus TEI texts: https://github.com/PerseusDL/canonical-greekLit
- Dorr, seminar notes "The New Principle": https://pages.nyu.edu/dorr/teaching/laws/Seminar5.pdf
- Schwarz, "Can evidence be inadmissible?": https://www.umsu.de/blog/2008/534
- Unreachable: Project Euclid (Dawid 1985; Blackwell–Dubins), Wiley (Dorst et al. VoR), Mind/JSTOR/PhilArchive (Hall 1994), and OUP (Hoefer 2019, HTTP 429).
