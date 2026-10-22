import numpy as np
rng=np.random.default_rng(1)
def js_grand(X):
    p=X.shape[-1]; m=X.mean(-1,keepdims=True); d=X-m; S=(d**2).sum(-1,keepdims=True)
    c=np.maximum(0.0,1-(p-3)/S); return m+c*d
def lt(X,D):
    J=js_grand(X); return X+np.clip(J-X,-D,D)
def risk(theta,est,N=40000):
    X=theta+rng.standard_normal((N,len(theta))); return ((est(X)-theta)**2).mean(0)
p=10
# worst-case individual risk: single outlier at distance a from 9 others at 0, scan a
avals=np.linspace(0,8,33)
for D in [None,2.0,1.5,1.0,0.75,0.5,0.25]:
    f=(lambda X: js_grand(X)) if D is None else (lambda X,D=D: lt(X,D))
    worst=max(risk(np.r_[np.zeros(p-1),a],f)[-1] for a in avals)
    tot0=risk(np.zeros(p),f).sum()            # all equal: max gain case
    totS=np.mean([risk(rng.normal(0,1,p),f).sum() for _ in range(5)])  # true sd 1 (= noise sd)
    print(f"cap D={'none' if D is None else D:>5}: worst individual risk {worst:.2f} | total risk all-equal {tot0:.2f} (MLE 10) | total, true sd=noise sd {totS:.2f}")
