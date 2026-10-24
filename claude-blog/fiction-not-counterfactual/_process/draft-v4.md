# Growing Stories and Hidden Facts (draft v4)

*[Revised after Q&A round 1; see qa/TRIAGE-round1.md. Quotations from Blumberg & Holguín (B&H) are from the published version, with page references. Other quotations still to be checked at step 6.]*

## 1. Introduction

When Holmes first meets Watson, does he have an odd or an even number of hairs on his head? Lewis thought it "absurd to suppose" that such questions about the world of Sherlock Holmes have answers (Lewis 1978: 42, as quoted by Blumberg and Holguín 2025: 159). Blumberg and Holguín (B&H) argue that Lewis was wrong: "for any given work of fiction, there is a single world that determines what's true in it, and that world is as rich in detail as reality itself" (176). The parity of Holmes's hairs is "as factual as the question of whether he is a detective" (151). It is just unknowable.

Their case rests on our attitudes to the questions a fiction leaves open. We can wonder whether the coin at the end of a television series landed heads. We can think a biased coin more likely than not to have landed heads. We can hope it did. But we cannot know, or be sure. B&H argue that this profile is what we should expect if there is a fact we are ignorant of. They add that a Stalnakerian theory of counterfactuals locates the fact: it is whatever would be the case if the work's settled truths were true.

Here is a case they do not consider. In 1890, with two Holmes stories in print, Ann says: "Holmes had an odd number of hairs on his head when he first met Watson." In 2026, after fifty-odd more stories, none of which mentions his hair, Carl says the same sentence. Ann and Carl made the same claim about Holmes. So, surely, either both are right or neither is. And nothing Doyle published after 1890 can have changed whether Ann was right, since none of it bears on Holmes's hair. On B&H's view, both judgements fail. The world located by their principle for the Holmes stories in 1890 almost certainly differs from the one it locates for the stories now. On questions no story addresses, the two worlds agree only by chance. So it is about even odds that Ann and Carl differ in truth value, or, if the stories form one fiction whose world changes over time, that Ann's claim has silently changed its truth value since 1890.

I argue for three claims.

1. **The attitude data do not discriminate.** A semantics on which bare fictional claims and attitudes toward them are evaluated against a *story state*, a body of information fixed by what the work settles, predicts B&H's whole profile with no single world (§3). Given two bridge principles B&H need anyway, their account and the story-state account agree on every attitude toward a single fiction (§4).
2. **Growth does discriminate.** On B&H's view, consistent additions to a story reshuffle the answers to the questions it leaves open. Bare judgements like Ann's and Carl's show that they do not (§5).
3. **The repairs cost the single world its support.** Every escape either gives up the principle B&H use to locate the world, leaving a single world that nothing in the data requires, or makes the earlier world depend on stories not yet written (§5).

The story-state view is not new in spirit. Williams and Woodward (2021) argued that the right attitude to what a fiction leaves open is an imaginative credence matching "the conditional probability of p given the fictive evidence", and that "there are, so to speak, no fictional facts of the matter" (MS 1–2). Lewis's own (1978) analysis lets a story's truths grow as the story does. Badura and Berto (2019) model truth in fiction as belief revision. Oppy and Raivars (2026) and Khoo (2026) reply to B&H by contesting their data. B&H cite Williams and Woodward only for examples. My contribution is not the alternative but the case for it: a precise semantics on which ordinary attitude verbs deliver B&H's profile, a proof that attitudes toward single fictions cannot decide the issue, and a kind of datum, about growth, that can.

## 2. The case for fictional reality

B&H work within the modal approach to truth in fiction (Lewis 1978). A bare internal claim, such as "Holmes lives on Baker Street" on its natural reading, carries a silent operator □_f. It is true iff its prejacent holds at every world in a set Fic_f. The *principal truths* of f are "the fictional claims that can be known to be true in f—at least in principle" (156): what it states or depicts, what its author intended, and what follows from these with background reality. Let P-Fic_f be the set of worlds compatible with them. The *standard analysis* sets Fic_f = P-Fic_f, so a claim the principal truths settle neither way is false, and so is its negation.

**The data.** B&H's central case is the final episode of *JAG*. Bud tosses a fair coin to decide which of Mac and Harm will resign and follow the other, and the episode ends with the coin in the air. B&H stipulate, "perhaps counterfactually", that the writers had no intentions about the outcome "and then never thought about the events of JAG again" (161).[^jag] With complement "Bud's coin landed heads", they report: *know*, *be sure*, *know whether* ✗; *think* ✗ for a fair coin, ✓ for one biased 2:1; *doubt* likewise; "It's .5 likely that" ✓; *wonder whether* ✓; *wish* ✗; *hope* ✓ (161–167).

