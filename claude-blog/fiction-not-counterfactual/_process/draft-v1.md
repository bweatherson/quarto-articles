# Growing Stories and Hidden Facts (rough draft v1)

*[Step 3 rough draft. Quotations from Blumberg & Holguín (B&H) are from the published version, with page references. Other quotations still need checking at step 6.]*

## 1. Introduction

At the moment he first meets Watson, does Holmes have an odd or an even number of hairs on his head? Lewis thought it "absurd to suppose" that such questions about the world of Sherlock Holmes have answers (Lewis 1978: 42). In a recent and much-discussed paper, Blumberg and Holguín (2025) argue that Lewis was wrong. "For any given work of fiction, there is a single world that determines what's true in it, and that world is as rich in detail as reality itself" (176). The number of Holmes's hairs is as factual as his profession. It is just unknowable.

Their argument does not start from metaphysics. It starts from the attitudes we take toward the questions fictions leave open:
- We can wonder whether the coin at the end of a TV series landed heads.
- We can find it twice as likely that a biased coin landed heads as that it landed tails.
- We can hope it landed heads.
- But we cannot know, or be sure, how it landed.

B&H argue that this profile cannot be squared with the view that fictional truth is exhausted by what a work settles. They argue that it is exactly what we should expect if there is a fact we are ignorant of. Add a Stalnakerian theory of counterfactuals, and the fact can even be located: it is whatever would be the case if the work's settled truths were true.

I argue that the profile is evidence of something else. Attitudes evaluated against a single *story state* produce exactly B&H's profile. A story state is a body of information, with probabilities, fixed by what a work settles. Such a state leaves the open questions open, and it requires no single world. The paper has three claims:
1. **Scopelessness without a world.** B&H's key logical principle, that the fiction operator commutes with negation, needs a single point of evaluation, not a single world (§3).
2. **Absorption.** The story-state account and B&H's account agree on every attitude datum B&H offer, so those data cannot decide between them (§4).
3. **Growth.** The two views come apart over how stories *grow*. On B&H's view, a sequel that is perfectly consistent with the original almost certainly changes, or contradicts, what the original left open. On the story-state view, nothing that a sequel does not address changes. Our judgements side with the second (§5).

I conclude that the case for fictional reality fails. What tells for or against hidden facts is not whether we can be uncertain about a question. It is how answers behave as the information that fixes them grows.

The story-state view is not new in spirit. Williams and Woodward (2021) argued that the right attitude toward what a fiction leaves open is a graded imaginative confidence. They called it "i-credence", set by "the conditional probability of p given the fictive evidence" (MS 2). They held that "there are, so to speak, no fictional facts of the matter" (MS 1). They even used a fair-versus-biased die to illustrate it. Oppy and Raivars (2026) gloss our hopes and credences about JAG informally as attitudes toward "extensions of JAG". B&H cite Williams and Woodward three times, but only for examples, and never discuss their proposal. What I add is:
- a semantics on which *ordinary* attitude verbs, not sui generis imaginative ones, deliver B&H's whole table;
- a diagnosis of where B&H's derivation of a single world goes wrong;
- an argument that the attitude data cannot discriminate;
- the growth argument, which can.

## 2. The case for fictional reality

B&H work within the modal approach to truth in fiction (Lewis 1978).
- **Internal claims.** An internal fictional claim, such as "Holmes lives on Baker Street" on its natural reading, carries a silent operator □_f. The claim is true iff its prejacent holds at every world in a set Fic_f.
- **Principal truths.** These are the claims a work is "straightforwardly committed to": what it states or depicts, what its author intended, their obvious consequences, and so on (157–158). Let P-Fic_f be the worlds compatible with them.
- **The standard analysis.** This sets Fic_f = P-Fic_f. A fictionally indeterminate claim, settled neither way by the principal truths, then comes out false, along with its negation.

