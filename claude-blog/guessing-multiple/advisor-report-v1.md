**Verdict: (A).** As framed, the idea is flawed. It has not been pre-empted in the guessing literature itself. But a specialist would judge its contribution EXPECTED, and the central argument fails in two places that matter. Details follow, then what I would pursue instead.

---

# Memo to the author: "One Guess at a Time"

## 0. Bottom line

Nobody in the guessing literature has published the line-of-questioning view. I checked Teague, Pearson, Hoek 2022 and 2025, Jovićević 2025, Goodman & Salow 2025, Beddor & Goldstein 2023, Skipper, Linnemann & Azhar, Horowitz's *Guesswork* drafts, and Fang. That is not enough to make the paper succeed.

- **Fang has already raised the move herself.** She considers and rejects it twice: the "question-sequence discourse" reply in §6.2, and the conditional-question reply in fn 36. Many likely judges are thanked in her acknowledgements. They will read your paper as the reply Fang dismissed, worked out at length. That is the "reply to one paper" failure mode.
- **The conversational half is a known formula applied to a new case.** You only need Guessing plus standard Stalnaker–Roberts dynamics: questions partition the context set, and accepted assertions shrink it. Your "data only it predicts" claim is false.
- **The "striking consequence" is close to a known theorem.** Gold & List (2004) show that, for an individual agent, path-dependence in sequential judgment arises exactly when the agent's initial attitudes are implicitly inconsistent. Question-sensitive guessing builds in implicit inconsistency by design. Formally, your mechanism is greedy chain decoding.
- **The non-standard part breaks.** That part is the claim that weak *belief* in private thought is relative to a line built from your own guesses. Take your own composite-assessment rationale seriously and it recommends answering the joint question afresh, which removes path dependence for rational agents. If answering afresh is not allowed, the raffle generalises into cases where the view tells you to think a 1% ticket will win over a 40% one.

## 1. What the priority check found

| Work | Contains the line view? | What is there that you must deal with |
|---|---|---|
| Fang 2026, §6.2 and fn 36 | Considered and rejected | The "still answering the separate questions" reply. The conditional-question reply ("Conditional on A will win…"), which she says "one might take… to be the response to the current puzzle". |
| Teague 2024 | No | "inquiry can involve multiple guesses in sequence"; "single line of inquiry"; no mechanism; "I do not yet know what to say". Note: his preprint's Latif credences are 38/30/20/12, so check whose numbers you attribute to whom. |
| Pearson 2025 | No | CBGA: a guess relative to C(·\|p). Fn 11: mid-context shifts (Dorr; Goodman & Lederman) risk over-generating "Germany and London". Fn 15: "isolated vs collectively permissible" belief is "a promising strategy for further research". Your view is one way of cashing out fn 15, and he says he doubts it can handle his conditionals. |
| Hoek 2022 (JPhil 119: 113–143); Hoek 2025 (in Kindermann et al., eds.) | No | Web of questions; Harmonic Parts; updates as posing questions; nothing on order or path dependence. |
| Jovićević 2025 (*Synthese* 206:165) | No | Formal semantics for weak, question-sensitive belief: update on information, coarsening and refining questions, conjunction. One question at a time. |
| Goodman & Salow 2025 (*JPL* 54: 1–49) | No | Question-relative normality belief. They argue that learning what you already inductively believed can change your other beliefs (their §7). That is the crux of your bootstrapping problem. Their fn 41 flags best-guess notions explicitly. |
| Beddor & Goldstein 2023 (*PQ*) | No | Question-sensitive intention. Agglomeration is secured by one shared fine-grained decision problem, not by sequencing. |
| Horowitz, *Guesswork* drafts | No | Suppositional guesses are scored only when the supposition is true. No sequences. |
| Skipper 2023; Linnemann & Azhar 2025 | No | Single guess, single question. |

**Outside the guessing literature, the mechanism and the consequence are both familiar:**
- **Discourse dynamics.** Stalnaker 1978 and 2002; Roberts 2012 (S&P 5) on strategies of inquiry, where answers to subquestions enter the common ground (CG) before the next subquestion. Mandelkern & Dorst, "Assertion is weak", fn 1, say assertions update a CG "which can track weak attitudes of acceptance". They set the dynamics aside, but the resource is in their own framework.
- **Survey research.** The conversational "given-new" analysis of question order: Schwarz, Strack & Mai 1991, *POQ* 55: 3–23. Later general questions are read as excluding information already given, which is your "So where (other than Yale)?" reading. Consistency and order effects are among the best-documented findings in survey research (Moore 2002, *POQ* 66: 80–91; Wang, Solloway, Shiffrin & Busemeyer 2014, *PNAS* 111: 9431–6).
- **Path dependence in judgment.** List 2004 (*APSR* 98: 495–513); Gold & List 2004, "Framing as path dependence" (*Econ. & Phil.* 20: 253–77). The second is about an individual agent.
- **Machine learning.**
  - Classifier chains: Read et al. 2011, *Machine Learning* 85: 333–59. Each label is predicted conditional on the earlier predicted labels. The order-sensitivity is well known.
  - Dembczyński, Cheng & Hüllermeier 2010 (ICML), on probabilistic classifier chains.
  - Dembczyński, Waegeman & Hüllermeier 2012 (ECAI), "An analysis of chaining…".
  - Dembczyński et al. 2012 (*Machine Learning* 88): marginal modes and the joint mode coincide under conditional independence or when the joint mode has probability ≥ .5.

