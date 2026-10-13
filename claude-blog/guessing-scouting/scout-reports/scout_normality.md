# Scouting report: Independent Closure and question-sensitive belief

Context: Fang, "Guessing and Its Limits", PPR 112(3) (2026). Guessing (believe p iff p is a union of the k most probable cells of Q) violates Independent Closure through Filtering Failure: the product of two upper sets is a rectangle, which is generally not an upper set in the product probability order. Fang says the problem extends to Carter & Hawthorne and to other question-sensitive accounts.

Reading status (be aware of this): read in full or nearly so: Fang; G&S "Knowledge from Probability" (EPTCS 335); G&S "Belief Revision Normalized" (EPTCS 379); Carter & Hawthorne "Normality" (preprint); Leitgeb (Duke HTML of the 2014 stability paper, but I did not finish every section); Moss 2019 (most; last pages skimmed); Dorst 2019 (abstract through section 5.1; the tail was not read). NOT read in full: G&S "Epistemology Normalized" (Phil Review 2023) itself. I downloaded the JPL version but did not read it. I rely on the EPTCS papers for the formal core, so anything below about the Phil Review text, including the section 5 definition of "sufficiently more normal", is secondhand from what I saw and should be checked. Hong (Ergo 2023): I read the abstract, intro and the start of section 2 only. Weatherson 2005: extracted but NOT read. Fang's body text has no footnotes or reference list in the file I had, and I found no citation of Weatherson in it; I cannot say whether she uses him in the printed bibliography. Quotes below carry no page numbers because my extracted texts had few reliable pagination markers; verify before using.

## 1. Source notes

### 1 (a). Goodman & Salow, normality papers
Question and answer. When does evidence suffice for knowledge or belief, if not by a probability threshold? Answer: a subject's evidence orders worlds by normality, relative to a question Q. One knows (believes) p iff p holds at all worlds in the accessible region, where accessibility is fixed by how much more normal other worlds are, and normality is tied to probability.

Formal core (as I read it in the EPTCS papers). With a partition Q and evidence E, cells are ranked by Pr_E. The mass rule: B(E) = {s : Pr_E({s' : Pr_E([s']_Q) > Pr_E([s]_Q)}) < t}, and one believes p iff B(E) is a subset of p. Cell s is "in" iff the total probability of strictly more probable cells is below t. This delivers a THRESHOLD constraint, Pr(B) >= t. Variants (k-, km-, i-normality) change how "sufficiently less normal" is measured; the principles are Factivity, evidential knowledge, inductive knowledge, inductive limits, convexity.

Independent questions and conjunctions. G&S do not give a cross-question closure principle; they deny it, via contextualism about which question is live (as I read the Belief Revision paper). Within one question they have closure. So Independent Closure is not a principle of theirs; the question is whether it holds as a theorem for a joint question QR. It does not (section 2).

Takes for granted: that the question is a partition fixed by context; that belief/knowledge is a threshold on an ordering by probability of cells; that the relevant probability is the evidential one.

Leaves open: what happens when the live question is a product. In my reading of the Belief Revision paper they treat cross-question conjunction as unavailable rather than computing the product case. (I did not find a place where they compute the product question; flagging that as a non-exhaustive read.)

### 1 (b). Lin & Kelly ratio rule (for comparison, via CH and G&S)
B_LK = {s : Pr([s]) >= t * max Pr}. This is a margin rule: cells within a fixed ratio of the best. Key property: log-ratios are additive across independent factors, so Independent Closure in belief form holds (section 2).

### 2. Goodman & Salow, "Belief Revision Normalized" (EPTCS 379)
Question and answer. How should belief be revised when the normality ordering is probability-based? Answer: revision is conditioning on E in the mass rule, giving a non-monotonic but principled revision policy.
Formal core: the same mass rule, applied to Pr conditioned on E; belief iff B subset of p, with THRESHOLD. Cross-question closure is explicitly denied. Takes for granted the question-relativity and context fixity. Leaves open: a unified multi-question picture.

