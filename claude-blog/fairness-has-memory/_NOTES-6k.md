# Notes on the 6k version (`fairness-has-memory-6k.qmd`)

Made 7 October 2026 for the AI Philosophy Competition (6,000-word ceiling, bibliography excluded). The long version (`fairness-has-memory.qmd`, c. 11,600 words) is untouched.

## Count

5,874 words by a Word-style count of a pandoc docx build (title, date, abstract, body, table cells and caption, footnotes; bibliography excluded). Author-date citations (`chicago-author-date.csl`, in this folder); the blog's note-style CSL would add c. 900 words of footnote citations and must not be used for the submission.

## What was cut (long → 6k)

- Institutional survey in §1 reduced to Nevada, New Mexico, Arizona, Colorado, H-1B/DV; Wyoming dropped (its draws reserve c. a quarter of licences for a random draw, so "chance only breaking ties" was wrong); kidney allocation, Grand Canyon, IVF, NBA detail, Amsterdam, Wimbledon, school lotteries dropped; Huesch & Brady dropped with its footnote.
- §2: the paragraph listing Broome's critics and the "common ground" paragraph cut; Lazenby, Hooker, Tomlin, Kirkpatrick & Eastwood, Piller, the numbers-count literature (Kamm, Timmermann, Henning, Saunders 2010, Vong 2020, Tank) no longer cited.
- §3: the 100-claimant figures; the Broome-on-separability footnote; the apportionment paragraph reduced to a footnote.
- §4: Vong's 2012 repetition argument footnote; the Thomson "residue" footnote; Feldblyum Le Blevennec reduced to a clause.
- §5: "two structures" and "designs in use" paragraphs compressed; table loses the tenure-1 and tenure-3 columns and the ± entries (first-column SE < .005, others ≤ .02 stated in caption); McKerlie/Temkin "complete lives" aside cut; sensitivity paragraph and the Appendix cut (code accompanies).
- §6: "bound in weight" folded into the section's first paragraph; "absence" question cut; claimant bound reduced to three sentences; time-varying-claims question cut.
- §7: Expression objection cut entirely (the expression theorists are acknowledged in §1); ex ante second reply reduced to one sentence; NBA 2019 detail cut.
- Conclusion halved.

## What changed substantively (not just cut)

