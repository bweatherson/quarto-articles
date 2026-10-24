# Growing Stories and Hidden Facts (rough draft v3)

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
3. **Growth.** The two views come apart over how stories *grow*. On B&H's view, a later story that is perfectly consistent with the original almost certainly changes, or contradicts, what the original left open. That includes B&H's own example, the hairs on Holmes's head. On the story-state view, nothing that a later story does not address changes. Our judgements side with the second. The repairs open to B&H either misdescribe counterfactuals, which the PRP ties to fiction, or give up the PRP (§5).

I conclude that the case for fictional reality fails. What tells for or against hidden facts is not whether we can be uncertain about a question. It is how answers behave as the information that fixes them grows.

The story-state view is not new in spirit. Williams and Woodward (2021) argued that the right attitude toward what a fiction leaves open is a graded imaginative confidence. They called it "i-credence", set by "the conditional probability of p given the fictive evidence" (MS 2). They held that "there are, so to speak, no fictional facts of the matter" (MS 1). They even used a fair-versus-biased die to illustrate it. Oppy and Raivars (2026) gloss our hopes and credences about JAG informally as attitudes toward "extensions of JAG". Badura and Berto (2019) model truth in fiction as belief revision by the story's content, and Lewis's (1978) own analysis lets a story's truths grow as the story does. B&H cite Williams and Woodward three times, but only for examples, and never discuss their proposal. So the alternative is not new. What I add is:
- a semantics on which *ordinary* attitude verbs, not sui generis imaginative ones, deliver B&H's whole table;
- a diagnosis of where B&H's derivation of a single world goes wrong;
- an argument that the attitude data cannot discriminate;
- the growth argument, which can. This is the main contribution: a datum that separates single-world views of fiction from views that leave questions open, where attitude reports cannot.

## 2. The case for fictional reality

B&H work within the modal approach to truth in fiction (Lewis 1978).
- **Internal claims.** An internal fictional claim, such as "Holmes lives on Baker Street" on its natural reading, carries a silent operator □_f. The claim is true iff its prejacent holds at every world in a set Fic_f.
- **Principal truths.** These are the claims a work is "straightforwardly committed to": what it states or depicts, what its author intended, their obvious consequences, and so on (156–158). Let P-Fic_f be the worlds compatible with them.
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
- Indeterminate counterfactuals show the same attitude profile. B&H take the parallel as "strong abductive support" for the PRP (182): "we see no better way of explaining these similarities" (183).
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

**Monotonic change.** B&H discuss fictional change in §11.3, but only change of one kind: revision, as when Gilligan decided that Jesse Pinkman would live. Their conclusion is that "the fact that what's true in a work of fiction can seem to evolve nonmonotonically is no threat to the idea that there is a single world" (194). The literature on serial fiction has the same focus. McGonigal (2013), Caplan (2014) and Lee (2024) all ask what to say when a later instalment contradicts or overturns an earlier one. All of them treat pure addition, a later story consistent with everything before it, as unproblematic. On B&H's view it is the harder case.

**The argument.**
- *A Study in Scarlet* (1887) was followed by fifty-odd more Holmes stories, each (let us suppose) consistent with those before it.
- Let A be the P-Fic of *A Study in Scarlet*, and B the P-Fic of *A Study in Scarlet* together with one later story. Then B ⊆ A, and for any story that adds something, B ⊂ A.
- On the PRP, the world of *A Study in Scarlet* is s(A, @) and the world of the larger fiction is s(B, @). By Stalnaker's success condition s(B, @) ∈ B. So if s(A, @) ∉ B, the two worlds differ.
- Is s(A, @) a B-world? It would have to be a world in which the later story's events happen exactly as told. The world selected for *A Study in Scarlet* settles everything about Holmes's life before and after 1881, and settles it "at random, so to speak" (184), among indefinitely many candidates. So almost certainly s(A, @) ∉ B.

The point can be put as a fact about conditional logic. CV (rational monotonicity) says that if A > C and not A > ¬B, then (A ∧ B) > C. It is the principle that protects a fiction's truths when the fiction is extended by something it does not rule out. Stalnaker's logic validates CV. It also validates CEM, and given CEM, "not A > ¬B" is equivalent to A > B. So under CEM, CV protects the original's truths only when the extension was already true at the original's world, and for a rich later story that almost never holds. Lewis's semantics, without CEM, lets CV apply whenever the extension is compatible with some closest A-world, which is the normal case (Lewis 1973). What does the damage is not selection semantics as such but uniqueness, the single world per fiction that Scopelessness was meant to require. Stalnaker's (1981) supervaluation over selection functions, and Khoo's (2026: §4) use of it for fiction, escape the problem for the same reason: they give up the single world.

