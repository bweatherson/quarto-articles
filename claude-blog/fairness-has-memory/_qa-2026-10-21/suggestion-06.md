**§5.3 files transplant lists under the rule that forgets, but there exit rises with waiting, and then forgetting leaves more people dead unserved.**

**Where.** §5.3: "Housing lists and transplant lists, where some always leave unserved, fall on the second side." Also its parenthetical that urgency is "a difference in claims, not a memory of history," and §4's approval of Vong's dialysis and organ verdict as "right."

**What is wrong.** The verdict needs a premise the section states: "With exits unforeseeable and uncorrelated with waiting." Transplant exits are neither. Liver allocation ranks by MELD, a forecast of short-term death on the list (from memory; check), and mortality on dialysis rises with time on dialysis (from memory; check). By the paper's own test, a queue is fairer "exactly to the extent that exit is foreseeable," so transplant belongs on the queue side. The urgency parenthetical does not help: dialysis time records how long a patient has gone unserved, which is what the paper calls memory.

The table cannot show this, because its exit probability is fixed. I ran a bottleneck variant inline with `python3`: a pool of ten kept full, one unit a period, served claimants leave, and the others die each period with probability 0.005 times the periods already waited, capped at 0.5. Over 200,000 periods, 23 per cent of exits were deaths unserved under forgetting, 19 per cent under a waiting credit (weight 1 + waiting), and 17 per cent under a queue. With constant exit the three rules are identical in aggregate. Forgetting passes the per-tenure test by construction, since each waiting claimant has the same chance each period. But that test conditions on the stay, and here the rule helps fix the stay. A dialysis patient who has waited six years holds, on this verdict, the chance of a new referral. No committee could defend that to her.

**What to do.**

1. Move transplant lists to the first side, where the paper's own logic favours a queue or a credit weighted by foreseeable exit. Keep housing on the second side only if its exit is unforeseeable, which needs an argument.
2. Withdraw the Vong approval. The US kidney system and Eurotransplant credit waiting time (from memory; check).
3. Replace the urgency parenthetical with §5.2's point: if the allocator knew who would leave, it "would owe such claimants the surrogate outright," a chance proportional to their claim. That is claim-weighting by foreseeable exit. COVID-triage lotteries broke ties within clinical tiers (from memory; check).
4. Add the rising-hazard case to `simulations-6k.py` and report unserved deaths as a table row.

**Cut room.** The Vong sentence and the dynamic-allocation footnote free about 90 words.
