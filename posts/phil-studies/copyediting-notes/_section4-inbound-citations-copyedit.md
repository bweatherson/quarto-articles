# Section 4: Inbound Citations - Copyediting Suggestions

## Section Heading - Line 1662: CRITICAL TYPO

**Original:**
> # Inbound Citatations {#sec-inbound-citations}

**Issue:**
TYPO: "Citatations" should be "Citations"

**Suggested Revision:**
> # Inbound Citations {#sec-inbound-citations}

---

## Line 1740: Repetition and Wordiness

**Original:**
> This section looks at the eighty journal articles that are most cited across the hundred journals between 1980 and 2019, and looks at what proportion of their citations are in _Philosophical Studies_.

**Issues:**
1. "looks at... and looks at" - repetitive verb
2. Could be more concise
3. "the eighty" and "the hundred" - consider using numerals for consistency with rest of paper

**Suggested Revision:**
> This section examines the 80 most-cited journal articles across the 100 journals between 1980 and 2019, analyzing what proportion of their citations appear in _Philosophical Studies_.

**Alternative:**
> This section examines the 80 journal articles most frequently cited across the 100 journals between 1980 and 2019 and analyzes the proportion of their citations that appear in _Philosophical Studies_.

---

## Line 1740: Agreement Issue

**Original:**
> On average, those articles have about 10% of their citations in _Philosophical Studies_, but the proportion varies greatly by articles.

**Issue:**
"varies greatly by articles" should be "varies greatly by article" (singular) or "among articles"

**Suggested Revision:**
> On average, those articles have about 10% of their citations in _Philosophical Studies_, but the proportion varies greatly among articles.

**Alternative:**
> On average, those articles have about 10% of their citations in _Philosophical Studies_, though this proportion varies considerably.

---

## Line 1740: Footnote Clarity

**Original:**
> The ranking here is not by proportion of cites in _Philosophical Studies_, but instead by the probability that an article would have this many cites in _Philosophical Studies_, given how many overall citations it has and that highly cited articles have about 10% of their citations in _Philosophical Studies_.

**Issues:**
1. Very long sentence with multiple clauses
2. "cites" is informal (should be "citations")
3. Could be broken into two sentences for clarity

**Suggested Revision:**
> The ranking here is not by proportion of citations in _Philosophical Studies_, but by the probability that an article would have this many citations in _Philosophical Studies_, given its overall citation count. This probability calculation assumes that highly cited articles typically have about 10% of their citations in _Philosophical Studies_. I think this is a slightly better way to separate the signal from the noise.

**Alternative (keeping as one note):**
> The ranking is based not on the proportion of citations in _Philosophical Studies_, but on the probability that an article would have this many citations in _Philosophical Studies_ given its total citations and the baseline rate of approximately 10% for highly cited articles. This approach better separates signal from noise.

---

## Table Captions: Lines 1744 and 1756

### Line 1744: TYPO

**Original:**
> "Articles with a high concentration of ciations in _Philosophical Studies_."

**Issue:**
TYPO: "ciations" should be "citations"

**Suggested Revision:**
> Articles with a high concentration of citations in _Philosophical Studies_.

---

### Line 1756: TYPO

**Original:**
> "Articles with a low concentration of ciations in _Philosophical Studies_."

**Issue:**
TYPO: "ciations" should be "citations"

**Suggested Revision:**
> Articles with a low concentration of citations in _Philosophical Studies_.

---

## Line 1752: Citation Reference Clarity

**Original:**
> There are articles here in the five main topics _Philosophical Studies_ covers: language, ethics, metaphysics, mind, and epistemology (hereafter, LEMME). The other end of the scale looks quite different, as shown in @tbl-mainly-out-ps. There we mainly see articles in political philosophy, philosophy of science, and logic, with @WOS000073222300002 being a notable (and surprising) exception.

**Issues:**
1. Introducing "LEMME" acronym here when it may not be used extensively afterward
2. Citation code @WOS000073222300002 appears without context - reader doesn't know which article this is
3. "There we mainly see" is slightly informal

