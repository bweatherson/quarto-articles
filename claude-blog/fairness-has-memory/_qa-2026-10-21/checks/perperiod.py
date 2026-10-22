# How often does a claimant with no surplus (shortfall >= 0) get a per-period chance below 1/N under kappa=1 (churn, N=10, q=0.1)?
import numpy as np
rng = np.random.default_rng(11); N=10; q=0.1; kappa=1.0
w=np.zeros(N); r=np.zeros(N); below=0; tot=0; mins=[]
for t in range(200000):
    s = r/N - w
    wt = np.maximum(0.0, 1 + kappa*s); p = wt/wt.sum()
    if t > 500:
        m = s >= 0
        tot += m.sum(); below += (p[m] < 1/N - 1e-12).sum()
        if m.any(): mins.append((p[m]*N).min())
    i = rng.choice(N, p=p); w[i]+=1; r+=1
    ex = np.where(rng.random(N) < q)[0]; w[ex]=0; r[ex]=0
mins=np.array(mins)
print(f"no-surplus claimant-periods below 1/N: {below/tot:.3f}; min ratio among them per period: median {np.median(mins):.3f}, 5th pct {np.percentile(mins,5):.3f}")