**The data.** B&H's central case is the final episode of JAG. Bud tosses a fair coin to decide which of Mac and Harm will resign and follow the other, and the episode ends with the coin in the air. B&H stipulate, "perhaps counterfactually", that the writers had no intentions about the outcome "and then never thought about the events of JAG again" (161). They report this profile (165):

| Report (complement: "Bud's coin landed heads") | Verdict |
|---|---|
| I know / I'm sure that … | ✗ |
| I know whether … | ✗ |
| I think that … (fair coin) / (biased 2:1) | ✗ / ✓ |
| I doubt that … (fair) / I doubt that it landed tails (biased) | ✗ / ✓ |
| It's .5 likely that … | ✓ |
| I wonder whether … | ✓ |
| I wish that … | ✗ |
| I hope that … | ✓ |

**Against the standard analysis.** Anyone who knows the show knows that "Bud's coin landed heads" is not a principal truth. On the standard analysis, then, they know it is false. So they know whether it landed heads, they are sure it did not, and they should be able to wish that it had. Their credence that it landed heads should be zero.
- B&H call the underlying principle ATTITUDE EQUIVALENCE (167).
- Treating indeterminate claims as undefined does no better. Known undefinedness makes "I wonder whether the King of France is happy" bad, but known fictional indeterminacy does not make "I wonder whether Bud's coin landed heads" bad (169–171).

**From the data to a single world.**
- **The key inference.** It is "unimpeachable", B&H say (172), that:

  > I don't know that Bud's coin landed heads. And I don't know that it failed to land heads. So I don't know whether Bud's coin landed heads.

  Since "fail to" lexicalises negation, the second premise denies knowledge of □_f¬h. The conclusion denies knowledge of ¬□_f h as well. So knowing ¬□_f h must require knowing □_f¬h.
- **Scopelessness.** B&H conclude that the correct analysis validates SCOPELESSNESS: ¬□_f p iff □_f ¬p (173).
- **Uniqueness and FEM.** Because □_f quantifies universally over Fic_f, Scopelessness forces |Fic_f| = 1. It also forces fictional excluded middle, FEM: □_f p ∨ □_f ¬p (175 and n. 39).

**Locating the world.** Which world is it?
- B&H propose THE PRINCIPAL REALITY PRINCIPLE (PRP): □_{f,w} p iff (P-Fic_{f,w} > p). On a Stalnakerian selection semantics this picks out a unique world: "the unique world that would accurately represent how things are, were all the principal claims of f really true" (183).
- Indeterminate counterfactuals show the same attitude profile. B&H take the parallel as "strong abductive support" for the PRP: "we see no better way of explaining these similarities" (183).
- Since similarity rarely favours one world over another in the relevant respects, the selection is arbitrary, "at random, so to speak" (184). That is why the facts are unknowable.

## 3. Story states: Scopelessness without a world

The step from Scopelessness to Uniqueness is the place to look. B&H's footnote 39 runs as follows. If Fic_f had two worlds disagreeing on p, then "¬□p is true, since not every world in Fic_f is a p-world", and likewise ¬□¬p. That contradicts Scopelessness. The argument needs the negation in "¬□_f p" to be Boolean negation applied to a quantifier over worlds. I propose a semantics on which internal claims are not quantifiers over a set of worlds. They are claims evaluated against an information state, and their negation is the story's own.

**States and the story shift.**
- An *information state* is a set of worlds s with a probability measure μ.
- Given a fiction f, let P_f(w) be the worlds compatible with f's principal truths as they are at w.
- The *story shift* takes a state to the state got by imaging each world in it onto P_f(w): s⊕f = ⋃_{w∈s} Img(w, P_f(w)).
- The measure is spread by in-story chance and, where there is none, by typicality. This is general imaging in Gärdenfors's (1982) sense.

The crucial feature is that images are spread, not points. Each world's image of P-Fic_JAG contains worlds where the coin lands heads and worlds where it lands tails, weighted by the coin's chances. (Stalnakerian imaging, by contrast, sends each world to a single selected world. §4 shows what that difference amounts to.)

