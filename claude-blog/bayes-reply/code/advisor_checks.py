"""Advisor's checks (2026-10-23). Run: python3 -I advisor_checks.py
(1) N4 scope: non-CAR does not imply bias or negative value (Williamson's symmetric clock; uniform-prior margin populations).
(2) Dominance: over any domain of learning with two-sided margins, the GEC rule 'project pi(.|p) onto the
    probability functions concentrated on int(p)' is at least as accurate as conditionalization at every
    (evidence, state) pair, strictly when p has a rim. For the simple log score the projection is pi(.|int p);
    for Brier it is the Euclidean projection (pi(.|int p) itself is NOT Brier-dominant: example below).
(3) Interior rule under M&Z's full measure; knife-edge: random weights on a CAR-capable support are never CAR."""
import sys, math, random
sys.path.insert(0, '/mnt/user-data/outputs/bayes-reply/code')
from checks import subsets, brier, logscore, cond, factive_situations, lam_p, is_extensional, tea, opt_rule_factory

def sbrier(c, s): return -sum((c[i] - (1.0 if i == s else 0.0))**2 for i in range(len(c)))
def proj_simplex(v):
    u = sorted(v, reverse=True); css = 0; theta = 0
    for j, x in enumerate(u, 1):
        css += x; t = (css - 1) / j
        if x - t > 0: theta = t
    return [max(x - theta, 0.0) for x in v]
def proj_face(c, face, n):
    idx = sorted(face); pv = proj_simplex([c[i] for i in idx]); out = [0.0]*n
    for i, x in zip(idx, pv): out[i] = x
    return out
def interior(p, n, circle=False):
    nb = (lambda s: ((s-1) % n, (s+1) % n)) if circle else (lambda s: tuple(t for t in (s-1, s+1) if 0 <= t < n))
    return frozenset(s for s in p if all(t in p for t in nb(s)))

print("(1) N4 scope")
for n in [5, 6, 8]:
    SUBS = subsets(n); pi = [1/n]*n
    E = tuple(frozenset({(s-1) % n, s, (s+1) % n}) for s in range(n))
    post = [sum(pi[s]*cond(pi, E[s])[i] for s in range(n)) for i in range(n)]
    gb = sum(pi[s]*(brier(cond(pi, E[s]), s, n, SUBS) - brier(pi, s, n, SUBS)) for s in range(n))
    gl = sum(pi[s]*(logscore(cond(pi, E[s]), s, n) - logscore(pi, s, n)) for s in range(n))
    print(f"  symmetric clock n={n}: CAR? False; max|E[post]-prior|={max(abs(a-b) for a,b in zip(post,pi)):.1e}; "
          f"value of conditionalizing vs prior: Brier {gb:+.3f}, log {gl:+.3f}")

print("(2) Dominance over two-sided-margin learning")
random.seed(11)
for n in [3, 4, 5]:
    SUBS = subsets(n)
    Es = factive_situations(n, allowed=lambda s, A: all(t in A for t in (s-1, s+1) if 0 <= t < n))
    pairs = set((E[s], s) for E in Es for s in range(n))
    mins = [float('inf')]*3; strict = True
    for _ in range(300):
        pi = [random.random()**3 + 1e-3 for _ in range(n)]; z = sum(pi); pi = [x/z for x in pi]
        for (p, s) in pairs:
            c = cond(pi, p); ip = interior(p, n); cb = proj_face(c, ip, n); cl = cond(pi, ip)
            g = (sbrier(cb, s) - sbrier(c, s), brier(cb, s, n, SUBS) - brier(c, s, n, SUBS), math.log(cl[s]) - math.log(c[s]))
            mins = [min(a, b) for a, b in zip(mins, g)]
            if ip != p and min(g) <= 1e-12: strict = False
    print(f"  line n={n}: {len(Es)} situations, {len(pairs)} possible (evidence,state) pairs x 300 random priors; "
          f"min gain state-Brier {mins[0]:.1e}, all-subset Brier {mins[1]:.1e}, log {mins[2]:.1e}; strict when rim nonempty: {strict}")
n = 6; pi6 = [0.2, 0.25, 0.005, 0.245, 0.25, 0.05]; p = frozenset({1, 2, 3, 4}); ip = interior(p, n)
c = cond(pi6, p); cl = cond(pi6, ip); cb = proj_face(c, ip, n)
for s in sorted(ip):
    print(f"  Brier at s={s}, p={sorted(p)}: conditionalize {sbrier(c,s):.4f}; condition on interior {sbrier(cl,s):.4f}; projection {sbrier(cb,s):.4f}")

print("(3) Interior rule and knife-edge (Dana's space)")
n = 3; SUBS = subsets(n); pi = [0.2, 0.6, 0.2]
R = [frozenset({0,1}), frozenset({0,1,2}), frozenset({1,2})]
mp = factive_situations(n, allowed=lambda s, A: R[s] <= A); interior_rule = opt_rule_factory(lam_p(mp, [1.0]*len(mp), n), pi, n)
allE = factive_situations(n)
for nm, r in [("bcond", lambda p: cond(pi, p)), ("interior", interior_rule)]:
    print(f"  {nm}: M&Z measure Brier {tea(r, allE, [1.0]*len(allE), pi, n, brier, SUBS)/len(allE):.4f}; "
          f"margin measure Brier {tea(r, mp, [1.0]*len(mp), pi, n, brier, SUBS)/len(mp):.4f}")
S = frozenset({0,1,2})
cx = [(frozenset({0}),S,S), (frozenset({0,1}),S,frozenset({1,2})), (S,frozenset({0,1}),frozenset({1,2})), (S,S,frozenset({2})), (S,frozenset({1,2}),S)]
print("  pretest support with weights 2,1,1,1,2 CAR?", is_extensional(lam_p(cx, [2,1,1,1,2], n), n),
      "| random weights on same support CAR:", sum(is_extensional(lam_p(cx, [random.random() for _ in cx], n), n, tol=1e-6) for _ in range(10000)), "/ 10000")
