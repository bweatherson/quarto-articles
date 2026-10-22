# Scout A (traditional epistemology): three candidates
21 Oct 2026. I scanned 2024–26 issues (via Crossref) of Phil Review, Mind, Noûs, PPR, Imprint, Ergo, AJP, Analysis, J Phil, PQ, Phil Studies and Episteme, plus the Sep 2026 revision of the SEP entry on higher-order evidence. The web-search budget ran out before my last checks on candidates 2 and 3; what was and wasn't checked is marked below.

**Ideas killed by priority (do not re-propose):**
- Probabilistic primality proofs as lottery propositions: Hamami 2021, *PQ*.
- Moral memory as a counterexample to moral-testimony pessimism: Doyle, "Remembering What Is Right".
- Jury unanimity and peer disagreement: Y. Lee 2018, *Legal Theory*.
- Noisy or randomised sources against normic support: Goodman & Salow 2023 and Smith 2024 between them.
- Unavoidable doxastic wrongs between friends: "Suspensive Wronging"; Soter 2025, *JESP*.
- Gaslighting as misleading higher-order evidence: Spear 2019, *Inquiry*; Kirk-Giannini 2022 and 2025.

---

## 1. What a proof has that a probable prime lacks

**Question.** Why don't we count overwhelming probabilistic evidence as proof, and why can't we know that a lottery ticket lost? Mathematical practice supplies a minimal pair that bears on both questions.

**Candidate thesis.** A proof differs from overwhelming probabilistic evidence because a proof can mislead only if something malfunctions. Lottery evidence lacks the same property, which is why we cannot know lottery outcomes. Certainty, reliability, safety and transferability do not mark the difference.

**Core case.**
- *The pair (real practice).* GIMPS, which searches for Mersenne primes, says a probable-prime result "is not final" because there is a "(very small) chance it could be composite". GIMPS certifies a prime only after Lucas–Lehmer tests are run on different software and hardware and their results match. Yet a single Lucas–Lehmer run "where no serious errors were reported" goes wrong about 1.5% of the time.
- *Sharpening.* A Miller–Rabin test using 50 bases taken from a public randomness beacon has an error bound of 4⁻⁵⁰ (about 10⁻³⁰). Anyone can reproduce it, and the randomness can be verified. It still would not be accepted as proof of primality.
- *Rival explanations.*
  - Probability, and Goodman–Salow-style normality defined by probability, get the pair backwards.
  - Safety cannot separate a random base draw from a random cosmic-ray bit flip.
  - Transferability (Easwaran 2009) does not separate them once Miller–Rabin is beacon-seeded, because both sides are then reproducible re-runs.
- *Normic support explains the pair.* Two matching Lucas–Lehmer residues can be wrong only through a fault, which would call for explanation. A composite number passing Miller–Rabin needs no explanation beyond the luck of the draw, since the procedure did exactly what it was designed to do. This has the same structure as newspaper versus lottery.
- *Same contrast in testimony.* An informant who lies at random by policy at a rate of 10⁻⁶ seems to give no knowledge. An honest informant whose accidental error rate is 10⁻³ does.
- *Payoff.* The paper vindicates mathematicians against Fallis without treating proof as a convention. It also gives a discriminating case in the live lottery debate: Smith 2024, Ochoa 2025, Goodman & Salow 2023, Hirvelä 2025.

**Obvious answer and why this differs.** The obvious answer is that proof gives certainty, or checkable transfer, or that the rule is just disciplinary convention. But the accepted side of the pair is neither certain (1.5% error per run) nor checked by inspecting it. Once the Miller–Rabin test is beacon-seeded, both sides are equally transferable.

**Closest prior work.**
- Hamami 2021, "Probabilistic Proofs, Lottery Propositions, and Mathematical Knowledge", *PQ* 72 [ABSTRACT]. He assimilates probabilistic proofs to lottery propositions and concludes they give no knowledge. From the abstract, he does not contrast them with hardware-dependent deterministic proofs, but this must be checked in full. This is the biggest priority risk.
- Easwaran 2009, *Phil Math* [ABSTRACT]: transferability. Jackson 2009, "Randomized Arguments Are Transferable" [TITLE ONLY].
- Fallis 1997 (*J Phil*) and 2000 (*BJPS*) [TITLE ONLY]: reliability parity. He may already make the hardware-error comparison, but to argue the opposite conclusion.
- Smith 2024, "Justification, Normalcy and Randomness", *PPR* [ABSTRACT; the full text was blocked by Cloudflare]. It poses a puzzle about "remarkable" random outcomes. If Smith counts a 50-round pass as abnormal, normic support would predict knowledge, and the adjudication collapses.
- GIMPS, mersenne.org/various/math.php [READ]: the source of the quotations above.

**Generalist appeal.** "What is a proof for?" and "Why can't you know your ticket lost?" are both questions any philosopher recognises.

**Biggest risk.**
- A screener could read it as a known theory (Smith) plus an application, which would make it EXPECTED.
- Hamami or Smith 2024 may already draw this contrast.
- The paper needs a principled reason why a cosmic ray "calls for explanation" and an unlucky base draw does not.

**Confidence:** low–medium.

---

## 2. Censored consensus is fake-barn country

**Question.** Does suppressing even absurd objections to an expert consensus damage the public's epistemic standing? If so, how, given that what is suppressed is bad?

**Candidate thesis.** Censoring dissent leaves lay belief in a consensus justified, but it can stop that belief being knowledge. A consensus maintained by a filter keyed to the consensus itself is a fake-barn environment, whatever the quality of the objections removed.