**Support and rejection.** A bare internal claim f:φ is evaluated bilaterally:
- f:φ is supported at s iff s⊕f ⊆ |φ|;
- f:φ is rejected at s iff s⊕f ∩ |φ| = ∅.

Here |φ| is the ordinary (external) content of φ, a set of worlds. Negation swaps support and rejection, so f:¬φ is supported exactly when f:φ is rejected. Three things follow:
1. **Scopelessness is a theorem.** "It's not the case that Bud's coin landed heads" and "Bud's coin failed to land heads" are both f:¬h, supported exactly when f:h is rejected.
2. **FEM fails.** (f:h) ∨ (f:¬h) is not supported at the JAG state, since that state supports neither disjunct. The internal excluded middle f:(h ∨ ¬h) is supported, so "Either it landed heads or it landed tails" is fine on its natural reading.
3. **No single world.** Fic_f can stay plural. In B&H's footnote 39, the Boolean "not every world in Fic_f is a p-world" is a metalinguistic fact about the state ("the story does not settle p"). It is not the content of any internal claim. So the slide from "there are two worlds" to ¬□p never gets started.

So Scopelessness requires one point of evaluation, not one world. A single story state is such a point. This also answers B&H's objection to a reviewer's wide-scope reply (168 n. 34). "Whether" lexicalises negation, but on this semantics there is no □_f for that negation to fall under; it is evaluated inside the shifted state like any other negation.

**Ordinary attitude verbs.** Attitude verbs get their ordinary entries, applied to the subject's state after the shift. Let D_S be what S is sure of (B&H's Dox_S) and C_S her credence:
- **Know, be sure:** D_S⊕f supports φ. "Know whether" means D_S⊕f supports or rejects φ.
- **Probability and credence reports:** (C_S⊕f)(|φ|).
- **Think:** I use Holguín's (2022) answer-sensitive account, which B&H themselves invoke. S thinks φ iff φ is entailed by the most probable answer to the question under discussion, computed with C_S⊕f. **Doubt φ** is thinking ¬φ.
- **Wonder whether φ:** S is inquisitive about {φ, ¬φ}, and D_S⊕f settles neither.
- **Wish φ** (counterfactual wish): D_S⊕f rejects φ, plus the bouletic component (Heim 1992; von Fintel 1999).
- **Hope φ:** D_S⊕f neither supports nor rejects φ, plus the bouletic component (Benton 2021; Blumberg & Hawthorne 2022).

**The table falls out.** For a viewer who knows JAG, D⊕f contains heads-worlds and tails-worlds, with C⊕f giving .5 each (or 2/3 and 1/3 for the biased coin). So:
- know ✗; sure ✗; know whether ✗ (D⊕f neither supports nor rejects h);
- think ✗ for the fair coin and ✓ for the biased one (heads is the unique best answer);
- doubt behaves likewise;
- "It's .5 likely" ✓;
- wonder ✓ and hope ✓ (the question is open);
- wish ✗ (¬h is not supported).

B&H's control (20), "I wish that Bud's coin hadn't been flipped at all", is ✓, because "the coin was flipped" is supported. Inference (28) is valid: not knowing f:h and not knowing f:¬h is not knowing whether f:h. No attitude needs its own projection rule. Each verb keeps its lexical entry, and all of them look at the same shifted state. So B&H's charge of ad hocery against undefinedness views (171) does not apply.

**The King of France.** B&H contrast fiction with known presupposition failure. All embeddings of "the King of France is happy" are bad (171). But they become fine once a supposition is in force: "Suppose France still had a king. I wonder whether he'd be happy." This tells against treating fictional indeterminacy as undefinedness. It is what the state view predicts: what matters is whether a state with the relevant information is in play.

