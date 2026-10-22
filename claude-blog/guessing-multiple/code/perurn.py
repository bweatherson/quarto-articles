exec(open('refit.py').read().split("res={}")[0])
PG=Ps@S.T
from scipy.optimize import minimize
r1=minimize(lambda t: nll(lsm(-((n+k+1)-n*PG)/2,math.exp(min(t[0],50)))),[1.]); l1=lsm(-((n+k+1)-n*PG)/2,math.exp(r1.x[0]))
r2=minimize(lambda t: nll(lsm(comp(1+math.exp(t[1]),math.exp(t[2])),math.exp(min(t[0],50)))),[3.8,0,0],method='Nelder-Mead',options={'maxiter':3000}); l2=lsm(comp(1+math.exp(r2.x[1]),math.exp(r2.x[2])),math.exp(r2.x[0]))
d=collections.defaultdict(float); c=collections.Counter()
for i,(P,g) in enumerate(trials):
    comb=tuple(int(x) for x in sorted((P*12).round().astype(int),reverse=True))
    d[comb]+= -l1[i,idx[i]] + l2[i,idx[i]]; c[comb]+=1
for comb in sorted(d,key=lambda x:-d[x]): print(comb,c[comb],"search NLL minus compression NLL = %.1f"%d[comb])