### 3. Leitgeb 2014 (stability theory)
Question and answer. How can belief be both closed under conjunction and probabilistically high-but-not-certain? Answer: belief is P-stable: B is believed in context (partition) iff the strongest believed proposition B_W is P-stable, i.e. P(A)=1 or for all w in A, P({w}) > P(W minus A) (with conditional-on-compatible-evidence flavour). Stable sets form a chain, giving a threshold derived from the structure of the P and the partition.
Independent questions. Belief is partition- and P-dependent; he explicitly does not permit conjunction across contexts. So independent closure is again not endorsed.
Takes for granted: the context fixes the partition; a unique strongest believed proposition.
Leaves open: how stable beliefs in separate coarse partitions relate to the fine partition. Section 2 shows that the natural bridge principle fails.

### 4. Dorst 2019, "Lockeans Maximize Expected Accuracy"
Question and answer. Is a Lockean threshold rationalizable by accuracy? Answer: yes, with a proposition- and context-dependent threshold, -F_p/(T_p - F_p), set by contextual priorities about the costs of false and true belief.
Formal core: believe p iff Pr(p) >= that threshold. For conjunctions the thresholds differ; I recall the admission that one sets the threshold for the conjunct higher than for the conjunction (checked in text I read). Independent closure: not secured; closure is paid for by contextual variation in priorities per proposition. Takes for granted: priorities are exogenous. Leaves open: any link between the priorities and the question. (I did not read the tail.)

### 5. Carter & Hawthorne, "Normality"
Question and answer. What is normality and how does it figure in knowledge? Answer: a subject-matter-sensitive normality ordering with an associated-subject-matter semantics.
Formal core: their Def 3 is the mass rule; their informal text reads as the ratio rule. The logic is non-normal: it fails Weakening and single-premise closure. They explicitly reject Agglomeration, in favour of lightweight contextualism.
Consequence for Fang: her claim that the problem extends to CH is true in a sense that CH accept: failure of Independent Closure is a feature CH embrace, not a hidden commitment. Her paper's charge has force only if closure is a desideratum for the theory, which CH reject.
Note on CH's Fact 1 (my check): the preprint's counter-model's stated t-range (0, 12/25) and Max(pi3) = {HT,TH} appear wrong. I get Max(pi3) = {HH} for t <= .36 and {HH,HT,TH} for .36 < t <= .6, so agglomeration fails only for t in (.36, .6]. The published version may differ. Also CH's bag example works on the ratio reading and not on Def 3's mass reading.

### 6. Moss 2019
Question and answer. How should belief be understood if probabilistic content and closure both matter? Answer: belief has loosely stated probabilistic content under contextual precision standards; closure holds within a context, and the preface is dissolved by context shift.
Takes for granted a single contextual standard per context. Leaves open: whether independent questions can share a standard. Close to G&S in spirit: closure within, contextualism across.

### 7. Hong, Ergo 2023 (skim only)
Abstract: preface paradox for knowledge; "Socraticism", we do not know much in any context; a question-sensitive contextualist model that vindicates most knowledge ascriptions, with Closure held fixed. Relevant because it is a neighbouring literature that gets closure by the same contextualist cross-question move. I did not read past section 2.1. I cannot assess his formal model.

### 8. Weatherson 2005
Not read. I cannot say how Fang uses it. Skip it in the priority check except as a flagged gap.

## 3. KEY QUESTION: does G&S normality satisfy Independent Closure?

Define the belief version (ICb): for independent Q, R with B_Q, B_R the believed regions, B_QR is a subset of B_Q x B_R (believing p given Q and r given R should give belief in p and r given QR, i.e. the QR-region must lie inside the rectangle).

Answer: No, for the mass rule. Yes, for the ratio rule. No (in its "may" form) for Leitgeb.

