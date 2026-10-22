import numpy as np
exec(open('js_sim.py').read().split("p=10")[0])
# Bias for the outlier: E[estimate | theta]
p=10; theta=np.r_[np.zeros(p-1),4.0]; N=20000
est=np.zeros(p)
for _ in range(N):
    X=theta+rng.standard_normal(p); est+=js_grand(X)
print("outlier true 4.0 -> mean JS estimate %.2f (others %.2f)"%(est[-1]/N, est[:-1].mean()/N))
# Batch dependence: same observed record x=2.0 for Ann; batch A: others clustered near 0; batch B: others spread widely
ann=2.0
A=np.r_[ann, rng.normal(0,0.3,9)]; B=np.r_[ann, rng.normal(0,3,9)]
print("Ann observed 2.0; batch of similar others -> %.2f; batch of dispersed others -> %.2f"%(js_grand(A)[0],js_grand(B)[0]))
# Unequal variances: thin vs thick records; normal-normal empirical Bayes shrinkage toward grand mean
def eb(X,v):
    # method-of-moments tau^2, then shrink each by v/(v+tau2)
    m=np.average(X,weights=1/(v+1e-9)); tau2=max(0.0,np.var(X)-v.mean())
    B=v/(v+tau2); return m+(1-B)*(X-m)
v=np.array([0.1]*5+[1.0]*5)  # five thick-record, five thin-record teachers
X=np.array([2.0,0.1,-0.3,0.2,-1.5, 2.0,0.0,0.4,-0.2,-1.5])
print("EB estimates thick:",np.round(eb(X,v)[:5],2)," thin:",np.round(eb(X,v)[5:],2))
