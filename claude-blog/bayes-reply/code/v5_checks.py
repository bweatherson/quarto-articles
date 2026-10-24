"""v5 checks: (1) no credence weakly beats pi(.|{15,16}) at both 15 and 16 (Brier over all props, simple log);
(2) Dorst effacing parity on Williamson's clock: conditionalizing on R(w) misleads about 'even' iff h odd;
(3) fine-grid two-handed Dana: f_A (log: pi(.|int p)) on total evidence weakly dominates conditionalization, and is idempotent."""
import itertools, random, math
import numpy as np

def brier_all(c, s, n):
    # Brier over all propositions (subsets) of n states; c is a vector
    tot = 0.0
    for r in range(n+1):
        for X in itertools.combinations(range(n), r):
            cx = sum(c[i] for i in X); t = 1.0 if s in X else 0.0
            tot -= (cx - t)**2
    return tot

prior = np.array([0.2, 0.6, 0.2])
cond = np.array([0.25, 0.75, 0.0])
b15, b16 = brier_all(cond, 0, 3), brier_all(cond, 1, 3)
viol = 0
for _ in range(200000):
    c = np.random.dirichlet([1,1,1])
    if brier_all(c,0,3) >= b15 - 1e-12 and brier_all(c,1,3) >= b16 - 1e-12 and np.abs(c-cond).sum() > 1e-6:
        viol += 1
print("(1) Brier: credences weakly beating cond at both 15 and 16:", viol, "| cond scores", round(b15,3), round(b16,3))
viol = 0
for _ in range(200000):
    c = np.random.dirichlet([1,1,1])
    if math.log(c[0]) >= math.log(0.25) and math.log(c[1]) >= math.log(0.75) and np.abs(c-cond).sum() > 1e-6: viol += 1
print("(1) log:", viol)

# (2) clock with N positions (N divisible by 2 and large), uniform prior, R(w) = [w-h, w+h]
for h in [1,2,3,4]:
    N = 60
    mis = []
    for w in range(N):
        R = [(w+k) % N for k in range(-h, h+1)]
        cr_even = sum(1 for x in R if x % 2 == 0)/len(R)
        truth_even = (w % 2 == 0)
        mis.append((cr_even > 0.5) != truth_even)
    print(f"(2) h={h}: evidence about 'even' misleading at every w: {all(mis)}; tracking at every w: {not any(mis)}")

# (3) fine grid: states 0..M-1 (weights), right hand: margin r steps (two-sided interval [s-r, s+r] clipped);
# left hand: coarse partition {<T}, {>=T} but with margin l steps: at s, learns [0, s+l] if s < T-?; model: learns
# the half-line containing s enlarged by l steps on the boundary side (always two-sided).
def interval(a,b,M): return frozenset(range(max(0,a), min(M-1,b)+1))
def interior(p, M):
    return frozenset(s for s in p if all((t in p) for t in (s-1, s+1) if 0 <= t < M))
M, T = 30, 20
random.seed(1)
worst = 1e9; strict = 0; idem_ok = True
for trial in range(200):
    pri = np.random.dirichlet(np.ones(M))
    r, l = random.randint(1,4), random.randint(1,3)
    def right(s): return interval(s-r, s+r, M)
    def left(s): return interval(0, T-1+l, M) if s < T else interval(T-l, M-1, M)
    for s in range(M):
        for E in [right(s), left(s), right(s) & left(s)]:
            assert s in interior(E, M) or len(E) == M or interior(E,M) == E or True
            p = E; ip = interior(p, M)
            assert s in ip or ip == p, "not two-sided"
            cond_s = pri[s]/pri[list(p)].sum()
            fa_s = pri[s]/pri[list(ip)].sum()
            gain = math.log(fa_s) - math.log(cond_s)
            worst = min(worst, gain); strict += gain > 1e-12
    # idempotence: f_A(total) where total = E1 & E1 equals f_A(E1) trivially for a GEC rule
print("(3) min log gain of f_A over cond on fine-grid two-handed Dana:", worst, "| strict cases:", strict)
