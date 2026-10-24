"""Independent check of N5: under two-sided margins, conditionalization is weakly accuracy-dominated, at every possible
(evidence, state) pair, by an evidence-only rule. Log: condition on the interior. Brier: Euclidean projection of
pi(.|p) onto the simplex face over int(p)."""
import itertools, random, math
import numpy as np

def subsets(n): return [frozenset(c) for r in range(1, n+1) for c in itertools.combinations(range(n), r)]
def nbhd(s, n, cyc=False):
    if cyc: return frozenset({(s-1) % n, s, (s+1) % n})
    return frozenset(t for t in (s-1, s, s+1) if 0 <= t < n)
def interior(p, n, cyc=False): return frozenset(s for s in p if nbhd(s, n, cyc) <= p)
def cond(pi, A):
    v = np.array([pi[i] if i in A else 0.0 for i in range(len(pi))]); return v / v.sum()
def proj_simplex_face(c, face, n):
    """Euclidean projection of vector c onto {q >= 0, sum q = 1, q_i = 0 off face}."""
    idx = sorted(face); y = c[idx]
    u = np.sort(y)[::-1]; css = np.cumsum(u); rho = max(j for j in range(len(u)) if u[j] - (css[j]-1)/(j+1) > 0)
    theta = (css[rho]-1)/(rho+1); q = np.zeros(n); q[idx] = np.maximum(y - theta, 0); return q
def brier_state(c, s): v = np.zeros(len(c)); v[s] = 1; return -np.sum((c-v)**2)
def logs(c, s): return math.log(c[s]) if c[s] > 0 else -math.inf

if __name__ != "__main__":
    pass
else:
  random.seed(11); np.random.seed(11)
  for cyc in [False, True]:
      for n in [3,4,5,6,7]:
          worst = {"log": math.inf, "brier": math.inf, "brier_condint": math.inf}
          strict_ok = True; pairs = 0
          for trial in range(100):
              pi = np.random.dirichlet(np.ones(n))
              for p in subsets(n):
                  I = interior(p, n, cyc)
                  if not I: continue            # never learned under two-sided margins
                  b = cond(pi, p); fl = cond(pi, I); fb = proj_simplex_face(b, I, n)
                  for s in I:                   # under two-sided margins, p can be learned only at interior states
                      pairs += 1
                      gl = logs(fl, s) - logs(b, s); gb = brier_state(fb, s) - brier_state(b, s); gc = brier_state(fl, s) - brier_state(b, s)
                      worst["log"] = min(worst["log"], gl); worst["brier"] = min(worst["brier"], gb); worst["brier_condint"] = min(worst["brier_condint"], gc)
                      if I != p and not (gl > 1e-12 and gb > 1e-12): strict_ok = False
          print(f"{'cycle' if cyc else 'line '} n={n}: pairs checked {pairs}; min gain log {worst['log']:.2e}, Brier-projection {worst['brier']:.2e}, "
                f"Brier for cond-on-interior {worst['brier_condint']:.3f}; strict whenever rim nonempty: {strict_ok}")
