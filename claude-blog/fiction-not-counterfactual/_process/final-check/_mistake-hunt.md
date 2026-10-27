# Final mistake hunt: "Fiction Without Hidden Facts"

Checked: `paper/fiction-without-hidden-facts.qmd`, `.bib` and the rendered PDF (13 pp., Typst), against the source texts in `research/texts/` and Crossref.

Counts: **A = 4, B = 10, C = 15.**

Page references "B&H n" are to Blumberg and Holguín, *Phil Review* 134(2), 2025, in its published pagination.

---

## (A) Must fix

### A1. Word count is over the 6,000 limit
- **Location:** the whole paper.
- **What's wrong:** every counting method I tried comes out above 6,000.
  - The PDF text, excluding References and page numbers, has 6,319 whitespace-delimited tokens. Of these, 6,240 contain a letter or digit. These counts include the title, date, "Abstract" label, section numbers, Table 1, footnotes and inline math, which pdftotext splits into several tokens.
  - Counting from the source, with each inline `$…$` expression as one word, gives about 6,175: title 4, abstract about 195, body about 5,650, footnotes about 325.
  - By section: §1 926, §2 649, §3 1,210, §4 1,631, §5 727, §6 325, §7 183. Footnotes: n.1 89, n.2 41, n.3 70, n.4 79, n.5 46.
  - So the paper is roughly **175–320 words over**.
- **Fix:** cut at least 350 words to leave a margin. These are candidate cuts that do not touch the argument:
  - Footnote 1 can go from 89 words to about 35: "A 2019 *NCIS: Los Angeles* episode later revealed tails, on B&H's labelling (161) [@Hurley2019; @Mitovich2019]; B&H's note 26 cites a preview of it [@Stein2019]. Like B&H, I set this aside."
  - §1 paragraphs 4–5 (the related work): about 60 words. The Woodward "determinately complete" point is made twice, in paragraph 4 and again in paragraph 5.
  - §4.5 paragraph 2: about 60 words.
  - §5, the last two paragraphs: about 60 words.
  - §6 "Viewers will think the makers decided": cut to one sentence, saving about 45 words. Footnote 4's last sentence already makes the same point.
  - §7: about 40 words.
- **Re-count after re-rendering.**

### A2. Anonymisation: the YAML names an AI model, and the HTML shows it
- **Location:** YAML lines 6–9:
  ```
  categories:
    - philosophy of language
    - aesthetics
    - claude
  ```
- **What's wrong:** "claude" names an AI model. In the rendered HTML it appears visibly under the title as `<div class="quarto-category">claude</div>`. The Typst PDF does not print categories, but the `.qmd` and `.html` both carry it.
- **Fix:** delete the line `  - claude`, or the whole `categories:` block, and re-render every output.
- **Other checks:** nothing else identifies the author or the human involved. The PDF has no author field and its XMP metadata is clean. The `.bib` and the HTML contain no other names.

### A3. The judgement about *doubt* is misreported, and the paper's own semantics does not predict it
- **Location:**
  - §2: "With the complement "Bud's coin landed heads", they report that … and *think* and *doubt* are acceptable only for a biased coin (161–167)."
  - §3.3: "*Think*, which B&H gloss as finding something "more likely than not" (175), is unacceptable for the fair coin and acceptable for the biased one, and *doubt* likewise."
- **What's wrong:** B&H's acceptable *doubt* report has the complement "landed **tails**", not "heads". Their coin is biased 2:1 towards heads, and they treat doubting that p as thinking that ¬p. So doubting that the biased coin landed *heads* is unacceptable.
  - On the paper's own fragment, (C⊕f)(¬h) = 1/3 for the biased coin. So "doubt [h] likewise" is predicted **unacceptable**, the opposite of what §3.3 says.
- **Evidence:** B&H 163: "(14) a. ✗ I doubt that Bud's coin landed heads. b. ✓ I doubt that Bud's biased coin landed tails. Here we assume that to doubt that p is to think that ¬p." The 2:1 bias in favour of heads is set up on p. 163.
- **Fix:**
  - §2: replace "and *think* and *doubt* are acceptable only for a biased coin (161–167)" with "and *think*, and *doubt* that it landed tails, are acceptable only for the biased coin (161–167)".
  - §3.3: replace "and acceptable for the biased one, and *doubt* likewise" with "and acceptable for the biased one, as is *doubt* that it landed tails".

