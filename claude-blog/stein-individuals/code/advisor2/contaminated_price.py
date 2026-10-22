import numpy as np
from scipy import stats
grid=np.linspace(-80,80,160001)
def pm(x,lp):
    l=lp(grid)-0.5*(x-grid)**2; l-=l.max(); w=np.exp(l); return (w*grid).sum()/w.sum()
def pv(x,lp):
    l=lp(grid)-0.5*(x-grid)**2; l-=l.max(); w=np.exp(l); w/=w.sum(); m=(w*grid).sum(); return (w*(grid-m)**2).sum()
# 1. Correctly-fitted normal under contaminated truth 95% N(0,1)+5% N(0,25)
V=0.95+0.05*25
print("variance of contaminated truth",V,"linear-rule risk with fitted tau^2=V:",V/(1+V))
# Bayes-optimal under contaminated truth: posterior mean with the true mixture prior
def lp_mix(t): return np.log(0.95*stats.norm.pdf(t)+0.05*stats.norm.pdf(t,0,5)+1e-300)
xq=np.linspace(-40,40,1601)
d=np.array([pm(x,lp_mix) for x in xq])
tg=np.linspace(-25,25,501); wt=0.95*stats.norm.pdf(tg)+0.05*stats.norm.pdf(tg,0,5); wt/=wt.sum()
def risk(dvec,th):
    w=stats.norm.pdf(xq-th); w/=w.sum(); return (w*(dvec-th)**2).sum()
print("Bayes risk of true-mixture posterior mean:", sum(wt[i]*risk(d,tg[i]) for i in range(len(tg))))
# risk of fitted-normal (tau^2=V) rule
dn=xq*V/(1+V)
print("fitted normal rule Bayes risk:", sum(wt[i]*risk(dn,tg[i]) for i in range(len(tg))))
# Huber k=1 with tau=sqrt(V)? and tau=1 as in memo
def rho(u,k): a=np.abs(u); return np.where(a<=k,0.5*u**2,k*a-0.5*k**2)
for tau,k in [(1,1),(1,1.5),(np.sqrt(V),1),(np.sqrt(V),1.5)]:
    dh=np.array([pm(x,lambda t: -rho(t/tau,k)) for x in xq])
    print(f"Huber tau={tau:.2f} k={k}: contaminated-truth risk",round(sum(wt[i]*risk(dh,tg[i]) for i in range(len(tg))),4), " max pull", round(np.abs(xq-dh).max(),3))
# worst-case per-person risk of true mixture posterior mean
print("worst per-person risk, mixture-Bayes rule:", max(risk(d,th) for th in np.linspace(0,30,61)), " max pull", np.abs(xq-d).max())
# pull of mixture prior at large x
for x in [5,10,20,40]: print("mixture pull at",x, round(x-pm(x,lp_mix),3))
