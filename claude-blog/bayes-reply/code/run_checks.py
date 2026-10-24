import sys, itertools, random, math
sys.path.insert(0, '/mnt/user-data/outputs/bayes-reply/code')
from checks import *

# ---------- 1. Reproduce M&Z's Dana numbers ----------
n = 3; SUBS = subsets(n); pi = [0.2, 0.6, 0.2]
B = lambda p: cond(pi, p)
D = lambda p: pi[:]
def oneshot(p):
    if p == frozenset({0,1}): return [1,0,0]
    if p == frozenset({1,2}): return [0,0,1]
    if p == frozenset({0,1,2}): return [0,1,0]
    return cond(pi, p)
Es = factive_situations(n); alpha = len(Es) / 4  # (2^d)^d with d=2 -> 16
print("number of factive situations, n=3:", len(Es))
w = [1.0]*len(Es)
for name, r in [("bcond", B), ("dogmatic", D), ("one-shot", oneshot)]:
    print(name, "TEA/alpha =", round(tea(r, Es, w, pi, n, brier, SUBS)/16, 4))
# M&Z report: one-shot -6.8, bcond -2.72, dogmatic -4.48

# Dana's own problem
dana = (frozenset({0,1}), frozenset({0,1,2}), frozenset({1,2}))
for name, r in [("bcond", B), ("dogmatic", D), ("one-shot", oneshot)]:
    print("Dana EA", name, round(sum(pi[s]*brier(r(dana[s]), s, n, SUBS) for s in range(n)), 4))

# ---------- 2. Reduction: TEA_lambda = Lambda * EA in auxiliary transparent problem ----------
random.seed(1)
wr = [random.random() for _ in Es]
L = lam_p(Es, wr, n)
# auxiliary problem: Omega = S x Es, mu(s,E) = pi(s) w(E)/Lambda; evidence cell = E(s); rule depends on cell only
Lam = sum(wr)
def ea_aux(rule):
    return sum(wE/Lam * pi[s] * brier(rule(E[s]), s, n, SUBS) for E, wE in zip(Es, wr) for s in range(n))
for name, r in [("bcond", B), ("dogmatic", D), ("one-shot", oneshot)]:
    print("reduction check", name, abs(tea(r, Es, wr, pi, n, brier, SUBS) - Lam*ea_aux(r)) < 1e-9)
opt = opt_rule_factory(L, pi, n)
print("random lambda extensional?", is_extensional(L, n), " TEA opt > bcond:", tea(opt, Es, wr, pi, n, brier, SUBS) > tea(B, Es, wr, pi, n, brier, SUBS))

# ---------- 3. Permutation-invariant weights are extensional ----------
n4 = 4; Es4 = factive_situations(n4)
def canon(E):
    # orbit key under S_n: sorted multiset of (|E(s)|, pattern) -- use full orbit min
    best = None
    for perm in itertools.permutations(range(n4)):
        F_ = tuple(frozenset(perm[t] for t in E[perm.index(s)]) for s in range(n4))
        key = tuple(tuple(sorted(x)) for x in F_)
        if best is None or key < best: best = key
    return best
orbit_w = {}
wsym = []
for E in Es4:
    k = canon(E)
    if k not in orbit_w: orbit_w[k] = random.random()
    wsym.append(orbit_w[k])
print("n=4 factive situations:", len(Es4), " orbits:", len(orbit_w), " random symmetric lambda extensional?", is_extensional(lam_p(Es4, wsym, n4), n4))
# opaque-only uniform and transparent-only uniform
def partitional(E, n):
    return all(E[t] == E[s] for s in range(n) for t in E[s])
wop = [0.0 if partitional(E, n4) else 1.0 for E in Es4]
wtr = [1.0 if partitional(E, n4) else 0.0 for E in Es4]
print("uniform over opaque only extensional?", is_extensional(lam_p(Es4, wop, n4), n4), "; transparent only?", is_extensional(lam_p(Es4, wtr, n4), n4), "; #transparent:", int(sum(wtr)))

# interval-valued only (path order), uniform
def is_interval(A): return max(A) - min(A) + 1 == len(A)
Esint = factive_situations(n, allowed=lambda s, A: is_interval(A))
Lint = lam_p(Esint, [1.0]*len(Esint), n)
print("n=3 interval-only uniform: #", len(Esint), "extensional?", is_extensional(Lint, n), " lambda_{01}(0), lambda_{01}(1):", Lint.get((frozenset({0,1}),0)), Lint.get((frozenset({0,1}),1)))
