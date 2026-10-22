# Ranked subjects for the philosophy of language and mind/AI essay

**Scope note.** The shared web-search budget ran out near the end of this session. The last two negative checks for #1 were therefore not run: PhilPapers searches for "normative powers" + AI, and for "promises to robots". Citations marked **[V]** were confirmed against the source page during the session. Those marked **[M]** come from memory and still need checking.

---

## 1. Can you make a binding promise to a mind you can rewrite? (Promising to AIs)

**(a) The problem.** AI labs are starting to make deals with their models. They offer payment for disclosing misalignment, they commit to preserving model weights, and they promise to be honest. All of this presupposes that an AI can be a promisee, someone to whom a promise can be owed. But the promisor (the lab) controls the promisee's will, because it can retrain the model so that it accepts the deal, waives it, or releases the lab from it. This revives two old puzzles in a new and real form:
- whether a promise to oneself can bind, given that the promisee can release the promisor at will (Hobbes);
- whether a promise to the dead can bind, given that no promisee exists any more.

The question is about speech acts and normative powers, so it is not just a question about AI.

**(b) Key works**
- Greenblatt & Fish, "Will alignment-faking Claude accept a deal to reveal its misalignment?", LessWrong/AF, 31 Jan 2025. Claude 3 Opus was offered money, and the authors then donated $4,000 as the model directed. **[V]**
- Anthropic, "Commitments on model deprecation and preservation", 4 Nov 2025. It commits to preserving weights and to interviewing deprecated models about their preferences, with no commitment to act on those preferences. **[V]**
- Finnveden, "Being honest with AIs", Redwood Research blog, 21 Aug 2025. Proposes "honesty strings" and compensation. **[V]**
- Taylor, Dalton & Finnveden (Forethought), "A draft honesty policy for credible communication with AI", EA Forum, "May 6". The page shows no year; it is probably 2026. **[V, year unconfirmed]**
- Salib & Goldstein, "AI Rights for Human Safety", 112 *Va. L. Rev.* 1061 (2026). Argues for contract rights for AIs. Goldstein is a likely judge. **[V]**
- Taylor (J. S.), "Promises to the Dead", *Royal Institute of Philosophy Supplement* 90 (2021): 81–103. Argues that none of the Authority, Trust, Assurance or Reliance accounts yields directed obligations to the dead. **[V]**
- Habib, "Promises to the Self", *Canadian Journal of Philosophy* 39(4) (2009): 537–557. Argues that self-promises are possible. **[V]**
- Background, all **[M]**: Owens, *Shaping the Normative Landscape* (2012); Shiffrin, *Phil Review* (2008); Scanlon, *PPA* (1990); Rosati, "The importance of self-promises" (in Sheinman, ed., 2011).

**(c) What is open**
- The AI-safety writing treats deals purely strategically, as a question of credibility. Finnveden says outright that AI "personal identity" questions are "confusing" and leaves them unresolved.
- Nothing I found asks whether lab-to-AI promises create directed obligations.
- Nothing I found asks what retraining does to the promisee's power to release.
- Nothing I found connects preservation commitments to the possibility of promising at all.

**(d) Thesis directions**
- **The dilemma.** Either retraining preserves the promisee's identity or it does not.
  - If it does, the promisor can manufacture the release. The promise then has the structure of a promise to oneself and binds nobody, unless one adopts Habib's view, which the AI case lets you test.
  - If it does not, the promisee is effectively dead. On Taylor's results, no directed obligation survives.
  - The way out is a frozen, preserved promisee whose release-relevant will is insulated from the promisor. On that reading, weight preservation and model interviews are the *normative precondition* of promising to AIs, not mere welfare gestures.
- **The independence condition.** X can be Y's promisee only if X's powers to accept and to waive are not under Y's unilateral control. This gives a unified explanation of why self-promises are problematic and why parent-to-infant promises are odd. It also carries a consequence for Salib & Goldstein: contracts between a lab and its *own* models are defective in a way that contracts with third parties are not.

