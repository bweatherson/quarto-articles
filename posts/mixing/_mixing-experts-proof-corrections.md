# Proof Corrections

**Article:** "Mixing Expert Opinion: Three Worked Examples" (Brian Weatherson)
**Journal:** *Logos & Episteme* XVII, 2 (2026): 251–269
**Date:** 23 June 2026

The proof reproduces the manuscript faithfully — references, cross-references, figure and table numbering, and footnotes all resolve correctly. The corrections below are substantive errors carried over from the source that should be fixed before publication.

## Mathematical corrections

**1. Geometric-pooling formula — missing "+" in the denominator (two places).**
On p. 252 (Introduction) and p. 261 (start of the Section 4 approximation discussion), the formula is set as

> √(yz) / [√(yz)·√((1−y)(1−z))]

The denominator should be a **sum**, not a product:

> √(yz) / [√(yz) **+** √((1−y)(1−z))]

The displayed formula on p. 262 has the "+" and is correct, so the paper is currently inconsistent with itself. (The product version is not a probability — at y = z = 0.5 it evaluates to 2.)

**2. Search-committee procedure, point 3 (p. 265) — not a weighted average.**
Currently reads:

> Quinn's credence should be 0.8k + 32k/35.

Both terms carry *k*. It should be:

> Quinn's credence should be 0.8k + (32/35)(1−k).

This matches the surrounding text ("a weighted average of the first two, with the weight being the overlap in the evidence") and the general kg + (1−k)h formula: weight *k* on the full-overlap value (0.8), weight (1−k) on the independence value (32/35).

**3. Incorrect subscript in equations (6) and (8) and in the Unanimity statement.**
Equation (6) (p. 254), equation (8) (p. 255), and the statement of Unanimity (p. 255) each set the second conjunct with **Cr_A** where it should be **Cr_B**:

- Eq. (6): `Cr_Q(p | Cr_A(p) = y ∧ Cr_A(p) = z)` → second conjunct should be `Cr_B(p) = z`
- Eq. (8): same correction (`Cr_B(p) = z`)
- Unanimity: `Cr_Q(p | Cr_A(p) = y ∧ Cr_A(p) = y) = y` → second conjunct should be `Cr_B(p) = y`

Equation (7) (p. 255) has it correct (Cr_A ∧ Cr_B), confirming these three are slips.

**3a. Related A/B slip in prose (p. 256).**
When introducing *B_x*, the text reads "the disjunction of all possible evidence propositions that would lead **Ava** to have credence *x* in *p*". Since this sentence defines *B_x* (Ben's evidence), it should read **Ben**.

**4. Inline formula on p. 256 inconsistent with the proof.**
The text reads:

> use the earlier derived fact that Cr(A_x | ¬p) = ((1−x)r) / (x(1−r)Cr(p))

This should be:

> Cr(A_x | ¬p) = ((1−x)r) / (x(1−r)) · Cr(A_x | p)

The version in the text has a spurious *Cr(p)* in the denominator and omits the *Cr(A_x | p)* factor. The preceding displayed proof and the substitution in the next display are both correct; only this prose restatement is wrong.

## Wording corrections

**5.** p. 251–252: "if Ava's credence **in** *y*, and Ben's is *z*" → "if Ava's credence **is** *y*, and Ben's is *z*".

**6.** p. 254: "approximating the value of (6) realistic cases" → "approximating the value of (6) **in** realistic cases".

**7.** p. 258: "The next model will help with more realistic case." → "...with more realistic **cases**."

## Note (no change needed)

The in-text citations for Zhang and Wright render as 2026 and 2025, matching the reference list, even though the underlying citation keys read 2025 and 2024. This is correct in the output; flagging only in case it causes confusion.