Mass rule, clean example. Q = R = (.85, .10, .05), t = .9. B_Q: cells with strictly-more-probable mass < .9: cell 1 (0), cell 2 (.85 < .9) in; cell 3 (.95) out. So B_Q = B_R = {1,2}. Rectangle {1,2}x{1,2} has mass .9025. On QR the cell probabilities are products: (1,1)=.7225; (1,2),(2,1)=.085; (1,3),(3,1)=.0425; (2,2)=.01; (2,3),(3,2)=.005; (3,3)=.0025. Ordering by probability: (1,1) > (1,2)=(2,1) > (1,3)=(3,1) > (2,2) > ... Strictly-more-probable mass: (1,1): 0; (1,2): .7225; (1,3): .8925 < .9 so in; (2,2): .8925+.085 = .9775 out. So B_QR contains (1,3),(3,1) (mass .0425 each) and excludes (2,2) (mass .01). B_QR is not a subset of the rectangle, and does not contain it. Failure in both directions: someone who believes p given Q and r given R does not believe p and r given QR (since (3,1)... is outside p-and-r? (1,3) is outside the rectangle, so the QR region is not inside it), and the rectangle includes a cell (2,2) that is less probable than excluded-from-rectangle cells. This is Filtering Failure: the rectangle is not an upper set in the product order.

Round-number Fang-style example: Q = (.5, .4, .1), R = (.4, .3, .2, .1). Checked in the Python script; the same pattern.

Python (run with python3 -I). Code in scratchpad/code/ic.py and search.py. Key definitions:
gs_mass(P,t) = {s : sum of v in P with v > P[s] < t}; ratio(P,r) = {s : P[s] >= r*max}.
Results:
- Mass rule: ICb fails in about 26% of random draws; among the 15630 draws where the rectangle's mass is already >= t, it still fails in 970.
- Ratio rule: 0 failures in 20000 draws. Reason: Pr(s,s')/max = (Pr(s)/maxQ)(Pr(s')/maxR), so a ratio threshold on the product is a threshold on the product of the factor ratios. That product test r_Q r_R >= r is weaker than r_Q >= r and r_R >= r? In fact, containment direction (B_QR subset of B_Q x B_R) holds because r_Q r_R >= r implies each factor >= r given each factor <= 1. Good. The converse (rectangle subset of B_QR) generally fails, but ICb as defined only needs the direction above; Fang's Independent Closure needs the rectangle to be believed, i.e. the other direction in "may believe" form. CAUTION: I should flag that which direction is needed depends on how one formalizes "believes q∩r given QR". If belief iff B subset of p, then believing q and r given QR means B_QR subset of q∩r, which follows from B_Q subset of q and B_R subset of r only when B_QR subset of B_Q x B_R. That is ICb. So ICb is the right direction. Fine: ratio rule passes.
- Exhaustive search over distributions in multiples of 1/20: first failing hit Q=(17,2,1)/20, R=(16,3,1)/20, t=9/10.

Leitgeb. Stable sets exist for each factor; the rectangle {A}x{C} (the products of the two strongest stable sets) is stable on the product only if probabilities are high enough: .9/.1 yes; .7/.3 and .6/.4 no. Under the "may believe" reading, closure fails in about 29% of cases (46751 of 158797) and about 40% (26466 of 66556) when both stable sets have probability < 1. Leitgeb accepts this: separate contexts, no cross-context conjunction.

Interpretation. Mass rules (G&S, CH Def 3, Leitgeb) fail Independent Closure; margin/ratio rules satisfy it. The reason: mass rules count how much probability lies above a cell, which does not factor over products; ratio rules compare cells, which does. But mass rules are what give THRESHOLD (belief region has probability >= t), and THRESHOLD plus aggregation across independent questions is impossible: the product of two regions each of mass >= t has mass t^2 < t. Multi-dimensional normality gives agglomeration but violates THRESHOLD. So there is a trilemma: question-sensitivity of the ordering, THRESHOLD, Independent Closure; at most two of three. G&S and Leitgeb choose THRESHOLD and give up cross-question closure explicitly.