**The open questions.** Take B&H's own example: whether Holmes had an odd number of hairs when he first met Watson (149).
- Nothing in B&H's theory makes s(B, @) agree with s(A, @) about this.
- Both are selected by similarity to @. Holmes's hair count in s(A, @) is not a fact about @, so it exerts no pull on the selection of s(B, @).
- So a rational agent's credence that the two worlds agree about the hairs is about one half. Strictly, B&H say nothing about joint credences over selections; the half assumes the two selections are independent draws. Repair 1 below considers theories that correlate them.

**The data.** Let the later story be "The Gloria Scott" (1893), in which Holmes tells Watson about his college years and his first case, a decade before they met.
- (i) ✓ I'm sure "The Gloria Scott" didn't change whether Holmes had an odd number of hairs when he first met Watson.
- (ii) ✗ It's about 50% likely that "The Gloria Scott" changed whether Holmes had an odd number of hairs when he first met Watson.
- (iii) ✓ Whatever number of hairs Holmes had when he met Watson in *A Study in Scarlet*, he had the same number in the complete canon.
- (iv) ✗ It's about 50% likely that *A Study in Scarlet* and the complete canon disagree about whether Holmes had an odd number of hairs when he met Watson.

(iii) quantifies over exactly the non-principal facts B&H posit, so it cannot be heard as a claim about principal truths.

To my ear, (i) and (iii) are as good as anything in B&H's table, and (ii) and (iv) are absurd. B&H's view predicts the reverse on each of their two options for fictional change:
- **Versions.** *A Study in Scarlet* and the complete canon are different fictions, and their worlds disagree about the hairs with probability about one half. B&H grant that versions' truths "(whether principal or otherwise) can come quite dramatically apart" (194). But they say this about revision, where the later version overturns the earlier. Here the later fiction contains the earlier. This is Caplan's (2014: 69–70) "contradiction problem", a work contradicting a consistent extended fiction of which it is a part, but without the retcon that generated it for Caplan. On B&H's view almost every work contradicts almost every consistent extension of it, on about half of the binary questions both leave open.
- **Time-indexing.** "The Gloria Scott" changed the hair count, with probability about one half.

The state view predicts the judgements. An extension refines the state: since B ⊆ A, the shifted state for the canon is contained in the shifted state for *A Study in Scarlet*. A question the extension does not address stays open. Nothing settled becomes unsettled, and nothing open acquires a new answer.

**Repair 1: defaults.** To keep the hair count fixed, selection must give the open question a default answer that survives strengthening of the antecedent. (A fixed tie-breaking order over worlds is no help. Stalnaker selection already comes from a well-order, and the argument above applies to any well-order.) There are two ways to build in defaults.
- **Lexicographic defaults.** Fix default answers to a privileged list of questions. Among the antecedent-worlds, select the one that matches the defaults on as many questions as possible, in order. This keeps the hairs fixed. But the PRP shares the selection function with counterfactuals, so it would also keep the coin's outcome fixed under every strengthening that leaves the outcome open: had Bud tossed harder, had a moth flown past. Those counterfactuals are not true. A slight change in a toss can change how a fair coin lands, which is why B&H can treat the outcome as fixed only "at random".
- **Causal defaults.** Select by intervention in a causal model with one fixed, arbitrary assignment of values to the exogenous variables (cf. Briggs 2012). Defaults then survive strengthening by content that is causally downstream of the open question or independent of it, which is what Morgenbesser-style cases require (Schaffer 2004; Kment 2006). They do not survive strengthening by content upstream of it. This is the best repair available to B&H. It would protect the hair count against a story set after 1881, which is why the example is "The Gloria Scott", set before. Whether Holmes's college years are upstream of his hair count depends on the grain of the causal model, and the PRP makes fiction share that grain with counterfactuals.
  - At any grain fine enough for a coin's landing to depend on a passing moth, the events of Holmes's college years are among the causes of the hairs on his head ten years later.
  - At a grain coarse enough to screen the hairs off from them, the coin no longer depends on the moth.
  - Either way the repair strains the PRP. Its antecedent, a story's whole principal content including backstory, is not an intervention on variables of the actual world. And the exogenous variables of merely possible people have no actual values to serve as defaults; the defaults amount to a stipulated "default world" for possibilia.

