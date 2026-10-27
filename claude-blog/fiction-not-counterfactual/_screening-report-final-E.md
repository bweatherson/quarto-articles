# Screening report: final text (screener E)

- **Paper title:** Fiction Without Hidden Facts (paper-v7.3-final.qmd)
- **Word count:** about 5,900 words: a 181-word abstract and about 5,700 words of body and notes. The bibliography has 27 entries, of which 25 are scholarly and 2 are web pages.
- **Thesis summary:** Blumberg and Holguín (2025) argue in two stages that every fiction has a single world that settles every question. The paper argues that both stages fail. Their first stage is the claim that the attitude and embedding data require fictional excluded middle. The paper answers it with a "story-state" semantics: bare fictional claims are evaluated homogeneously against the information a work provides, and credence is weighted by in-story chances. Given two explicit bridge principles, this semantics agrees with B&H's view on every attitude toward a single fiction. Their second stage is the Principal Reality Principle (PRP), which identifies fictional truth with Stalnakerian counterfactual truth. The paper refutes it with a "strengthening test": adding a cause of an open chancy outcome to a story behaves differently from adding it to a counterfactual's antecedent.
- **Verdict:** PASS, FORMAL

As the brief instructs, I judged the paper as a reply, and it is a good one. It targets the two load-bearing parts of B&H's case. The first is the step from Scopelessness to a single world (their n. 39), which drives fictional excluded middle (FEM). The second is the PRP, which says where the world is. What the paper says against each is correct as far as I can check. The central argument has three formal parts:

- a semantic fragment with a probabilistic credence layer;
- an equivalence result about attitudes;
- a model-based analysis of what Stalnaker's selection semantics predicts when an antecedent is strengthened.

That meets the "formal semantics with a probabilistic core" trigger, so the full assessment has to engage that work.

## Key strengths

- **It finds the exact step where B&H's main argument depends on a dispensable assumption.** Their n. 39 gets a singleton set of fiction-worlds from Scopelessness only by reading ¬□_f p as Boolean negation of a universal quantifier. The paper's fragment uses support and rejection over chance-weighted states. Negation swaps support and rejection, and a quantifier outside the story binds into it instance by instance.
  - On this fragment, inference (28), Scopelessness and the *Breakfast Club* equivalence all hold without a singleton, and all of B&H's judgements are kept.
  - The homogeneity tool comes from von Fintel, but B&H never consider it.
  - The paper also extends it to the attitude data. It meets B&H's trivalence challenge (171) with a transparent internal truth predicate.
- **"Absorption" is correct and changes the debate.** The paper adds two bridge principles: a link between credence about the selected world and in-story chance, and an "Openness" principle. Both are stated as strengthenings of B&H's own indifference suggestion (175) and their claim that the selection is unknowable (184).
  - Given these principles, credence and certainty in □_fφ equal the story-state values. I checked the derivation; it is a version of Lewis's 1976 imaging result.
  - So neither B&H's attitude table nor the fiction/counterfactual parallel they call "strong abductive support" (182) can decide between their view and one without a single world.
  - B&H themselves say their argument rests on abduction from these data (175, 182–183), so this removes its basis.
- **The strengthening test is new and it works.** In the test, a later special adds to JAG a gust that catches the coin.
  - On the PRP, adding the gust almost certainly moves the selected world. On B&H's own arbitrary selection (184), and also on causal tie-breaking, the new world disagrees about how the coin landed about half the time.
  - So the PRP predicts (B), and B&H's time-indexed account of fictional change (194) makes it even odds that the special *changed* how the coin landed.
  - Sentences (C) and (D) rule out a "what the story says" reading of the data, and a further prediction separates the revelation reading.
  - The paper then surveys the ways to save a single world: anchoring, defaults, path-dependence and supervaluation. It shows that each adds a rule for fiction that counterfactuals do not obey. That is a precise sense in which fictional truth is not counterfactual truth.

