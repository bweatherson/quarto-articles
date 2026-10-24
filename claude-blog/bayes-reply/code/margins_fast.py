import sys, itertools, random, math
sys.path.insert(0, '/mnt/user-data/outputs/bayes-reply/code')
from checks import subsets, brier, logscore, cond, factive_situations, lam_p, is_extensional, opt_rule_factory, tea

def R_path(n, m=1):
    return [frozenset(t for t in range(n) if abs(t-s) <= m) for s in range(n)]
def interior(p, R):
    return frozenset(s for s in p if R[s] <= p)

def product_lambda(n, admissible):
    """Uniform product measure over factive E with E(s) in admissible(s). Returns lambda_p(s)."""
    SUBS = subsets(n)
    opts = [[A for A in SUBS if s in A and admissible(s, A)] for s in range(n)]
    Z = [len(o) for o in opts]
    tot = math.prod(Z)
    L = {}
    for s in range(n):
        for A in opts[s]:
            L[(A, s)] = tot / Z[s]
    return L, tot

def tea_fast(rule, L, pi, n, score, SUBS):
    return sum(pi[s] * v * score(rule(p), s, n, SUBS) for (p, s), v in L.items())

if __name__ == "__main__":
    n = 6; SUBS = subsets(n); R = R_path(n, 1); pi = [1/6]*6
    L, tot = product_lambda(n, lambda s, A: R[s] <= A)
    opt = opt_rule_factory(L, pi, n); B = lambda p: cond(pi, p)
    print("Olivia n=6 margin 1: #MP situations", tot, "extensional?", is_extensional(L, n))
    for name, r in [("bcond", B), ("TEA-optimal", opt)]:
        print(f"   {name:12s} TEA/total Brier {tea_fast(r, L, pi, n, brier, SUBS)/tot:.4f}  log {tea_fast(r, L, pi, n, logscore, SUBS)/tot:.4f}")
    for p in [frozenset({1,2,3}), frozenset({1,2,3,4}), frozenset({0,1,2}), frozenset(range(6))]:
        print("   learn", [x+15 for x in sorted(p)], "-> optimal", [round(x,3) for x in opt(p)], "| interior", [x+15 for x in sorted(interior(p,R))])

    # Theorem check by enumeration, random margin-respecting weights
    random.seed(7)
    for n in [3,4,5]:
        R = R_path(n, 1); Es = factive_situations(n, allowed=lambda s, A: R[s] <= A)
        bad = 0; tried = 0
        for trial in range(200):
            w = [random.random() if random.random() < 0.5 else 0.0 for _ in Es]
            L = lam_p(Es, w, n)
            if not any(v > 0 for (q, s), v in L.items() if len(q) < n): continue
            tried += 1
            if is_extensional(L, n): bad += 1
        print(f"n={n}: {len(Es)} MP situations; {tried} random margin-respecting weightings with nontrivial learning; extensional: {bad}")

    # Mixed domain n=4: uniform transparent + k * uniform margin-respecting
    def partitional(E, n): return all(E[t] == E[s] for s in range(n) for t in E[s])
    n = 4; SUBS = subsets(n); R = R_path(n, 1); pi4 = [0.25]*4
    Es_all = factive_situations(n)
    Es_tr = [E for E in Es_all if partitional(E, n)]
    Es_mp = [E for E in Es_all if all(R[s] <= E[s] for s in range(n))]
    print("n=4: transparent", len(Es_tr), "margin-respecting", len(Es_mp), "both", sum(1 for E in Es_tr if all(R[s] <= E[s] for s in range(n))))
    for k in [0.001, 0.1, 1.0]:
        Es_mix = Es_tr + Es_mp; w = [1.0]*len(Es_tr) + [k]*len(Es_mp)
        L = lam_p(Es_mix, w, n)
        print(f"   margin weight {k}: extensional? {is_extensional(L, n)}; TEA bcond {tea(lambda p: cond(pi4,p), Es_mix, w, pi4, n, brier, SUBS):.4f} vs optimal {tea(opt_rule_factory(L,pi4,n), Es_mix, w, pi4, n, brier, SUBS):.4f}")

    # How much 'edge' (unsafe) weight does the uniform measure over ALL factive situations carry? n=6, margin 1
    n = 6; R = R_path(n, 1); SUBS = subsets(n)
    Lall, totall = product_lambda(n, lambda s, A: True)
    mass_safe = sum(v for (p, s), v in Lall.items() if R[s] <= p) / (totall * n)
    print(f"n=6: share of (state, evidence) pairs under M&Z's uniform measure in which the evidence respects the margin: {mass_safe:.3f}")