**Core case.**
- *The pair.* Ana and Ben both truly believe a consensus claim on the same testimonial evidence.
  - Ana's platform removes content that "contradicts health authorities". This filter is keyed to the consensus, like the 2020–21 platform policies [dates to verify].
  - Ben's venue removes only spam and work that cannot be refereed. This filter is keyed to form, like arXiv moderation.
- *The modal difference.* Consider nearby worlds where the consensus is false. Ana's filter would also remove the sound objections that would correct it; Ben's would not.
- *Verdicts.* Ana's belief is justified but unsafe, so she is Gettiered, like Henry among the fake barns. Ben knows.
- *Consequences for the debate.*
  - Wright (2021) and Joshi (2025) are wrong that censoring absurd objections destroys lay warrant.
  - Levy (2026) is right about warrant, but coverage does not settle whether the public knows.
  - Mill's claim that even true opinion suffers under censorship is vindicated, but as a claim about knowledge, not justification.
- *Corollary.* Suppressing flat-earth material does not Gettierise anyone's knowledge that the earth is round, because there are no nearby worlds in which that consensus is wrong. Suppression on questions still under live expert inquiry does Gettierise. What matters is how the filter would behave counterfactually, not how bad the objections are.

**Obvious answer and why this differs.** One obvious answer is Mill's: censorship always erodes warrant. The other is common sense: it is harmless if the objections are bad. This thesis says warrant survives while knowledge can be lost, and that the deciding factor is how the filter is keyed.

**Closest prior work.**
- Wright 2021, *Phil Imprint* 21(14) [ABSTRACT]: censoring even flat-earth objections destroys the public's testimonial warrant.
- Joshi 2025, "Expertise and Social Epistemic Warrant", *Analysis* [ABSTRACT]: experts cannot be cordoned off from these effects.
- Levy 2026, "Social Epistemic Warrant? You're Covered!", *Analysis* [ABSTRACT]: a Goldberg-style coverage conditional underwrites lay warrant.
- Levy 2019, *JAPA* [ABSTRACT]: no-platforming as a way of avoiding misleading higher-order evidence. "Weighing the Costs: The Epistemic Dilemma of No-Platforming", *Synthese* 2021 [ABSTRACT].
- The knowledge/warrant split does not appear in any of these abstracts. I could not search further (Fantl 2018 is unchecked).

**Generalist appeal.** It is about Mill, free speech and content moderation, which is very broad.

**Biggest risk.**
- It could read as a reply to a three-paper exchange.
- The keying criterion is close to the obvious answer, "it depends on how reliable the censor is".
- If coverage-based warrant is externalist, censorship removes warrant too, and the split collapses. The paper must argue that warrant tracks the believer's evidence about coverage, not coverage itself.

**Confidence:** low–medium.

---

## 3. Disclose, don't apply: higher-order evidence in testimony

**Question.** When you learn your judgment may be impaired, should you tell others what you concluded, or what you now believe all things considered?

**Candidate thesis.** Higher-order evidence about oneself should be disclosed rather than applied in any judgment others will use as evidence. So calibrationism, whatever its merits for final belief, is the wrong norm for the attitudes that ground testimony.

**Core case.**
- *The pair.* A pilot who may be hypoxic either says (a) "Fuel's sufficient, but I may be hypoxic; check me", or (b) "I'm about 60% that fuel's sufficient".
  - Answer (a) is better. The co-pilot, who can see her symptoms, is better placed to weigh the hypoxia, and answer (b) invites the co-pilot to discount twice.
- *Institutions converge on the same practice.*
  - Witnesses disclose relationships but are never asked to discount their own testimony.
  - Conflict-of-interest disclosure is used in science.
  - Forensic "evaluative reporting" asks experts to report the strength of the evidence, not a posterior.
- *Thesis applied.* Calibrated credence is the right final state, but it is the wrong basis for what one passes on.

**Obvious answer and why this differs.** The obvious answer is "just say 'my calculation says p' and disclose". That is the practice; the thesis claims that the attitude grounding testimony is not the calibrated one.

**Closest prior work.**
- Staffel 2025, *Unfinished Business*, chapter on higher-order evidence [ABSTRACT]. Under higher-order evidence, a conclusion stays justified as a transitional attitude but not as a final one. This is very close to the thesis.
- Christensen 2026, *Judging One's Own Case*, ch. 1 [ABSTRACT].
- De Benedetto & Peruzzi 2026, *Synthese* [PART]: cross-examination as higher-order defeat. It does not address reporting.
- Lackey 2007 on selfless assertion [not re-read].
- SEP, "Higher-Order Evidence", Sep 2026 revision [PART].

**Generalist appeal.** Moderate: what experts, witnesses and pilots should tell us.

**Biggest risk.**
- Staffel's distinction between transitional and final attitudes may already be this thesis.
- The deflationary reply ("assert what you know about your evidence") is consistent with the knowledge norm and absorbs the practice data.

**Confidence:** low. I include it because it is the best remaining intervention in the most active debate. I would drop it unless a full reading of Staffel 2025 clears it.

---

## Ranking
1. **Proof versus probable prime.** It is the only candidate with a real, quotable minimal pair that separates the live theories of lottery ignorance. Read Hamami 2021 and Smith 2024 in full before going further.
2. **Censored consensus.** It has the strongest generalist appeal, but its novelty is a distinction inside a small recent exchange.
3. **Disclose, don't apply.** It is probably anticipated by Staffel.

None reaches "high". If the reading for candidate 1 turns up the hardware contrast in Hamami or Smith, I would not advance any of the three.
