import sys, math
sys.path.insert(0, '/mnt/user-data/outputs/bayes-reply/code')
from checks import subsets, brier, logscore, cond
from margins_fast import product_lambda, R_path, tea_fast
for n, m in [(3,1), (4,1), (5,1), (6,1), (7,1), (7,2)]:
    SUBS = subsets(n); R = R_path(n, m); pi = [1/n]*n
    L, tot = product_lambda(n, lambda s, A: R[s] <= A)
    for name, sc in [("Brier", brier), ("log", logscore)]:
        b = tea_fast(lambda p: cond(pi, p), L, pi, n, sc, SUBS)/tot
        d = tea_fast(lambda p: pi[:], L, pi, n, sc, SUBS)/tot
        print(f"n={n} m={m} uniform prior, {name}: EA bcond {b:.4f}  prior {d:.4f}  bcond-prior {b-d:+.4f}")