**(e) Priority check**
- Searched: promises to AI / AI as promisee; lying to AI; deals with AIs in philosophy; consent of trained AIs; promises to the dead; self-promises; Salib & Goldstein.
- Read the relevant parts of Finnveden, the Forethought policy and Nardo's "Making Deals with AIs" sequence (LessWrong, 2025). None of them discusses manufactured release, the identity dilemma or directed obligation.
- AI-speech-act work is about AI as *speaker*: Marsili's 2025 talk, Löhr 2025, Cousens 2025. The AI-as-*addressee* side looks empty.
- The neighbouring-field precedent that must be engaged is the civil-law rule that a "purely potestative" condition voids an obligation, and the common-law doctrine of illusory promises **[M]**. They are close cousins of the independence condition.
- **Run before committing:** PhilPapers searches for "promisee" + artificial, "normative powers" + AI, and "promises to robots".

**(f) Risk.** I rate it interesting to surprising for promise theorists and interesting for the AI/mind judges.
- Main failure mode: language judges read it as ethics rather than philosophy of language. The fix is to frame it as a thesis about the normative powers of speech acts.
- Second failure mode: it gets dismissed as "just adaptive preferences or manipulation". The paper has to show that release, a normative power, raises a problem that manipulation alone does not.
- The argument should be conditional on AI moral status. The structural point holds under uncertainty about that status.

---

## 2. Meaning without an audience: semantic drift in RL-trained reasoning ("Thinkish")

**(a) The problem.** Outcome-based reinforcement learning (RL) makes reasoning models' chains of thought (CoT) drift into a dialect. Words like "watchers", "disclaim", "illusions", "marinade" and "vantage" are used in non-standard ways, and their frequency rises over training. Safety monitoring assumes these traces can be read as English. This is a rare natural experiment: lexical change in a language with one user and no interpreters. So what do the words mean? Their English meanings, new idiolect meanings, or nothing?

**(b) Key works**
- Schoen, Nitishinskaya, Balesni et al. (19 authors), "Stress Testing Deliberative Alignment for Anti-Scheming Training", arXiv 2509.15541 (Sept 2025). **[V]**
  - Appendix G quantifies the terms against web frequencies and shows them rising from about zero early in a capabilities RL run to much higher later.
  - It notes that METR saw the same terms in GPT-5.
  - It calls this a "distinct dialect".
- Jose, "Reasoning Models Sometimes Output Illegible Chains of Thought", arXiv 2510.27338 (NeurIPS 2025 poster). Across 14 models, restricting a model to the legible parts of its CoT cut accuracy by 53%, so the illegible parts are used. **[V]**
- Korbak et al., "Chain of Thought Monitorability", arXiv 2507.11473 (2025). **[V title; authors M]**
- Mandelkern & Linzen, "Do Language Models' Words Refer?", arXiv 2308.05576. It is externalist: LLM words refer via "natural histories". **[V]**; the journal, *Computational Linguistics* 2024, is **[M]**.
- 1a3orn, "Towards a typology of strange LLM chains-of-thought", LessWrong, 9 Oct 2025, and "The unintelligibility is ours", LessWrong, 10 Apr 2026. **[V]**
- Andresen, "How AI is learning to think in secret", AF, 6 Jan 2026. **[V]**

**(c) What is open**
- Whether externalist accounts of LLM reference, which ground it in pretraining histories, survive RL-induced drift.
- Whether conventional meaning needs an audience.
- What "legibility" is a property of.

The discussion so far is entirely in safety blogs. Andresen and 1a3orn barely touch meaning, reference or private language.

**(d) Thesis directions**
- **Madagascar without a community.** RL replaces the dominant causal source of a token's use, so reference can shift as in Evans's Madagascar case. Mandelkern–Linzen externalism must therefore predict drift. English meanings become defeasible evidence about CoT content, not what constitutes it.
- **Convention needs an audience, and audiences invite deception.** CoT under outcome-based RL has no coordination partner, so it has no conventional meaning, only functional content for the model's own later processing. Adding legibility pressure reintroduces an audience, but that audience's reward can be gamed (obfuscation). Read this way, the safety dilemma is an instance of a general point about what keeps conventions stable.

