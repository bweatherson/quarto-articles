# Canon check: priority and antecedents for the candidate reply to Meehan & Zhang, "Bayes Is Back"

Checked 2026-10-23 against `process/candidate.md` (six formal points plus dialectic).
Target: Meehan & Zhang, "Bayes Is Back", *Philosophical Review* 134(3): 285–350 (2025), DOI 10.1215/00318108-11873775. M&Z page numbers below are the published ones, from `research/texts/mz-published.txt`.

Labels: **anticipates** means the source states the candidate's claim, or an equivalent of it. **Partly anticipates** means it states a special case, the informal content, or the key ingredient. **Related but different** means it is on the same phenomenon but makes a different claim.

## Access notes (read first)

- **PhilArchive.** PhilArchive downloads by curl return a Cloudflare challenge. The stray file `research/texts/oa/dl_WEAMAE` is one of these challenge pages, not a paper. WebFetch could read two PhilArchive PDFs: Isaacs & Russell (ISAUWE) and the Gallow draft (GALUFE). After that PhilArchive refused WebFetch as well. I did not try any workaround: no dc2 mirror, no Wayback copy, no CAPTCHA.
- **Other blocked sites.** PhilSci-Archive rejected both tools. Project Euclid (Heitjan & Rubin 1991) returned an Incapsula bot-check. Princeton (Elga) and discovery-pp.ucl returned Cloudflare pages. Wiley rejected both tools. The UVic repository (Oller et al.) returned an Anubis bot-check. DSpace bitstreams returned 429. OpenAlex's anonymous budget ran out, and I did not request a key.
- **Quotes obtained through WebFetch.** These are marked "[WebFetch]": Isaacs & Russell, Gallow, Carr. They came through the fetch tool's extraction, which is limited to quotes of about 125 characters. Check them against the PDFs before printing.
- **Versions.** Several sources are penultimate drafts or accepted manuscripts. Page numbers for those are draft pages and are labelled as such.

---

## Q1. Is candidate point 3 ("margins ⇒ not CAR") already in the literature?

**Short answer.** I found no source that states it: that learning which respects a margin is CAR only if every learned proposition is R-closed, and so, on a connected scale, only if nothing is learned. But three things are close.

- **(a)** It is a one-line corollary of the standard characterisation of CAR (Gill, van der Laan & Robins 1997; Grünwald & Halpern 2003, Thm 3.1(d)). In M&Z's own terms it follows from their Lemma 2 (p. 345).
- **(b)** Its single-situation special case is M&Z's Fact 12 (p. 338): a deterministic learning situation is extensional iff it is transparent.
- **(c)** The structural fact behind it is well known in the clock literature and is used there for other purposes. The fact is that margin evidence is had only at its centre (or interior), so its shape locates the truth. The sources are Williamson 2014, Salow 2018, Ahmed & Salow 2019 and Das 2023.

What is new is the general statement: it covers any weighting over any margin-respecting learning situations, including wider-than-margin evidence and mixtures. Also new is its use against M&Z's extensionality.

### 1A. Statistics literature on CAR

**Gill, van der Laan & Robins 1997.** "Coarsening at random: characterizations, conjectures, counter-examples", in *Proc. First Seattle Symposium in Biostatistics*, Lecture Notes in Statistics 123: 255–294, DOI 10.1007/978-1-4684-6316-3_14. Not accessed directly; its characterisation is reproduced by Grünwald & Halpern 2003. **Partly anticipates (supplies the criterion).**

**Grünwald & Halpern 2003.** "Updating probabilities", *JAIR* 19: 243–278, DOI 10.1613/jair.1164. I read the arXiv version, cs/0306124; pages below are arXiv pages.
- Thm 3.1 (attributed to GvdLR 1997), arXiv p. 8. Condition (d): "Pr(XO = U | XW = w) = Pr(XO = U | XW = w′) for all w, w′ ∈ U such that Pr(XW = w) > 0 and Pr(XW = w′) > 0".
- Gloss on the same page: "the probability that w is coarsened to U is the same for all w ∈ U".
- Point 3 is immediate from this. Under margin-respect, Pr(observe U | w) = 0 whenever R(w) ⊄ U, so CAR forces every observed U to be R-closed.
- GH also show that overlapping observations push CAR into degenerate cases. Ex. 3.3 (p. 9): CAR "cannot hold for both U1 and U2 unless Pr(XW ∈ U1 ∩ U2) is either 0 or 1". See also Thm 4.4 (p. 12), and §4.4 (p. 15): "We may summarize this as 'sometimes CAR is nothing'".
- Prop. 4.1 (p. 10): "The CAR condition holds for all distributions Pr on R if and only if O consists of pairwise disjoint subsets of W". This is the analogue of M&Z Fact 12.
- GH's "CARgen" procedure (p. 15) picks a partition ("sensor") independently of the world. This is exactly M&Z's remark (p. 336) that positive combinations of transparent learning situations are extensional.
- **Verdict: partly anticipates** (the criterion, and the "CAR is often degenerate" theme). GH say nothing about margins.