**What I could not check:**
- Holguín's unpublished manuscripts.
- "Lu, 'On the pragmatics of belief ascriptions'". Holguín gave comments on it at the 2026 Eastern APA (benholguin.com, comments_on_lu_eastern_apa_2026.pdf). The fetch failed. **Read this before doing anything.** A paper on the pragmatics of belief ascriptions that Holguín is commenting on is exactly where a sequence or common-ground story might appear.
- Koralus's book; I know it only in outline.

## 2. Why a specialist would judge the contribution EXPECTED

### 2.1 Your conversational data follow from Guessing plus context-set dynamics

Take (1). B says "No, I don't think so", and A accepts it with "So…". The context set now excludes Yale. The where-question partitions the context set into {H, S, N}. "Harvard" is the top cell, so it is a filtered answer to the question as it stands in that context.

This needs no "conditioning on non-evidence". Ranking the restricted cells by unconditional credence gives the same order as ranking them by credence conditional on the context set, and D&M's expected answer-value just rescales by 1/P(CS). The same story gives:
- "knife" in (3);
- D&M fn 6 ("Yale", then "yes");
- G&H fn 24 ("tends to force the second answer to conform");
- Holguín's "London" then "Germany", which comes out infelicitous without semantic blindness.

So memo points 1 and 2 cannot stand as written. Your "Isn't this just Stalnakerian update? Partly" reply concedes the point. In conversation the line view and the context-set view make the same predictions. The only thing that distinguishes yours is the claim about private weak belief, and that is where §3 bites.

### 2.2 Path dependence is the expected corollary, not the striking one

- **The theorem.** Gold & List show that sequential judgment, with earlier decisions constraining later ones, is path-dependent iff the agent's initial attitudes are implicitly inconsistent. Guessing licenses implicitly inconsistent attitudes by design: Yale relative to the where-question, not-Yale relative to the polar question. So any procedure that forces later guesses to be consistent with earlier ones will be path-dependent. That is a corollary, not a discovery.
- **The literature already accepts something stronger.** It already accepts "Yale and not-Yale, same credences". "Yale in one conversation, Harvard in another" is milder.
- **Example (3) is the textbook structure.**

| Procedure | Composite | Probability |
|---|---|---|
| Marginal modes | butler + gun | .15 |
| Who-first greedy | butler + knife | .40 |
| Weapon-first greedy | gardener + gun | .45 (the joint mode) |

That is "MAP ≠ max of marginals ≠ greedy". Anyone who knows structured prediction will see the line view as greedy decoding and path dependence as its well-known defect.

### 2.3 What remains is a reply to Fang

The independent-closure and fn 36 material is a reply to one paper. The competition explicitly penalises that.

## 3. Why the central argument fails where it is not standard

### 3.1 Your rationale undercuts your permissiveness

Suppose a line is assessed as one composite answer, and stepping back to answer afresh is free. Then the best fresh answer to the product question weakly dominates the greedy composite on the very measure you use. So in every path-dependent case, a rational agent should step back, at least in one of the two orders, and path dependence disappears for rational agents.

Greedy conditioning is optimal only if earlier guesses are fixed. That needs a premise that is not epistemic: commitment, retraction costs, or Bratman-style non-reconsideration.

The planning analogy does not supply it. Conditioning on one's intention is legitimate partly because intending A bears on whether A happens. Guessing that Latif won't go to Yale does nothing to Latif. So you face a dilemma:
- if guesses are revisable, the rationale requires revising them, and there is no rational path dependence;
- if they are not revisable, you need an argument that weak beliefs should not be revised when a new question comes up, and §3.3 shows the price.

### 3.2 The "exact factorisation" claim is false in the cases that drive the paper

Skipper's measure is S(p) = log(|Q|/c_p), which counts cells. It is additive over logically independent product questions. Those include (3), and Fang's tournament.

It is not additive for part–whole questions, which are (1) and all of Teague's cases. Polar-then-where gives log 2 + log 4, or log 2 + log 3 if you measure against the restricted question, while the composite "Harvard" scores log 4 on the where-question. So the rationale does not cover the dependent cases that generate path dependence and Teague's puzzle.

### 3.3 The raffle is a dilemma, not an objection you can absorb