**Against the standard analysis.** Anyone who knows the show knows that "Bud's coin landed heads" is not a principal truth. On the standard analysis, then, they know it is false, and so know whether it is true, are sure it is not, and should be able to wish it were. B&H call the bridge from known semantic value to attitude ATTITUDE EQUIVALENCE (167). Treating indeterminate claims as undefined does no better. A known truth-value gap makes "I wonder whether the King of France is happy" bad, but known fictional indeterminacy does not make "I wonder whether Bud's coin landed heads" bad (169–171). And any trivalent view, B&H argue, predicts that "I know whether p is true, but I don't know whether p" can be uttered truly (171).

**From the data to a single world.** B&H find the following inference "unimpeachable" (172): "I don't know that Bud's coin landed heads. And I don't know that it failed to land heads. So I don't know whether Bud's coin landed heads." Since "fail to" lexicalises negation, the inference requires SCOPELESSNESS: ¬□_f p iff □_f¬p (173). Because □_f quantifies over Fic_f, Scopelessness forces Fic_f to have exactly one member, and fictional excluded middle (FEM) follows: □_f p ∨ □_f¬p (175 and n. 39).

**Locating the world.** B&H's PRINCIPAL REALITY PRINCIPLE (PRP) says that p is true in f at w iff the counterfactual P-Fic_{f,w} > p is true at w, read on Stalnaker's selection semantics (182). The world of f is "the unique world that would accurately represent how things are, were all the principal claims of f really true" (183). Indeterminate counterfactuals show the same attitude profile as fiction. B&H take this to give the PRP "strong abductive support" (182): "we see no better way of explaining these similarities" (183). Similarity rarely favours one candidate world over another, so the selection function picks "at random, so to speak" (184), which is why the facts are unknowable.

## 3. Story states

B&H's step from Scopelessness to a single world assumes that the negation in ¬□_f p is Boolean negation applied to a quantifier over Fic_f. Their footnote 39 runs: if Fic_f contained two worlds disagreeing about p, then "¬□p is true, since not every world in Fic_f is a p-world", and likewise ¬□¬p, contradicting Scopelessness. On the semantics below, a bare claim is not a quantifier over a set of worlds. It is evaluated against an information state shifted by the story, and its negation is interpreted inside the shift.

**The fragment.**

> *Priors.* For each world w, let π_w be a probability over worlds that encodes w's regularities and the chances internal to whatever is being supposed (in-story chances).
>
> *Story images.* For a fiction f, let P_f(w) be the worlds compatible with f's principal truths as they are at w. The image of w under f is the measure π_w(· | P_f(w)).
>
> *States and shifts.* An information state is a set of worlds s with a credence C over it. The shift by f is s⊕f = ⋃_{w∈s} supp π_w(· | P_f(w)), with C⊕f = Σ_w C(w) · π_w(· | P_f(w)).
>
> *Bare claims.* A bare declarative φ, including its connectives and quantifiers, is interpreted inside the shift as f:φ. Here |φ| is φ's ordinary content.
> - s supports f:φ iff s⊕f ⊆ |φ|.
> - s rejects f:φ iff s⊕f ∩ |φ| = ∅.
>
> *Truth.* The internal truth predicate is transparent: f:(φ is true) ≡ f:φ. A bare claim about f is *right* (external truth) iff {@}⊕f, the image of the actual world, supports it.
>
> *Attitudes.* The fiction is a parameter of the context, not an operator inside the complement. An attitude verb relates S to φ by applying its ordinary entry to S's own state shifted by f: D_S⊕f for S's certainties and C_S⊕f for S's credences.

Three features matter.

1. **Scopelessness without a world.** Since ⊕ distributes over unions, support and rejection are fixed world by world. So f:φ behaves like a homogeneous plural predication: it is supported where every candidate is a φ-world, rejected where none is, and gappy otherwise (cf. Križ 2015 on homogeneity). "Bud's coin didn't land heads" and "Bud's coin failed to land heads" both express f:¬h, which is supported exactly when f:h is rejected. That is Scopelessness, with no single world. In footnote 39, "not every world in Fic_f is a p-world" is a fact *about* the state (the story does not settle p). It is not the content of any bare claim, so the slide from two worlds to ¬□p never starts.
2. **FEM fails, internal excluded middle holds.** f:(h ∨ ¬h) is supported, so "Either it landed heads or it didn't" is fine, and so, with transparent truth, is "One of (9a) and (9b) is true." But neither f:h nor f:¬h is supported. FEM, read as a claim about what the story makes true, is false.
3. **Refinement.** If P_{f'}(w) ⊆ P_f(w) for each w, as when f' adds to f without retracting anything, then each image under f' is the image under f conditioned on P_{f'}(w) (assuming that conditional is defined). So s⊕f' ⊆ s⊕f, and C⊕f' is C⊕f conditioned. A consistent addition to a story is a Bayesian update of its state. §5 relies on this.

