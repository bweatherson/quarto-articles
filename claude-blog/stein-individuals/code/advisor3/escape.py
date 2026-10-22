"""Does some coherent model escape the trilemma? Same setup as scope.py (batch 50; typical N(-1,1); k exceptional at 3; noise 1).
Models:
 MIX   : (1-e)N(M,1)+e Cauchy(M,2), e learned by ML-II (as scope.py)
 FLOOR : same, but e >= 0.05 (moral floor)
 FB    : same, but e integrated over Beta(1,1) prior (full Bayes on e; M by ML on grid jointly -> posterior over (M,e))
 HUBTAU: Huber prior k=1 in prior-sd units, scale tau learned by ML-II (shape fixed, scale learned)
Report: centre M, overall predictive mean of theta, new x=3, x=5, x=-1."""
import numpy as np
rng=np.random.default_rng(5)
g=np.linspace(-60,60,6001)
phi=lambda u: np.exp(-0.5*u**2)/np.sqrt(2*np.pi)
def rho(u,k): a=np.abs(u); return np.where(a<=k,0.5*u**2,k*a-0.5*k**2)
ug=np.linspace(-30,30,1201)
def tables(prior):
    W=prior[None,:]*phi(ug[:,None]-g[None,:]); m=W.sum(1); e=(W*g).sum(1)/m
    return (lambda u: np.interp(u,ug,np.log(m+1e-300))), (lambda u: np.interp(u,ug,e))
def norm(p): return p/p.sum()
nrm=norm(phi(g)); cau=norm(1/(1+(g/2)**2))
LM_n,E_n=tables(nrm); LM_c,E_c=tables(cau)
meanC=0.0  # cauchy centred at M: mean undefined; use median M for predictive 'centre'
Ms=np.linspace(-3,3,241); eps_grid=np.r_[0.001,0.003,np.linspace(0.01,0.6,60)]
def mix_ll(X):
    LN=np.exp(LM_n(X[None,:]-Ms[:,None])); LC=np.exp(LM_c(X[None,:]-Ms[:,None]))
    return np.array([np.log((1-e)*LN+e*LC).sum(1) for e in eps_grid])  # [eps, M]
def assess(x,M,e):
    u=np.atleast_1d(x-M); a=(1-e)*np.exp(LM_n(u)); b=e*np.exp(LM_c(u)); w=a/(a+b)
    return (M+w*E_n(u)+(1-w)*E_c(u))[0]
# Huber with learned scale
taus=np.linspace(0.5,3,26)
HT={}
for t in taus:
    p=norm(np.exp(-rho(g/t,1.0))); HT[t]=tables(p)
def fit_hubtau(X):
    best=(-np.inf,None,None)
    for t in taus:
        LM=HT[t][0]; ll=np.array([LM(X-M).sum() for M in Ms]); i=ll.argmax()
        if ll[i]>best[0]: best=(ll[i],Ms[i],t)
    return best[1],best[2]
xs=[3,5,-1]
print("k | MIX: M e x3 x5 x-1 | FLOOR(.05): M e x3 x5 x-1 | FB(Beta(1,1) on e, flat M): E[e] x3 x5 x-1 | HUB-learned-tau: M tau x3 x5 x-1")
for k in [0,1,3,10]:
    R=[]
    for rep in range(40):
        theta=np.r_[rng.normal(-1,1,50-k),np.full(k,3.0)]; X=theta+rng.standard_normal(50)
        L=mix_ll(X)
        i,j=np.unravel_index(L.argmax(),L.shape); M1,e1=Ms[j],eps_grid[i]
        Lf=L.copy(); Lf[eps_grid<0.05]=-np.inf; i2,j2=np.unravel_index(Lf.argmax(),Lf.shape); M2,e2=Ms[j2],eps_grid[i2]
        # full Bayes: uniform prior on e approximated on grid with weights = spacing; flat on M
        de=np.gradient(eps_grid); P=np.exp(L-L.max())*de[:,None]; P/=P.sum()
        Ee=(P.sum(1)*eps_grid).sum()
        fb=[ (P*np.array([[assess(x,M,e) for M in Ms[::8]] for e in eps_grid])[:, :].repeat(8,axis=1)[:, :len(Ms)]).sum() for x in xs]
        Mh,th=fit_hubtau(X)
        hub=[Mh+HT[th][1](np.array([x-Mh]))[0] for x in xs]
        R.append([M1,e1]+[assess(x,M1,e1) for x in xs]+[M2,e2]+[assess(x,M2,e2) for x in xs]+[Ee]+fb+[Mh,th]+hub)
    r=np.mean(R,0)
    print(f"{k:2d} | {r[0]:.2f} {r[1]:.3f} {r[2]:.2f} {r[3]:.2f} {r[4]:.2f} | {r[5]:.2f} {r[6]:.3f} {r[7]:.2f} {r[8]:.2f} {r[9]:.2f} | {r[10]:.3f} {r[11]:.2f} {r[12]:.2f} {r[13]:.2f} | {r[14]:.2f} {r[15]:.2f} {r[16]:.2f} {r[17]:.2f} {r[18]:.2f}")