**Suggested Revision:**
> There are articles here in the five main topics _Philosophical Studies_ covers: language, ethics, metaphysics, mind, and epistemology (hereafter, LEMME). The other end of the scale looks quite different, as shown in @tbl-mainly-out-ps, where we primarily see articles in political philosophy, philosophy of science, and logic, with @WOS000073222300002 being a notable (and surprising) exception.

**Alternative (if the citation reference is Clark & Chalmers as in the PDF):**
> Articles in @tbl-mainly-in-ps represent the five main topics _Philosophical Studies_ covers: language, ethics, metaphysics, mind, and epistemology (hereafter, LEMME). The other end of the scale looks quite different, as @tbl-mainly-out-ps demonstrates. There we find primarily articles in political philosophy, philosophy of science, and logic, with Clark and Chalmers's extended mind paper [-@WOS000073222300002] being a notable exception.

---

## Line 1764: Transition Sentence

**Original:**
> These tables tell us that the LEMME topics are at the heart of what _Philosophical Studies_ has published over these four decades. I'll use that fact in the next analysis.

**Issues:**
1. "tell us" is slightly informal
2. "I'll use that fact" is informal and could be more specific
3. Could strengthen transition to next section

**Suggested Revision:**
> These tables demonstrate that the LEMME topics are central to _Philosophical Studies_' output over these four decades. This observation informs the topic modeling analysis that follows.

**Alternative:**
> These tables show that the LEMME topics lie at the heart of _Philosophical Studies_' publications over these four decades—a finding that motivates the topic model developed in the next section.

---

## Overall Section 4 Assessment

### Strengths:
- Clear explanation of methodology
- Good use of tables to present data
- Helpful footnote explaining the ranking method
- Introduces the LEMME acronym that will be used later

### Critical Issues:
1. **Section heading has typo**: "Citatations" → "Citations"
2. **Two table captions have typo**: "ciations" → "citations"

### Other Issues:
- Some repetitive phrasing
- Minor agreement issue ("by articles" vs "among articles")
- Long, complex sentences that could be broken up
- Some informal language ("tell us," "looks at")
- Citation reference without context

### Very Short Section:
This is a very brief section (only about 100 lines, mostly code). Consider whether it should be:
1. Combined with Section 3 as a subsection
2. Combined with Section 5 as introductory material
3. Expanded with more analysis
4. Left as is but with clearer transition language

---

## Clean Revised Version of Section 4

# Inbound Citations {#sec-inbound-citations}

[code block]

This section examines the 80 most-cited journal articles across the 100 journals between 1980 and 2019, analyzing what proportion of their citations appear in _Philosophical Studies_. On average, those articles have about 10% of their citations in _Philosophical Studies_, though this proportion varies considerably. @tbl-mainly-in-ps lists the ten articles whose citations are most concentrated in _Philosophical Studies_.^[The ranking is based not on the proportion of citations in _Philosophical Studies_, but on the probability that an article would have this many citations in _Philosophical Studies_ given its total citations and the baseline rate of approximately 10% for highly cited articles. This approach better separates signal from noise.]

[Table: Articles with a high concentration of citations in _Philosophical Studies_.]

Articles in @tbl-mainly-in-ps represent the five main topics _Philosophical Studies_ covers: language, ethics, metaphysics, mind, and epistemology (hereafter, LEMME). The other end of the scale looks quite different, as @tbl-mainly-out-ps demonstrates, where we find primarily articles in political philosophy, philosophy of science, and logic, with @WOS000073222300002 being a notable exception.

[Table: Articles with a low concentration of citations in _Philosophical Studies_.]

These tables demonstrate that the LEMME topics are central to _Philosophical Studies_' output over these four decades—a finding that motivates the topic model developed in the next section.

---

## Summary of Required Corrections

**CRITICAL (Must Fix):**
1. Line 1662: "Citatations" → "Citations" (section heading)
2. Line 1744: "ciations" → "citations" (table caption)
3. Line 1756: "ciations" → "citations" (table caption)

**Important:**
1. Line 1740: "varies greatly by articles" → "varies greatly among articles"
2. Line 1740: "looks at... and looks at" → use different verb in second instance

**Recommended:**
1. Break up long footnote sentence
2. Improve transition to next section
3. Consider adding context for citation reference @WOS000073222300002
4. Replace "cites" with "citations" throughout