**The table.** For a viewer who knows *JAG*, D⊕f contains heads-worlds and tails-worlds, and C⊕f gives each .5 (or 2/3 and 1/3 for the biased coin).
- *Know* and *be sure* (support in D⊕f) are ✗, and so is *know whether*.
- "It's .5 likely" (C⊕f) is ✓.
- *Think*, on Holguín's (2022) account, which B&H themselves invoke (the most probable answer to the question under discussion, computed with C⊕f), is ✗ for the fair coin and ✓ for the biased one. *Doubt* behaves likewise.
- *Wonder* and *hope* (the question is open in D⊕f) are ✓.
- *Wish*, which requires ¬h to be supported, is ✗.

B&H's control "I wish that Bud's coin hadn't been flipped at all" is ✓ because "the coin was flipped" is supported. The inference B&H call unimpeachable is valid. No verb needs a special projection rule: each keeps its lexical entry, and all of them look at the same shifted state.

**Trivalence.** The view is trivalent at the level of the state, so B&H's objection (171) applies to it. They argue that a trivalent view must let "I know whether p is true, but I don't know whether p" be uttered truly. With a transparent internal truth predicate, its bare reading is a contradiction: knowing whether f:(p is true) just is knowing whether f:p. The conjunction is acceptable only when "true" is heard as "true according to the story", and then it is acceptable: "I know whether it's true in JAG that the coin landed heads (it isn't), but I don't know whether the coin landed heads." What B&H's objection shows is that the truth predicate in such sentences is transparent. It does not show that fiction has no gaps.

**Explicit operators.** On this view, explicit "according to f" claims are quantifiers over P-Fic, Lewis-style, and may diverge from bare ones, as B&H allow (153). That is what Khoo's (2026: 1191) judgements about explicit "in the fiction of *The Shining*" credence reports reflect.

## 4. Why attitudes toward one fiction cannot decide

On B&H's view, an agent's credence that p is true in f is her credence about where the selection function lands: C_S(□_f p) = C_S({w : s(P_f(w), w) ∈ |p|}). B&H need this to track in-story chances. Otherwise "It's twice as likely that Bud's biased coin landed heads" fails. They concede they have no direct argument that the agent's credal state "must have this structure", and suggest a rational agent will be "doxastically indifferent to the various possibilities compatible with the principal truths" (175). Two bridge principles make this precise.

- **Chance–selection link.** Conditional on any world w, S's credence that s(P_f(w), w) lies in X equals π_w(X | P_f(w)). This is a link of the kind Schulz (2017) defends, and it is what B&H's appeal to indifference has to come to.
- **Openness.** The selections S's certainties leave open, given w, are exactly the support of π_w(· | P_f(w)). This follows from B&H's definition of principal truth as what can be known to be true in f (156): anything about f's world that can be known is principal, so S cannot rule out any selection that P-Fic allows.

**Absorption.** Given both bridges, for every attitude in B&H's table, any φ and any single fiction f, B&H's view predicts that S bears the attitude to □_f φ iff the story-state view predicts that S bears it to f:φ.
- For credence, average the selection over the chance–selection link: C_S(□_f φ) = Σ_w C_S(w) π_w(|φ| | P_f(w)) = (C_S⊕f)(|φ|).
- For certainty, Openness gives: S is sure of □_f φ iff every open selection is a φ-world iff D_S⊕f ⊆ |φ|.