**Repair 2: path-dependence.** B&H could select the new world from the old one: the world of the extended canon is s(B, s(A, @)), the B-world closest to the old world of the fiction.
- **The PRP is gone.** Fictional truth is no longer counterfactual truth at the actual world. It is a nested conditional, A > (B > p), and its divergence from B > p is the familiar failure of import-export for Stalnaker conditionals. It also violates the first Darwiche–Pearl (1997) postulate for iterated revision: when B entails A, revising by A and then by B should come to the same as revising by B. So the §9 answer to "why this world?" goes too. (By §4 that answer was not needed, but B&H offered it as the explanation of the data.)
- **Fictional truth becomes path-dependent.** The open details of a finished work would depend on the order in which its parts were published. Had Doyle written "The Gloria Scott" first, the same canon would have had a different world. A novel serialised in monthly parts, as most of Dickens's were, would have different non-principal truths from the same novel issued in one volume.
- **It does not even save the hairs.** On Lewis's (1979) standard of similarity, divergence is cheap and reconvergence costly. So the B-world closest to s(A, @) differs from it everywhere downstream of the new backstory, Holmes's head included.

**Repair 3: the total narrative.** B&H could say that the world of every instalment is the world of the whole series, s(B_total, @), where B_total is the P-Fic of the complete canon. This is McGonigal's (2013: 168) "extreme realism", defended by Walters (2015). B&H come close to it when they suggest that ordinary talk about Breaking Bad "is directed at the final version" (193). On this view later stories reveal and never reshuffle. Three costs:
- **Earlier stages still have worlds.** B&H allow that "we can think and talk about the first version" (193–194). The 1887 Holmes stories are such a version. So they have a world, s(A, @), and (iii) and (iv) can be read as about it. The total narrative fixes which world default talk is about. It does not stop the 1887 world and the final one disagreeing.
- **It does not fit B&H's account of change.** B&H hold that at the time of the pilot "it was a principal fictional truth of Breaking Bad that Jesse would die" (193). On their second option the default is "the most recent version" (194), not the eventual one.
- **Eternalism about authorship.** In 1887 the world of the Holmes stories would be fixed by stories Doyle had not yet decided to write. For a series still running it would be fixed by episodes not yet conceived, and for one that never ends there may be no total canon. Walters accepts eternalist truths about how the maximal fiction will go (Lee 2024: 683).

**JAG as an illustration.** In 2019 *NCIS: Los Angeles* brought back Harm and Mac. According to recaps of the season 10 finale, Mac won the toss and Harm passed up a JAG post in London to join her in San Diego (Hurley 2019; Mitovich 2019). On B&H's labelling (161) that is tails. B&H's footnote 26 cites, as evidence that no one knows how the coin landed, a *Country Living* piece announcing that *NCIS: LA* "will finally reveal who won the coin flip" (Stein 2019). It is dated a week before the reveal aired.
- B&H's case is closed by stipulation ("perhaps counterfactually", 161), so this is no counterexample to their judgements. But it illustrates the asymmetry.
- On the state view, the franchise's state now settles the outcome, and the question JAG's viewers wondered about has an answer.
- On B&H's view, the 2019 episode either created a new version, whose world agrees with the 2005 version's about the coin only by chance, or it changed JAG's world, with a fifty-fifty chance of overturning the outcome. Viewers took it to answer the question they had been asking.

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

What does separate them is how answers behave as stories grow. A single-world completion of a growing story must do one of four things:
- reshuffle what the story leaves open at almost every consistent addition;
- protect open answers with defaults, which either freezes chancy counterfactuals or still lets backstory reshuffle;
- make the completion depend on the path of growth, giving up the PRP;
- fix every stage by a total narrative, which leaves the earlier stages' own worlds to disagree with it.

A story state does none of these: it refines. Lewis's verdict stands, though not for Lewis's reason. Questions about the number of Holmes's hairs have no answers, and not because no attitude can be held toward them. It is because, if they had answers, almost any later story would change them.

---
**Notes for revision:**
- [done] Lewis 1978: 42 quote, as quoted by B&H p. 159 ("It is absurd to suppose that these questions about the world of Sherlock Holmes have answers"); check against Lewis at step 6.
- Check W&W quotes against the PPR version.
- [done] Khoo p. 1191 (12a), see _NOTES.
- Verify: Lewis 1973 (CV, C2 = VC + CEM); Stalnaker 1981 'A defense of CEM' (supervaluation); Darwiche & Pearl 1997 C1; Briggs 2012; Schaffer 2004; Kment 2006; Lewis 1979; Badura & Berto 2019; 'The Gloria Scott' (1893) setting.
- [done] Lee 2024, McGonigal 2013, Caplan 2014 read; none anticipates the sequel argument (all about retcons). Walters 2015 cited via Lee; get the PDF at step 6 if citing directly.
- [done] JAG/NCIS: LA checked against recaps (CinemaBlend 21 May 2019; TVLine 19 May 2019); not against the episode itself.
- [done] Blumberg & Strohminger (11a) checked (Analysis 85(1): 3-16).
- Gerrig 1989: check citation details.
- Check Veltman 1996 and Križ 2015 for exactly what they establish.