### A4. "Defaults": the first option is the §4.1 tie-breaker, which §4.3 says fails the test
- **Location:** §5: "**Defaults.** Fix one assignment of values to the exogenous variables of every story, or rank the questions a world answers and fix a default answer to each, and let the world of $f$ be the P-Fic$_f$-world that best matches the defaults. Rank the landing above the gust, and the special leaves the landing alone." This comes right after "There are three ways to keep a single world, and each passes the test."
- **What's wrong:** the first option is the tie-breaker the paper gave the PRP in §4.1: "break the many near-ties by agreement with one fixed assignment of values to the exogenous variables of the apt causal model, the same assignment for every antecedent. A gust is a cause of the landing, so strengthening by a gust redraws the coin".
  - §4.3 then argues that this kind of tie-breaking "makes $s(A, @)$ and $s(B, @)$ disagree about the landing about half the time". In other words, it fails the test.
  - Holding the exogenous variables fixed and adding the gust recomputes the landing. Only the second option, "Rank the landing above the gust", keeps the landing fixed.
  - So "each passes the test" is false for the first option as written, and that option contradicts §4.3.
- **Fix:** delete the first option. Replace the opening with: "**Defaults.** Rank the questions a world answers, fix a default answer to each, and let the world of $f$ be the P-Fic$_f$-world that best matches the defaults." This also saves 12 words.
  - If you want to keep the causal-model version, add "treating outcomes such as the landing as exogenous". But that makes the landing independent of its cause, which is the point the paragraph's last sentence makes anyway.

---

## (B) Should fix

### B1. Woodward's epistemic option is called "in effect B&H's view", but B&H decline to call their indeterminacy epistemic
- **Location:** §1: "unless the indeterminacy is epistemic, an option he leaves open [-@Woodward2012, 789] that is in effect B&H's view".
- **What's wrong:** Woodward (789) says classical semantics can be kept "if we take indeterminacy to be rooted in our epistemic limitations". He adds that "there are theories of indeterminacy which reject epistemicism but maintain classical semantics".
  - B&H explicitly refuse to say whether fictional indeterminacy is metaphysical or (sui generis) epistemic: "we are reticent to take a stand on it here" (187–188).
  - What matches B&H is Woodward's **classical** option, not specifically the epistemic one. B&H themselves cite "Woodward 2011a: 789" in n. 58 for exactly this neutrality (187).
- **Fix:** replace it with "unless indeterminacy is compatible with classical semantics, an option he leaves open [-@Woodward2012, 789] that is in effect B&H's view".

### B2. The Flippy example is quoted without "once"
- **Location:** §2: "Indeterminate counterfactuals, such as "If Flippy had been flipped, it would have landed heads", show the same attitude profile".
- **Evidence:** B&H 176, (31a): "If Flippy had been flipped once, it would have landed heads." All of their attitude data (32)–(39), on pp. 177–178, use "flipped once".
- **Fix:** change it to "If Flippy had been flipped once, it would have landed heads".

### B3. The abstract and introduction overstate the status of the bridge principles
- **Location:**
  - Abstract: "given two bridge principles their view needs, agrees with theirs on every attitude toward a single fiction".
  - §1: "And given two bridge principles their view needs, it agrees with theirs".
- **What's wrong:** §3.4 says "Two bridge principles make the suggestion precise. Both are my strengthenings of it." What B&H's view needs is only that credences track in-story chances, plus their unknowability claim (175, 184). The specific principles are the author's own.
- **Fix:** in both places, write "given two bridge principles that make precise what their view needs".

### B4. Absorption says "every attitude in B&H's table", but *know* is not covered
- **Location:**
  - §3.4: "Given both, for every attitude in B&H's table and any single fiction, $S$ bears the attitude to $\Box_f \varphi$ on B&H's view iff she bears it to $f{:}\varphi$".
  - Footnote 3: "The other attitudes in the table are defined from these."