## Key weaknesses

- **The refutation of the PRP rests on one judgement the author supplies, about a complex sentence.** (B) puts a counterfactual about the telling, with a comparison across tellings, under a credence operator. The paper treats its "no" as on a par with B&H's judgements about simple attitude reports, and it proposes an experiment only in a footnote. A simpler diagnostic is already in the paper ("the special changed how the coin landed"), but it appears only in the subsection on time.
- **The story-state view gets (B) right only by stipulating a coupling, and the coupling works like the "defaults" rescue.** The paper concedes this: the coupling "holds open outcomes fixed while the told causes vary, as the defaults view … does for worlds".
  - So the test refutes the PRP, not single-world views as such. The surviving single-world views and the story state tie on every verdict in the table.
  - The claim that Lewis's view is "better-supported" therefore rests on a cost comparison in §5 that lists costs on each side without weighing them.
  - The restriction to "one question at a time" is not explained. Couplings chosen separately for each question need not come from one joint coupling, so credences about comparisons between tellings may not form a probability measure.
- **The fragment covers less than B&H's modal analysis does.** The story is a parameter of the context rather than an operator, and every connective in a bare claim is read inside the story. The fragment therefore has no account of complements that mix fictional and actual content, such as:
  - comparing the likelihood of a fictional claim with a factual one;
  - a disjunction of an internal claim and an external one;
  - attitudes that involve two fictions.

  B&H handle these by scope. The paper does not say how it would handle them.
- **Coverage of the closest prior work is thin in two places.** For homogeneity, the paper cites only von Fintel 1997 and Križ 2019. The closest predecessors of its *Breakfast Club* move are homogeneity analyses of quantified conditionals that answer Higginbotham-style arguments without conditional excluded middle (for example Klinedinst 2011 and Schlenker 2004), and the paper does not locate itself against them. What a 0.5 credence is a credence *in*, when the claim has no fact behind it, is assumed by citing Khoo 2022 and Williams & Woodward 2021. B&H raise this alternative themselves (167), and the paper does not defend it.
- **The writing is dense.** §§3–4 fit a fragment, a theorem and a model-based argument into about 2,500 words. The proof of Absorption and the experimental design are in footnotes, and the paragraph in §1 that positions the paper against Khoo and Woodward is hard to follow.

## Critical issues for revision

1. Strengthen the evidence for (B). Lead with the simpler formulation, that the special changed how the coin landed. Either run the 2×2 elicitation described in the footnote or add a second case with a different structure.
2. Define the coupling for joint questions, or show that the per-question couplings fit together in the cases the paper uses. Say plainly that the test refutes the identification of fiction with counterfactuals, not single-world views. Then either argue the cost comparison in §5 or weaken "better-supported" to "unsupported".
3. Give clauses for complements that mix fictional and actual content, or state the restriction explicitly. Either way, show that the treatment keeps Scopelessness for bare claims.
4. Place the Scopelessness and Higginbotham moves relative to homogeneity analyses of quantified conditionals. Add one paragraph saying what a 0.5 credence in a claim that is neither right nor wrong is a credence in.

**Accuracy check.** I checked every quotation from B&H and every page reference to it against the published text. I also checked the quotations from these sources against the supplied copies:

- Lewis 1976, p. 311, and Lewis 1978, p. 42 (both from page images);
- Williams & Woodward 2021;
- Woodward 2012, pp. 787 and 789;
- Khoo 2022, pp. 1013–1014, and Khoo 2026, p. 1191;
- Schaffer 2004, p. 305;
- von Fintel 1997, p. 33;
- McGonigal 2013;
- Moss 2013;
- Križ 2019.

All of them are verbatim with correct pages, and the paper describes these works fairly. Three sources are not in the corpus, so I could not verify them: Oppy & Raivars 2026, Blumberg & Strohminger 2025 and the Hurley recap. The paper's use of each is peripheral.
