import json, itertools, math, collections, sys
import numpy as np
from scipy.optimize import minimize
D=json.load(open(sys.argv[1]))
colors=['blue','red','green','yellow']
def passes(p):
    a=p['Data']['attnCheck'][0]
    ok1 = all(a[c]==1 for c in [a['requestOne'],a['requestTwo']])
    ok2=True
    for r in p['Data']['responses']:
        cnt=[r['n'+c] for c in colors]
        if 0 in cnt:
            if any(r[c]==1 and r['n'+c]==0 for c in colors): ok2=False
    return ok1 and ok2
keep=[p for p in D if passes(p)]
print("participants kept",len(keep),"of",len(D))
trials=[]
for p in keep:
    for r in p['Data']['responses']:
        cnt=np.array([r['n'+c] for c in colors],float)
        if 0 in cnt: continue   # drop attention-check urn
        P=cnt/cnt.sum(); g=tuple(int(r[c]) for c in colors)
        if sum(g)==0: continue
        trials.append((P,g))
subsets=[s for s in itertools.product([0,1],repeat=4) if sum(s)>0]
S=np.array(subsets,float); n=4; k=S.sum(1)
Ps=np.array([t[0] for t in trials]); idx=np.array([subsets.index(t[1]) for t in trials]); N=len(idx)
print("trials",N)
def lsm(V,b):
    z=b*V; z=z-z.max(1,keepdims=True); return z-np.log(np.exp(z).sum(1,keepdims=True))
def nll(lp): return -lp[np.arange(N),idx].sum()
def sharp(a):
    Pa=Ps**a; return Pa/Pa.sum(1,keepdims=True)
def comp(g,a):
    Pa=sharp(a); out=np.zeros((N,len(S)))
    for j,s in enumerate(S):
        Q=np.where(s==1,g,1.0); Q=Q/Q.sum(); out[:,j]=1/(1+(Pa*np.log(np.maximum(Pa,1e-12)/Q)).sum(1))
    return out
res={}
PG=Ps@S.T
r=minimize(lambda t: nll(lsm(-((n+k+1)-n*PG)/2,math.exp(min(t[0],50)))),[1.]); res['search 1/n (1)']=(r.fun,1)
r=minimize(lambda t: nll(lsm(-((n+k+1)-n*(sharp(math.exp(min(t[1],50)))@S.T))/2,math.exp(min(t[0],50)))),[2,0],method='Nelder-Mead'); res['search+alpha (2)']=(r.fun,2)
r=minimize(lambda t: nll(lsm((sharp(math.exp(min(t[2],50)))@S.T)*(1+math.exp(min(t[1],50)))**((n-k)/n),math.exp(min(t[0],50)))),[2,1,0],method='Nelder-Mead',options={'maxiter':4000}); res['tradeoff J+alpha (3)']=(r.fun,3)
r=minimize(lambda t: nll(lsm(comp(1+math.exp(min(t[1],50)),math.exp(min(t[2],50))),math.exp(min(t[0],50)))),[3.8,0,0],method='Nelder-Mead',options={'maxiter':3000}); res['compression (3)']=(r.fun,3,np.exp(r.x))
def mix(l1,l2,w):
    L=(1-w)*np.exp(l1)+w*np.exp(l2); return -np.log(L[np.arange(N),idx]).sum()
r=minimize(lambda t: mix(lsm(-((n+k+1)-n*PG)/2,math.exp(min(t[0],50))),lsm(PG/k,math.exp(min(t[1],50))),1/(1+math.exp(max(min(-t[2],50),-50)))),[1,1,0],method='Nelder-Mead',options={'maxiter':4000}); res['search+top1 mix (3)']=(r.fun,3)
r=minimize(lambda t: mix(lsm(PG*(1+math.exp(min(t[1],50)))**((n-k)/n),math.exp(min(t[0],50))),lsm(PG/k,math.exp(min(t[2],50))),1/(1+math.exp(max(min(-t[3],50),-50)))),[1.5,1.5,2,0],method='Nelder-Mead',options={'maxiter':6000}); res['tradeoff+top1 mix (4)']=(r.fun,4)
r=minimize(lambda t: mix(lsm(comp(1+math.exp(min(t[1],50)),math.exp(min(t[2],50))),math.exp(min(t[0],50))),lsm(PG/k,math.exp(min(t[3],50))),1/(1+math.exp(max(min(-t[4],50),-50)))),[3.8,0,0,2,0],method='Nelder-Mead',options={'maxiter':6000}); res['compression+top1 mix (5)']=(r.fun,5)
for kk,v in res.items(): print("%-26s NLL=%.1f AIC=%.1f BIC=%.1f %s"%(kk,v[0],2*v[0]+2*v[1],2*v[0]+v[1]*math.log(N),v[2:] if len(v)>2 else ''))
obs=collections.defaultdict(collections.Counter)
for (P,g) in trials:
    comb=tuple(sorted((P*12).round().astype(int),reverse=True))
    named=tuple(sorted([int(round(P[i]*12)) for i in range(4) if g[i]],reverse=True)); obs[comb][named]+=1
for comb in sorted(obs,key=lambda c:(-c[0],c)):
    tot=sum(obs[comb].values()); print(comb, ", ".join("%s:%.2f"%(list(k_),v/tot) for k_,v in obs[comb].most_common(4)))
