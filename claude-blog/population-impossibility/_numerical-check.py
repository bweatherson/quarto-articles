"""Brute-force check of the candidate axiology V against Arrhenius's (2011) five exact
conditions and against the conclusions of Thomas's theorems.

Population = Counter {welfare level (int): count}.
V(P) = (J(P), T(P)) lexicographic, where
   High(P) = # lives with welfare >= A,  Tneg(P) = sum of welfare of lives with welfare < 0,
   I(P) = kappa*High(P) + Tneg(P),  J(P) = min(0, I(P)),  T(P) = total welfare.
P >= Q  iff  V(P) >= V(Q).
"""
import itertools, random
from collections import Counter

A = 4          # 'very high' threshold u
KAPPA = 1      # weight of a high life against a unit of negative welfare
LOW_MAX = 3    # R(1,3) = 'very low positive'

def High(P): return sum(c for w, c in P.items() if w >= A)
def Tneg(P): return sum(w * c for w, c in P.items() if w < 0)
def T(P): return sum(w * c for w, c in P.items())
def V(P):
    I = KAPPA * High(P) + Tneg(P)
    return (min(0, I), T(P))
def geq(P, Q): return V(P) >= V(Q)
def gt(P, Q): return V(P) > V(Q)
def U(*Ps):
    out = Counter()
    for P in Ps: out.update(P)
    return out
def pop(*pairs):
    P = Counter()
    for n, w in pairs:
        if n: P[w] += n
    return P

def rand_pop(rng, levels, maxn):
    P = Counter()
    for _ in range(rng.randint(0, 4)):
        P[rng.choice(levels)] += rng.randint(1, maxn)
    return P

def check(rng, trials=20000, levels=range(-6, 9)):
    fails = Counter()
    levels = list(levels)
    for _ in range(trials):
        # ED exact: A ⊂ Wx, N(A)=N(B)=n, all of B below x  ⇒  A ≻ B
        x = rng.choice(levels); n = rng.randint(1, 6)
        below = [w for w in levels if w < x]
        if below:
            B = Counter()
            for _ in range(n): B[rng.choice(below)] += 1
            if not gt(pop((n, x)), B): fails['ED'] += 1
        # GNEP exact: for z, witnesses u=A, y=3, n=2: A⊂Wx (x>=A), B⊂R(1,3), |A|=|B|=2, C={z}, D={z+1}; ∀E
        z = rng.choice(levels); xx = rng.choice([w for w in levels if w >= A]); nG = 2
        Bl = Counter()
        for _ in range(nG): Bl[rng.randint(1, LOW_MAX)] += 1
        E = rand_pop(rng, levels, 5)
        if not geq(U(pop((nG, xx), (1, z)), E), U(Bl, pop((1, z + 1)), E)): fails['GNEP'] += 1
        # NE exact: x-1 > y; witness n = max(1,KAPPA); A={x}, B=n at y, C=(n+1) at x-1; ∀D ⊂ R(y,x)
        x = rng.choice(levels); ys = [w for w in levels if w < x - 1]
        if ys:
            y = rng.choice(ys); nN = max(1, KAPPA)
            D = Counter()
            for _ in range(rng.randint(0, 5)): D[rng.randint(y, x)] += rng.randint(1, 3)
            if not geq(U(pop((nN + 1, x - 1)), D), U(pop((1, x), (nN, y)), D)): fails['NE'] += 1
        # WNS exact: witnesses Wx=-1 (any negative), n=1: A = 1 at -1; B ⊂ Wy (y>0) any size; ∀C: B∪C ≽ A∪C
        y = rng.choice([w for w in levels if w > 0]); m = rng.randint(1, 8)
        C = rand_pop(rng, levels, 5)
        if not geq(U(pop((m, y)), C), U(pop((1, -1)), C)): fails['WNS'] += 1
        # WQA exact: for X choose x=-1, u=A, y=3, n=1, m = KAPPA*High(X) + max(0, -Tneg(X))... use m large enough:
        X = rand_pop(rng, levels, 6)
        m = KAPPA * High(X) + Tneg(X) + 1   # makes I(B∪C∪X) = KAPPA*High(X)+Tneg(X) - m < 0
        if m < 1: m = 1
        zz = rng.choice([w for w in levels if w >= A]); nq = 1
        Bq = Counter()
        for _ in range(rng.randint(0, 12)): Bq[rng.randint(1, LOW_MAX)] += rng.randint(1, 5)
        if not geq(U(pop((nq, zz)), X), U(Bq, pop((m, -1)), X)): fails['WQA'] += 1
        # Conclusions: VRA* should hold, VRA should fail. Check the specific witnesses:
    return fails

def vra_checks():
    # VRA*: ∀z<0, m ∃P ∀n ∃N: P + m·z + N·3 ≻ P + n·A.  Take P = m·A (High = m ≥ m).
    bad = 0
    for z in range(-5, 0):
        for m in range(1, 6):
            P = pop((m, A))
            for n in range(1, 8):
                ok = any(gt(U(P, pop((m, z), (N, 3))), U(P, pop((n, A)))) for N in range(0, 400))
                if not ok: bad += 1
    print('VRA* violations with P=m·A:', bad)
    # VRA: for each P, exists (z,m,n) with no N working. Show for random P with m = High(P)+1.
    rng = random.Random(1); bad = 0
    for _ in range(300):
        P = rand_pop(rng, list(range(-6, 9)), 6)
        m = High(P) + 1 + max(0, -Tneg(P)); z = -1
        n = max(1, Tneg(P) * -1)  # ensure I(P + n·A) >= ... any n works since J(right) >= J(left)
        if any(gt(U(P, pop((m, z), (N, 3))), U(P, pop((n, A)))) for N in range(0, 400)): bad += 1
    print('VRA witnesses found (should be 0):', bad)

if __name__ == '__main__':
    rng = random.Random(0)
    print('condition failures:', dict(check(rng)))
    vra_checks()
