import numpy as np
from scipy.optimize import minimize_scalar
rng=np.random.default_rng(7)
g=np.linspace(-40,40,8001); dg=g[1]-g[0]
def rho(u,k): a=np.abs(u); return np.where(a<=k,0.5*u**2,k*a-0.5*k**2)
def make(kind,k=1.0,tau=1.0):
    lp = -0.5*(g/tau)**2 if kind=='normal' else -rho(g/tau,k)
    pri=np.exp(lp-lp.max()); pri/=pri.sum()
    return pri
def logm(u,pri):   # marginal log density of x-M = u, noise sd 1
    return np.log((pri[None,:]*np.exp(-0.5*(u[:,None]-g[None,:])**2)).sum(1)+1e-300)
def pm(u,pri):
    w=pri[None,:]*np.exp(-0.5*(u[:,None]-g[None,:])**2); return (w*g).sum(1)/w.sum(1)
p=60
theta=np.r_[rng.normal(-1,1,54), np.full(6,3.0)]   # 10% exceptional at +3
X=theta+rng.standard_normal(p)
for kind in ['normal','huber']:
    pri=make(kind)
    res=minimize_scalar(lambda M: -logm(X-M,pri).sum(),bounds=(-5,5),method='bounded'); M=res.x
    est=M+pm(X-M,pri); pull=X-est
    print(f"{kind}: type-II ML group centre M={M:.3f} (sample mean {X.mean():.3f}); sum of pulls={pull.sum():.4f}")
    print(f"   mean pull on the 6 exceptional (true 3): {pull[54:].mean():.2f}; their mean est {est[54:].mean():.2f}")
    # a new borderline member with record x=1.5
    print(f"   new member record 1.5 -> assessment {M+pm(np.array([1.5-M]),pri)[0]:.2f}; record 4 -> {M+pm(np.array([4-M]),pri)[0]:.2f}")
