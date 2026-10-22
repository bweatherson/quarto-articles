"""Centre vs scope: what exceptional records teach under (a) normal EB, (b) Huber location model (fixed shape),
(c) mixture model with learned exception weight eps: theta ~ (1-eps) N(M,1) + eps * Cauchy(M, 2).
x = theta + N(0,1). Group of n=50: n-k typical from N(-1,1), k exceptional at theta=3.
ML-II estimates; then assess two NEW members: record x=3 (exceptional) and x=-1 (typical)."""
import numpy as np
rng=np.random.default_rng(5)
g=np.linspace(-60,60,6001)
phi=lambda u: np.exp(-0.5*u**2)/np.sqrt(2*np.pi)
def rho(u,k): a=np.abs(u); return np.where(a<=k,0.5*u**2,k*a-0.5*k**2)
ug=np.linspace(-30,30,1201)
def tables(prior):  # prior on t-M (grid g); return interpolators for log m(u) and E[t-M|u]
    W=prior[None,:]*phi(ug[:,None]-g[None,:]); m=W.sum(1); e=(W*g).sum(1)/m
    return (lambda u: np.interp(u,ug,np.log(m+1e-300))), (lambda u: np.interp(u,ug,e))
nrm=phi(g); nrm/=nrm.sum()
hub=np.exp(-rho(g,1.0)); hub/=hub.sum()
cau=1/(1+(g/2)**2); cau/=cau.sum()
LM_n,E_n=tables(nrm); LM_h,E_h=tables(hub); LM_c,E_c=tables(cau)
Ms=np.linspace(-3,3,301); eps_grid=np.r_[0.001,np.linspace(0.01,0.6,60)]
def fit_loc(X,LM):
    ll=np.array([LM(X-M).sum() for M in Ms]); return Ms[ll.argmax()]
def fit_mix(X):
    best=(-np.inf,None,None)
    LN=np.exp(LM_n(X[None,:]-Ms[:,None])); LC=np.exp(LM_c(X[None,:]-Ms[:,None]))
    for e in eps_grid:
        ll=np.log((1-e)*LN+e*LC).sum(1); i=ll.argmax()
        if ll[i]>best[0]: best=(ll[i],Ms[i],e)
    return best[1],best[2]
def assess_mix(x,M,e):
    u=np.atleast_1d(x-M); a=(1-e)*np.exp(LM_n(u)); b=e*np.exp(LM_c(u)); w=a/(a+b)
    return M+w*E_n(u)+(1-w)*E_c(u), w
print("k exceptional of 50 | normal EB: M, tau2, new x=3, new x=-1 | Huber: M, x=3, x=-1 | mixture: M, eps, x=3 (P typical), x=-1")
for k in [0,1,3,6,10]:
    R=[]
    for rep in range(40):
        theta=np.r_[rng.normal(-1,1,50-k),np.full(k,3.0)]; X=theta+rng.standard_normal(50)
        M0=X.mean(); t2=max(0.01,X.var(ddof=1)-1); c=1/(1+t2)
        nx3=3-c*(3-M0); nxm1=-1-c*(-1-M0)
        Mh=fit_loc(X,LM_h); h3=Mh+E_h(np.array([3-Mh]))[0]; hm1=Mh+E_h(np.array([-1-Mh]))[0]
        Mm,e=fit_mix(X); m3,w3=assess_mix(3,Mm,e); mm1,_=assess_mix(-1,Mm,e)
        R.append([M0,t2,nx3,nxm1,Mh,h3,hm1,Mm,e,m3[0],w3[0],mm1[0]])
    r=np.mean(R,0)
    print(f"k={k:2d} | N: M={r[0]:.2f} t2={r[1]:.2f} x3->{r[2]:.2f} x-1->{r[3]:.2f} | H: M={r[4]:.2f} x3->{r[5]:.2f} x-1->{r[6]:.2f} | Mix: M={r[7]:.2f} eps={r[8]:.3f} x3->{r[9]:.2f} (P typ {r[10]:.2f}) x-1->{r[11]:.2f}")
