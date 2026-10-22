# Report: multiple guesses in seven papers on guessing

## Access and provenance (read this first)

| # | Paper | What I actually read | Reliability of quotes |
|---|---|---|---|
| 1 | Dorst & Mandelkern (D&M), "Good Guesses", PPR 105(3) 2022: 581–618 | PhilArchive DORGG, read **only through WebFetch**. That tool returns model-mediated extracts and caps each quotation at **125 characters**. It refused requests to stitch longer passages together. I could not download the raw PDF: PhilArchive, PhilPapers and Wiley all serve a Cloudflare challenge. | The quotes are short fragments as WebFetch extracted them, with section and footnote numbers. Page numbers could not be recovered. Check every quote against the PDF before you rely on it. |
| 2 | Holguín, "Thinking, Guessing, and Believing", Phil Imprint 22(1) 2022 | **Read in full**: the author's January 2022 version marked "Forthcoming in Philosophers' Imprint" (benholguin.com/papers/tgb_pi_2022.pdf, 34 pp.). The journal site (Anubis bot-block) and the PhilArchive PDF could not be fetched. | Verbatim. Page numbers are from the author's file. PI lists pp. 1–34, but I have **not confirmed** that the pagination matches. |
| 3 | Fang, "Guessing and Its Limits", PPR 112(3): 563–577 (2026), DOI 10.1111/phpr.70101. Open access, CC-BY. | **NOT READ.** PhilArchive FANGAI-2 (all three versions), philpapers .pdf, Wiley pdfdirect/epdf/full and the Wayback Machine all failed (Cloudflare, fetch errors or blocks). I got only the abstract and the author's one-line website description. | Abstract only. |
| 4 | Teague, "A puzzle about guessing and inquiry", Analysis 84(2): 327–336 | PhilArchive TEAAPA preprint (16 pp.), via WebFetch only | ≤125-character fragments. Page numbers are the preprint's. |
| 5 | **Joshua Edward Pearson, "A puzzle about weak belief"**, Analysis 85(2): 405–415 (online Aug 2024), DOI 10.1093/analys/anae018. Identified through Crossref; it is chapter 4 of his 2024 MIT thesis *Belief is Messy*. | PhilArchive PEAAPA-8 preprint (MIT affiliation, 11 pp.), via WebFetch only | ≤125-character fragments, cited by section and footnote. Footnote numbering was confirmed across three extractions. |
| 6 | Goodman & Holguín (G&H), "Thinking and being sure", PPR 106(3): 634–654 | **Read in full**: the March 2022 version at benholguin.com/papers/thinking_and_being_sure_ppr.pdf | Verbatim. Pages are from the author's file. |
| 7 | Horowitz, "Accuracy and Educated Guesses" | **Read in full**: the UMass draft. The file is headed **"Draft of 1/8/16"** (36 pp.). It is not the 2019 OSE text, which I did not access. | Verbatim. Pages are from the draft. |

Nothing below is reconstructed from memory. Anything marked [my observation] is my own inference, not the authors' text.

---

## 1. Dorst & Mandelkern, "Good Guesses"

**(a) Main thesis.** The intro says "guessers aim to optimize a tradeoff between accuracy and informativity." A guess's value depends on whether it is true and how many cells of the question it rules out. Guessers maximise expected answer-value, and a parameter J weights informativity. The paper applies this to belief ("believe what your best guess entails"), to assertion and to the conjunction fallacy.

Named principles (WebFetch fragments):
- **Improbable Guessing** (§2): "It's sometimes permissible to answer p even when P (p) < 0.5."
- **Question Sensitivity** (§2): "Whether p is a permissible answer depends not just on the guesser's credence in p…"
- **Optionality** (§2): "Given any question Q, for any k : 1 ≤ k ≤ |Q|, it's permissible for your guess about Q to be the union…" / "…of exactly k cells of Q." (Two overlapping fragments.)
- **Filtering** (§2): "A guess about Q is permissible only if it is filtered"; "if it includes a complete answer q, it must include all complete answers that are more probable than q."
- **Fit** (§2): "If a guess crosscuts a complete answer, it's impermissible."
- **Clustering** (§3.3): "People tend to avoid making guesses that crosscut clusters of complete answers with similar probabilities."
- **Expected answer-value** (§3.1): extracted as "EQ(p) := P (p) · V +Q (p) + P (p) · V −Q (p)". The second P(p) is presumably P(¬p) with the negation lost in extraction.
- **Jamesian measures** (§3.1): "VQ is Jamesian iff, for some t > 0 and J ≥ 1:" with "V +Q (p) = JQp · t if p is true" and "V −Q (p) = 0 if p is false".
- **Filtered Rankings** (§3.2): "Equally informative answers should be ranked by probability" (formally: "if Qp = Qr, then EQ(p) > EQ(r) iff P (p) > P (r)").
- **Say Your Guess** (§4.2): "When the QUD is Q, you should communicate your best guess about Q."
- **Belief** (§4.1, adopting Holguín): "to believe p relative to question Q is for p to be entailed by your best guess about Q."
- **Answer-Value Account** (§4.3): "People commit the conjunction fallacy because they rank outcomes according to their expected answer-value" … "rather than their probability".

