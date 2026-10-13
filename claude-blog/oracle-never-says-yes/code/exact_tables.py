"""Exact minimax values for named classes of 'analyses' over n binary case-features (cases = {0,1}^n),
and a randomised check of the Hanneke-Livni-Moran bounds on small abstract classes.
Run:  python3 exact_tables.py   (about a minute)"""
import random, time, sys
from qlib import *

def row(name, C, improper_check=False):
    t = time.time()
    L = C.ldim()
    P = C.eq_value(C.C)
    K = C.inconsistency()
    imp = None
    if improper_check:
        imp = C.eq_value(C.all_functions())
        assert imp == L, (name, imp, L)
    print(f"{name:34s} |X|={C.m:3d} |C|={C.N:5d}  Ldim={L:2d}  proper(H=C)={P if P<INF else 'inf':>3}  K*={K:2d}  "
          f"improper==Ldim checked={improper_check}  [{time.time()-t:.1f}s]", flush=True)
    assert P >= max(L, K - 1), (name, P, L, K)
    return L, P, K

print("== named classes (cases are all 2^n combinations of n binary features) ==")
for n in range(2, 9):
    row(f"single-feature analyses, n={n}", dictators(n), improper_check=(n <= 3))
for n in range(2, 6):
    row(f"monotone conjunctions, n={n}", monotone_conjunctions(n), improper_check=(n <= 3))
for n in range(2, 4):
    row(f"conjunctions of literals, n={n}", conjunctions(n), improper_check=(n <= 2))
row("2-juntas of n=4 features", juntas(4, 2))
row("2-juntas of n=5 features", juntas(5, 2))
for n in range(1, 4):
    row(f"all Boolean functions, n={n}", all_boolean(n), improper_check=(n <= 2))
row("monotone DNF <=2 terms, n=4", monotone_dnf(4, 2))
row("monotone DNF <=3 terms, n=4", monotone_dnf(4, 3))

print("\n== random abstract classes: check max(L, K*-1) <= proper value; improper value == L; proper <= L*max(2,K*) ==")
random.seed(1)
worst_ratio = 0; viol_up = 0; trials = 0; gaps = []
for m in (4, 5, 6):
    for _ in range(60 if m < 6 else 25):
        N = random.randint(3, 14)
        fs = [tuple(random.randint(0, 1) for _ in range(m)) for _ in range(N)]
        C = Cls(m, fs)
        if C.N < 2:
            continue
        L = C.ldim(); P = C.eq_value(C.C); K = C.inconsistency()
        I = C.eq_value(C.all_functions())
        assert I == L, (I, L)
        assert P >= max(L, K - 1), (P, L, K)
        if P < INF and P > L * max(2, K):
            viol_up += 1
        trials += 1
        if P < INF and L > 0:
            worst_ratio = max(worst_ratio, P / L)
        gaps.append((P - L) if P < INF else None)
print(f"trials={trials}; improper==Ldim and proper>=max(L,K*-1) held in all; proper>L*K violations: {viol_up}; "
      f"max proper/Ldim observed: {worst_ratio:.2f}; classes with proper==inf: {sum(g is None for g in gaps)}; "
      f"classes with proper>Ldim: {sum(1 for g in gaps if g not in (None,0))}")