**Gill & Grünwald 2008.** "An algorithmic and a geometric characterization of coarsening at random", *Annals of Statistics* 36(5): 2409–2422. Saved as `oa/gill-grunwald2008-arxiv.pdf`.
- p. 2410: CAR "precisely characterizes when one can ignore the distinction between the fact that an event has been observed, and the fact that an event has happened". This is a good framing quote for the paper.
- They show that CAR mechanisms are exactly mixtures of "uniform multicovers" (pp. 2414–2415). These are families of sets that cover every point the same number of times.
- **Related but different.** It is useful for point 2: "report a uniformly random true proposition" is a uniform multicover. Nothing on margins.

**Jaeger 2005.** "Ignorability for categorical data", *Annals of Statistics* 33(4): 1964–1981. arXiv copy saved. **Related but different.** It concerns CAR and parameter distinctness; I found nothing on interval or margin structure.

**Heitjan & Rubin 1991.** "Ignorability and coarse data", *Annals of Statistics* 19(4): 2244–2253, DOI 10.1214/aos/1176348396. **Not accessed** (bot-check). It is the source of the definition; cite it for the definition only.

**Oller, Gómez & Calle 2004.** "Interval censoring: model characterizations for the validity of the simplified likelihood", *Canadian Journal of Statistics* 32(3): 315–326, DOI 10.2307/3315932. This is the "constant-sum" condition for interval-censored data. **Not accessed** (bot-check); citation verified via Crossref only.

**On "interval censoring with error" with the truth bounded away from the edges.** I found no published result stated that way. The closest correct statement is the converse case:
- Uniform measurement error within the margin is CAR. The reported interval contains the truth anywhere in it, including at the edge, with uniform likelihood.
- So conditionalising on the reported interval is then optimal. This is Easwaran & Nielsen 2025 p. 1129 and Isaacs & Russell's clock (§3 below).
- Interval-generating mechanisms that keep the truth off the edge (centred or margin-respecting) are not CAR by GH Thm 3.1(d).

The paper should present point 3 as this corollary, not as a deep theorem.

### 1B. Philosophy literature, source by source

**Williamson 2014**, "Very improbable knowing", *Erkenntnis* 79: 971–999. Saved from the *Philosopher's Annual* reprint, which keeps the Erkenntnis pagination. **Partly anticipates (the structural fact).**
- On the clock with margin h: "R(w) is an interval with w as its midpoint" (p. 980).
- "We can prove that R(w) is known only at w" (p. 980). The evidential probability of knowing R(w) is therefore 1/(2h+1) (p. 980).
- This is the single-situation fact that the evidence is had only at its centre. Williamson uses it to show improbable knowing, while endorsing conditionalisation. He draws no accuracy or CAR moral.

**Williamson 2011**, "Improbable knowing", in Dougherty (ed.), *Evidentialism and its Discontents*, OUP, 147–164. **Not accessed.** It is the same clock argument in an earlier form.

**Salow 2018**, "The externalist's guide to fishing for compliments", *Mind* 127(507): 691–728. Penultimate draft from Salow's site; pages are draft pages. **Partly anticipates (conceptually closest).**
- The popularity-clock exploits exactly the edge asymmetry. The friend sets the hand at 53 if I am popular, otherwise at 52 or 54, and conditionalising on margin evidence then yields "a no-lose investigation" (pp. 22–23).
- He blames the margin description: "The culprit, I think, was to identify my evidence with the strongest claim I am reliable about given the actual setting" (p. 23).
- He offers a best-guess model instead, in which "talk of 'margins for error' [is] talk about the maximum distance between my best guess and the actual hand" (p. 23). That is the guess-centred, edge-allowing model.
- fn 25 (p. 21): evidence "presumably ... also supports the remaining possibilities to a degree which is proportional to their proximity to the true value".
- No CAR, no accuracy, no theorem. But the contrast "truth-centred evidence is exploitable; guess-centred is not" is the informal counterpart of points 3 and 5. **Must cite.**

**Ahmed & Salow 2019**, "Don't look now", *BJPS* 70(2): 327–350. Draft from ORA; pages are draft pages. **Partly anticipates (structural fact; centre-weighted update; see Q4).**
- On the clock: "you could combine it with your knowledge of the setup to infer that D = 52, since that is the only case in which you get this evidence" (p. 6). Conditionalising on margin evidence is misleading about parity (p. 6).