**Higginbotham pairs.** B&H note that "Every character in The Breakfast Club failed the test" and "No character in The Breakfast Club passed the test" are equivalent, even on a mixed reading with the quantifier outside the fiction (181). On the state view, ¬f:φ ≡ f:¬φ, so ∀x f:¬passed(x) and ∀x ¬f:passed(x) are equivalent too. (Whatever it is that the Breakfast Club's detainees write, it is an essay, not a test. The example can be repaired.)

**Explicit operators.** The state view expects what B&H allow (154): bare internal claims and explicit "according to f" claims can diverge.
- The explicit operator is a quantifier over P-Fic, Lewis-style, and its negation is Boolean.
- So "It's .5 likely that, according to JAG, the coin landed heads" is bad for an informed speaker, since they know it is not true according to JAG.
- This is just what Khoo (2026: 1191) reports for "in the fiction of The Shining" with credence reports. Khoo's judgements and B&H's are then judgements about different constructions.

**Precursors.** The state view is Williams and Woodward's evidentialism, with two differences:
- Their i-credences are ordinary credences evaluated in a shifted state.
- Their "fictive evidence" is the shift.

Blumberg and Strohminger (2025) argue against positing imaginative analogues of desire for attitudes like hope toward fiction. They observe that such hopes are constrained by ordinary belief about the fiction: "#Bill believes that Juliet died, but he hopes that she survived" (11a). The state view agrees. The shift is built from the subject's ordinary information about the story, and no sui generis attitude is needed.

## 4. Why the attitudes cannot decide

The state view predicts B&H's table. Does B&H's view predict anything the state view does not? No. Their credences are credences about which world the selection function picks, and those coincide with credences in the shifted state.

**Credence.** On B&H's view:
- C_S(□_f p) = C_S({w : s(P_f(w), w) ∈ p}).
- By Lewis's (1976) result, this is C_S imaged on P_f by the Stalnakerian selection: credence in a Stalnaker conditional equals imaged credence.
- To get (15b), "It's twice as likely that Bud's biased coin landed heads", B&H need that uncertainty about where the selection lands to track the in-story chances. They concede they have no direct argument that Dox_S "must have this structure". They suggest a rational agent "will be doxastically indifferent to the various possibilities compatible with the principal truths" (175).
- However it is spelled out, this is a chance–selection link of the kind Schulz (2017) defends. Given it, averaging Stalnakerian images over uncertainty about the selection yields exactly the general image. So C_S(□_f p) = (C_S⊕f)(p).

**Qualitative attitudes.** B&H insist that selections are in principle unknowable (150, 184). So whatever S is sure of leaves open every selection compatible with P-Fic. S is then sure of □_f p iff P-Fic ⊆ p iff D_S⊕f supports p. Likewise for the other rows.

**Absorption.** For any agent whose information is silent about selections, which B&H require for indeterminate claims, and for every attitude in the table, B&H's view predicts that S Φ's □_f p iff the state view predicts that S Φ's f:p.

So the data in B&H's §6 cannot discriminate.
- Their abductive argument compares FEM only with the standard analysis plus ATTITUDE EQUIVALENCE, and with undefinedness. Against those it wins. Against the state view it draws.
- The same goes for the counterfactual parallel of §9. Any view on which attitudes toward fiction are evaluated against a story state predicts that they pattern with attitudes toward indeterminate counterfactuals. That holds whether counterfactual attitudes are suppositional (Edgington 2008; Khoo 2022) or are credences in Stalnaker conditionals, which by Lewis's result come to the same thing.
- So the parallel does not support the PRP. I can even grant Stalnaker's semantics for counterfactuals. What I deny is that it is the semantics of fiction.

**What would discriminate.** Since the views coincide on what we may think, wonder and hope, they must differ elsewhere. They differ on whether there is something a fiction makes true that outruns what it settles. That difference should show up when what a fiction settles *changes*.

## 5. Growing stories

**The setup.**
- Stories grow. *A Study in Scarlet* (1887) was followed by *The Sign of Four*, "A Scandal in Bohemia", and fifty-odd more.
- Each later story is consistent with the earlier ones (let us suppose) and adds principal truths about Holmes.
- Let A = P-Fic of *A Study in Scarlet*, and B = P-Fic of the canon after "A Scandal in Bohemia". Then B ⊂ A.

**What the PRP says.**
- The world of *A Study in Scarlet* is s(A, @). The world of the extended canon is s(B, @).
- Stalnaker's (1968) constraints give: s(B, @) = s(A, @) iff s(A, @) ∈ B.
- Is the world selected for *A Study in Scarlet* one in which Holmes, seven years later, is bested by Irene Adler in exactly the way "A Scandal in Bohemia" describes?
  - That world settles everything about Holmes's later life.
  - It settles it arbitrarily, among the indefinitely many continuations compatible with *A Study in Scarlet*.
  - By B&H's own credences, the probability that it happens to match the details of "A Scandal in Bohemia" is negligible.
- So almost certainly s(B, @) ≠ s(A, @).

**What happens to the open questions.** Take a question that both stories leave open: whether Holmes ate eggs on the morning he met Watson.
- Nothing in B&H's theory makes s(B, @) agree with s(A, @) on it.
- Both are selected by similarity to *@*. The breakfast in s(A, @) is not a fact about @, so it exerts no pull on the selection of s(B, @).
- Given the chance–selection link of §4, the two arbitrary selections are as independent as two coin tosses. On a binary question with no in-story bias, they agree with probability about one half.

**B&H's two options for fictional change (§11.3).**
- **Versions.** *A Study in Scarlet* and the Holmes canon are different fictions. B&H grant that versions' truths "(whether principal or otherwise) can come quite dramatically apart" (194). On this option, the two worlds disagree about Holmes's breakfast with probability about one half.
- **Time-indexing.** The world of the Holmes stories changes when the principal truths do. On this option, the publication of "A Scandal in Bohemia" in 1891 changed what Holmes ate that morning in 1881, with probability about one half.

**The verdict, on B&H's own method.** We are to consult our attitudes. Consider:
- (i) ✓ I'm sure that "A Scandal in Bohemia" didn't change what Holmes ate on the morning he met Watson.
- (ii) ✗ It's about 50% likely that "A Scandal in Bohemia" changed what Holmes ate on the morning he met Watson.
- (iii) ✓ I'm sure *A Study in Scarlet* and the complete canon don't disagree about what Holmes ate that morning.

To my ear, (i) and (iii) are as good as anything in B&H's table, and (ii) is absurd. B&H's view predicts the reverse. The state view predicts the judgements:
- An extension refines the state (B ⊂ A, so the shifted state for the canon is contained in the shifted state for *A Study in Scarlet*).
- A question the extension does not address stays open.
- Nothing that was settled becomes unsettled, and nothing that was open acquires a new answer.

**Repair 1: separable selection.** B&H could require that the selection function preserve open details under strengthening of the antecedent. Picture a fixed "default" answer to each question, which every selection respects unless the antecedent forbids it.
- Nothing in Stalnakerian theory delivers this, and similarity to @ does not. So it is an extra structural posit.
- Under the PRP, fiction and counterfactuals share the selection function, so the posit applies to counterfactuals too. There it is false. "If Flippy had been flipped, it would have landed heads" is supposed to be true or false arbitrarily because the outcome depends on details the antecedent does not fix. Strengthen the antecedent with those details (this force, this spin) and the outcome must be free to change.
- Separability would make the coin land the same way however it had been flipped.
- Nor can separability be restricted to "irrelevant" details. In a deterministic story world, later events are not independent of earlier ones; they constrain them. If strengthening the antecedent may flip a coin, it may flip a breakfast.

**Repair 2: path-dependent selection.** B&H could select the new world from the old: the world of the extended canon is s(B, s(A, @)), the B-world closest to the old world of the fiction. Two costs follow:
- **The PRP is gone.** Fictional truth is no longer counterfactual truth at the actual world, so the §9 answer to "why this world?" goes too. (By §4 that answer was not needed, but B&H offered it as the explanation of the data.)
- **Fictional truth becomes path-dependent.** The open details of a finished work then depend on the order in which its parts were published. Had Doyle written "A Scandal in Bohemia" first and *A Study in Scarlet* second, the same canon would have had a different world. A novel serialised in monthly parts, as most of Dickens's were, would have different non-principal truths from the same novel issued in one volume.

**JAG as an illustration.** In NCIS: Los Angeles in 2019, the JAG coin was finally addressed: Mac won the toss, and Harm passed up a post in London to join her in San Diego [VERIFY against the episode; TVLine and CinemaBlend recaps, May 2019]. B&H's Country Living source (dated 12 May 2019) announced the reveal a week before it aired.
- B&H's stipulated case is closed by hypothesis, so this is no counterexample to their judgements. But it illustrates the asymmetry.
- On the state view, the franchise's state now settles the outcome, and the question JAG's viewers wondered about has an answer.
- On B&H's view, the 2019 episode either created a new world for the franchise, in which case whether it agrees with JAG's world about the coin is a coin toss, or it changed JAG's world, in which case there was a fifty-fifty chance it overturned the outcome.

## 6. Objections

**Classical conservatism.** B&H might reply that empirical equivalence favours them. They get the table with classical logic, Hintikkan attitudes and a Boolean □_f; the state view buys it with a non-classical semantics. Three replies:
1. The semantics is the familiar logic of information-sensitive discourse (Yalcin 2007; Veltman 1996). Bilateral support–rejection systems are standard in work on homogeneity (Križ 2015). It validates the classical-looking inferences of bare fictional talk: f:(p ∨ ¬p), Scopelessness, and the Higginbotham equivalences.
2. B&H's view is not classical where it matters. Its classical logic is bought with a selection function nobody can know, whose outputs §5 shows to misbehave.
3. The decisive comparison is not logic but growth.

**"One of you is right."** Two fans disagree: one says the coin landed heads, the other tails.
- On B&H's view, "one of you is right; we just can't know which" is true.
- On the state view, it is unsupported, and the natural verdict is "neither of you is right: the show never says".
- My ear favours the state view, but judgements here are contested, and B&H dismiss "fact of the matter" talk as "semitechnical" (166). I rest nothing on this.

**Deliberate openness.** Some authors leave questions open on purpose. Stockton's "The Lady, or the Tiger?" ends by asking the reader which came out of the door.
- On B&H's view an arbitrary fact answers the question regardless.
- On the state view the question stays open, as the author meant.
- B&H's RESTRICTED FEM (192) exempts only fictions that make a truth-value gap a principal truth. "The Lady, or the Tiger?" is not one: it is open, not gappy.

**Suspense.** Re-readers hope Romeo gets the letter, though they are sure he doesn't. This anomalous suspense (Gerrig 1989) troubles both views equally, since both make hope require the question to be open.

## 7. Conclusion

B&H showed that the standard analysis, combined with ATTITUDE EQUIVALENCE, mispredicts our attitudes toward fictional indeterminacy. They were right about that. Their mistake was to take the attitudes as evidence for hidden facts. Attitudes evaluated against a story state produce the same profile, and no attitude datum separates the two hypotheses.

What does separate them is how answers behave as stories grow. A world-based completion of a growing source must do one of three things:
- reshuffle what the source leaves open at every consistent addition;
- impose a separability on selection that misdescribes counterfactuals;
- make the completion depend on the path of growth.

A story state does none of these: it refines. Lewis's verdict stands, though not for Lewis's reason. Questions about the number of Holmes's hairs have no answers, and not because no attitude can be held toward them. It is because nothing a sequel could do would make the answer stay put.

---
**Notes for revision:**
- Verify Lewis 1978 p. 42.
- Check W&W quotes against the PPR version.
- Check Khoo p. 1191.
- Check Blumberg & Strohminger (11a).
- Verify the JAG/NCIS: LA episode.
- Read Lee 2024, McGonigal 2013 and Caplan 2014 for the serial-fiction literature.
- Gerrig 1989: check citation details.
- Check Veltman 1996 and Križ 2015 for exactly what they establish.