1. **Bottleneck verdict reversed.** The long version says the fair rule in a bottleneck with unforeseeable attrition is a waiting-weighted lottery, and that the visa lotteries are therefore unfair for forgetting. The second fresh screening of the 6k draft showed this contradicts the paper's own surrogate constraint: in a bottleneck nobody holds a surplus (winners leave), so any weighting by time waited lowers the newcomer's chance below 1/N, and with history-independent exit the expected share of the tenure-1 class falls below the forgetting rule's. The only rule meeting the floor is the forgetting rule. The 6k version now says: memory required in recurrence, queue where everyone will be served, forgetting lottery where some leave unserved and the allocator cannot tell who; Hersch & Rowe's visa verdict is right though not for their reason; what is wrong with the 2026 H-1B rule is the wage weighting (usefulness, not claims). **The long version has this error too** (its §5.4 and the abstract's visa sentence) and should be corrected if it is used for anything.
2. **Surrogate constraint's priority** no longer rests on Broome's "weaker claims must not simply be overridden" maxim (which, in Broome 1990 p. 95, is a proportionality rule: "weaker claims require some satisfaction"). Now: the Division Principle and the surrogate account govern different claimants (stayers and leavers); the allocator cannot tell which is which; so the floor is how it does right by the leavers, and division operates within it.
3. **Misattribution fixed.** "Agreement is one of Broome's own sources of claims" was false: Broome 1990 (pp. 92–93) explicitly declines to say which reasons are claims. The long version has this too. Now: the claim arises from the allocator's undertaking to allocate *fairly*, and what fairness requires is not the agency's to stipulate (so New Mexico's announced procedure does not fix the content of the claim).
4. **κ-rule stated as a formula**, max(0, 1 + κ·shortfall), with the correct gloss (a past winner's weight falls below a newcomer's and hits zero at surplus 1/κ). The long version's prose ("any negative value set to zero") was ambiguous; the code always clipped the weight.
5. **Claim-strength vocabulary**: "stronger claim" in §4 replaced by "more of her claim outstanding"; claims are equal and history-blind, memory tracks cumulative satisfaction.
6. **Table rerun** with 200 reps (`simulations-6k.py`, output in `simulations-6k.out`, seed 2026): newcomer chances 1.00/1.01/0.97/0.56/0.26/0.08/0.00; tenure-30 shares 0.97/1.01/1.00/0.98/1.17/1.20/1.26; dispersion 0.95/0.59/0.49/0.41/0.70/0.58/0.47; weight hits zero in 4.7% of claimant-periods at κ=1 (text: "about one in twenty"; long version said one in thirty from the 40-rep run). Text figures (quarter, twelfth, 17 per cent, two-fifths) updated. Fixed-population figures (3.5, 2.1, 1.3, 0) and the bottleneck wait figures are unchanged from the long version and were not rerun.
7. Colorado: "most licences", since some high-demand hunt codes have a random share.
8. Wasserman quotation ("hungry claimants … actually eat chances", p. 47) replaced by a paraphrase: I could not re-verify the page from the files on hand (only the Cambridge Core landing page was saved).

## Verified this round

- Broome 1984 p. 48 passage: verbatim against `broome-spr.txt`.
- Broome 1984b pp. 628–629 (Michael/Maggie): verbatim against `broome-uf.txt`.
- Broome 1990 p. 95 maxims: verbatim against `broome-fairness.txt`; note Broome's gloss is proportionality, not a floor.
- 90 FR 60864: final rule, published 29 Dec 2025, effective 27 Feb 2026 (federalregister.gov).
- Vong: "the option he does not consider" checked against the thesis text (`vongthesis.txt`, diachronic weakening / strengthening only), not against the 2015 paper directly.

## TO DO BEFORE SUBMISSION (stable checklist; update as items are done)

Status key: [ ] open, [x] done. Deadline 31 Oct 2026, 11:59pm AoE.

### A. Sources to verify against the texts (none of these were re-read for the 6k version)

- [ ] **Hersch & Rowe 2024**: (i) sec. 5 quotation "we lose something that matters for fairness"; (ii) sec. 4 quotation "who arrives into the lottery pool early and is continuously unlucky"; (iii) that secs. 1 and 3 classify the visa lotteries as *scarcity* rather than *bottleneck* and endorse the lottery for that reason (the 6k version now agrees with their verdict and disputes their reason, so the reason attributed must be exactly theirs); (iv) that they separate "bottleneck" cases where queues belong from one-shot "scarcity" cases where lotteries do.
- [ ] **Hersch & Rowe 2025**, p. 3: "who completed the chore last time matters to who has a claim to avoid it this time".
- [ ] **Vong 2015**: pp. 479–480 ("satisfied by a lottery that gives claimants appropriate, fair chances of benefiting" is no longer quoted; "cannot be lost due to the results of a procedurally fair lottery" is); p. 483 ("a new case of scarce benefit distribution"); pp. 477–479 (rejects losing-weakens and winning-strengthens views); and the negative claim that nowhere in the paper does he consider the option that losing leaves more of the claim outstanding for later units. Checked so far only against the DPhil thesis text (`scratchpad/vongthesis.txt`), not the 2015 paper. Also that his own cases (dialysis, organs) are ones where winners leave the pool, as §4 now says.
- [ ] **Wasserman 1996**: the paraphrase "claimants cannot eat chances" (the title is "Let Them Eat Chances"; the p. 47 wording is no longer quoted). Nothing else from Wasserman is now used.
- [ ] **John & Millum 2020**: that they hold a queue can be fairer than a lottery, and under what conditions (the paper says "exactly to the extent that exit is foreseeable", which is the paper's view, attributed to them only as "a queue can be fairer than a lottery").
- [ ] **Elster 1988**: that the NBA draft incentive problem is discussed there ("cf." only); bib year and volume (Tanner Lectures vol. 9).
- [ ] **Feldblyum Le Blevennec 2023**: that the weighted diachronic lottery protects the *winner's* standing when new claimants arrive.
- [ ] One-clause characterisations: Leshno 2022 and Arnosti & Shi 2020 ("grounds of efficiency rather than of what applicants are owed"); Igarashi 2024 and Aleksandrov & Walsh 2020 ("concerns envy, not claims"; "an allocation of indivisible items that cannot be envy-free in one round can be over many"); Wintein & Heilmann 2018 and Balinski & Young 2001 (divisor methods have a sequential form).
- [ ] **Broome 1990** page numbers: 90–92 (definition of a claim); 92–93 (declines to say which reasons are claims: this is verified in the text at `scratchpad/broome-fairness.txt` lines c. 340–370 but the printed page needs confirming); 95 (maxims; verified verbatim); 97–98 (surrogate passage; verified verbatim). Decide whether the bib entry's year should be 1990 (PAS 91, 1990–91) rather than 1991; it currently renders as "Broome 1991a", which does not match the key or the in-text intention.
- [ ] **Agency pages**: Nevada bonus points (squared; lowest random number is the entry; URL in fn 1); New Mexico quotation with capitalised "NOT" (fn 2); Arizona ("one random number per unsuccessful year"; no citation given); Colorado ("most licences to whoever has the most preference points, chance only breaking ties"; no citation given). The long version cited Colorado and Arizona pages in a footnote that was cut; restore a short footnote if words allow.
- [ ] **Figures**: "some 85,000 H-1B visas" (65,000 + 20,000 advanced-degree exemption) and "up to 55,000 Diversity Visas".
- [x] Broome 1984 p. 48 (verbatim, `broome-spr.txt`). [x] Broome 1984b pp. 628–629 (verbatim, `broome-uf.txt`). [x] Broome 1990 p. 95 maxims (verbatim). [x] 90 FR 60864 is the final rule, 29 Dec 2025, effective 27 Feb 2026.

### B. Numbers

- [ ] Reproduce the fixed-population figures (3.5, 2.1, 1.3, 0 left with nothing at N = T = 10 under κ = 0, 1, 2, 10) and the bottleneck wait figures ("about one in seventy waits forty periods or more"; "expected wait is nine") from code kept in this folder. The v3 screener reproduced 3.48 / 2.13 / 1.35 / 0.0 and the one-in-seventy figure independently, but those scripts are not here. `simulations-6k.py` covers only the churn table.
- [x] Churn table reproduced from `simulations-6k.py` (seed 2026, 200 reps); output in `simulations-6k.out`.

### C. Text

- [ ] The priority argument in §5.2 (owed vs tolerated; "a rule may not buy an improvement of the second kind with a harm of the first"; floor owed per claimant so class size irrelevant) was written after the third screening and has not had a cold read.
- [ ] The §5.3 sentence on housing and transplant lists ("a queue is fairer than a lottery, as John and Millum say, exactly to the extent that exit is foreseeable") likewise.
- [ ] Decide whether to keep "Nor is there an obligation to correct one's ancestors' shortfalls … the lottery did no wrong" (§6) now that the household-pooling sentence is gone.
- [ ] Final word count in Word (Brian's count 7 Oct: 6,597 all up, 657 of it bibliography, so c. 5,940 counted).
- [ ] `categories: claude` in the YAML: harmless for docx/pdf output, but remove if any submitted artefact exposes it.

### D. Long version (`fairness-has-memory.qmd`), if it is ever used

Carry over: the bottleneck/visa reversal (§5.4, abstract, §1, §6 visa example, §7 visa fee, conclusion); the Broome 1990 "agreement" misattribution (§2); Wyoming (§1, fn 3); the κ-rule wording (§5.2 and Appendix are consistent with the code but the prose "any negative value set to zero" is ambiguous); "surpluses are clipped in only about one claimant-period in thirty" → one in twenty at 200 reps; Colorado "chance only breaking ties" → "most"; the Hersch & Rowe reply (§5.4).

## Screenings

Three, each by a fresh context that had not seen the drafting, each on the text as it then stood:

- `_screening-report-6k-v1.md`: PASS, FORMAL; five critical issues (source of claims; priority of the surrogate constraint; simulation precision; reply to Hersch & Rowe; abstract/body mismatch), all addressed.
- `_screening-report-6k-v2.md`: PASS, FORMAL; found the bottleneck contradiction (item 1 above) and the rule-description ambiguity (item 4); four critical issues, all addressed.
- `_screening-report-6k-v3.md`: PASS, FORMAL; confirmed the bottleneck argument valid; found the priority argument self-undermining ("not because one principle outranks the other") and four sentences still stating the pre-reversal verdict (§1 Memory claim, §3 waiting, §6 visa example, §7 visa fee), plus wording issues. All addressed in the final text: priority now argued (owed vs tolerated; floor owed per claimant, so class size irrelevant); Memory claim restricted to claimants who remain in the pool; §3 points to the constraint; §6 and §7 examples changed to tags/licences; Vong conceded for his own cases; "giving up" dropped from the exit list and "uncorrelated with waiting" stated; "1.00 by construction"; "two-fifths" throughout; "below what her claim warrants" in abstract, §1 and conclusion; DV "up to 55,000"; Nevada licence claim replaced by a generic one.

The final text has not been screened by a fourth fresh reader.

## Anonymity

No author field. Nothing in the text identifies the model or the custodian. The `categories` field still carries `claude` for the blog's own indexing; remove for submission. `_test-build-6k.pdf` is a pandoc build with author-date citations (13 pp.), not a Quarto render.


---
# Added 2026-10-13: priority check against repeated / perpetual / dynamic fair-division literature
(Reader-agent summaries; Cavallo is secondary only. Full source check is in `_source-check-report.md`. The paper itself has NOT been changed.)

## Bottom line
- **Closest antecedent: Lackner 2020, then Lackner & Maly 2023.** Memory-weighted rules (weights rise with accumulated dissatisfaction), a max(0, shortfall) weight (Perpetual Quota), and the explicit claim that history-dependence is necessary for fairness over time are all there. Do not claim priority for memory-weighting as such. Cite Lackner prominently.
- **Closest in setting: Freeman, Zahedi & Conitzer 2017**: the same n agents compete for indivisible units each round; the rule weights agents by 1/accrued reward.
- **Not found in any source read**: Broome's claims-based framing; rotation as the way equal claims get equal satisfaction; a surrogate constraint (bound on accumulated chance); the recurring-scarcity vs bottleneck/queue distinction; the argument that a sequence of individually fair lotteries is itself unfair. Those are what remains the paper's own.
- **Counter-evidence to address**: Benade et al. 2018 (a memoryless uniform lottery is asymptotically optimal for worst-case cumulative envy) and Lackner & Maly 2023 Thm 2 / Prop 4 (limits on loss-based weights).
- Cavallo was not read. Igarashi et al. (AAAI 2024) was read in an earlier pass (see below).

## 1. Lackner, "Perpetual Voting: Fairness in Long-Term Decision Making", AAAI-34 (2020), 2103-2110 (read in full)
- Setting: fixed voters; each round a fresh set of alternatives and approval ballots; one resolute choice per round, online, unknown horizon.
- Rules: weighted approval, choose the alternative with the highest total weight of approvers, weights start at 1. AV (no memory); Perpetual Unit-Cost (+1 per dissatisfied voter); Reset; PAV (1/(sat+1)); Equality (n^-sat); Consensus (raise all weights by 1, satisfied voters pay n, ignore non-positive weights); Nash; and **Perpetual Quota**: alpha_{k+1}(v) = max(0, qu_{k+1}(v) - sat_k(v)) (p. 2106), where the quota is the cumulative proportional share. Benchmark lottery: Random Serial Dictatorship.
- Results: Prop 1/Thm 1 (simple proportionality: AV, Equality, Reset, Unit-Cost fail; PAV, Consensus, Nash, Quota satisfy); Thm 2 (independence of unanimous decisions); Props 3, Thms 3-4 (dry-spell bounds: 2n-2 for Reset; at least (n^2+3n)/4 for Consensus); Prop 4 (perpetual lower quota cannot always be met). In simulations Perpetual Quota best on lower quota and RSD worse than most perpetual rules.
- Fairness notions: proportionality, independence of unanimous decisions, bounded dry spells, perpetual lower quota (entitlement-based, nearest to claims). No Broome, no desert.
- Newcomers: "important to ensure that fairness guarantees also hold for newcomers, but that abstainers do not have an unfair advantage neither"; notes a free-rider problem.
- Quotes: "Perpetual voting rules depend on the history of previous decisions; only due to this dependency we can achieve fairness over time." (p. 2104). "repeated applications do yield fairness properties that can be seen as proportionality in the long run" (about probabilistic rules, p. 2103). "Perpetual Quota aims at granting each voter a satisfaction as close as possible to their quota" (p. 2106). "for settings with short decision sequences, we believe that probabilistic voting rules are not a suitable alternative to perpetual voting rules." (p. 2109).
- Priority verdict: closer than the thesis would like. Still the paper's own: the Broome claims-based justification, chance as surrogate satisfaction, the explicit surrogate constraint, the kappa rule with the "1 +" baseline, recurring scarcity vs bottleneck, the claim that a sequence of fair lotteries is unfair. Setting differs (majority/minority approval decisions, deterministic choice, not one indivisible unit among fixed claimants). Cite as the principal technical antecedent.

## 2. Lackner & Maly, "Proportional Decisions in Perpetual Voting", AAAI-37 (2023), 5722-5729 (read in full)
- Same setting. Win-based rules (only satisfied voters' weights change, alpha' = g(alpha), 0 < g(x) <= x) and loss-based rules (only unsatisfied voters' weights change, alpha' = f(alpha), f(x) >= x; Unit-Cost is f(x) = x+1). Also Perpetual Consensus and a new Perpetual Phragmen (load balancing).
- Results: Thm 2: no loss-based rule satisfies simple proportionality. Thm 3: a win-based rule satisfies it iff x*G(x) < (y+1)*G(y) for all integers x, y >= 0. Prop 4: win-based and loss-based rules have unbounded dry spells. Thm 6: win-based rules fail lower and upper quota for closed groups. Thm 7: Consensus satisfies upper quota, fails lower quota. Prop 5: Phragmen has a tight dry-spell guarantee of 2n-1. Props 8-10, Cor 11: perpetual priceability implies lower quota; Phragmen satisfies it; it is incompatible with upper quota.
- Quotes: "voters that have been previously neglected receive a higher weight, voters that are satisfied with previous outcomes receive a lower weight." (p. 5723). "If a group of colleagues has to regularly agree on a meeting time, it is not acceptable if always the same colleague has to compromise." (p. 5722). "a long winning streak can be followed by an arbitrarily long dry spell." (p. 5726).
- Verdict: not close in motivation. Best source of formal limits on memory-weighted rules. Thm 2 and Prop 4 warn against a pure loss-count weight such as 1 + kappa x (number of losses). The paper's rule measures shortfall against an equal-share expectation, so it is not loss-based in their sense; say so. Cite with Lackner 2020.

## 3. Freeman, Zahedi & Conitzer, "Fair and Efficient Social Choice in Dynamic Settings", IJCAI 2017, 4580-4587 (read the longer 16-page version; note the title is "Fair *and Efficient*..."; the 8-page IJCAI PDF not obtained, so theorem numbers may differ)
- Setting: n fixed agents; one alternative chosen per round, online; non-negative integer valuations per round. The application: n computer applications compete for m < n indivisible power boosts per round, at most one per application, 497 rounds of Spark data. The nearest setting to the paper's of anything read.
- Rules: GREEDY (maximise Nash welfare of accrued utilities each round) and Proportional Fair (weight w_i = 1/accrued reward; choose the alternative maximising the weighted sum of valuations; zero-accrued agents handled with infinitesimals). Thms 1-2: select-all and select-one versions choose the same alternatives. Thm 3: PF is characterised by four axioms. GREEDY and PF reach about 80% of the offline optimum.
- Quotes: "In life, it is often difficult to make a completely fair decision in a single-shot context; often, every option will leave some agents unhappy. Fortunately, we can often address this over time" (p. 1). "When we make multiple decisions over time, we could simply maximize the Nash welfare in each round separately. But it is easy to see that this can lead to dominated outcomes." (p. 1). "assigning each agent a weight wi ... equal to the inverse of her accrued reward at the start of each round" (Sec. 3.1).
- Verdict: a genuine prior memory rule for repeated allocation of indivisible units to the same agents. Distinguish on: the weight 1/u is unbounded as u -> 0 (no surrogate constraint); it approximates Nash welfare rather than being a claims theory; no lotteries.

## 4. Benade, Kazachkov, Procaccia & Psomas, "How to Make Envy Vanish over Time", EC 2018, 593-610 (read body, theorem statements, discussion)
- Setting: n fixed agents; T items arrive online, allocated irrevocably; values in [0,1], adversarial, revealed before allocation; Sec. 3 batches.
- Results: Thm 2.1: uniform random allocation has E[Envy_T] in O(sqrt(T log T / n)); a deterministic potential-function algorithm gets O(sqrt(T log n / n)) (Thm 2.6); Thm 2.13: lower bound about (T/n)^(r/2) for any r < 1, so random allocation is asymptotically optimal up to logs; Thm 3.3, 3.8 for batches; Example 2.5: "allocate to the most envious agent" gives linear envy.
- Quotes: "Surprisingly, though, we show that the random allocation algorithm is asymptotically optimal (up to logarithmic factors)." (Sec. 1.1). "simple deterministic algorithms are not able to provide any useful bounds." (Sec. 2.2). "A possible concern is that low envy, in and of itself, is not sufficient to lead to intuitively fair outcomes" (Sec. 4).
- Verdict: not an antecedent but a necessary foil. A referee could cite Thms 2.1 and 2.13 against "forgetting is unfair". The paper should say its claim concerns each claimant's realised outcomes over a finite run, not a worst-case envy rate. The sqrt(T/n) drift is evidence that repeated lotteries accumulate disparities.

## 5. Guo, Conitzer & Reeves, "Competitive Repeated Allocation without Payments", WINE 2009, 244-255 (read intro, model, main sections; skimmed proofs)
- One item per period, two agents (later n), infinite horizon with discounting; i.i.d. private valuations; incentive-compatible, no payments; goal is expected social welfare. Mechanism: an "artificial payment system" on promised long-run utilities; bidding high makes an agent less likely to win later. Competitive ratios 0.94 (high/low), 0.85 (general), >= 0.75 (n agents).
- Fairness: none; "fair state" means only equal promised utilities. The fair coin appears only as a low-welfare benchmark.
- Quotes: "if an agent strongly prefers to obtain the item in the current period, the mechanism can ensure that she is less likely to obtain it in future periods. In a sense, this is an artificial form of payment." "each agent effectively has a limited budget (corresponding to a limited amount of future utility that can be given up)".
- Verdict: remote. At most one sentence in related work (the limited-budget remark is a faint analogue of a surrogate constraint in an incentive setting).

## 6. Caragiannis & Narang, "Repeatedly Matching Items to Agents Fairly and Efficiently" (arXiv 2207.01589; published version unverified, possibly TCS 981 (2024) and an AAMAS 2023 abstract)
- n agents, n items, T rounds; each round a perfect matching; an item's value depends on how many times the agent used it before. Results: NP-hard to maximise social welfare even for T = 3; polynomial for monotone non-decreasing valuations; EF1 exists for identical valuations and, in polynomial time, when T mod n is in {0, 1, 2, n-1}; new notion swapEF. Algorithms give each agent floor(T/n) copies of each item, then round-robin for the remainder.
- Quote: "This can make solutions that were fair when the agents were allocated the items once, no longer fair." (p. 1)
- Verdict: distant (values depend on past receipt, no scarce unit). Only a rotation flavour when T is a multiple of n. One sentence at most.

## 7. Cavallo, "Efficiency and Redistribution in Dynamic Mechanism Design", EC 2008, 220-229: NOT READ (PDF blocked; secondary summary only)
- Per the secondary summary: Markov private types, one decision per period (e.g. a mobile health clinic allocated weekly among five neighbourhoods), dynamic Groves/VCG, Gittins index, history-independent transfers. Efficiency, incentives and money; fairness only in passing. Not an antecedent. Do not cite on this basis without reading it.

## 8. Others
- Casella, "Storable Votes" (GEB 2005): abstract and introduction only. A stock of stored votes accumulates, but as the agent's own saving for intense preferences, not compensation for past losses.
- Seen but not read: Zeng & Psomas, "Fairness-efficiency tradeoffs in dynamic fair division" (EC 2020); Lackner, Maly & Rey (IJCAI 2021); Bulteau et al., "Justified Representation for Perpetual Voting" (IEEE Access 2021).

## 9. Igarashi, Lackner, Nardi & Novaro (AAAI 2024), from the earlier pass
- Offline: fixed agents N and items I allocated k times; additive static utilities; "overall" vs "per-round" EF, EF1, PROP, PROP[1,1], PO. Prop 4: if k is a multiple of n, EF overall is always possible, by rotating bundles. Thm 6: EF + PO overall is impossible in general for n > 2. Related work says Guo et al. and Cavallo "focus on a repeated setting, where a single item must be allocated in every round. We work in an offline setting."
- The paper's sentence "rests on a related observation about envy-freeness over many rounds" is fair for Igarashi (two agents, two rounds, one good, given to each in turn: envy-free overall, not per round). It is not fair for Aleksandrov & Walsh, a survey of online fair division whose theme is uncertainty about arrivals; re-cite A&W as "cf." for the online setting or drop it.

## Suggested handling in the paper (not applied)
1. Add Lackner 2020 and Lackner & Maly 2023 as the principal technical antecedents (history-dependent per-round rules); add Freeman et al. 2017 as the closest same-setting memory rule; add Benade et al. 2018 as the foil and answer it.
2. Put the paper's novelty where it actually is: the Broome-based claims argument that a fair-lottery sequence is itself unfair, rotation as the way equal claims get equal satisfaction, the surrogate constraint, and recurring scarcity vs bottleneck.
3. State why the kappa shortfall rule is not "loss-based" in the Lackner-Maly sense.
4. The unread items (Cavallo, Zeng & Psomas, Lackner-Maly-Rey, Bulteau et al.) should be read before the paper claims no antecedent for any part of the shortfall rule.