- **What's wrong:** B&H's Table 1 (166) includes *Know*, which is not defined from certainty and credence. B&H get the *know* verdicts from a separate assumption: indeterminate claims are unknowable because selection is arbitrary (173, 184). The "iff" for *know* needs that premise too, and the introduction calls this result "a proof".
- **Fix:** in footnote 3, replace the last sentence with "The other attitudes in the table except *know* are defined from these; for *know*, B&H's unknowability claim (173, 184) matches the requirement of support."

### B5. "The story state keeps its view of truth" contradicts §2–§3
- **Location:** §6: "The standard analysis is right about truth and wrong about credence; the story state keeps its view of truth and adds a Reality Principle for credence."
- **What's wrong:** on the standard analysis, an unsettled claim and its negation are both **false** (§2: "a claim the principal truths leave unsettled is false, and so is its negation"; B&H 160). On the story state both are gaps, "otherwise neither" (§3.2), and Scopelessness holds.
  - Support is also computed over supp $\pi_w(\cdot \mid P_f(w))$, not over P-Fic. So the two views share which claims are true, but not falsity or the logic.
- **Fix:** replace it with "the story state keeps its verdicts on which bare claims are true, treats unsettled ones as gaps rather than falsehoods, and adds a Reality Principle for credence."

### B6. "The two predict the same … strengthening judgements" conflicts with §4.5
- **Location:** §5: "By absorption and the test, the two predict the same attitudes, embedding patterns and strengthening judgements, so the data no longer favour the single world."
- **What's wrong:** §4.5 says that the revelation reading and the story state "come apart" on "If the writers had left the special out, there would still have been a gust", which is true on one and not on the other. §5 says that Anchoring "is the revelation reading made into semantics". So one of the "survivors" does not make the same predictions as the story state.
- **Fix:** replace "and strengthening judgements" with "and verdicts in @tbl-test".
  - If you want to be explicit, add "(anchoring parts company with the story state only on sentences like "there would still have been a gust", @sec-test)". Mind the word count.

### B7. The relation between the special's content B and JAG's content A is misstated
- **Location:** §4.2: "The special is consistent with everything in *JAG*, so its principal content, $B$, is a subset of *JAG*'s, $A$."
- **What's wrong:** $B$ is the content of JAG **together with** the special, not the special's own content. §4.3 confirms this: "$s(B, @)$, the closest world to actuality at which everything in *JAG* and the special holds".
  - The subset relation follows from adding claims, not from consistency. Consistency only guarantees that $B$ is non-empty.
- **Fix:** replace it with "The special adds to *JAG* without contradicting it, so the principal content of the series with the special, $B$, is a non-empty subset of *JAG*'s, $A$."

### B8. The anchoring example uses a coin that was actually tossed
- **Location:** §5: "Applied to the toss itself, it would require that whenever "if the coin had been tossed" and "if it had been tossed in a gust" are discussed together, the first select a gust-world. Then merely raising the possibility of a gust would make "Had the coin been tossed, there would have been a gust" true, which it is not."
- **What's wrong:** "the toss itself" has no clear referent. The only real coin in the paper is the one in §4.1, which "was tossed and landed heads". For that coin, "if the coin had been tossed" has a true antecedent. With centering, which B&H assume at 180 n. 46 ("if w ∈ p, then s(p, w) = {w}"), it selects actuality, and the subjunctive reads oddly. The example needs an untossed coin.
- **Fix:** replace it with "Applied to an unflipped coin such as B&H's Flippy, it would require that whenever "if Flippy had been flipped" and "if it had been flipped in a gust" are discussed together, the first select a gust-world. Then merely raising the possibility of a gust would make "Had Flippy been flipped, there would have been a gust" true, which it is not."