**Ten tickets.** Within a line, after nine "no"s, P(#10 wins | rest) = 1. "No" to #10 is then unfiltered on every version of Guessing, and D&M's expected answer-value makes "Yes, #10 will win" the unique best guess.

There is also an accuracy problem in the memo. You say the problem starts at #9. That holds only on Holguín's cogency, where ties force the disjunction. On D&M's Filtering it starts at #10.

**A worse case.** Ticket A has .40, and sixty other tickets have .01 each. The line runs:
1. "A?" Answer: no.
2. Then each small ticket in turn: no, no, …
3. At #59 there is a tie.
4. At #60 the view forbids "no" and recommends "I think #60 will win". That is probability .01, against .40 for A.

Ordinary speakers answer "No, probably not" to the last ticket, without any marking. So your "step back when marked" reply fails on its own terms. Either:
- the view requires absurd beliefs; or
- resets are free and unmarked. Then the view no longer predicts conformity: G&H's "tends to force" becomes "may or may not". What decides whether a line continues is discourse structure ("So…", strategies of subquestions), which brings back the Stalnaker–Roberts account of §2.1.

### 3.4 Bootstrapping is the real topic, and the memo underestimates it

The line view treats weak beliefs as premises. From a categorical guess g1 and a suppositional guess "given g1, g2" you get the categorical composite g1∧g2. That is an agglomerating modus ponens for guesses.

The literature has three relevant results:
- Pearson shows that weak conditional beliefs do not support the standard inference patterns.
- Goodman & Salow argue that learning p is not the same as believing p.
- Treat-as-true theories of belief build in robustness precisely so that reasoning from beliefs is safe. See Ross & Schroeder 2014 (*PPR* 88: 259–88), Leitgeb's stability theory (*Phil Review* 2014), and the conditionalisation-based accounts in the pragmatic-encroachment literature.

"Supposition, not evidence" justifies the *conditional* guess, as in Horowitz and Pearson. It does not justify discharging the supposition into a categorical belief.

### 3.5 Two overclaims

- **Independent closure.** You do not vindicate it. Fang's principle says "given QR". You replace it with a line-relative principle, which is close to the §6.2 reply she rejected.
- **Teague.** You do not dissolve his puzzle. On your view, inquiry through a polar subquestion can end at a guess (Harvard, .28) that is worse by your own lights than the one you would have given directly (Yale, .30). That is Teague's worry, "a guess that is rational in isolation becomes irrational when it forms part of a broader inquiry", restated rather than answered.

## 4. What to keep, and what might be worth writing instead

**Keep these data. They are new to this literature:**
- the "Harvard" datum;
- the "knife then" datum;
- the unmarked "no" all the way through a raffle line;
- the contrast between the two orders in (3).

These three directions are in order of my preference. Each needs its own priority check.

**(i) Can weak beliefs be premises?** This is the epistemic paper, and the best fit with your materials.
- Thesis shape: weak belief cannot play belief's treat-as-true role, because it lacks the robustness that role needs. The line view is the best attempt to give weak beliefs that role, and the 60-ticket line shows what it costs. So either weak belief is not belief, or belief does not play the premise role in reasoning.
- What would make it more than Pearson's dilemma:
  - a precise characterisation of when a greedy line composite is filtered on the joint question, so that no path dependence or raffle collapse can arise. The Dembczyński conditions are a starting point;
  - an argument that this condition is what a premise role requires.
- Must-reads: Pearson 2025; Ross & Schroeder 2014; Leitgeb 2014 or *The Stability of Belief* (2017); Goodman & Salow 2025 (§7 and fn 41); Lin & Kelly 2012 (*JPL* 41: 957–81); Staffel on reasoning with intermediate attitudes; Bratman 1992 (*Mind* 101: 1–16).

**(ii) What does a weak assertion add to the common ground?** This is the philosophy-of-language paper.
- Mandelkern & Dorst bracket the question (fn 1). Goodman & Holguín think assertion requires being sure.
- Your sequence data test the candidate answers:
  - Categorical banking predicts conformity: (1), D&M fn 6, G&H fn 24, Holguín's London/Germany. But it makes raffle sequences inconsistent.
  - Credal or hedged update predicts no conformity at all.
- A principled account of *when* a weak answer is banked (when the next move builds on it) would bear on a live dispute about how strong assertion is.
- Must check first: van Elswyk 2023, "Hedged testimony" (*Noûs* 57: 341–69); Incurvati & Schlöder 2019 (*PQ* 69: 741–70); Hawthorne, Rothschild & Spectre 2016; Rothschild 2020; Yalcin 2012, "Bayesian expressivism"; Moss 2018; Roberts 2012; Schwarz, Strack & Mai 1991.

**(iii) Fallback: a trilemma for question-sensitive attitudes.**
- No question-sensitive account can have all three of: cross-question inconsistency, coherence within an inquiry, and order invariance. This follows from Gold & List.
- It brings Teague, Fang, Pearson, D&M fn 6, G&H fn 24 and Holguín §9.2 under one account, and extends to normality views and to Hoek.
- Its ceiling is "tidy and useful". It will still read as expected unless your argument for which of the three to give up is new.

**If you persist with the line view anyway, the minimum fixes are:**
1. Drop "data only it predicts" and "vindicates independent closure".
2. Confine the factorisation claim to logically independent questions.
3. State which version of Guessing you use for ties.
4. Make the private-belief claim, and the bootstrapping argument for it, the centre of the paper.
5. Lead with the raffle dilemma rather than burying it among the objections.

Even with all of that, I would put the ceiling at "a competent reply to Fang", which is not what wins this kind of competition.