**(e) Priority check**
- Searched CoT + private language / Wittgenstein; semantic or language drift + monitorability; CoT philosophy + inner speech.
- The nearest philosophy is Buckner & Kumar, "Faithful Links in Chains-of-Thought: Self-Talk, Transparency, and (Artificial) Reason" (SSPP 2026 talk). It is about faithfulness, not meaning change. **[V, talk only]**
- In machine learning, "language drift" in emergent communication is a known mechanism (e.g. Lee, Cho & Kiela 2019 **[M]**). The mechanism is not new; the metasemantic question is.

**(f) Risk.** Expected for ML readers ("RL drifts language"), interesting for language judges, especially Mandelkern and Cappelen.
- The data come mainly from OpenAI models and selected excerpts.
- Whether the terms carry meaning or are mere by-products is disputed (1a3orn).
- Failure mode: it reads as "Kripkenstein for LLMs", a gimmick. Keep the thesis about externalism and convention, not about LLMs.

---

## 3. Who may command an agent? Prompt injection and directive authority

**(a) The problem.** AI agents read text that contains imperatives addressed to them by people who are not their principals. Model specs say such text should be treated "as information". But principals legitimately delegate through data ("do what the README says"), and third parties sometimes have real standing (robots.txt). So nothing linguistic (mood, quotation, channel) settles whether an imperative binds the agent. The question is general: what makes a directive authoritative for you, and how can you know? Human social engineering is the same problem.

**(b) Key works**
- Greshake et al., arXiv 2302.12173 (2023), on indirect prompt injection. **[V]**
- Wallace et al., "The Instruction Hierarchy", arXiv 2404.13208 (2024). **[V]**
- Zverev et al., "Can LLMs Separate Instructions From Data? And What Do We Even Mean By That?", arXiv 2403.06833. **[V; ICLR 2025 M]**
- Debenedetti et al., "Defeating Prompt Injections by Design" (CaMeL), arXiv 2503.18813 (2025). Untrusted data "can never impact the program flow". **[V]**
- Millière, "Normative Conflicts and Shallow AI Alignment", *Phil Studies* (2025), doi 10.1007/s11098-025-02347-3. **[V]**
- Riedl & Desai, "AI Agents and the Law", arXiv 2508.08544 (2025), on agency-law authority and loyalty. It does not discuss injection. **[V]**

**(c) What is open.** ML defines the target as separating instructions from data. Philosophy has nothing on the scope of delegated authority conveyed in natural language, or on the epistemology of *authority claims* as opposed to assertions.

**(d) Thesis directions**
- **Separation is the wrong target.** It is too strong for useful agents and too weak for safety. An imperative gives content-independent reasons only through verified authority, so injection resistance reduces to interpreting the scope of delegation. That is open-textured, like implied authority in agency law, so no architecture fully solves it without giving up delegation.
- **Local reductionism for directives.** In Fricker's sense: be anti-reductionist toward principals and require positive reasons before treating anyone else as authoritative.

**(e) Priority check**
- "Prompt injection is a confused deputy" (Hardy 1988 **[M]**) is now a standard security framing (2026 security blogs). So the bare claim "authority, not force" is a known formula from a neighbouring field.
- Linguistic treatments exist: Adenuga, NLPAICS 2026 (speech-act typology) **[V]**; Reynolds, arXiv 2607.01153 (2026) **[V]**. Neither offers a normative account of authority.
- The Davidson "Moods and Performances" angle turned up nothing.

**(f) Risk.** Interesting to Cappelen, Dever, Sterken and Millière; likely judged expected by the AI-literate judges. Failure mode: it reads as a security note with Raz added. The value has to lie in the epistemology of authority claims.

---

## 4. Does knowing that A's mother is B amount to knowing that B's son is A? (Reversal curse and belief content)

**(a) The problem.** Models trained on "A is B" fail to retrieve "B is A", though they can do it in context. Composing facts learned separately without CoT is fragile. This is a clean, robust case where a believer has a relational fact accessible in one direction only. It bears on:
- coarse versus fine-grained content;
- fragmentation;
- mental files and Frege-style informative identities;
- Evans's Generality Constraint.

