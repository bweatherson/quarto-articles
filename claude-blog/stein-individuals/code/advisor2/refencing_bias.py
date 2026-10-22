"""Biased group belief: hyperprior on group centre M ~ N(m0, s0^2); truth: theta ~ N(0,1), x = theta + N(0,1).
Posterior mean of M under normal vs Huber(k=1) random-effects prior after n records."""
import numpy as np
g=np.linspace(-40,40,8001)
def rho(u,k): a=np.abs(u); return np.where(a<=k,0.5*u**2,k*a-0.5*k**2)
def logm_fn(kind,k=1.0):
    lp=-0.5*g**2 if kind=='normal' else -rho(g,k); p=np.exp(lp-lp.max()); p/=p.sum()
    ug=np.linspace(-20,20,2001)
    lm=np.array([np.log((p*np.exp(-0.5*(u-g)**2)).sum()+1e-300) for u in ug])
    return lambda u: np.interp(u,ug,lm)
Ms=np.linspace(-6,4,501)
LM={k:logm_fn(k) for k in ['normal','huber']}
def post_M(X,lm,m0,s0):
    ll=lm(X[None,:]-Ms[:,None]).sum(1); lp=ll-0.5*((Ms-m0)/s0)**2; w=np.exp(lp-lp.max()); w/=w.sum(); return (w*Ms).sum()
rng=np.random.default_rng(11)
for m0,s0 in [(-2,0.5),(-3,0.5)]:
  for n in [5,20,80]:
    res={'normal':[], 'huber':[]}
    for rep in range(200):
        X=rng.normal(0,1,n)+rng.standard_normal(n)
        for kind in res: res[kind].append(post_M(X,LM[kind],m0,s0))
    print(f"hyperprior centre {m0} (sd {s0}), truth 0, n={n}: posterior group centre normal {np.mean(res['normal']):.2f}, huber(k=1) {np.mean(res['huber']):.2f}")