### B9. Some symbols mean two things
- **What's wrong:**
  - **A, B, C, D.** In §4.2–§4.3 and §5, $A$ and $B$ are sets of worlds ("$s(A, w')$", "$s(B, @)$", "the closest $B$-world"). But (A)–(D) are also the sentence labels in the same section. For example, "(A) and (B) then differ only in …" sits next to "$s(B, @)$". Likewise $C$ is the credence function (§3.1, §3.3) and $D$ is the certainty state ("$D \oplus f$"), alongside sentences (C) and (D).
  - **$s$.** It is the information state in §3.1 ("For an information state $s$ with credence $C$", "$s$ *supports* $f{:}\varphi$"). It is also B&H's selection function in §3.4 and §4.3 ("$s(P_f(w), w)$", "$s(B, @)$").
  - **$P_f(w)$ and P-Fic$_{f,w}$.** The first is used in §3.1 and §3.4, the second in §2 and §5, for the same set.
- **Fix:**
  - Rename the two contents, for example $J$ and $J^{+}$, or $P_{\textit{JAG}}$ and $P_{\textit{JAG}+}$, everywhere in §4.2–§4.3 and §5.
  - Rename the information state, for example $\sigma$, in §3.1 clauses 2–4 and in "{w} ⊕ f".
  - At first use, write "$P_f(w)$ (B&H's P-Fic$_{f,w}$)".

### B10. The fragment has no clause for negation outside the story, which §3.2 relies on
- **Location:** §3.1, clause 3, which gives only support, rejection and "A quantifier outside the story binds into it pointwise". §3.2 then says: "Negation of a homogeneous claim swaps support and rejection, so for each $x$ the two open sentences are supported together".
- **What's wrong:** B&H's (43b), "Every … x: ¬(□BC x passed)", has negation outside the operator. The fragment never defines how $\neg f{:}\varphi$ is interpreted.
- **Fix:** add to clause 3: "Negation outside the story is the story's own: $\neg f{:}\varphi$ is supported iff $f{:}\varphi$ is rejected, and rejected iff it is supported."

---

## (C) Minor: typos and style

**C1. "Their case (hereafter B&H's) has two stages."** Introducing the abbreviation as a possessive is awkward.
- Fix: write "Blumberg and Holguín [-@BlumbergHolguin2025] (hereafter B&H) argue that he was wrong" and "Their case has two stages."

**C2. The framing of the 188 quotation drops "are invited".** The paper says: "B&H put the choice this way. Their argument is "fundamentally conditional in nature: …" (188)." B&H 188 actually says that readers who resist "are invited to see the argument of the article as fundamentally conditional in nature", and adds "We would sooner accept the consequent of this conditional than deny the antecedent."
- Fix: "B&H invite those who resist to see their argument as "fundamentally conditional in nature: …" (188)."

**C3. The principal-truths gloss cites the wrong page and drops "believed".** §2: "(156): what it states or depicts, what its author intended, and what follows from these against background reality". Page 156 only gives the definition. The list of sources is on 157–158 (B&H: "intended or believed … obvious consequences … sufficiently realistic").
- Fix: "(156–158): what it states or depicts, what its author intended or believed, and what follows from these against background reality".

**C4. B&H's model of fictional change is paraphrased loosely.** §4.5: "If a fiction is a function from times to worlds". B&H 194 actually writes "functions from times to sets of fictional truths", with one world per time.
- Fix: "If a fiction is a function from times to sets of truths, each with its own world, so that …".

**C5. Lewis's italics are dropped.** Lewis 1978, 42 prints "the world*s* of Sherlock Holmes are plural", with the plural *s* italicised (checked on the page image).
- Fix: render it as "the world*s* of Sherlock Holmes are plural", or leave as is (trivial).

**C6. *The Breakfast Club* is not italicised.** This affects §2 and §3.2 (four times), while *JAG* and *NCIS: Los Angeles* are italicised.
- Fix: italicise it, including inside the quoted example sentences.

**C7. One §5 sentence is a garden path.** "Supervaluating over admissible selection functions, an option B&H mention, following Stalnaker [-@Stalnaker1980], and reject for themselves (185), and the shape of Woodward's [-@Woodward2012] and Khoo's [-@Khoo2026, §4] proposals, abandons the single world."
- Fix: "Supervaluating over admissible selection functions abandons the single world. B&H mention this option, following Stalnaker [-@Stalnaker1980], and reject it for themselves (185); it is the shape of Woodward's [-@Woodward2012] and Khoo's [-@Khoo2026, §4] proposals."

