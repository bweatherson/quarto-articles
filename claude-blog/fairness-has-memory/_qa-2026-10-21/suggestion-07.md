**Define the surrogate constraint exactly: by conservation it can only bind with equality at every tenure, so "dominated at no cost" and "the region around κ = 1" must be restated as claims about a stated tolerance.**

*What it is.* In the code the constraint is E[wins | tenure = L] ≥ L/N, checked at L = 1, 10, 30, with exit independent of history, averaged over the stationary distribution of pools a newcomer may join. The prose ("owed to each claimant") does not say so; conditioning on the pool she actually joins would be far stronger. The paper's ex ante reply asks "when is the ex ante?"; so does this constraint.

*Conservation.* One unit is handed out per period, so the tenure-weighted mean of (E[wins | L] − L/N) is zero for any rule (checked numerically). So "no tenure class below proportional" means "every tenure class exactly proportional". The floor is a target, with no interior to press into. Two claims then fail as worded.

1. *"Dominated at no cost in anyone's expected share."* A rule with memory cannot weakly dominate unless it matches the lottery everywhere. A Rao-Blackwellised rerun (300 runs) puts κ = 1 at +0.7% at L = 1, +0.5% at L = 10, −0.4% at L = 40 and −0.5% at L = 50 (SE about 0.15%): a small, real transfer from long-stayers to short-stayers. The table cannot see it: its standard errors reach .02 and it samples three tenures.

2. *"The region around κ = 1."* Breach is continuous in κ. The worst ratio to proportionality over L ≤ 40 is 0.993, 0.985, 0.973 and 0.904 at κ = 1.5, 1.75, 2 and 3. The constraint selects no κ: a 1% tolerance admits up to about 1.6, a 3% tolerance about 2. Nor is "the residual is exactly the surrogate" shown: with tenures known, integrality alone allows a pooled SD of 0.41; κ = 1 gets 0.585.

*In the author's favour.* κ = 1 is not an artefact of N = 10, q = 0.1. Over N = 5–40 and q = .05–.2 it never falls more than 2% below proportional at tenures up to 40, while κ = 2's breach grows from under 2% at N = 5 to 5–6% at N = 20–40.

*Do.* (i) State the constraint formally, with the conservation identity in one sentence. (ii) Introduce a tolerance ε, and say κ ≈ 1 is a safe point at ε ≈ 1%. (iii) Replace "no cost" with "under 1% of proportional share, borne by long-stayers". (iv) Replace the two tenure columns with the minimum and maximum ratio over L ≤ 60. (v) Delete "exactly".

Cuts (about 100 words): the Transition and Regress sentences in Section 6.
