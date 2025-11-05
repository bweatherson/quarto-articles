# Section 5: A Topic Model for Philosophical Studies - Copyediting Suggestions

## Line 1770: British vs American Spelling

**Original:**
> Following the groundbreaking work of Christophe Malaterre and colleagues, I analysed the content of _Philosophical Studies_ articles by building a five-topic topic model.

**Issue:**
British spelling "analysed" vs American "analyzed" - needs consistency with rest of paper

**Suggested Revision:**
> Following the groundbreaking work of Christophe Malaterre and colleagues, I analyzed the content of _Philosophical Studies_ articles by building a five-topic topic model.

**Note:** This same issue appears throughout the footnote. Check all instances of "analyse/analyze" for consistency.

---

## Line 1772: Repetition

**Original:**
> I thought a five topic model should work because _Philosophical Studies_ concentrates on the LEMME topics.

**Issue:**
"five topic" appears twice in close proximity (also at start of sentence)

**Suggested Revision:**
> I thought this approach should work because _Philosophical Studies_ concentrates on the LEMME topics.

**Alternative:**
> I chose five topics because _Philosophical Studies_ concentrates on the LEMME topics.

---

## Line 1772: Hyphenation

**Original:**
> I thought a five topic model should work

**Issue:**
Should be hyphenated: "five-topic model" (compound adjective)

**Suggested Revision:**
> I thought a five-topic model should work

---

## Line 1774: Word Choice

**Original:**
> Articles on utilitarianism use different words to articles on mental content

**Issue:**
"different words to" is British usage; American English would use "different words from" or "different words than"

**Suggested Revision:**
> Articles on utilitarianism use different words from articles on mental content

---

## Line 1776: Unclear Pronoun

**Original:**
> For many of these, it would be arbitrary to call them mind articles or metaphysics articles.

**Issue:**
"For many of these" - "these" is slightly unclear (could be papers or articles about physicalism)

**Suggested Revision:**
> For many such papers, it would be arbitrary to classify them as mind articles or metaphysics articles.

---

## Line 1782: Missing Word

**Original:**
> We could build many models and just which one looks most like familiar topics, but that would just introduce different biases.

**Issue:**
Missing word: "and just **pick** which one" or "and **choose** which one"

**Suggested Revision:**
> We could build many models and choose the one that looks most like familiar topics, but that would introduce different biases.

**Alternative:**
> We could build many models and select the one that most resembles familiar topics, but that would introduce different biases.

---

## Line 1790: Extra Space

**Original:**
> I labeled the topics, and mostly the labels are straightforward.  The only one

**Issue:**
Double space after period

**Suggested Revision:**
> I labeled the topics, and mostly the labels are straightforward. The only one

---

## Line 1794: Grammar Issue

**Original:**
> The important thing is that the philosophy of science articles that _Philosophical Studies_ publish also fall into one of those five topics.

**Issue:**
Subject-verb agreement: "_Philosophical Studies_ **publishes**" (singular journal)

**Suggested Revision:**
> The important thing is that the philosophy of science articles that _Philosophical Studies_ publishes also fall into one of those five topics.

---

## Line 1794: Repetition

**Original:**
> There is a good sense in which _Philosophical Studies_ publishes a fair bit of philosophy of science; it publishes many papers that could easily appear in _Philosophy of Science_. Despite that, the five way classification used here makes sense.

**Issues:**
1. "publishes... publishes" - repetitive
2. "five way" should be hyphenated: "five-way"

**Suggested Revision:**
> _Philosophical Studies_ publishes a fair amount of philosophy of science; many of its papers could easily appear in _Philosophy of Science_. Despite this, the five-way classification used here makes sense.

---

## Line 1809: Agreement Issue

**Original:**
> The higher numbers for language in the normal issues is in part a factor of there just being more normal issues before the mid-1990s

**Issue:**
Subject-verb agreement: "numbers... **are**" (plural subject)

**Suggested Revision:**
> The higher numbers for language in the normal issues are in part a factor of there being more normal issues before the mid-1990s

**Alternative (more concise):**
> The higher numbers for language in normal issues partly reflect the greater number of normal issues before the mid-1990s

---

## Line 1809: Informal Language

**Original:**
> is in part a factor of there just being more normal issues

**Issue:**
"just being" is informal

**Suggested Revision:**
> is partly because there were more normal issues

---

## Line 1811: Informal Phrasing

**Original:**
> I've noted a few times that you see less epistemology in the journal than you might expect

**Issues:**
1. "you see" is informal
2. "less" should be "fewer" (countable) or rephrase to use "less"

**Suggested Revision:**
> I've noted several times that the journal contains less epistemology than one might expect

**Alternative:**
> As noted previously, the journal publishes fewer epistemology articles than one might expect

---

## Line 1824: Typo

**Original:**
> But breaking up the citations by decades reveals something suprising.

**Issue:**
TYPO: "suprising" should be "surprising"

**Suggested Revision:**
> But breaking up the citations by decades reveals something surprising.