**Das 2023**, "The value of biased information", *BJPS* 74(1): 25–55. UCL accepted manuscript; pages are AAM pages. **Related but different.**
- Conditionalisation plus non-partitional evidence allows "rationally biased inquiries".
- fn 13 (p. 19) on Williamson's clock: the agent "is antecedently certain that her evidence will be misleading with respect to whether the minute hand is pointing to an odd number or an even number".
- No CAR, no margin theorem.

**Das 2019** ("Accuracy and ur-prior conditionalization", *RSL* 12(1): 62–96) and **Das 2022** ("Externalism and exploitability", *PPR* 104(1): 101–128). UCL copies read. **Related but different**: nothing on margins beyond a passing mention, and nothing on CAR or interior updating.

**Dorst 2020**, "Evidence: a guide for the uncertain", *PPR* 100(3): 586–632. Read as ch. 2 of Dorst's 2019 MIT dissertation *Modest Epistemology*; pages are dissertation pages. **Related but different.**
- Trust rules out "Effacing Evidence", which "natural versions of Williamson's (2014) unmarked clock model" generate: "If I am right, no such theory can be correct" (diss. p. 60).
- This rejects margin models on value-of-evidence grounds. No CAR or interior point.

**Dorst, Levinstein, Salow, Husic & Fitelson 2021**, "Deference done better", *Phil Perspectives* 35: 99–150. ORA draft read. **Not relevant** to point 3.

**Goodman & Salow 2023**, "Epistemology normalized", *Phil Review* 132(1): 89–145. ORA draft read. **Related but different.**
- It uses Williamson's 2013 measurement models: Bjorn's scale reading as evidence, knowledge as an interval around it. This bears on the candidate's appearance-centred illustration.
- No probabilistic updating rule, CAR, or interior point.

**Gallow 2021** and **Isaacs & Russell 2023**: see Q3. **Partly anticipate point 1** (likelihood or misfire-weighted optimal plans). Neither states point 3.
- Isaacs & Russell's clock assumes uniform guess error, which is a CAR, edge-allowing model.
- Gallow's clock (2018 draft p. 27) gives a centre-weighted posterior.

**Carr 2021**, "A modesty proposal", *Synthese* 198(4): 3581–3601. [WebFetch] of Carr's uncorrected proof; section numbers, as no page numbers were available. **Related, and supports point 5's diagnosis.**
- In her clock model (§6.1) the prior "distributes credence equally among the possible ⟨wi, ej⟩-pairs". This gives "equal probability to ⟨wi−1, ei⟩, ⟨wi, ei⟩, and ⟨wi+1, ei⟩", which yields 1/3 on each position "as desired".
- That is a CAR weighting which puts weight on pairs where the truth is at the edge of the evidence. These are exactly the margin-violating pairs.
- She notes her framework "merely allows, rather than mandates, transparent modesty" (§6.3).
- Easwaran & Nielsen (p. 1114) summarise Carr: "The result she endorses always recommends that agents conditionalize on the proposition that is their evidence."
- **Must cite**: it is the clearest published case of the edge-weighting the candidate diagnoses.

**Easwaran & Nielsen 2025**, *JPL* 54: 1095–1134. **Partly anticipates points 1–2 and the CAR condition; related to point 3.**
- p. 1120: conditioning on signal and on worldly set coincide only as "a misleading artifact of the fact that for every signal, every world that gives it a non-zero probability gives it the same probability. (This fact is a generalization of Theorem 4 of Isaacs and Russell.)" That is CAR in words.
- p. 1129: with "a precise margin for error, and uniform probability of updating on any signal within that interval from the true position ... the update is equivalent to conditionalizing on this set of worlds."
- That uniform-within-margin model is CAR because it lets the truth sit anywhere in the signal's worldly content, edges included. It is the edge-allowing counterpart of the candidate's margin-respecting model.

**Schultheis 2025** ("Accurate updating", *Phil Sci* 92: 324–343) and **Medina 2023** ("Just as planned: Bayesianism, externalism, and plan coherence", *Phil Imprint* 23(28); M&Z cite it as 2024). Local texts read. **Not relevant** to point 3: nothing on margins, interiors or CAR.

**Bronfman 2014** (*Erkenntnis* 79(4): 871–892), **Elga 2013** (*Phil Studies* 164(1): 127–139), **Williamson 2013** ("Gettier cases in epistemic logic", *Inquiry* 56(1): 1–14), **Weatherson 2013** ("Margins and errors", *Inquiry* 56(1): 63–76). **Not accessed**; see the PDF list.
- PhilPapers gives Bronfman's abstract as arguing that "Conditionalization goes wrong in those cases" (KK failures). Whether he proposes a replacement rule is unverified, and it matters for Q4.
- Elga's New Rational Reflection treatment of the clock is, from M&Z p. 322 and general knowledge, related but different. I have not verified it.