Caveat for Fang: her target Guessing is a k-most-probable-cells (a mass-ish rule in count form). The same structure explains why it fails. The extension to G&S and Leitgeb is correct as a formal matter but they say so themselves.

## 4. Candidate paper questions

A. Is "may believe in each question" the wrong notion for the closure debate; should closure be stated as margin-closure? Question: does closure across independent questions require ratio rather than mass rules? Thesis: Independent Closure holds exactly for margin rules, so the stable/normality tradition's mass rules cannot have it. Argument: log-ratio additivity theorem plus converse (a rule satisfying ICb for all independent pairs and a weak monotonicity condition must be a ratio rule). The converse is unproved by me. Objection: Fang or G&S can say the theorem is a restatement of filtering failure. Fatal? Mostly yes on priority: this is applying a known formula to a new case, and it replies to Fang directly. DROP (or fold into another paper).

B. Trilemma: THRESHOLD, question-sensitivity, cross-question closure; belief is not a probability-high state. Thesis: no question-sensitive account of belief can respect both a probability-threshold floor and conjunction across independent topics, so belief must either be non-threshold or non-agglomerative. Minimal pair: two independent coin flips of 85/10/5 types; ask whether a person who believes each region believes the conjunction. Objection: this is exactly what G&S/Leitgeb accept by contextualism, so the "result" is known (the product of thresholds t^2 < t is the old lottery/preface structure). Priority: weak; the lottery paradox in disguise. Likely EXPECTED. Drop unless it becomes the second half of C.

C. Borrow from the contextualist closure literature (Hong, Lewis) to defend cross-question closure for belief. Thesis: the widely held view in the question-sensitive belief literature that cross-question closure must be denied is wrong, because the knowledge-contextualist's Combo A / not-Combo B structure (Hong's terms) already shows how context-indexed relations can support closure per context. Argument: model the QR context as a context where belief is defined on the joint partition and show the context shift is what separates "believing p given Q" from "believing p given QR" without losing Independent Closure for a fixed context. Problem: that is the current G&S move, so it does not contradict them. Priority: neighbouring-literature move is of the right type, but I can't find the principle that would overturn the assumption. Underdeveloped. KEEP as a sketch only.

D. Does the preface paradox show that belief is question-relative? Thesis: preface is a product-of-independent-questions case, so Filtering Failure is the formal core of the preface. Argument: a book with n independent claims, each 0.95 probable; the believed region on the joint question shrinks; compare Hong's Xin. Vivid minimal pair: Xin's book with n=1 versus n=100. Objection: Hong, Dorst, Moss, Leitgeb already treat the preface as exactly this (the question-relativity solutions). Priority: very weak, replying to a recent exchange. DROP.

E. Is the right unit of belief the question or the proposition? Generalist-facing: on Dorst's proposition-by-proposition thresholds closure is paid for by letting the threshold for a conjunct differ from that for a conjunction, while on question-sensitive views it is paid for by letting the question differ. Thesis: these are the same move, and the choice between them is empirical about ordinary belief reports. Argument: translate Dorst thresholds into question refinement. Objection: translation may fail. Priority: moderate-to-weak; comparative survey, which may read as EXPECTED. KEEP as second-best.

Which I would drop: A, B, D. I would keep C as the only candidate of the type that succeeded (an assumption in one literature, here that cross-question closure must be given up, challenged using a principle from a neighbouring one, here contextualism's per-context closure schema), but I could not find a convincing argument; it is a sketch. E is second.

## 5. Honest gaps
- Phil Review text of "Epistemology Normalized" not read; G&S claims rest on the EPTCS papers.
- Hong beyond section 2.1, Weatherson, Dorst's tail, parts of Leitgeb: not read.
- No page numbers for quotes.
- The ratio-rule converse is unproved.