**C8. A line break falls inside "P-Fic$_f$-world" in the PDF.** In §5 "Defaults" (PDF p. 10), "P-Fic" ends one line and "𝑓 -world" starts the next.
- Fix: write `$\text{P-Fic}_f$-world` as a single math expression, here and elsewhere.

**C9. The section locator style is inconsistent.** It renders as "Khoo (2026, 1191, §4)" in §1, but as "Khoo's (2026, sec. 4)" in §5 and "(2025, sec. 4.1)" in footnote 2. Citeproc converts "§" to "sec." only when it is the first locator.
- Fix: use "sec." throughout. For example, write `[-@Khoo2026, 1191]` and add "(his sec. 4)" in prose. Alternatively, write `§` in all three places.

**C10. The page-range style is inconsistent.** Citeproc abbreviates ranges ("1013–14", "167–68"), but the hand-typed B&H references are written in full ("161–167", "169–171", "182–183", "185–187", "193–194").
- Fix: pick one style.

**C11. The capitalisation of named principles is inconsistent.** The paper has "SCOPELESSNESS" once and "Scopelessness" afterwards; "ATTITUDE EQUIVALENCE" in §2 but "attitude equivalence" in §7; and "PRINCIPAL REALITY PRINCIPLE".
- Fix: use `[...]{.smallcaps}` at first mention and capitalised "Scopelessness" or "Attitude Equivalence" thereafter.

**C12. Dates of the web sources are not printed.** The `note = {12 May}`, `{19 May}` and `{21 May}` fields do not render in the reference list (PDF pp. 12–13 show only "2019"). Readers therefore cannot check footnote 1's "dated a week before the reveal aired".
- Fix: in the .bib, replace each `note` with `date = {2019-05-12}`, `{2019-05-19}` and `{2019-05-21}`.
- Also, the Hurley title renders as "Set up" because citeproc lowercased it. Protect it as `Set {Up}`.

**C13. Table 1 is never referred to.** The label `@tbl-test` is unused.
- Fix: "These are my judgements (@tbl-test), offered on the same footing as B&H's own."

**C14. B&H use different years for two of the cited papers.** B&H's own citations say "Khoo 2021" (n. 33) and "Woodward 2011a" (nn. 53, 58) for the papers this paper cites as Khoo 2022 and Woodward 2012. The paper's years are the issue-of-record years confirmed by Crossref (Noûs 56(4) 2022; Noûs 46(4) 2012), so they are correct. A reader checking "(167 n. 33)" will see "Khoo 2021".
- No change needed. Optionally, note it once.

**C15. Housekeeping before submission.**
- The paper folder also holds an older draft (`fiction-not-counterfactual.qmd/.html/.bib`). Make sure it is not submitted.
- The YAML declares `pdf:` (LaTeX) with `output-file: "Fiction Without Hidden Facts"`, but the PDF supplied was built with Typst. Re-render whichever format you submit after making the fixes above.

---

## Verified (no change needed)

**B&H quotations.** Every quotation is verbatim and on the stated page:
- 151: "as factual as …"
- 161: "perhaps counterfactually"; "and then never thought …"
- 167: "no fact of the matter" … "is perfectly compatible …"
- 172: "unimpeachable", and the inference (28) word for word
- 175: "will be doxastically indifferent …" (the dropped "plausibly" is covered by "they suggest"); "a direct argument"; "more likely than not"
- 175 n. 39: "not every world in Fic_f is a p-world"
- 176: "for any given work of fiction …"
- 181: "If FEM is invalid …"
- 182: "strong abductive support"
- 183: "we see no better way …"; "the unique world that would accurately represent …"
- 183 n. 53: "primarily"
- 184: "at random, so to speak"; "the word of an oracle"; "won't be able to rule out any of the possible results"
- 188: "fundamentally conditional …"
- 194: "there are as many such worlds …"; "(whether principal or otherwise) can come quite dramatically apart"

