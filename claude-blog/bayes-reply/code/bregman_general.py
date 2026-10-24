"""Check the general Proposition: for strictly proper scores (additive log over all propositions, as Meehan & Zhang use;
spherical; Brier), the A-projection of pi(.|p) onto credences concentrated on int(p) dominates pi(.|p) at every interior
state. Projection computed numerically: minimize D_A(q, c) = sum_s q(s)[A(q,s) - A(c,s)] over q in the face."""
import itertools, math, random
import numpy as np
from scipy.optimize import minimize

def props(n): return [c for r in range(1, n) for c in itertools.combinations(range(n), r)]  # proper nonempty subsets
def addlog(c, s, n, P):
    tot = 0.0
    for A in P:
        cA = min(max(sum(c[i] for i in A), 1e-12), 1-1e-12)
        tot += math.log(cA) if s in A else math.log(1 - cA)
    return tot
def spherical(c, s, n, P=None): return c[s] / math.sqrt(sum(x*x for x in c))
def brier(c, s, n, P=None): return -sum((c[i] - (1.0 if i == s else 0.0))**2 for i in range(n))
def interior(p, n): return [s for s in p if all(t in p for t in (s-1, s+1) if 0 <= t < n)]

def project(c, I, n, A, P):
    k = len(I)
    def D(z):
        w = np.exp(z - z.max()); w = w / w.sum()
        q = np.zeros(n); q[I] = w
        return sum(q[s] * (A(q, s, n, P) - A(c, s, n, P)) for s in I)
    best = None
    for start in range(3):
        z0 = np.log(np.maximum(c[I], 1e-6)) + (np.random.randn(k)*0.3 if start else 0)
        r = minimize(D, z0, method='Nelder-Mead', options={'xatol':1e-10, 'fatol':1e-12, 'maxiter':20000})
        if best is None or r.fun < best.fun: best = r
    w = np.exp(best.x - best.x.max()); w /= w.sum(); q = np.zeros(n); q[I] = w
    return q

random.seed(5); np.random.seed(5)
for name, A in [("additive log", addlog), ("spherical", spherical), ("Brier", brier)]:
    worst = math.inf; cases = 0
    for n in [4, 5]:
        P = props(n)
        for trial in range(25):
            pi = np.random.dirichlet(np.ones(n))
            for r in range(2, n+1):
                for p in itertools.combinations(range(n), r):
                    I = interior(p, n)
                    if not I or len(I) == len(p): continue
                    c = np.zeros(n); c[list(p)] = pi[list(p)]; c /= c.sum()
                    q = project(c, I, n, A, P)
                    for s in I:
                        cases += 1; worst = min(worst, A(q, s, n, P) - A(c, s, n, P))
    print(f"{name}: {cases} (rim-nonempty evidence, interior state) cases; minimum gain of projection over conditionalization = {worst:.3e}")