**(b) Passages on multiple guesses**
- **§2.** "we'll understand guessing to be a three-place relation between a person x, a question Q, and a proposition p." *So one person's guesses to different questions are different relations, not one stock of commitments.*
- **§2 (Question Sensitivity).** "your guess about 'Where will Latif go?' may be 'Yale', while your guess about 'Will Latif go to Yale or not?' may be 'not Yale'". *One agent with fixed credences may permissibly give jointly inconsistent guesses to two questions.*
- **§2, fn 6 (the 'stickiness' footnote).**
  - It opens: "If you are first asked 'Where do you think will Latif go?', and your guess is 'Yale'". WebFetch paraphrase of what follows: if you are then asked whether he will go to Yale, "yes" is the natural answer.
  - "This is presumably explained by some 'stickiness' in the contextual resolution of the question under discussion:"
  - "the first QUD 'Where will Latif go?' may remain salient even if" "the new question, 'Will Latif go to Yale?', is explicitly asked."
  - *This is D&M's only remark on sequential guessing. They treat the later answer's conformity as the earlier QUD persisting, not as a coherence norm.*
- **§2.** "at any given point in a conversation, there's a question under discussion (QUD) that guessers aim to address". Fn 3 (paraphrase only): the explicit question can differ from the QUD. *This sets up QUD-relativity but gives no dynamics.*
- **§3.2.** "If you are asked to rank the complete answers to a question, your ranking should follow the probabilities." *This is the only treatment of ranked lists. Ranking is the ordering of complete answers, not a sequence of guesses.*
- **§2, Optionality (k cells).** *A "top-k" answer is modelled as one disjunctive guess, not as k separate guesses.*
- **§3.3.** "we take J-values to be very flexible—able to adjust as you switch amongst questions"; "despite the fact that these two guesses will require different J-values". *The same person's informativity weighting may shift from question to question within one context.*
- **Fn 23.** "the Jamesian account makes some substantive predictions about how the QUD will affect people's tendencies to guess."
- **§4.3.**
  - "rankings of all possible answers according to their expected answer-value"
  - "although the conjunction will never be more probable than one of its conjuncts, it may nevertheless be a better guess"
  - "our claim is not that FT is a good guess, but rather that it is a better guess than T"
  - *Conjunction versus conjunct is treated as ranking two candidate answers to one question, not as guessing two questions.*
- **§2 (Fit).** The only conditional in the paper is inside a single guess: "Latif will go to Yale or Harvard, and if he goes to Yale, he'll learn a lot". *Conditional guesses of the form "if not A, then…" are not treated.*
- **§4.1.** "it's perfectly sensible to say 'I think your lottery ticket will lose.'" *The lottery appears only to illustrate weak belief. No multi-ticket aggregation is discussed.*
- **Not found** (WebFetch reported "not addressed" for each): guessing again after being told you are wrong, second guesses, conditional guesses, coherence among one person's guesses, closure of guesses under conjunction.

**(c) Consistency across questions.** Guesses relative to different questions may be jointly inconsistent (the Latif example). Belief is "a relation to a proposition, relative to a question." No cross-question consistency requirement is stated. Fn 6 is the only remark about one person guessing several questions in one conversation. Fn 27 (paraphrase) asks whether people with different J-values *disagree*; that is interpersonal, not within one person.

**(d) Open problems flagged**
- §4.2: "Clearly there is much more to do to defend a picture like this—a project we take up in further work (Mandelkern and Dorst, 2021)."
- §4.3: "In future work, we plan to offer a more detailed examination of both the empirical literature"; "we leave it open that other proposed factors—like confirmation, similarity, implicature, and noise—also influence the effect".
- Fn 38: "A question we want to remain neutral on here: do words like 'likely' and 'probably' have a meaning…"

---

