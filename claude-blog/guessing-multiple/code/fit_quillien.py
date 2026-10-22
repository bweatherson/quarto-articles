import json, itertools, math, collections, sys
import numpy as np
from scipy.optimize import minimize
D=json.load(open('../data/quillien/study2.json'))
colors=['blue','red','green','yellow']
trials=[]
for p in D:
    for r in p['Data']['responses']:
        cnt=np.array([r['n'+c] for c in colors],float); P=cnt/cnt.sum()
        g=tuple(int(r[c]) for c in colors)
        if sum(g)==0: continue
        trials.append((P,g))
subsets=[s for s in itertools.product([0,1],repeat=4) if sum(s)>0]
S=np.array(subsets,float)
def softmax_ll(V,beta):
    # V: (ntrials, nsubsets)
    z=beta*V; z=z-z.max(1,keepdims=True); lp=z-np.log(np.exp(z).sum(1,keepdims=True)); return lp
Ps=np.array([t[0] for t in trials]); idx=np.array([subsets.index(t[1]) for t in trials])
n=4; k=S.sum(1)
PG=Ps@S.T  # P(g)
def V_search(): return -((n+k+1)-n*PG)/2
def V_budget1(): return PG/k
def V_dm(J): return np.log(np.maximum(PG,1e-12))+((n-k)/n)*np.log(J)   # log value; softmax on log value
def V_comp(gamma,alpha):
    Pa=Ps**alpha; Pa=Pa/Pa.sum(1,keepdims=True)
    out=np.zeros_like(PG)
    for j,s in enumerate(S):
        Q=np.where(s==1,gamma,1.0); Q=Q/Q.sum()
        kl=(Pa*np.log(np.maximum(Pa,1e-12)/Q)).sum(1)
        out[:,j]=1/(1+kl)
    return out
def nll(lp): return -lp[np.arange(len(idx)),idx].sum()
res={}
# search, softmax
f=lambda th: nll(softmax_ll(V_search(),math.exp(th[0])))
r=minimize(f,[1.0]); res['search (1 par: beta)']=(r.fun,1,math.exp(r.x[0]))
# mixture of budget-1 and unbounded search
def f2(th):
    b1,b2,w=math.exp(th[0]),math.exp(th[1]),1/(1+math.exp(-th[2]))
    l1=np.exp(softmax_ll(V_search(),b1)); l2=np.exp(softmax_ll(V_budget1(),b2))
    L=(1-w)*l1+w*l2; return -np.log(L[np.arange(len(idx)),idx]).sum()
r=minimize(f2,[1,1,0],method='Nelder-Mead',options={'maxiter':4000}); res['search+budget1 mixture (3 par)']=(r.fun,3,[math.exp(r.x[0]),math.exp(r.x[1]),1/(1+math.exp(-r.x[2]))])
# D&M with log value softmax (beta, J)
f3=lambda th: nll(softmax_ll(V_dm(1+math.exp(th[1])),math.exp(th[0])))
r=minimize(f3,[1,1],method='Nelder-Mead'); res['D&M (2 par: beta,J)']=(r.fun,2,[math.exp(r.x[0]),1+math.exp(r.x[1])])
# D&M linear value softmax
f3b=lambda th: nll(softmax_ll(np.exp(V_dm(1+math.exp(th[1]))),math.exp(th[0])))
r=minimize(f3b,[1,1],method='Nelder-Mead'); res['D&M linear (2 par)']=(r.fun,2,[math.exp(r.x[0]),1+math.exp(r.x[1])])
# compression (beta,gamma,alpha)
f4=lambda th: nll(softmax_ll(V_comp(1+math.exp(th[1]),math.exp(th[2])),math.exp(th[0])))
r=minimize(f4,[3,0,0],method='Nelder-Mead',options={'maxiter':3000}); res['compression (3 par)']=(r.fun,3,[math.exp(r.x[0]),1+math.exp(r.x[1]),math.exp(r.x[2])])
N=len(idx)
print("N trials",N, " uniform-chance NLL",N*math.log(15))
for k_,(v,npar,th) in res.items():
    print("%-35s NLL=%.1f  AIC=%.1f  BIC=%.1f  params=%s"%(k_,v,2*v+2*npar,2*v+npar*math.log(N),np.round(th,3)))