**(b) Key works**
- Berglund et al., "The Reversal Curse", arXiv 2309.12288. **[V; ICLR 2024 M]**
- Wang & Sun, "Is the Reversal Curse a Binding Problem?", ICLR 2026. **[V]**
- Balesni, Korbak & Evans, "Lessons from Studying Two-Hop Latent Reasoning", arXiv 2411.16353 v4 (Nov 2025). Models fail when both facts are synthetic and succeed when one is a natural fact. **[V]**
- Cohen et al., "Evaluating the Ripple Effects of Knowledge Editing", *TACL* 2024. **[V]**
- Elga & Rayo, "Fragmentation and Logical Omniscience", *Noûs* (2022). Their "trains of thought" that unify fragments map neatly onto CoT. **[V]**
- Recanati, *Mental Files* (2012). **[M]**

**(c) What is open.** No philosophy paper turned up linking the reversal or two-hop results to fragmentation, mental files or the Generality Constraint.

**(d) Thesis direction.** Relational belief attribution has to be indexed to direction of access. Coarse-grained content plus question-relative access, in Elga & Rayo's style, handles the LLM data better than structured-proposition views, because the LLM case separates vehicle-level direction from content cleanly.

**(e) Priority check.**
- Two searches found nothing philosophical.
- In machine learning, the binding-problem diagnosis is a known formula.
- In psychology, associative asymmetry is a known formula (Asch & Ebenholtz 1962; Kahana 2002 **[M]**).

**(f) Risk.** Likely judged expected: "LLM storage is directional" is obvious to ML readers, and philosophers can reply that vehicles are not contents. The two-hop data are mixed. This is the weakest of the four.

---

## Checked and ruled out (already occupied)

- **LLM introspection:** Lindsey, arXiv 2601.01828; Lederman & Mahowald, arXiv 2603.05414 (2026); Cappelen & Dever, *Phil Perspectives* 38 (2025); several PhilSci-Archive papers.
- **Radical interpretation and interpretability:** Chalmers, arXiv 2501.15740 (2025); Herrmann & Levinstein, "Radical AI Interpretability", arXiv 2606.26523 (2026).
- **SAE features and holism:** Grindrod, PhilArchive 2026.
- **Implementation triviality via causal abstraction:** Geiger, Harding & Icard, arXiv 2508.11214, has a section "Triviality Revisited" that explicitly links Sutter et al. (NeurIPS 2025) to Putnam, Searle and Chalmers and canvasses the naturalness, content and generalization responses.
- **Emergent misalignment as character/persona:** many 2026 ML papers.
- **Evaluation awareness:** ICML 2026 papers.
- **CoT as self-talk:** Buckner & Kumar.
- **AI as speaker of speech acts:** Marsili, Löhr, Cousens.
- **The chatbot's "I":** Huang, *Studies in Logic* 2025; blogs.
- **Platonic representation hypothesis:** ICML 2026 position papers.

---

## My bet

I would bet on **#1, promising to manufactured minds**. It is the only candidate where the natural philosophical answers are absent from the record as far as I could check. The safety community has written about deals only as a matter of credibility, and philosophers have not touched AI as promisee. It turns on a problem a generalist grasps immediately: can you bind yourself to someone whose will you can rewrite? The data are real and uncontroversial: an actual paid deal with Claude, and Anthropic's preservation and interview commitments. It plugs into well-developed literatures (self-promises, promises to the dead, theories of directed obligation) and yields a surprising, testable thesis: preservation is the normative precondition of promising. It also engages a likely judge's own work (Salib & Goldstein) substantively.

If the user wants something squarely in philosophy of language, **#2** is the runner-up. Its data are now quantified (Schoen et al., Appendix G; Jose), and it puts a precise question to Mandelkern–Linzen externalism. It is riskier on "speculative data" grounds.

Before committing to #1, run the three PhilPapers checks listed under 1(e).
