import sys, itertools, random
sys.path.insert(0, '/mnt/user-data/outputs/bayes-reply/code')
from checks import subsets, brier, cond, factive_situations, lam_p, is_extensional, tea

# (1) Situations respecting SOME two-sided margin of width >= 1 at every state (widths may vary by state and situation):
#     equivalently E(s) contains s-1 and s+1 (when on the scale) for every s.
random.seed(3)
for n in [3,4,5]:
    Es = factive_situations(n, allowed=lambda s, A: all(t in A for t in (s-1, s+1) if 0 <= t < n))
    hits = 0; tried = 0
    for _ in range(300):
        w = [random.random() if random.random() < 0.4 else 0.0 for _ in Es]
        L = lam_p(Es, w, n)
        if not any(v > 0 for (q, s), v in L.items() if len(q) < n): continue
        tried += 1; hits += is_extensional(L, n)
    print(f"n={n}: two-sided-margin situations {len(Es)}; random weightings with nontrivial learning {tried}; extensional {hits}")

# (2) Under a CAR weighting, conditionalization is a martingale and beats the prior in expectation (auxiliary problem);
#     under a margin weighting both can fail.
def check(n, pi, Es, w, label):
    SUBS = subsets(n); Lam = sum(w)
    exp_post = [0.0]*n
    for E, wE in zip(Es, w):
        for s in range(n):
            c = cond(pi, E[s])
            for i in range(n): exp_post[i] += wE/Lam * pi[s] * c[i]
    ea_b = tea(lambda p: cond(pi, p), Es, w, pi, n, brier, SUBS)/Lam
    ea_d = tea(lambda p: pi[:], Es, w, pi, n, brier, SUBS)/Lam
    print(f"{label}: CAR? {is_extensional(lam_p(Es, w, n), n)}; E[posterior] = {[round(x,4) for x in exp_post]} vs prior {pi}; EA bcond {ea_b:.4f} vs prior {ea_d:.4f}")

pi = [0.2, 0.6, 0.2]; n = 3
allE = factive_situations(n)
check(n, pi, allE, [1.0]*len(allE), "M&Z uniform (Dana's prior)")
dana = [(frozenset({0,1}), frozenset({0,1,2}), frozenset({1,2}))]
check(n, pi, dana, [1.0], "Dana's situation alone")
mp = factive_situations(n, allowed=lambda s, A: all(t in A for t in (s-1, s+1) if 0 <= t < n))
check(n, pi, mp, [1.0]*len(mp), "uniform over margin-respecting situations")
# pretest counterexample (b): one-sided gauges + Dana, CAR
S = frozenset({0,1,2})
cx = [(frozenset({0}), S, S), (frozenset({0,1}), S, frozenset({1,2})), (S, frozenset({0,1}), frozenset({1,2})), (S, S, frozenset({2})), (S, frozenset({1,2}), S)]
check(n, pi, cx, [2,1,1,1,2], "pretest's one-sided mixture")