**M&Z themselves.**
- Fact 12 (p. 338) is the deterministic special case.
- Lemma 2 (p. 345) is "extensional ⇔ π(·|λp) = π(·|p)".
- fn 21 (p. 311) concedes, of opaque Monty Hall: "In that case, it is less obvious that the standard solution still applies". There they discuss Pearl's remark that "we must also consider what information could have been reported", which is the CAR insight.
- p. 337 voices the likelihood objection as the non-Bayesian's "incredulous stare": "it also matters how likely it is for one to learn p at s".
- The candidate should engage fn 21 and p. 337 directly.

### 1C. Verdict on point 3

- **New** as a general claim about weightings over margin-respecting learning, and in its use against M&Z's extensionality "bedrock" (p. 337).
- **Formally trivial** given GvdLR/GH Thm 3.1(d) or M&Z Lemma 2 (p. 345). Present it as a corollary and cite them.
- **Informally anticipated** in its single-situation core by Williamson 2014 (p. 980), Salow 2018 (pp. 21–23) and Ahmed & Salow 2019 (p. 6).
- The point that CAR weightings must put the truth at the edge is implicit, but not stated, in Carr 2021 §6.1, Isaacs & Russell's clock, and Easwaran & Nielsen p. 1129.

---

## Q2. Published or posted replies to "Bayes Is Back" (2025–2026)

**1. Pettigrew, "Bayesianism when learning isn't straightforward"**, *Richard's Substack*, 20 Dec 2025, https://richardpettigrew.substack.com/p/bayesianism-when-learning-isnt-straightforward. Saved as `oa/pettigrew2025-substack.txt`, with comments in `oa/pettigrew2025-substack-comments.json`. It is an exposition and endorsement with two limitations:
- "This is a limitation of Meehan and Zhang's approach". This is on factivity: with non-factive evidence functions included, the prior beats conditionalisation under Brier.
- "It's also worth noting that Meehan and Zhang's result relies on you thinking each evidence function is equally likely."

**2. Kenny Easwaran, comment on that post**, 20 Dec 2025, 15:33 UTC. Full text retrieved through Substack's public comments endpoint.
- "I think it is basically equivalent to assuming you are equally likely to be using it in any of these situations and then taking the expected accuracy."
- "we can reconstruct a version of their picture in ours if we think each signal must be a proposition that is true in the actual world, but that which proposition is received as the signal is chosen uniformly at random from the set of all propositions true at the world."
- He also says he forgot to discuss M&Z in Easwaran & Nielsen 2025.

**3. Other comments in the thread.** Thornley, Muñoz and Pettigrew (21 Dec 2025) add nothing substantive. Pettigrew says he will discuss M&Z and Easwaran & Nielsen "in the book" (a forthcoming Pettigrew book; title not given).

**Nothing else found.**
- Citation indices: Crossref "is-referenced-by-count" is 1 and OpenAlex `cited_by_count` is 1 (work W4413269783). I could not identify the citing work: OpenAlex was rate-limited and PhilPapers' citations page disallows robots. Semantic Scholar lists 0 citations.
- Searches of blogs, PhilEvents and PhilPapers results turned up no critique or reply. Schultheis 2025 and Easwaran & Nielsen 2025 do not cite M&Z 2025; E&N cite M&Z 2020.
- The *Philosopher's Annual* vol. 45 selection is confirmed (Leiter Reports, 30 Aug 2026).
- **Suggest BW check by hand**: the PhilPapers "citations of this work" page for MEEBIB, and Google Scholar "cited by".

---

## Q3. Isaacs & Russell's Theorem 4; Gallow's result

### Isaacs & Russell 2023

"Updating without evidence", *Noûs* 57(3): 576–599, DOI 10.1111/nous.12426. [WebFetch] of the PhilArchive preprint; pages are preprint pages. I have **not** seen the Noûs pagination.

**Setup.**
- A *rule* is f : S → PS. The conditionalisation rule cond_{P,E} sends s to P(− | E(s)), where E is a **partition** of S (p. 23).
- A stochastic guess model has a joint "guess distribution" P ∈ P(S × S). P(s,t) is the probability of being in s while guessing t (Def. 2, p. 25).
- The plan is applied to the guess, not the actual state.

**Theorem 4 (App. D, p. 29), exact passages.**
- "Consider a stochastic guess model with (state-regular) guess distribution P ∈ P(S × S)."
- P0 is the marginal on states, P0(s) = Σ_t P(s,t). "Let c(s,t) be the conditional probability of guessing state t while in state s", with c(s,t) = P(s,t)/P0(s).
- "Then the conditionalization rule condP0,E is optimal iff both of the following two conditions hold:"
  - "(a) c(s,t) = 0 whenever s and t are not in the same cell of E; and"
  - "(b) c(s,t) = c(s′,t) whenever s, s′, t are all in the same cell of E."