---

## Line 1833: Forward Reference

**Original:**
> I'll come back to this point in @sec-1980s-articles, as part of a broader look at how the topic distribution in _Philosophical Studies_ changed over time.

**Issue:**
Section reference may not exist (looks like it should be @sec-1980s or similar based on paper structure)

**Suggested Revision:**
Verify the section reference is correct. If it's Section 8 (1980s), it should be:
> I'll come back to this point in @sec-1980s, as part of a broader look at how the topic distribution in _Philosophical Studies_ changed over time.

---

## Overall Section 5 Assessment

### Strengths:
- Clear explanation of topic modeling methodology
- Good discussion of limitations and choices
- Helpful footnotes providing additional context
- Transparent about randomness and model selection process
- Connects well to previous section's LEMME framework

### Areas for Improvement:
- Several British spellings need consistency check (analysed, different words to)
- Some missing or incorrect hyphens in compound adjectives (five-topic, five-way)
- One missing word in sentence (line 1782)
- One typo: "suprising" → "surprising"
- Subject-verb agreement issues (lines 1794, 1809)
- Some informal language ("you see," "just being")
- Minor issues: double space, repetitive phrasing

### Technical Issues:
- Forward section reference may be incorrect (@sec-1980s-articles)
- Multiple instances of "analyse" need to be "analyze" for consistency

---

## Clean Revised Key Passages

### Opening Paragraph (Line 1770):
**Revised:**
> Following the groundbreaking work of Christophe Malaterre and colleagues, I analyzed the content of _Philosophical Studies_ articles by building a five-topic topic model.^[This technique is used to analyze _Philosophy of Science_ by @Malaterre2019, to analyze _Biology and Philosophy_ by @Malaterre2019b, and to analyze a family of eight philosophy of science journals by @Malaterre2020. In @Malaterre2022 the technique is extended to journals that don't publish exclusively in one language, but that's not relevant to _Philosophical Studies_.] Without going too deep into the details of what topic modeling is, I'll note four features of it that are relevant.

### Model Building Explanation (Line 1772):
**Revised:**
> First, a topic model divides some texts into *k* topics, where *k* is given by the model builder. On the one hand, the model itself doesn't tell you how many topics to use. On the other hand, the model builder doesn't tell the model what those topics should be. I chose five topics because _Philosophical Studies_ concentrates on the LEMME topics. After asking the model to divide the articles into five topics, it more or less found those five groups. (Though with some caveats that will become clearer in what follows.) The model doesn't give names to those topics; that's something I did. But it does create the five groupings.

### Model Selection (Line 1782):
**Revised:**
> But this randomness raises a problem: how do we choose which random starting point to use? We could just use the first one we run, but that might be a very idiosyncratic output. We could hand code the starting point, but that would introduce our own biases. We could build many models and choose the one that looks most like familiar topics, but that would introduce different biases.

### Philosophy of Science Discussion (Line 1794):
**Revised:**
> Philosophy of science raises a complication though. _Philosophical Studies_ publishes a fair amount of philosophy of science; many of its papers could easily appear in _Philosophy of Science_. Despite this, the five-way classification used here makes sense. The important thing is that the philosophy of science articles that _Philosophical Studies_ publishes also fall into one of those five topics.

### Normal Issues Discussion (Line 1809):
**Revised:**
> The differences between Oberlin and BSPC are striking, even if not surprising. BSPC was primarily an ethics and metaphysics conference, while Oberlin has focused more on philosophy of mind. The higher numbers for language in normal issues partly reflect the greater number of normal issues before the mid-1990s, when language was more central to the journal and perhaps the discipline.

### Epistemology Observation (Line 1811):
**Revised:**
> As noted previously, the journal publishes less epistemology than one might expect given the prominence of the editors in epistemology. Here we do see an effect. The one-off issues, where the editors have more say over the topic, lean more toward epistemology than the rest of the journal.

### Closing Paragraph (Line 1824):
**Revised:**
> The differences are not as stark as in @tbl-citation-by-type, but they are still notable. Epistemology articles are cited, on average, about 50% more often than language articles. Now a simple explanation for that might be that epistemology articles appear on average later, and articles that appear later get cited more often. As @tbl-topics-cites-decades shows, that is partially right. But breaking up the citations by decades reveals something surprising.

---

## Summary of Required Corrections

**CRITICAL:**
1. Line 1824: "suprising" → "surprising"
2. Line 1782: Add missing word ("choose" or "pick")
3. Line 1794: "publish" → "publishes"
4. Line 1809: "is" → "are"

**Important for Consistency:**
1. Throughout: "analysed/analyse" → "analyzed/analyze" (American spelling)
2. Line 1774: "different words to" → "different words from"
3. Line 1772, 1794: Add hyphens to compound adjectives ("five-topic," "five-way")
4. Line 1833: Verify section reference @sec-1980s-articles is correct

**Recommended:**
1. Remove double space at line 1790
2. Reduce repetition in several passages
3. Make language less informal ("you see," "just being")