## 2. Holguín, "Thinking, Guessing, and Believing"

**(a) Main thesis.** "this paper defends the view that to think that p is to guess that p is the answer to the question at hand, and that to think that p rationally is for one's guess to be in a certain sense non-arbitrary" (p. 2). Thinking is question-sensitive, extremely weak, non-monotonic and closed under entailment, and it is a matter of choice. If thinking is believing, all of this holds for belief too.

Principles, verbatim:
- **CLOSURE** (p. 10): "If a set of propositions Γ is such that S is rationally permitted to think every member of it, and Γ entails p, then S is rationally permitted to think that p."
- **CONSISTENCY** (p. 12): "S is not rationally permitted to be such that: S thinks that p and S thinks that ¬p."
- **NON-MONOTONICITY** (p. 9): "There can be two agents (or the same agent at different times) S1 and S2 such that: CS1 (p) < CS2 (p), yet S1 is rationally permitted to think that p while S2 is not."
- **Best guess** (p. 17): "let S's best guess to Q? be the answer to Q? in which S has highest rational credence (if multiple answers are tied for first, S's best guess is their disjunction)".
- **BEST GUESS** (p. 17): "S is rationally permitted to thinkQ that p just in case: the conjunction of ES and S's best guess to Q? entails p."
- **guess** (p. 24): "I'll start by defining S's guess to Q? as the strongest answer to Q? such that S thinksQ that answer is true."
- **Cogency** (p. 25): p is cogent iff "(1) p is a union of complete answers to Q?" and "(2) If there is a complete answer to Q?, r, such that r doesn't entail p, then there is no other complete answer to Q?, r*, such that: r* entails p, but CS (r) ≥ CS (r*)."
- **COGENT GUESS** (p. 25): "S is rationally permitted to thinkQ that p just in case: (i) the conjunction of ES and S's guess to Q? entails p, and (ii) S's guess to Q? is cogent."
- **DOXASTIC CHOICE** (p. 28): "S thinksQ that p just in case: the conjunction of all the propositions S is sure of and S's choice of answer to Q? entails p."
- Also stated: WEAKNESS, SUBSTANTIAL WEAKNESS, EXTREME WEAKNESS (p. 6), the ML-versions (p. 18), PERMISSIVISM (p. 26) and THINKING SCHEMA (p. 26).

**(b) Passages on multiple guesses**
- **§6, p. 10.**
  - "(7) a. ✗ I think B will be at the party. I also think C will be at the party. But I wouldn't say I think both B and C will be at the party."
  - *These are the data for agglomeration across a person's several thoughts.*
