# Independent check of suggestion 07: Rao-Blackwellised expected share by tenure, kappa = 0 and 1, N=10, q=0.1.
import numpy as np, sys
def run(kappa, T, seed, N=10, q=0.1):
    rng = np.random.default_rng(seed)
    w = np.zeros(N); r = np.zeros(N); ew = np.zeros(N)   # ew: sum of win probabilities (Rao-Blackwell)
    tot = {}; cnt = {}
    for t in range(T):
        wt = np.maximum(0.0, 1 + kappa * (r / N - w)) if kappa > 0 else np.ones(N)
        if wt.sum() == 0: wt = np.ones(N)
        p = wt / wt.sum()
        ew += p
        i = rng.choice(N, p=p); w[i] += 1; r += 1
        ex = np.where(rng.random(N) < q)[0]
        if t > 500:
            for j in ex:
                L = int(r[j]); b = min(L, 60)
                tot[b] = tot.get(b, 0) + ew[j]; cnt[b] = cnt.get(b, 0) + 1
        w[ex] = 0; r[ex] = 0; ew[ex] = 0
    return tot, cnt
T = int(sys.argv[1])
for kappa in (0, 1):
    tot, cnt = run(kappa, T, 7)
    # ratio of expected share to proportional, by tenure bins
    bins = [(1,1),(2,5),(6,15),(16,30),(31,45),(46,60)]
    out = []
    for a, b in bins:
        s = sum(tot.get(L,0) for L in range(a,b+1)); n = sum(cnt.get(L,0)*L for L in range(a,b+1))
        out.append(f"L{a}-{b}: {s/(n/10):.4f}")
    # conservation: total expected wins minus total claimant-periods/N over all exits
    S = sum(tot.values()); P = sum(cnt[L]*L for L in cnt)/10
    print(f"kappa={kappa}: " + " | ".join(out) + f" | overall {S/P:.4f}")
