import json, itertools, math
import numpy as np
from scipy.optimize import minimize
exec(open('fit_quillien.py').read().split("res={}")[0])
def sharpen(alpha):
    Pa=Ps**alpha; return Pa/Pa.sum(1,keepdims=True)
def PGa(alpha): return sharpen(alpha)@S.T
def mixnll(l1,l2,w):
    L=(1-w)*np.exp(l1)+w*np.exp(l2); return -np.log(L[np.arange(len(idx)),idx]).sum()
out={}
# D&M with alpha (beta,J,alpha), Quillien-style value P'(g) * J^{Q} linear
def f(th):
    b,J,a=math.exp(th[0]),1+math.exp(th[1]),math.exp(th[2])
    V=PGa(a)*J**((n-k)/n); return nll(softmax_ll(V,b))
r=minimize(f,[1.5,1.5,0],method='Nelder-Mead',options={'maxiter':4000}); out['D&M+alpha (3)']=(r.fun,3)
# search with alpha (beta, alpha)
def f(th):
    b,a=math.exp(th[0]),math.exp(th[1]); V=-((n+k+1)-n*PGa(a))/2; return nll(softmax_ll(V,b))
r=minimize(f,[2,0],method='Nelder-Mead'); out['search+alpha (2)']=(r.fun,2,np.exp(r.x))
# mixture: deterministic-ish search (beta1) + budget-1 (beta2), weight w  -- already 3 params
# mixture of D&M + budget1 for fairness (4 params)
def f(th):
    b,J,b2,w=math.exp(th[0]),1+math.exp(th[1]),math.exp(th[2]),1/(1+math.exp(-th[3]))
    l1=softmax_ll(PG*J**((n-k)/n),b); l2=softmax_ll(PG/k,b2); return mixnll(l1,l2,w)
r=minimize(f,[1.5,1.5,2,0],method='Nelder-Mead',options={'maxiter':6000}); out['D&M+budget1 mixture (4)']=(r.fun,4)
for kk,v in out.items(): print("%-28s NLL=%.1f AIC=%.1f BIC=%.1f %s"%(kk,v[0],2*v[0]+2*v[1],2*v[0]+v[1]*math.log(len(idx)), v[2:] if len(v)>2 else ''))
# per-urn predictions of search+budget1 mixture with fitted w=.45, deterministic search (ties split evenly), budget-1 top color
import collections
w=0.45
obs=collections.defaultdict(collections.Counter); pred=collections.defaultdict(lambda: collections.defaultdict(float))
for (P,g) in trials:
    comb=tuple(sorted((P*12).round().astype(int),reverse=True))
    named=tuple(sorted([int(round(P[i]*12)) for i in range(4) if g[i]],reverse=True)); obs[comb][named]+=1
for comb in obs:
    P=np.array(comb)/12.
    Vs=np.array([-((n+s.sum()+1)-n*(P@s))/2 for s in S]); best=np.isclose(Vs,Vs.max())
    Vb=np.array([(P@s)/s.sum() for s in S]); bestb=np.isclose(Vb,Vb.max())
    for j,s in enumerate(S):
        named=tuple(sorted([comb[i] for i in range(4) if s[i]],reverse=True))
        pred[comb][named]+= (1-w)*best[j]/best.sum()+ w*bestb[j]/bestb.sum()
print()
for comb in sorted(obs,key=lambda c:(-c[0],c)):
    tot=sum(obs[comb].values())
    keys=sorted(set(list(obs[comb].keys())+[k_ for k_,v in pred[comb].items() if v>0.01]),key=lambda x:-obs[comb][x])
    print(comb, " | ".join("%s obs %.2f pred %.2f"%(list(k_),obs[comb][k_]/tot,pred[comb][k_]) for k_ in keys[:5]))
