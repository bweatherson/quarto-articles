"""Bounded-incredulity priors: normal centre, exponential tails (log-prior = -Huber rho).
x | theta ~ N(theta, 1). Prior centred at M, scale tau=1, Huber constant k: log pi(t) = -rho_k(t-M).
Checks: (1) shift bound |E[theta|x]-x| <= L = k (Lipschitz constant of log prior), all x;
(2) per-person worst-case risk; (3) Bayes risk if truth N(0,1); (4) group gap and threshold hurdle;
(5) empirical-Bayes batch version vs James-Stein (worst individual risk vs batch size)."""
import numpy as np
from scipy import stats
grid=np.linspace(-60,60,120001)
def rho(u,k): a=np.abs(u); return np.where(a<=k,0.5*u**2,k*a-0.5*k**2)
def logprior(kind,k=None,M=0.0):
    if kind=='normal': return lambda t: -0.5*(t-M)**2
    if kind=='huber':  return lambda t: -rho(t-M,k)
    if kind=='laplace':return lambda t: -np.abs(t-M)*np.sqrt(2)   # sd 1
def pm(x,lp):
    l=lp(grid)-0.5*(x-grid)**2; l-=l.max(); w=np.exp(l); return (w*grid).sum()/w.sum()
def pmvec(xs,lp): return np.array([pm(x,lp) for x in xs])

priors={'normal':logprior('normal'),'huber k=1':logprior('huber',1.0),'huber k=1.5':logprior('huber',1.5),
        'huber k=2':logprior('huber',2.0),'laplace':logprior('laplace')}
xs=[0.5,1,2,3,4,6,8,12,20]
print("(1) pull-back x-E[theta|x]")
print("x      "+"  ".join(f"{n:>11}" for n in priors))
for x in xs: print(f"{x:<6} "+"  ".join(f"{x-pm(x,lp):11.3f}" for lp in priors.values()))
# max shift over wide range
xx=np.linspace(-30,30,601)
for n,lp in priors.items():
    s=np.abs(xx-pmvec(xx,lp)).max(); print(f"   max |shift| over |x|<=30, {n}: {s:.3f}")

# (2) per-person risk R(theta)=E(d(X)-theta)^2 via quadrature on x
xq=np.linspace(-45,45,2251)
def risk_curve(lp,thetas):
    d=pmvec(xq,lp); out=[]
    for th in thetas:
        w=stats.norm.pdf(xq-th); w/=w.sum(); out.append((w*(d-th)**2).sum())
    return np.array(out)
ths=np.array([0,1,2,3,4,6,10,20])
print("\n(2) per-person risk R(theta) (stand-alone x has risk 1 everywhere)")
print("theta  "+"  ".join(f"{n:>11}" for n in priors))
rc={n:risk_curve(lp,ths) for n,lp in priors.items()}
for i,th in enumerate(ths): print(f"{th:<6} "+"  ".join(f"{rc[n][i]:11.3f}" for n in priors))

# (3) Bayes risk if truth is theta~N(0,1)
print("\n(3) average risk if truth theta~N(0,1)  (raw x: 1.0; normal prior optimal: 0.5)")
tg=np.linspace(-8,8,321); wt=stats.norm.pdf(tg); wt/=wt.sum()
for n,lp in priors.items():
    print(f"   {n}: {(wt*risk_curve(lp,tg)).sum():.4f}")
# also if truth is a contaminated normal 95% N(0,1) + 5% N(0,5^2)
wt2=0.95*stats.norm.pdf(tg)+0.05*stats.norm.pdf(tg,0,5); 
tg2=np.linspace(-25,25,501); wt2=0.95*stats.norm.pdf(tg2)+0.05*stats.norm.pdf(tg2,0,5); wt2/=wt2.sum()
print("    ... if truth is 95% N(0,1)+5% N(0,5^2):")
for n,lp in priors.items():
    print(f"   {n}: {(wt2*risk_curve(lp,tg2)).sum():.4f}")

# (4) group gap: groups A (M=0) and B (M=-1), same record x
print("\n(4) group gap E_A[theta|x]-E_B[theta|x], group means 0 vs -1")
for kind,k in [('normal',None),('huber',1.0),('huber',1.5),('laplace',None)]:
    la=logprior(kind,k,0.0); lb=logprior(kind,k,-1.0)
    print(f"   {kind} {k or ''}: "+"  ".join(f"x={x}:{pm(x,la)-pm(x,lb):.3f}" for x in [-2,0,1,2,3,4,6,10]))
# threshold hurdle: record B needs to reach posterior >= T, minus record A needs
from scipy.optimize import brentq
print("   extra record needed by B-member to reach posterior mean T:")
for kind,k in [('normal',None),('huber',1.0),('huber',1.5),('laplace',None)]:
    la=logprior(kind,k,0.0); lb=logprior(kind,k,-1.0); row=[]
    for T in [0.5,1,2,3,5]:
        xa=brentq(lambda x: pm(x,la)-T,-20,40); xb=brentq(lambda x: pm(x,lb)-T,-20,40); row.append(f"T={T}:{xb-xa:.3f}")
    print(f"   {kind} {k or ''}: "+"  ".join(row))
