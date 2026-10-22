import numpy as np
rng=np.random.default_rng(7)
def js_grand(X):
    p=X.shape[-1]; m=X.mean(-1,keepdims=True); d=X-m; S=(d**2).sum(-1,keepdims=True)
    c=np.maximum(0.0,1-(p-3)/S); return m+c*d
def lt(X,D):
    J=js_grand(X); return X+np.clip(J-X,-D,D)
def risk(theta,est,N=200000):
    X=theta+rng.standard_normal((N,len(theta))); return ((est(X)-theta)**2).mean(0)
p=10
# (1) exchangeable prior: one uniformly random person is an outlier at a, others 0.
for a in [3.16,6.0]:
    th=np.r_[np.zeros(p-1),a]
    r=risk(th,js_grand)
    print(f"outlier a={a}: outlier risk {r[-1]:.2f}, others {r[:-1].mean():.2f}; ex ante (exchangeable, random identity) per-person risk = total/p = {r.sum()/p:.3f}")
# (2) total risk of LT vs MLE across configurations (does LT dominate X in total?)
configs={"all 0":np.zeros(p),"one at 3.16":np.r_[np.zeros(p-1),3.16],"one at 10":np.r_[np.zeros(p-1),10.],
 "two clusters +-2":np.r_[-2*np.ones(5),2*np.ones(5)],"spread sd3":np.linspace(-5,5,p),"half at 0 half at 4":np.r_[np.zeros(5),4*np.ones(5)],
 "one at 1.5":np.r_[np.zeros(p-1),1.5],"one at 2":np.r_[np.zeros(p-1),2.0]}
for name,th in configs.items():
    out=[name]
    for D in [None,1.0,0.5]:
        f=js_grand if D is None else (lambda X,D=D: lt(X,D))
        r=risk(th,f,100000); out.append(f"{'JS' if D is None else 'LT'+str(D)}: tot {r.sum():.2f} max {r.max():.2f}")
    print(" | ".join(out))