- **§6, p. 11 (Kyburg's lottery).**
  - "for each entrant it seems rationally permissible to think that that entrant won't win. But of course you know that someone has to win, and are thus not rationally permitted to think that none of the entrants will. … then rational thinking cannot be closed under conjunction."
  - *This is the lottery-type case in this corpus: separately licensed guesses on many binary questions are jointly inconsistent.*
- **§6, pp. 11–12 (Bond: 40% London; 20% each Berlin, Frankfurt, Munich).** Asked the city, "'We're not sure, but we think he's in London' is a perfectly appropriate response". Asked the country, "the most natural response would be 'We're not sure, but we think he's in Germany'". *Two questions with overlapping subject matter get incompatible permissible answers.*
- **§8.2, pp. 17–18 (horse race 40/35/25).**
  - "Here are two things I might ask you: 1) Who do you think will win the race? 2) Do you think it is true that A will win the race?"
  - "it would be perfectly appropriate to answer the first question with something like 'I think A will win', perfectly appropriate to answer the second question with something like 'No, I think one of the other horses will', but not at all appropriate to answer either question with something like 'I think both that A will win the race and that A won't win the race'."
  - "Thus, there is no Q? such that you are rationally permitted to thinkQ that A will win and that A will not win."
- **§8.2, pp. 19–20 (diagnosis).**
  - Bond: the impression that one can rationally think he is in London but not in the UK "is simply due to the fact that what one is rationally permitted to think relative to the question 'Which city is Bond in?' is distinct from what one is rationally permitted to think relative to the question 'Which country is Bond in?'."
  - Lottery: "For each entrant n, relative to the question 'Will entrant n win the lottery?' S is rationally permitted to think n won't win the lottery. But relative to the question 'Will someone win the lottery?' S is not rationally permitted to think of any individual entrant that that entrant will not win. Thus, there is no single context in which 'S is rationally permitted to think someone will win' and, for each n, 'S is rationally permitted to think entrant n won't win' all express true propositions."
  - *Joint inconsistency across many binary questions is allowed, but only across contexts, never within one.*
- **Fn 22, p. 19.** "Well, we really only have single-premise closure. But generalizing to the multi-premise case is easy enough." (This is closure within one question.)
- **§9.2, pp. 21–22 (sequential questions in one conversation).**
  - "(9) ✗ Well I think Bond is in London rather than Frankfurt or Berlin; but I also think he's in Germany rather than the United Kingdom."
  - "Likewise, if one were asked 'Which city do you think Bond is in?' and then immediately after 'Which country do you think Bond is in?', it would sound rather strange to answer first 'London' and then 'Germany'. One's audience would probably infer that one thinks London is in Germany."
  - We would otherwise "expect ordinary speakers … to understand the answers to the two consecutive questions about Bond's location as expressing distinct thinking relations. Indeed, we wouldn't expect there to be any puzzle about CLOSURE in the first place."
  - *This is the most explicit passage in the corpus on consecutive guesses. Holguín treats it as evidence of semantic blindness, not as a norm.*
- **p. 22.** "everyone's theory of (rational) thinking needs to account for the fact that, holding S's evidence fixed, there are some situations in which an agent can assert 'I think Bond is in London', other situations in which they can assert 'I think Bond is in Germany', but no situation in which they can rationally think London is in Germany."
- **Fn 24, p. 21.** If contrast classes needn't be partitions, a question like {p, ⊥} would make almost any p thinkable. *This is why the questions must be partitions.*
- **§10, pp. 23–25 (several candidate answers to one question; credences a .35, b .30, c .20, d .15).**
  - "(16) ✗ There is no horse in particular I think will win, but I do think it will be either A or C."
  - "what one is rationally permitted to think relative to a question Q? depends not only on the distribution of one's rational credences in its answers, but also on what one in fact thinks the answer to that question is."
  - "only the following guesses are cogent for S: a, a ∨ b, a ∨ b ∨ c, and a ∨ b ∨ c ∨ d."
  - *Permissible guesses form a nested top-k chain. Nothing is said about producing several of them in sequence.*
- **§11, pp. 27–28.**
  - Credal duplicates: "nothing guarantees S1 and S2 will answer in the same way."
  - On the coin: "in choosing between heads or tails when asked to guess how a coin will land. Your credences don't determine whether you guess heads or tails."
  - *Relevant to whether a repeated or second guess must coincide with the first; not explored.*
- **p. 9.** "One can start off rationally thinking that p, acquire evidence that increases the likelihood that p, but—because the evidence increases the likelihood of a relevant alternative q even more—one can thereby become rationally prohibited from thinking that p." *This is diachronic revision on new evidence, not on being told you are wrong.*

**(c) Consistency across questions.** CONSISTENCY and CLOSURE hold within a single question or context. Across questions, jointly inconsistent thoughts or guesses are permitted (horse race, Bond, Kyburg). The bad sound of consecutive answers like "London" then "Germany" is put down to semantic blindness.

**(d) Open problems flagged**
- "What to make of CLOSURE then? At this point it is hard to say." (p. 12; resolved later in the paper.)
- "I lack the space here to address the vexing issues concerning contextualism and semantic blindness in the detail they deserve" (p. 22).
- "it is an open empirical question the extent to which people are capable of choosing to think non-cogently" (p. 29).
- Whether defenders of traditional belief can explain why language treats thinking and believing alike "is not something I will try to resolve here" (p. 31).

---

## 3. Fang, "Guessing and Its Limits" (NOT READ: full text inaccessible)

**(a) From the PhilArchive abstract (verbatim fragments):**
- "Guessing is the thesis that, roughly put, you may believe something iff it is among the most probable answers" "to a salient question."
- "This paper raises a novel problem for the thesis, focusing on belief reports in multi-question scenarios."
- "I introduce and motivate a plausible inter-question principle for belief," "show that Guessing is incompatible with the principle, and argue that the resulting puzzle is intractable" "and significant—posing a unique challenge to the thesis."
- "Moreover, the problem generalizes to formally parallel 'question-sensitive' accounts in epistemology and philosophy" "of language, calling for future research into their limits."

Her website adds: "I present a puzzle for a 'question-sensitive' theory of belief/guessing in multi-question scenarios."

**(b)–(c)** I cannot report the inter-question principle, the cases or any passages. This is the paper most directly on point, and it needs to be read from the PDF (CC-BY, Wiley).

**(d)** The abstract flags "future research into their limits."

---

## 4. Teague, "A puzzle about guessing and inquiry"

**(a) Main thesis.** Good guesses track likelihoods (Filtering), but rational inquiry seems to require coherent guesses across related questions. The two conflict, and contextualism does not fix it. "a fully satisfactory account of guessing or other question-sensitive attitudes should aim to address and solve this puzzle" (p. 1).

Principles:
- **Filtering** (as Teague states it, citing Holguín; p. 3): "A guess, p, about Q is permissible only if for any q, q′ ∈ Q: if P (q′) > P (q) and q ⊆ p, then q′ ⊆ p."
- **DAC** (p. 9): "If you are wondering Q, and don't immediately come to an answer," "then it is sometimes a good idea to subsequently wonder some R," "where for every r ∈ R there is a q ∈ Q such that q ⊆ r."
- **WTP** (p. 11): "If your guess to Q is p, and for every q ∈ Q there is an r ∈ R such that q ⊆ r," "then your guess to R should be compatible with p."
- **PTW** (pp. 11–12): "If your guess to R is that p, and for every q ∈ Q there is an r ∈ R" "such that q ⊆ r, your guess to Q should be compatible with p."
- **WAG** (p. 12): "If your guess to R is p, and there is a q ∈ Q such that p and q are incompatible, then you ought not to wonder Q."

**(b) Passages on multiple guesses**
- **p. 2.** "a guess that is rational in isolation (not Yale) becomes irrational when it forms part of a broader inquiry". Also: "one's best guess about whether Latif will go to Yale can be part of a rational inquiry that leads to one's best guess about where Latif will go".
- **Fn 2, p. 2.** "However given a polar question whose alternatives are just {a,¬a} it can be rational to guess ¬a."; "rationally guessing the answer to the latter question can form part of a rational strategy for answering the former."
- **p. 4.** "it looks like it's acceptable to have guesses that are, prima facie, incoherent"; "to guess that p and to guess that ¬p about what is, intuitively, one and the same subject matter."
- **p. 5 (sequence).**
  - "If that same someone also considers the question of whether Latif will go to Yale and guesses that he won't, then this guess contradicts her previous guess."
  - "I think this problem of seemingly incoherent guesses is more severe than has been noted."
  - "Importantly, inquiry can involve multiple guesses in sequence, and this has an important dialectical function here."
  - "in the course of a single line of inquiry, their genuine incoherence becomes hard to deny."
  - *This is the corpus's most direct claim that sequential guesses by one inquirer must cohere.*
- **Fn 7, p. 5.** The puzzle "is particularly addressed to the plausible coarse-grained view of questions and answers". (Fine-grained individuation of guesses by question is noted as an escape.)
- **Fn 8, p. 5.** Reports D&M's "stickiness" explanation.
- **pp. 6–7.**
  - "(1) # As to whether Latif will go to Yale or not, my guess is that he won't, but I wonder whether he'll go to Harvard, Stanford, NYU, or Yale."
  - "Intuitively, the guess part suggests that the speaker is in some way prepared to rule out Yale"
  - Related examples: "(2) My guess is that Latif won't go to Yale, but still, I wonder whether he might."
- **p. 9.** "One might guess that the answer to Q is p, and thereby bring one's inquiry to a close"; "it seems plausible that what we guess does and at least sometimes should bear upon what we wonder and vice versa".
- **pp. 10–12.**
  - "If you're wondering where Latif will go to law school, it makes sense, as part of this activity, to wonder whether he will go to Yale."
  - "the beliefs you form about this latter question should match those you form about the former."
  - "your guess to where Latif will go to law school should not be that he will go to Yale."
  - Fn 19: DAC underlies Twenty Questions.
  - Fn 24: WTP is "almost exactly like that for question-sensitive belief proposed by Hoek (forthcoming.), which he calls 'Harmonic parts.'"
- **pp. 12–13 (contextualism).** "semantic blindness doesn't seem plausible to me at all here"; "the contextual parameters … are the very questions they are explicitly guessing and wondering about". *This is aimed at Holguín's semantic-blindness defence.*
- **Fn 28, p. 13.** WAG may need restricting to explicit or occurrent guesses (Lee 2020).

**(c) Consistency across questions.** Yes. WTP and PTW say that guesses to mereologically related questions should be compatible. Teague claims this is what DAC-style inquiry presupposes.

**(d) Open problems flagged.** "Personally, I do not yet know what to say about the intuitive data in section 1"; "So what's going on?" (p. 14). On WAG: "I don't have much to say about how exactly to interpret the 'ought' here" (p. 12).

---

## 5. Pearson, "A puzzle about weak belief"

**(a) Main thesis.** "The puzzle is that we cannot have both Conditional Weakness and Closure." (§4)
- **BGA** (§2): "S is rationally permitted to believeQ p iff e&gC,Q entails p."
- **gC,Q** (§2): "the cell of Q that C assigns greatest probability to" "(or the union of cells tied for greatest probability)."
- **CBGA** (§3.2): "S is rationally permitted to believeQ p→ q iff e&gCP,Q entails q", where gCp,Q is "the cell of Q that C(· | p) assigns highest probability to (or the union of cells with highest probability)."
- **Modus Tollens**: "(p→ q) and ¬q jointly entail¬p."
- **Proof By Cases**: "If (p1 ∨ p2) is a tautology, then (p1 → q) and (p2 → q) jointly entail q."

**(b) Passages on multiple guesses**
- **Bond (§1/§2).** Extracted credences are London 40%, Munich 30%, Berlin 30%, which differs from Holguín's numbers. "(7) I {believe / think} Bond is in Germany and in London" cannot be heard as rational.
- **Six-sided die (§3).** "(12) I think Alice will win."; "(13) I think that if the die lands greater than 3, Bob will win."; "(14) I think Alice will win; nevertheless, I think that if the die lands greater than 3, Bob will win." This is felicitous, but no single question licenses both beliefs on BGA. *This is the corpus's closest analogue to a guess conditional on the first guess being wrong.*
- **Ten-sided die (§3.2/§4).** Under CBGA, "S's permissible beliefs are not closed under Modus Tollens", and "CBGA predicts one can believe Bob will win!"
- **§3.1.**
  - Rejected reply: "posit bridge principles allowing what one can permissibly thinkQ1 to impact what one can permissibly thinkQ2"
  - Reason: "we require a substantive independence between what one can permissibly think with respect to different questions" (to block (7)).
- **Fn 11.** "Might we, as a referee suggests, allow for mid-context shifts" (Dorr). The author warns of over-generation.
- **Fn 12.** The conjunctive question QWin?&>3 ("Who will win, and who will win if the die lands greater than 3?"), and "Can Holguín reply by allowing one's best guess to break ties, as per Dorst and Mandelkern 2021?". Answer: no, because the die can be reweighted.
- **Fn 13 (Hoek).** "those beliefs should cohere with one's beliefs about the separate conjunct questions."
- **Fn 15.**
  - "it may be useful to distinguish between beliefs being permissible in isolation from beliefs being collectively permissible"
  - "I doubt this move can work for conditionals like (12) and (13)."
  - "distinguishing between isolated versus collectively permissible beliefs is a promising strategy for further research"
- **Fn 5.** "if S permissibly believes p1, ...pn, and p1, ...pn jointly entail q, then S is required to believe q": something BGA must add.

**(c) Consistency across questions.** The question-sensitive view needs cross-question independence to block (7). But (14) shows that conditional and categorical weak beliefs relative to different questions must interact in reasoning, so the view is squeezed.

**(d) Open problems flagged.** The pragmatic story or restricted closure principles needed: he cannot see what the "requisite pragmatic story or restricted closure principles would look like". Also fn 15, quoted above.

---

## 6. Goodman & Holguín, "Thinking and being sure"

**(a) Main thesis.** Being sure and thinking have different normative links to action. Surety norms govern assertion and inquiry; thinking is governed by best guesses. There is "no theoretically significant notion of 'full belief' intermediate in strength between thinking and being sure."
- **Thinking** (p. 17): "(i) Think that p is the true answer to Q only if p your best guess to Q. (ii) If it's okay that p be your best guess to Q, then it's okay to think that p is the true answer to Q."
- **Guessing** (p. 18): "People typically guess answers to questions by becoming opinionated about the questions and then guessing the answers they think are true."
- **Deciding** (p. 18): "People typically make decisions by becoming opinionated about what they should do, and then intending to do what they think they should do."

**(b) Passages on multiple guesses**
- **p. 16 (Djokovic).**
  - Two questions: "'Who do you think will win Wimbledon?' versus 'Do you think Djokovic will win Wimbledon?' (or even better, 'Who do you think will win Wimbledon: Djokovic or the field?')"
  - "it is perfectly natural to answer the first question with 'I think Djokovic will win' and to answer the second question with 'No, I think someone else will', at least if only one of the questions is asked."
  - "In answering this way, it does not follow that you have an incoherent doxastic state. Nor does it follow that you maintain coherence only by changing your mind between the two questions about whether Djokovic will win Wimbledon. You may simply think that Djokovic will win relative to the former question but not relative to the latter. Similar points go for multiple-choice exams ('What do you think the answer to this question is?' versus 'Do you think the answer to this question is (c), or something else?') and horse races".
- **Fn 24, p. 16 (complete text).** "Asking the questions in immediate succession tends to force the second answer to conform to the first." *This parallels D&M fn 6 and is offered as an observation, not explained.*
- **p. 15.** On an exam answer, the instructor's question "'Why did you put (c)?', an answer along the lines of 'Because I thought it was the correct answer' would seem unhelpful, if not petulant."
- **p. 18.** Guessing contexts are "forced-choice under conditions of uncertainty, as in multiple-choice exams, trivia questions, game shows, and the like."
- **Fn 31, p. 19 (repeated guesses on a biased coin).**
  - "Are they always going to guess that it will land heads when tossing the coin to determine who will go first in a game? Not necessarily."
  - "nevertheless they still think (irrationally) that the coin will land tails on occasions where they guess it will."
  - "What about people who have a stable disposition to guess heads if they know the coin is even slightly biased…"
  - *The only discussion of a series of guesses on repeated trials.*
- **p. 14 (inquiry after forming a view).** "we think that anything falling short of surety can suffice for reasonable inquiry"; "one may still reasonably remain curious whether p, or idly wonder whether p, as long as one remains unsure whether p." *This bears on Teague's WAG.*
- **p. 24.** "Perhaps one can have subjective probability 0 that a dart will land at a certain point while thinking (relative to the question of which point it will land on) that it will land there, this being one's best guess."

**(c) Consistency across questions.** Explicitly no incoherence across questions (the Djokovic passage). But in immediate succession, the second answer tends to conform to the first (fn 24).

**(d) Open problems flagged**
- "We see it as an interesting question for further work whether there is any attitude intermediate between thinking and being sure that is necessary for knowledge" (p. 24).
- Fn 26: "Allowing the answers to be partial introduces a range of complications."
- Fn 36: "This claim may need to be restricted to certain kinds of knowledge."

---

## 7. Horowitz, "Accuracy and Educated Guesses" (Jan 2016 draft)

**(a) Main thesis.** "Your credences are more accurate insofar as they license true educated guesses. They are less accurate insofar as they license false educated guesses." (p. 3) The framework vindicates Immodesty and, with extra norms, probabilism.
- **Simple questions** (p. 4): "When faced with a forced choice between two propositions, your educated guess should be the proposition in which your credence is highest."
- **Suppositional questions** (p. 4): "When faced with a forced choice between two propositions given some supposition, your educated guess should be the proposition in which your conditional credence (conditional on the supposition being true) is the highest."
- **Equal credence** (p. 4): "With both suppositional and non-suppositional questions, if you have equal credence in both options, you are licensed to guess in favor of either one."
- **Immodesty** (p. 7): "A rational agent should take her own credences to be best, by her own current lights, for the purposes of making true educated guesses."
- **No Self-Sabotage** and **No Missing Out** (p. 13).

**(b) Passages on multiple guesses**
- **Fn 6, p. 4.** "At the moment I'll keep things simple and just look at two-option cases, but there is no reason I can see why the framework couldn't be extended to choices between three or more options. How the framework would develop, if expanded in this way, is an interesting question – it would likely turn out that, on any plausible expansion, licensed guessing will be partition-relative."
- **pp. 4–5 (conditional guesses).** "Q2: Supposing that it's not sunny, which is it: rain or snow?" With Cr(Sun) .75, Cr(Rain) .2 and Cr(Snow) .05, "your credences license guessing Rain". "Suppositional guesses won't be assessed at all in cases where the supposition is false." *This is the corpus's only explicit norm for "if not A, then…" guesses. It is structurally what a second guess after the favourite is ruled out would be, though Horowitz doesn't frame it that way.*
- **p. 10 (Q3).** "(a) the coin is flipped, out of sight; (b) you answer whether Rain; and (c) you and the coin disagree about Rain. Who is right?" *A guess conditional on one's own first guess being contested.*
- **p. 11.** "To do well on the exam, when you don't know what question you will encounter, you need to be prepared for any question of this form."
- **pp. 19–22 (Q5a/Q5b: guesses on a disjunction versus on its disjuncts).**
  - "This combination of guesses illustrates the inconsistency in your credences."
  - "But the only difference between Q5a and Q5b was in how your guess about Q and R was presented: as a disjunction in Q5a, and as separate guesses on Q and R in Q5b. So if you are rational, you should not answer differently in Q5a and Q5b." (p. 21)
  - "Your credences should not license both guesses simultaneously." (p. 22)
  - "How reliable you take yourself to be regarding Q and R depends on how you are asked about Q and R – how the very same guessing situation is presented to you." (p. 23)
- **p. 31.** "we can do justice to the original thought that 'closer is better' if we look at all of the guesses that our credences license. Someone with .9 credence in a true proposition P will guess correctly not just about P, but about lots of other questions as well". *Accuracy is a property of the whole battery of guesses across many questions.*
- **Lottery cases: not in this draft.** A search finds "lottery" only in the bibliography (Lin & Kelly, cited in fn 6). The draft has no case where educated guesses on many binary questions are jointly inconsistent. If such a case is in the published OSE 2019 version, I could not check it. In this corpus that case is in Holguín §6/§8.2.

**(c) Consistency across questions.** Only invariance under re-presentation of "the same question" (Q5a/b), which is used to argue for Additivity. There is no requirement that guesses on distinct binary questions be jointly consistent. [My observation: applied question by question, Simple Questions would license "ticket i loses" for every i together with "some ticket wins". The draft does not note this.]

**(d) Open problems flagged**
- Extension to more than two options (fn 6).
- "What is required in these cases is a tricky question" (Carr's handstand case, p. 15).
- "A full exploration of these questions is beyond the scope of this paper" (p. 24).
- "I will leave that question open for now" (on dominance and Dempster-Shafer, p. 26).
- The concluding list of questions (p. 33).

**Supplementary (not one of the seven).** Horowitz's book manuscript *Guesswork* (forthcoming, Princeton UP; chapters circulated for MEW 2026 at philosophy.osu.edu/sites/default/files/2026-08/Guesswork.pdf), ch. 3, p. 3:
- "we will abstract away from contextual factors that might influence the way you respond to questions in conversation"
- "We will also focus on cases in which you are only given two options, and forced to choose one. So the complications discussed by Dorst and Mandelkern will not arise."

It also scores suppositional guesses only when the supposition is true, citing a 2011 Weatherson blog post on conditional credences.

---

## Synthesis

**(i) Several guesses at the same question.** None of these papers addresses guessing again after being told a guess is wrong, "second guesses", or giving a top-k list as a sequence. There are building blocks:
- D&M's Filtered Rankings and Optionality order the complete answers by probability and treat "top-k" as one disjunctive guess.
- Holguín's cogency makes the permissible guesses a nested chain (a, a∨b, a∨b∨c…).
- Horowitz's Suppositional Questions norm ("Supposing that it's not sunny…") and Pearson's conditional best guess gCp,Q give a natural model of "if not A, then…" guesses. Nobody identifies this with the guess one should give after A is refuted.
- G&H fn 31 (repeated biased-coin guesses) and Holguín's coin and credal-duplicate remarks note that credence does not fix which tied or near-tied option is guessed. Nobody draws a consequence for repeated or revised guesses.
- Holguín's non-monotonicity covers revision on new evidence only.

**(ii) Guesses at several questions.** This is where the literature is substantial.
- D&M, Holguín and G&H all hold that permissible guesses relative to different questions may be jointly inconsistent (Latif, Bond, Djokovic, the horse race, Kyburg's lottery). Consistency and closure hold only within one question or context (Holguín).
- All three record that asking the questions in sequence changes matters:
  - D&M fn 6 attributes it to QUD "stickiness".
  - G&H fn 24 says succession "tends to force the second answer to conform to the first".
  - Holguín p. 21 calls "London" then "Germany" "rather strange" and explains this by semantic blindness.
- Teague turns this into a puzzle: inquiry involves "multiple guesses in sequence", and WTP/PTW demand compatibility across related questions. Pearson argues that the cross-question independence needed to block "Germany and London" clashes with reasoning from conditional weak beliefs. Fang's (unread) "inter-question principle" is billed as incompatible with Guessing.

**Not said:**
- No theory of how earlier guesses in a conversation constrain later ones. There are only footnote observations, and it is unsettled whether the constraint is a norm, a QUD effect or a pragmatic illusion.
- No treatment of agglomerating guesses to independent questions within one conversation beyond Holguín's lottery diagnosis.
- No treatment of being told one's guess is wrong.
