# Check suggestion 03: centred rule p_i = 1/N + (kappa/N)(s_i - mean s), clipped at 0 and renormalised only if needed.
# Report expected share by tenure (Rao-Blackwellised) and sd of shortfall at exit; compare with (N-1)/(N(Nq+2k(1-q))).
import numpy as np, sys
def run(kappa, T, seed, N=10, q=0.1, centred=True):
    rng = np.random.default_rng(seed)
    w=np.zeros(N); r=np.zeros(N); ew=np.zeros(N); tot={}; cnt={}; sf=[]; clipped=0; per=0
    for t in range(T):
        s = r/N - w
        if centred: p = 1/N + (kappa/N)*(s - s.mean())
        else: p = 1 + kappa*s
        if (p < 0).any(): clipped += 1
        p = np.maximum(p, 0); p = p/p.sum()
        ew += p
        i = rng.choice(N, p=p); w[i]+=1; r+=1
        ex = np.where(rng.random(N) < q)[0]
        if t > 500:
            per += 1
            for j in ex:
                L=int(r[j]); tot[L]=tot.get(L,0)+ew[j]; cnt[L]=cnt.get(L,0)+1; sf.append(w[j]-L/N)
        w[ex]=0; r[ex]=0; ew[ex]=0
    bins=[(1,1),(2,5),(6,15),(16,30),(31,45)]
    rat=[sum(tot.get(L,0) for L in range(a,b+1))/(sum(cnt.get(L,0)*L for L in range(a,b+1))/N) for a,b in bins]
    return rat, np.std(sf), clipped/per
T=int(sys.argv[1]); N=10; q=0.1
for k in (0.5, 1.0):
    rat, sd, cl = run(k, T, 3)
    pred = np.sqrt((N-1)/(N*(N*q+2*k*(1-q))))
    print(f"centred kappa={k}: share by tenure bins 1|2-5|6-15|16-30|31-45 = " + " | ".join(f"{x:.4f}" for x in rat) + f" ; sd at exit {sd:.3f} (formula {pred:.3f}); periods with clipping {cl:.3f}")