The rest of the table is defined from these two. (The equivalence is a version of Lewis's (1976) result that credence in a Stalnaker conditional equals credence imaged on its antecedent.)

So the data in B&H's §6 cannot discriminate. Their abductive argument compares the single world only with the standard analysis plus ATTITUDE EQUIVALENCE, and with undefinedness. Against those it wins; against the story state it draws. The same goes for the counterfactual parallel of their §9. Any view on which these attitudes are evaluated against a shifted state predicts that fiction and indeterminate counterfactuals pattern together, so the parallel does not favour the PRP. I can grant Stalnaker's semantics for counterfactuals and still deny that it is the semantics of fiction.

Absorption is limited in one important way. The bridges fix B&H's credences one fiction at a time. They say nothing about how the selections for two different antecedents are related. So attitudes toward a single fiction cannot decide between the views, but attitudes that compare fictions, or a fiction at two times, may. That is where to look.

## 5. Growing stories

**Monotonic growth.** B&H discuss fictional change, but only of one kind: revision, as when Gilligan decided that Jesse Pinkman would live. Their conclusion is that the fact that fictional truth "can seem to evolve nonmonotonically is no threat to the idea that there is a single world" (194). The literature on serial fiction has the same focus. McGonigal (2013), Caplan (2014) and Lee (2024) ask what to say when a later instalment overturns an earlier one. Pure addition, a later story consistent with everything before it, looks harmless.

For *principal* truth it is harmless on every view. B&H note that a Lewis-style variably strict version of the Reality Principle "would serve as a plausible theory of principal fictional truth" (182 n. 51). Variably strict conditionals validate rational monotonicity (CV): if A > C, and A > ¬B is not true, then (A ∧ B) > C. So what an earlier story settles stays settled when a consistent story is added. Talk about what works settle, establish or contradict therefore cannot separate the views. The question is the residue: the bare claims B&H take to be true or false although no story settles them.

**The residue under the PRP.** Let A be P-Fic for the Holmes stories in 1890 and B the P-Fic for the stories now. Suppose, as the stories' author and readers took them to be, that each story is consistent with those before it.[^wound] Then B ⊆ A.
- By the PRP, the world of the stories in 1890 is s(A, @) and the world now is s(B, @). By Stalnaker's success condition, s(B, @) ∈ B. So if s(A, @) ∉ B, the worlds differ.
- Is s(A, @) a B-world? It would have to be a world in which fifty-odd later stories happen exactly as told. It was selected from among indefinitely many continuations of the 1890 stories, "at random, so to speak". So almost certainly s(A, @) ∉ B.
- In conditional logic, CEM collapses CV: given CEM, "A > ¬B is not true" is equivalent to A > B. Under CEM, then, CV protects what the 1890 world makes true only when the later stories were already true in it.

How do the two worlds compare on a question no story addresses, such as the parity of Holmes's hairs? Both are selected by similarity to @. The parity in s(A, @) is not a fact about @, so under the PRP it exerts no pull on the selection of s(B, @). B&H give no account of how selections for different antecedents are correlated. If an agent's indifference extends to the selection function itself, the two answers are independent, and the chance that they agree is a half. This is not a feature of selection semantics as such. It comes from locating the world by similarity to actuality, as the PRP does. I return below to theories that correlate the selections.

**The data.** B&H's options for fictional change are two (193–194). On the *versions* option, the 1890 stories and today's stories are different fictions. On the *time-indexing* option, there is one fiction whose world changes when its principal truths do. Now consider Ann (1890) and Carl (2026), each saying "Holmes had an odd number of hairs on his head when he first met Watson."
- (1) ✓ Ann and Carl made the same claim about Holmes, so either both are right or neither is.
- (2) ✗ It's about even odds that one of Ann and Carl is right and the other is not.
- (3) ✓ Nothing published since 1890 can have changed whether Ann is right; none of it bears on Holmes's hair.
- (4) ✗ It's quite possible that Ann was right in 1890 and is wrong now.

On the versions option, Ann's and Carl's claims concern different fictions whose worlds agree on the parity with probability one half. So B&H predict (1) ✗ and (2) ✓. On the time-indexing option, either Ann's claim is assessed at the world of the stories when she made it, in which case it differs from Carl's just as on the versions option, or it is assessed at the world of the stories as they stand, in which case it is right in 1890 iff the parity is odd at s(A, @) and right now iff it is odd at s(B, @). Then B&H predict (3) ✗ and (4) ✓, with probability one quarter that Ann went from right to wrong.

These are not judgements about what works settle. They concern whether bare claims are *right*, and B&H cannot read them as being about principal truth. Their own thesis is that bare claims like (9a) and (9b) are true or false beyond what the work settles: "exactly one of (9a) ... or (9b) ... is true" (176). The judgements are mine, offered as data to be tested rather than reported as collected. They are of the same kind as McGonigal's (2013: 173) cross-temporal datum: replaying a tape of Johnny's 1977 claim in 2007, Jimmy says "That's true".

**What the story state predicts.** By Refinement (§3), the state for the stories now is the 1890 state updated on what was added. Ann's and Carl's claims are each unsupported by the state of the stories they were made about, so neither is right, and nothing published has changed that: (1) and (3) ✓, (2) and (4) ✗. Read internally, the judgements come out the same way. A compound of bare claims about two stages of one growing story can be evaluated in the later state, because each world in it is a candidate for both stages. In each such world the parity is whatever it is, once. So "if Ann's claim was true in 1890, it is true now" is supported. On B&H's view, the analogous move would require s(A, @) = s(B, @), and that is exactly what fails.

**Repairs.** There are five ways B&H could respond.

(a) *Defaults without the PRP.* B&H could correlate the selections. Rank the questions a world answers, fix a default answer to each, and let the world of f be the P-Fic_f-world that matches the defaults lexicographically, highest-ranked first. Then whenever B ⊆ A and the defaults are compatible with B, s(B) keeps s(A)'s answers, and (1)–(4) come out right. But this ordering cannot be the counterfactual selection function. Shared with counterfactuals, it would keep a chancy outcome fixed under any strengthening that leaves the outcome logically open ("had Bud tossed harder", "had a moth flown past"), and those counterfactuals are not true. So defaults require giving up the PRP, and with it B&H's answer to which world is the world of f and their explanation of the counterfactual parallel.[^causal] What is left is a single world located by a stipulated ranking of questions with unknowable default answers. The case for positing it was Scopelessness and the attitude data. §3 shows Scopelessness needs no single world, and §4 shows the attitude data do not discriminate. There is a further cost. Under deterministic story-laws, the parity of Holmes's hairs in 1881 has to outrank every microphysical detail of his college years, or "The Gloria Scott" (1893), which narrates those years, reshuffles it again. Nothing about questions makes that ranking non-arbitrary.

(b) *Path-dependence.* B&H could select the new world from the old one: s(B, s(A, @)). This also abandons the PRP, since fictional truth is then a nested conditional rather than counterfactual truth at @.[^path] It also makes the non-principal truths of a finished work depend on the order in which its parts were published.

(c) *Total narrative.* B&H could say that every stage's world is the world of the eventual whole, s(B_total, @). This is McGonigal's "extreme realism" (2013: 168), defended by Walters (2015). B&H come near it when they say ordinary talk about Breaking Bad "is directed at the final version" (193). Ann and Carl then speak of one world. The costs:
- In 1890 the world of the Holmes stories was fixed by stories Doyle had not yet decided to write, and for a series still running it is fixed by episodes not yet conceived. Walters accepts such eternalist truths about how the maximal fiction will go (Lee 2024: 683).
- If the 1890 stories are parts of one work, they have no world of their own, and B&H's remarks that the pilot of Breaking Bad had principal truths of its own (Jesse would die) must be rejected.
- If they are a work of their own, as B&H's talk of "the first version" allows (193–194), their world is s(A, @) and the versions horn returns.

(d) *Assessment relativism.* Following McGonigal's (2013) relativism, Ann's claim might be assessed at the world of the stories as they stand at the context of assessment. Then (1) is ✓. But (3) and (4) concern how the standing of Ann's claim changes as assessment contexts change, and on this view it flips from 1890 to now with probability a half. In McGonigal's own cases such shifts are driven by later episodes bearing on the claim: Johnny "lucked out" when *The Empire Strikes Back* came out. Here they would be driven by stories that have nothing to do with it.

(e) *Anchoring.* A later story's principal truths might include "this is the world of the earlier stories". But s(A, @) already settles, at random, everything the later story narrates. So the anchor is satisfiable only if the later story happens to match it, and almost certainly it does not.

**The lesson.** The PRP locates a single world, and growth shows that the world it locates is not the one our judgements track. The repairs that respect our judgements either give up the PRP, leaving a single world supported by nothing in the data, or make the world of a story depend on stories not yet written.

## 6. Objections

**Classical conservatism.** B&H might say they get the data with classical logic, Hintikkan attitudes and a Boolean □_f, while I need gaps. But the logic of §3 is the familiar logic of homogeneity. It validates the classical-looking principles of bare fictional talk: internal excluded middle, Scopelessness, and transparent truth. And B&H's view is classical only by positing a selection whose outputs, §5 argues, nobody's judgements track.

**Deliberate openness.** Some works leave questions open on purpose. Stockton's "The Lady, or the Tiger?" ends by asking the reader which came out of the door. On B&H's view an arbitrary fact answers the question anyway. B&H's RESTRICTED FEM (192) exempts only fictions that make a truth-value gap a principal truth, and Stockton's story is open, not gappy. On the story-state view the question stays open, as its author meant.

**Re-readers.** Someone who knows how *Romeo and Juliet* ends can still hope, at Act V, that Romeo gets the letter (Gerrig 1989 on "anomalous suspense"). If hope requires the question to be open in D_S⊕f, re-reader hope looks impossible. But the state shifted by a fiction need not be S's whole state. It can be the state S occupies as a reader at a point in the story, what S takes as revealed so far. Imaginative theories of engagement (Walton 1990; Currie 1990) say the same, and nothing in §4 depends on which state is shifted. B&H can make the same move, so this is a point about both views, not a difference between them.

## 7. Conclusion

B&H showed that the standard analysis, combined with ATTITUDE EQUIVALENCE, mispredicts our attitudes toward fictional indeterminacy. They were right about that. Their mistake was to take the attitudes as evidence for hidden facts. Attitudes evaluated against a story state show the same profile, and no attitude toward a single fiction separates the two hypotheses.

What does separate them is growth. Principal truth grows monotonically on every view. The question is whether the hidden facts B&H add to it are stable when nothing touches them. If they are located by the PRP, they are not: a consistent new story almost certainly changes what the stories make true about Holmes's hair, or makes the same claim right in 1890 and wrong now. To keep them stable, B&H must give up the PRP or let the future fix the past. Lewis's answer survives because it lets the story grow: questions about the number of Holmes's hairs have no answers, and nothing Doyle could have added would have given them one.

[^jag]: In 2019 *NCIS: Los Angeles* brought Harm and Mac back. According to recaps, Mac had won the toss and Harm had passed up a JAG post in London to join her in San Diego (Hurley 2019; Mitovich 2019), which is tails on B&H's labelling (161). B&H's footnote 26 cites, as evidence that no one knows how the coin landed, a *Country Living* piece announcing that *NCIS: LA* "will finally reveal who won the coin flip" (Stein 2019), dated a week before the reveal aired. Their stipulation sets this aside, and so do I. It also picks out the rare case: in practice an unresolved ending is usually one its makers had decided and withheld, or left open on purpose.

[^wound]: The actual canon is not consistent; Watson's war wound moves from his shoulder to his leg. Nothing below depends on the Holmes stories. Any planned series whose instalments are consistent would serve.

[^causal]: A more sophisticated way to correlate selections uses a causal model with fixed default values for its exogenous variables (cf. Briggs 2012). It keeps answers fixed under additions causally downstream of them, as Morgenbesser-style cases require (Schaffer 2004; Kment 2006), while letting chancy outcomes change under relevant strengthening. But additions *upstream* of an open question still reshuffle it, and "The Gloria Scott" (1893) narrates Holmes's college years, a decade before he met Watson. At any grain fine enough for a coin's landing to depend on a passing moth, those years are among the causes of the hairs on his head. At a grain coarse enough to screen the hairs off, the coin no longer depends on the moth. Since the PRP makes fiction share the grain of counterfactuals, it cannot have both.

[^path]: Its divergence from s(B, @) is the failure of import-export for Stalnaker conditionals. It also violates the first Darwiche–Pearl (1997) postulate for iterated revision: when B entails A, revising by A and then by B should be the same as revising by B. And on Lewis's (1979) standard of similarity, on which divergence is cheap and reconvergence costly, the B-world closest to s(A, @) differs from it everywhere downstream of any new backstory, so even this repair reshuffles the hairs.

---
**Notes for step 6:**
- Verify every B&H page and quote with code/findq.py; check the W&W quotes against the PPR version (ask BW for the PDF), and Lewis 1978: 42 directly.
- Verify: Lewis 1973 (CV; C2 = VC + CEM); Stalnaker 1968; Schulz 2017; Holguín 2022; Križ 2015; Gerrig 1989; Walton 1990; Currie 1990; Darwiche & Pearl 1997; Briggs 2012; Schaffer 2004; Kment 2006; Lewis 1979; Badura & Berto 2019; Walters 2015 (read it if possible); Stockton 1882; Gloria Scott 1893; the Watson's wound facts.
- The "Ann (1890)" date: by 1890 *A Study in Scarlet* (1887) and *The Sign of the Four* (1890) were published. Check that the Sign of Four does not mention Holmes's hair.
- Count words; target ≤ 5,800 including notes.