**B&H page and note references.** All are correct: 153; 156; 161; 161–167; 167 and n. 33; 169–171; 171; 172; 173; 175 and n. 39; 176 n. 40; 181 and their (43); 182 and n. 51; 183 n. 53; 184 n. 55; 185; 185–187; 193–194; "note 26" (Stein, 162); "(175, 182–183)". "Tails on B&H's labelling (161)" is correct: on tails, Harm joins Mac.

**Other sources.** All quotations are verbatim and correctly paged:
- Lewis 1978, 42: "absurd to suppose …"; "the worlds … are plural"; the Analysis 1 clause (checked on the page image).
- Lewis 1976, 311: both quotations. PDF p. 15 is p. 311.
- Williams & Woodward 2021, 424 and 423.
- Woodward 2012, 787 ("determinately complete"; "no determinate way …"; indeterminate which completion) and 789.
- Khoo 2022: "middle facts" (1000); "leave open the possibility" (1014); "encoding a maximally specific set of inferential dispositions" (1013); factual truth defined over all selection functions (1014); lifted belief states (1014).
- Khoo 2026: the "in the fiction of" judgements at 1191; the choice-function supervaluation in §4 (1209–1210).
- McGonigal 2013: "extreme realism" (167–168); cliffhanger (168).
- Schaffer 2004, 305; von Fintel 1997, 33 ("obey the Excluded Middle"); MacFarlane 2003, 325 ("thin red line"; "amounts to giving up objective indeterminism").
- Križ 2019: the Benfleet example and its truth conditions.
- Moss 2013: the Bridge principle; she defends a variably strict semantics.
- Caplan 2014 and Lee 2024 are both about retconning and revision, as the paper says.

**Arithmetic.**
- 2/3 and 1/3 for the 2:1 coin.
- Footnote 3: the identity $C_S(\Box_f\varphi)=\sum_w C_S(w)\pi_w(|\varphi|\mid P_f(w))=(C_S\oplus f)(|\varphi|)$ holds, and so does the certainty clause.
- Footnote 5: the maximal-agreement coupling of P(H) = .9 and P(H) = .5 gives P(differ) = |.9 − .5| = .4, and (D) stays at .5.
- §4.5: coupling a certainty with a small chance ε gives agreement ε.
- Footnote 4's predictions, Table 1's rows and §6's standard-analysis verdicts ((B) and (C) right; (A) and (D) at credence 0) are all consistent with §4.3–4.4.

**Cross-references.** @sec-states, @sec-test and @sec-remains render as Sections 3, 4 and 5 and point to the right places. "By judgement 1" points to §4.1, item 1. There are no unresolved references in the PDF.

**Bibliography.** All 28 cited keys are in the .bib, and every .bib entry is cited. Crossref confirms authors, title, journal, volume, issue, pages and year for all 20 DOIs:
- Blumberg & Holguín 2025: 134(2) 149–201.
- Khoo 2026: 183(5) 1179–1215.
- Oppy & Raivars 2026: Philosophical Exchange 1–9, online 18 Aug 2026.
- Blumberg & Strohminger 2025: 85(1) 3–16.
- Stalnaker 1980 in *Ifs*: Crossref gives 1980.
- The others are correct.

The in-text years match the .bib throughout and use issue-of-record years consistently.

**Spelling.** British spelling is consistent. "judgments" appears only inside the B&H quotation, as in the original. No doubled words were found.

## Not verifiable here (nothing implausible found)
- Blumberg & Strohminger 2025, §4.1, the "Bill believes that Juliet died, but he hopes that she survived" example. Worth a last look, since their paper is about *imaginative* hopes and it would be worth confirming that they mark it infelicitous.
- Oppy & Raivars 2026 "contest B&H's data".
- The recaps (Mac won; Harm gave up London for San Diego). This is internally consistent with B&H's heads/tails labelling and with the dates 12 and 19 May.
- Hawthorne 2005, Schulz 2017, Bacon 2015, Walton 1990, Higginbotham 1986 and Stalnaker 1968/1980 are cited only as B&H cite them (184 n. 55, 182 n. 51, 181, 179, 185), and those B&H citations check out.
