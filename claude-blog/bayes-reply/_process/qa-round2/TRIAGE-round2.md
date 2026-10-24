# Triage, Q&A round 2 (on draft-v2) -- 2026-10-23
Outcome: revise to v3; small targeted round 3 on the rewritten sections.

1. 02 (mathematician): prove via Predd et al. Theorem 1 on sample space int p (covers unbounded scores; repeated events OK)
   + exact converse via Theorem 1(a) (undominated GEC rules over two-sided learning = those concentrated on int p).
   Concavity needed for the mixture claim (counterexample with a non-concave bounded proper score) -> restrict §6 to concave
   scores. Belief-threshold claim false (Dana: credence in false '16' -> .75) -> rest on certainty. Predd2009 missing from
   bib -> added. DONE in v3.
2. 06 (generalist): same belief-threshold point; cut footnote 4's higher-order material; say which horn. DONE (footnote cut
   to one sentence; conclusion now states the incompatibility thesis and what each side gives up).
3. 03 (Williamsonian): §6 misapplied safety -- by the margin principle the dominating certainty is unsafe/not knowledge, so
   no instability. Recast as "accuracy rewards certainty that is not knowledge"; asymmetry: conditionalization's certainties
   are knowledge (entailed by E), dominating rules' are not; clock: certainty of w = certainty that one knows R(w), evidential
   probability 1/(2h+1) (Williamson 2014 p. 980). Knowledge-first option gets an argument, not just a fallback. DONE.
4. 01 + 04 (defender, close reader): §5's "idempotence untouched" FALSE: the paper's policy (choose the GEC rule by known
   learning structure) is contrastive; by Fact 6 it violates formal idempotence; right-then-left Dana goes from certainty to
   1/4 under conjunction-based credence (M&Z n. 30's charge). DONE: own the contrast; diagnose formal idempotence/route-
   independence as CAR in normative form; n. 29 ('she does not learn that that is what she learns') answered: the
   Proposition shows no such learning is needed. Replaced veil dilemma with the parity/support-function reply (01's
   "sophisticated escape"): rule-level vindication of a support function, not of any margin-knower's choice.
   04 smaller fixes: "bedrock" quote now "close to the bedrock of normative explanations"; p. 294 wording attributed to M&Z;
   "M&Z's own examples" -> Olivia and right-handed Dana; n. 21's fine-graining reconciliation now stated; two-levels
   paragraph reworded as the paper's inference, not their claim; p. 339 question quoted in §1.
5. 05 (signal theorist): second horn misdescribed -- signal theorists drop flat likelihood, not slack; signals needn't be
   luminous (E&N p. 1119 'only as if'; p. 1122 no commitment re knowledge); E&N's 1/4-1/2-1/4 clock is slack-free yet not
   CAR -> "requires, but is not secured by, the absence of slack"; credit overlaps: mixtures on clock = A&S Cr* (eps .3),
   Gallow misfire 80/10/10, E&N 1/4-1/2-1/4 (eps 3/4); credit I&R Thm 4; p. 1120 is E&N's clock. DONE.
v3: paper/draft-v3.qmd, 5,159 body words.