**Informal gloss (pp. 18–19).** The two conditions are "perfect sensitivity" ("your guess state is certain to be in the same E-cell as the actual state") and insensitivity within a cell. Then: "But these conditions are not realistic in general; when they fail, nothing plays this classical role."

**Theorem 3 (p. 26).** For stochastic guess models, the unique optimal rule takes guess t to the guess distribution conditioned on "my guess is t", marginalised to states. This is the likelihood-weighted rule.

**Their clock (pp. 6–8).** The guess is n−1, n or n+1, each with probability 1/3, so the arrows are labelled 1/3. Then "the rule that uniquely maximizes expected accuracy really is conditionalization on E(n) in each state n." This is uniform, edge-allowing error, so CAR holds.

**Relation to the candidate.** Theorem 4 is CAR for a partition-valued report; E&N (p. 1120) call their condition "a generalization of Theorem 4". Condition (b) is the analogue of M&Z's extensionality. It **partly anticipates point 1**.

### Gallow 2021

"Updating for externalists", *Noûs* 55(3): 487–516, DOI 10.1111/nous.12307. I accessed **only the PhilArchive draft "of October 15, 2018"** via [WebFetch]; pages are draft pages. **The published version may differ.** Schultheis 2025 (p. 340, fn 24) says Gallow's rule is one "which he calls Update Conditionalization", whereas the draft calls it "excondi" ("externalist conditionalization").

**Definitions (pp. 20–21).**
- "If experience teaches that e and no more, then say that e is your total experiential evidence, and write 'Te'."
- "In response to an experience teaching that e, you plan to adopt a new credence function—call it 'Ce'", "and let 'Ue' be the proposition that you have updated to Ce."

**Rule (p. 27).** "(excondi) Ce(ϕ) = Σ_{f∈E} C(ϕ | Tf) · C(Tf | Ue)". This is a Jeffrey shift on the T-partition with weights C(Tf | Ue) ∝ C(Tf)·C(Ue | Tf), so it is likelihood-weighted.

**Result (Appendix, p. 34).** "Proposition 1. excondi is the available mixed update strategy which maximizes expected accuracy," "given any strictly proper, additive, and extensional measure of accuracy." "Extensional" here is a property of accuracy measures, not M&Z's extensionality; flag this terminological clash if both appear.

**The "misfire" probabilities** are the C(Uf | Te). The draft does not use the word "misfire". It speaks of planned updates going "awry": "you modestly foresee the possibility that you err, either clockwise or counterclockwise by a single position" (p. 23). "Misfire" is E&N's gloss (p. 1116) and Schultheis's (p. 327 fn 7: "flawless dispositions and (potentially) misfiring dispositions").

**Clock example (p. 27), four positions.** Experience teaches the exact position; with 80% you adopt C2 correctly, with 10% each you adopt C1 or C3.
- Resulting credences: "most likely at position 2 (80%)" and "10% each" at 1 and 3.
- "your total experiential evidence is that the clock hand is at 2, T2, your total certainty evidence is merely that it is not at 4, T¬4."
- So Williamson's margin evidence {1,2,3} appears as the support of a **centre-weighted** posterior (see Q4).

**Further reading.** Schultheis (pp. 339–340) reconstructs Gallow's argument as showing "Guess Conditionalization", g(C, GE(w)) = C(· | GE = GE(w)), best for fallible agents, and criticises its "guess-infallibility" premise. Medina 2023 notes that "his rule collapses into a-e conditionalization for ideal agents who know that they will correctly follow their plan" (Medina; no page numbers in the XML version).

**Needs BW:** the published Gallow PDF, to quote the published proposition and rule name.

---

## Q4. Is the "interior" update, or a centre-weighted update for inexact evidence, proposed anywhere?

**The exact interior rule: not found.** That rule conditionalises on int(p) = {s : R(s) ⊆ p}, with boundary weights N(s)^{-1}. Note that int(p) is the knowledge operator applied to p when R is epistemic accessibility, so the rule is "conditionalise on K(evidence)". I found no proposal of it, but I could not check Bronfman 2014. Four nearby things:

- **(i) Coincidence with meta-cond in Williamson's clock.** There the interior of R(w) is {w}, so the rule coincides with meta-conditionalisation and the truth rule. Schoenfield 2017 observed this for meta-cond; see also Williamson 2014 p. 980 and Ahmed & Salow p. 6, which reject the inference as implausible.
- **(ii) Coincidence with M&Z's one-shot rule.** On Dana the rule coincides with M&Z's own "one-shot rule" (pp. 325–326), which M&Z present as a foil.
- **(iii) Mimicry is already in M&Z.** They say "for every updating problem, one can find one updating rule that satisfies global evidential constancy and 'mimics' META-COND for that updating problem" (p. 327).
- **(iv) No accuracy derivation exists.** The candidate's derivation from Hi-TEA restricted to margin-respecting situations is not in the literature.

**Centre-weighted updates for inexact evidence.** **Partly anticipated**, in several places:

- **Ahmed & Salow 2019, draft p. 8 ("Third Objection").** "More likely you concentrate on central values within the range of still-live possibilities." Cr*(D=51) = 0.1, Cr*(D=52) = 0.8, Cr*(D=53) = 0.1.
  - fn 12: "That you shift to Cr* is inconsistent with simple Bayesian updating on D ∈ {51,52,53} given a uniform prior", modelled as Jeffrey conditionalisation.
  - They grant it only for argument: "Grant that a glance adjusts your credence to some Cr* symmetric about and modal at the true value of D".
  - Because clock evidence determines the position, this Cr* is a function of the evidence proposition, hence globally evidentially constant (GEC). It is exactly the candidate's softened rule (1−ε)·interior + ε·conditionalisation at ε = 0.3: (ε/3, 1−2ε/3, ε/3) = (0.1, 0.8, 0.1).
- **Gallow 2018 draft, p. 27.** The same 80/10/10 posterior, derived from misfire probabilities (above).
- **Easwaran & Nielsen 2025.**
  - pp. 1120–1121: signal likelihoods 1/4, 1/2, 1/4, "more likely in the middle one of the three. In many ways, this actually seems like a more natural description of the situation with a real unmarked clock". "The optimal update rule disagrees with conditionalization on this proposition, or on any proposition in F."
  - p. 1129: a cosine density that "fades away to zero at distance ε"; the update "is not equivalent to conditionalization on any proposition in F".
  - These are centred on the signal, not derived from margins.
- **Salow 2018, fn 25 (draft p. 21).** Support "proportional to their proximity to the true value" (passing remark).
- **Not checked, but reported by E&N as giving the same likelihood-weighted rule:** Konek 2023, "The art of learning", *OSE* 7: 71–133 (E&N p. 1121); Bacon 2018, *Vagueness and Thought*, ch. 6 and §8.1 (E&N p. 1119 fn 25); Meehan & Zhang 2020, "Jeffrey meets Kolmogorov", *JPL* 49(5): 941–979 (E&N p. 1126).

---

## Other points: antecedents

**Point 1 (reduction; optimal GEC rule ∝ π·λp; equals bcond iff CAR): anticipated.**
- M&Z's own Lemma 1 (p. 344) and Lemma 2 (p. 345) give the formula and the equivalence; the candidate already cites Lemma 1.
- M&Z p. 337 voice the likelihood objection.
- Easwaran's comment gives the informal equivalence to signal and likelihood updating.
- The same-shape optimality results are E&N §4.4 (pp. 1118–1119; p. 1126: "sets the posterior of each world proportional to its prior, multiplied by the likelihood it gives the signal"), I&R Thms 3–4, and Gallow Prop. 1.
- The CAR ⇔ naive-conditioning equivalence is GH Thm 3.1.
- **New only:** the explicit label "extensionality = CAR" with the statistics citations, and the "auxiliary transparent problem" gloss. Easwaran's "signal" reconstruction is essentially that gloss.

**Point 2 (uniform measure is CAR; any permutation-invariant weighting is CAR): partly anticipated.**
- M&Z p. 336: "Any positive, constant weighting function is trivially extensional in this sense". Fact 9 (p. 329) is the same fact in computational form.
- Easwaran's comment: uniform choice among true propositions.
- GG 2008: uniform multicovers.
- The permutation-invariance generalisation and the diagnosis that the measure "treats S as unstructured" are new but elementary.

**Point 4 (interior rule; Brier and log favour it; concave mixtures beat bcond).**
- Rule: see Q4 (not found in this form; centre-weighted relatives exist).
- The concave-mixture argument is M&Z's own Fact 4 technique (p. 304), redeployed; cite it as such.

**Point 5 (only 1/3 of pairs respect margin 1 on a 6-point scale; → 1/4; 4^{-m}; CAR needs edge weight).**
- The numbers are new.
- The diagnosis is **partly anticipated in substance** by Salow 2018 (truth-centred evidence is exploitable; guess-centred is not). It is **implicit** in Carr §6.1, I&R's clock and E&N p. 1129, which use edge-allowing uniform weightings and get conditionalisation.

