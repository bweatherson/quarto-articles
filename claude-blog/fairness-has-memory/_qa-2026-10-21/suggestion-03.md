**Prove the surrogate constraint rather than simulate it: it is an equality, not a floor, and the proof convicts κ = 1 and repairs the rule.**

Where: "Newcomers and the surrogate constraint", @tbl-churn and the paragraphs reading it; footnote 3.

*Proposition.* Exit is history-independent in your model. One unit per period among N claimants, so by renewal-reward a claimant's expected units at exit is E[L]/N under *every* rule. Your constraint says A(l) ≥ l/N for each tenure l, where A(l) is expected units given tenure l. But Σ P(L=l)A(l) = Σ P(L=l)·l/N, so every inequality binds: at every age the expected chance is exactly 1/N. That is ex ante proportionality at every horizon, the anytime form of the property randomized apportionment studies (Gölz, Peters & Procaccia, EC 2022; from memory; check). Lower quota in expectation collapses into exact quota.

*Corollary.* κ = 1's newcomer premium (1.006 ± .001) is not harmless: someone pays for it. I reran your rule (three seeds, 600,000 periods): long-stayers get about 0.997 of proportional from tenure 20 on, hidden in your table's noise. You call 0.97 "a small but real breach"; by that standard κ = 1 fails. The cause is normalisation: dividing by N + κS, where the pool's total shortfall S has mean zero, lets Jensen pay newcomers a premium.

*Lemma.* Centre instead: p_i = 1/N + (κ/N)(sh_i − mean sh). In a fixed pool this is your rule. By induction, given any exit history every expected shortfall is zero, so every age gets exactly 1/N unless a chance clips at zero. Dispersion is closed-form: variance (N−1)/(2κN) in a fixed pool, exactly, and about (N−1)/(N(Nq + 2κ(1−q))) at exit under churn. That gives .95 at κ = 0 (exact) and .57 at κ = 1, against your simulated .59; your "two-fifths" is 1 − 2.8^(−1/2).

So memory's weight is limited by chances not going negative, not by a balance read off a table. Clipping is negligible up to κ ≈ 0.5, where dispersion is .70: a quarter below forgetting, not two-fifths. At κ = 1 clipping costs newcomers 0.7%. Either defend an ε-floor or solve the optimisation: least dispersion subject to exact age-wise proportionality.

Is the κ-rule new? Its κ→∞ limit is the largest-deficit rule; the interpolation looks new. Claim it.

Footnote 3 misdescribes the field. With identical units and equal claims, envy-freeness up to one unit over the sequence *is* rotation, so "envy, not claims" marks no difference. Aleksandrov et al.'s food-bank Like and Balanced Like (IJCAI 2015) are your forgetting and lexical rules. Benade et al. (EC 2018) give the random rule's √T envy. Lackner's perpetual voting with self-approving voters is your fixed-pool model; its Phragmén rule becomes rotation. (All from memory; check.)

Room: these three results replace the table and its paragraphs (~350 words).
