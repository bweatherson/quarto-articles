"""Stein face: empirical-Bayes in a batch of p units, one exceptional unit.
Compare positive-part James-Stein (normal EB, grand mean) with a 'bounded-incredulity' EB rule:
same location/scale estimates, but posterior mean under a Huber prior (normal centre, exponential tails,
tail slope L=1 in absolute units), i.e. pull capped at 1 noise sd."""
import numpy as np
rng=np.random.default_rng(1)
grid=np.linspace(-40,40,8001)
def rho(u,k): a=np.abs(u); return np.where(a<=k,0.5*u**2,k*a-0.5*k**2)
def huber_pm(x,M,tau,k):
    # prior: log pi = -rho_k((t-M)/tau); likelihood N(x,1)
    l=-rho((grid-M)/tau,k)-0.5*(x[:,None]-grid)**2; l-=l.max(1,keepdims=True); w=np.exp(l)
    return (w*grid).sum(1)/w.sum(1)
def js(X):
    p=len(X); m=X.mean(); d=X-m; S=(d**2).sum(); c=max(0.0,1-(p-3)/S); return m+c*d
def robust_eb(X,L=1.0):
    # same centre/spread estimates; prior = normal centre with exponential tails of slope L (absolute units),
    # i.e. Huber threshold k = L*tau in standardized units => nobody moved more than L (noise sd = 1)
    p=len(X); M=np.median(X); tau2=max(0.05,np.var(X,ddof=1)-1.0)   # crude moment estimate
    tau=np.sqrt(tau2); return huber_pm(X,M,tau,L*tau)
print("one unit at theta1, rest at 0; risk of unit 1 (stand-alone=1) and average risk, 2000 reps")
for p in [10,50,200]:
    for th1 in [2,3,4,6]:
        theta=np.zeros(p); theta[0]=th1
        r1=np.zeros(2); ra=np.zeros(2); n=400
        for _ in range(n):
            X=theta+rng.standard_normal(p)
            for j,est in enumerate((js(X),robust_eb(X))):
                e=(est-theta)**2; r1[j]+=e[0]; ra[j]+=e.mean()
        print(f"p={p:3d} theta1={th1}: unit-1 risk JS {r1[0]/n:.2f}  robust {r1[1]/n:.2f} | avg risk JS {ra[0]/n:.3f} robust {ra[1]/n:.3f}")
