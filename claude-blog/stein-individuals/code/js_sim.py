import numpy as np
rng=np.random.default_rng(0)
def js_grand(X,s2=1.0):
    p=len(X); m=X.mean(); d=X-m; S=(d**2).sum()
    c=max(0.0,1-(p-3)*s2/S)       # positive-part, shrink toward grand mean (p>=4)
    return m+c*d
def lt(X,s2=1.0,D=1.0):
    J=js_grand(X,s2); return X+np.clip(J-X,-D*np.sqrt(s2),D*np.sqrt(s2))   # limited translation: move at most D sd
def risks(theta,est,N=20000):
    p=len(theta); err=np.zeros(p)
    for _ in range(N):
        X=theta+rng.standard_normal(p); err+=(est(X)-theta)**2
    return err/N
p=10
for name,theta in [("clustered (all 0)",np.zeros(p)),("spread (sd 2)",rng.normal(0,2,p)),("one outlier at +4",np.r_[np.zeros(p-1),4.0]),("one outlier at +6",np.r_[np.zeros(p-1),6.0])]:
    rm=np.ones(p); rj=risks(theta,js_grand); rl=risks(theta,lt)
    print(f"{name:22s} total MLE {rm.sum():.2f}  JS {rj.sum():.2f}  LT {rl.sum():.2f} | worst individual: JS {rj.max():.2f} (person {rj.argmax()})  LT {rl.max():.2f}")