**Point 6 (GEC does not block meta-cond's verdicts in margin cases).**
- **Partly anticipated by M&Z** (pp. 325–327: one-shot rule; "mimics" META-COND).
- **New:** a single, structurally defined GEC rule does this across all margin problems and is TEA-optimal under margin weighting.
- **Prepare for M&Z's reply** that one-shot-type rules do badly in other problems (Noah; left-hand Dana).

**Dialectic.**
- The frequency or credence readings of λ are anticipated by Pettigrew ("equally likely") and Carr (prior over ⟨w, e⟩ pairs).
- "Primitive evidential probability" is Williamson 2000 / Das 2022, as the candidate says.
- The appearance-centred illustration should cite Williamson 2013, Cohen & Comesaña 2013 ("Williamson on Gettier cases and epistemic logic", *Inquiry* 56(1): 15–29), Weatherson 2013, and Goodman & Salow 2023. Salow 2018 pp. 23–24 also uses a best-guess version.

---

## What the paper must cite

**Statistics (for CAR).**
- Heitjan & Rubin 1991 (definition)
- Gill, van der Laan & Robins 1997 (characterisation)
- Grünwald & Halpern 2003 (Thm 3.1, Ex. 3.3, Prop. 4.1, §4.4, CARgen)
- Gill & Grünwald 2008 (optional framing)

**Same-shape optimality results.**
- Easwaran & Nielsen 2025 (§4.4–4.5; pp. 1120, 1129)
- Isaacs & Russell 2023 (Thms 3–4; clock)
- Gallow 2021
- Konek 2023
- Carr 2021
- Easwaran's Substack comment (20 Dec 2025) and Pettigrew's post

**M&Z themselves.**
- Lemmas 1–2 (pp. 344–345)
- Facts 9, 11, 12 (pp. 329, 337, 338)
- fn 21 (p. 311)
- p. 337 "incredulous stare"
- pp. 325–327 one-shot and "mimics"

**Margin and clock structure.**
- Williamson 2011, 2014 (p. 980)
- Salow 2018 (pp. 21–23)
- Ahmed & Salow 2019 (pp. 6, 8)
- Das 2023 (fn 13)
- Schoenfield 2017
- Dorst 2020 (Effacing Evidence; optional)

**Centre-weighted updating.**
- Ahmed & Salow 2019 (Third Objection)
- Gallow (clock)
- E&N (centre-peaked clock; cosine dial)

---

## Needs a PDF from BW (exact citations; priority order)

1. Gallow, J. Dmitri (2021). Updating for externalists. *Noûs* 55(3): 487–516. DOI 10.1111/nous.12307. Needed for the published statement of the main proposition and the rule name; only the 2018 draft was read.
2. Isaacs, Yoaav & Jeffrey Sanford Russell (2023). Updating without evidence. *Noûs* 57(3): 576–599. DOI 10.1111/nous.12426. Needed for published page numbers for Theorem 4 (App. D) and the clock (§II); preprint read via WebFetch only.
3. Bronfman, Aaron (2014). Conditionalization and not knowing that one knows. *Erkenntnis* 79(4): 871–892. DOI 10.1007/s10670-013-9570-0. Needed to check whether he proposes conditionalising on what one knows one knows, i.e. the interior rule; not accessed.
4. Carr, Jennifer Rose (2021). A modesty proposal. *Synthese* 198(4): 3581–3601. Needed for published page numbers for §6.1 (clock, equal weights on ⟨w_{i±1}, e_i⟩); read via WebFetch of the uncorrected proof.
5. Williamson, Timothy (2013). Gettier cases in epistemic logic. *Inquiry* 56(1): 1–14. DOI 10.1080/0020174X.2013.775010. Needed to confirm the attribution of the appearance-centred model used in the candidate's illustration.
6. Elga, Adam (2013). The puzzle of the unmarked clock and the new rational reflection principle. *Philosophical Studies* 164(1): 127–139. DOI 10.1007/s11098-013-0091-0. Not accessed (Cloudflare and PhilSci blocks); low priority.
7. Williamson, Timothy (2011). Improbable knowing. In T. Dougherty (ed.), *Evidentialism and its Discontents*, OUP, 147–164. Low priority; the 2014 paper covers it.
8. Konek, Jason (2023). The art of learning. *Oxford Studies in Epistemology* 7: 71–133. DOI 10.1093/oso/9780192868978.003.0004. Needed to confirm it derives likelihood-weighted updating from accuracy (as E&N report).
9. Heitjan, Daniel F. & Donald B. Rubin (1991). Ignorability and coarse data. *Annals of Statistics* 19(4): 2244–2253. DOI 10.1214/aos/1176348396. Only for the exact CAR definition and their coarsening versus measurement-error distinction; Project Euclid gave a bot-check.
10. Optional:
    - Gill, R. D., M. J. van der Laan & J. M. Robins (1997). Coarsening at random: characterizations, conjectures, counter-examples. *Lecture Notes in Statistics* 123: 255–294. DOI 10.1007/978-1-4684-6316-3_14.
    - Oller, R., G. Gómez & M. L. Calle (2004). Interval censoring: model characterizations for the validity of the simplified likelihood. *Canadian Journal of Statistics* 32(3): 315–326. DOI 10.2307/3315932.
    - Salow, B. "Gnosticism and inexact knowledge", *PPR* (forthcoming), DOI 10.1111/phpr.70171. Open access, but Wiley blocked both tools. It is on margin models and improbable knowledge, and may cite M&Z.
    - Weatherson 2013 "Margins and errors" (BW's own; not re-read).

## Files saved to `research/texts/oa/` this session

- `das2023-value-biased-information-AAM.pdf` and `das2023.txt`
- `das2022-externalism-exploitability-AAM.pdf` and `das2022.txt`
- `das2019-ur-prior-AAM.pdf` and `das2019.txt`
- `gill-grunwald2008-arxiv.pdf` and `gg2008.txt`
- `jaeger2005-arxiv.pdf` and `jaeger2005.txt`
- `dorst-et-al2021-deference-done-better-AAM.pdf` and `ddb2021.txt`
- `goodman-salow2023-epistemology-normalized-AAM.pdf` and `gs2023.txt`
- `ahmed-salow2019-dont-look-now-draft.pdf` and `as2019.txt`
- `salow2018-fishing-for-compliments-draft.pdf` and `salow2018.txt`
- `williamson2014-very-improbable-knowing-PhilAnnual.pdf` and `williamson2014.txt`
- `dorst2019-modest-epistemology-dissertation.pdf` and `dorst_diss.txt`
- `pettigrew2025-substack.txt` and `pettigrew2025-substack-comments.json`

---

## Bottom line

**Points 1 and 2 are anticipated.**
- The formula and the extensionality-iff-conditionalisation equivalence are in M&Z's own appendix (Lemmas 1–2, pp. 344–345). M&Z p. 336 already say constant weightings are trivially extensional.
- Easwaran (Substack comment, 20 Dec 2025) gave the likelihood and signal reading, including the uniform-random-true-proposition reconstruction. The optimal-update-is-likelihood-weighted result is in Easwaran & Nielsen 2025, Isaacs & Russell 2023 (Thms 3–4) and Gallow 2021.
- What remains new is only the explicit identification with CAR from statistics, plus the elementary permutation-invariance lemma.

**Point 3 has not been stated as a general claim anywhere I could find, and is the paper's real contribution.** Present it honestly:
- It is a one-line corollary of the Gill–van der Laan–Robins / Grünwald–Halpern CAR characterisation (GH Thm 3.1(d)) and of M&Z's Lemma 2.
- Its single-situation case is M&Z's Fact 12.
- Its informal core, that margin evidence is had only at its centre and so its shape locates the truth, is in Williamson 2014 (p. 980), Salow 2018 (pp. 21–23; closest in spirit) and Ahmed & Salow 2019 (p. 6).

**Point 5's numbers are new.** Its diagnosis is implicit in Carr 2021 §6.1, Isaacs & Russell's clock and Easwaran & Nielsen p. 1129, all of which get conditionalisation from edge-allowing uniform weightings.

**Point 4 is new in its exact form** (the interior rule derived from Hi-TEA restricted to margin-respecting situations). But:
- On Dana it is M&Z's own one-shot rule.
- Its softened form is numerically Ahmed & Salow's "Third Objection" credence (0.1/0.8/0.1), and Gallow's clock posterior.
- Centre-weighted updating is in Easwaran & Nielsen (pp. 1120–1121, 1129).

**Point 6 is partly anticipated by M&Z themselves** ("mimics" META-COND, p. 327). It is new only as a single structural GEC rule that is TEA-optimal under margin weighting.

**The paper must cite:**
- Heitjan & Rubin 1991; Gill, van der Laan & Robins 1997; Grünwald & Halpern 2003
- Easwaran & Nielsen 2025; Isaacs & Russell 2023; Gallow 2021; Carr 2021
- Pettigrew's post and Easwaran's comment
- Williamson 2011/2014; Salow 2018; Ahmed & Salow 2019; Das 2023; Schoenfield 2017
- M&Z Lemmas 1–2, Facts 9/11/12, fn 21 and pp. 325–327, 337
- Konek 2023 (after checking)

**Replies:** none found beyond Pettigrew's post and its comment thread. One unidentified citing work is indexed by Crossref and OpenAlex.
