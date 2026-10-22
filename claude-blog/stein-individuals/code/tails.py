import numpy as np
from scipy import integrate, stats
# Posterior mean of theta given x ~ N(theta,1) under several priors with the same variance (tau^2=1)
grid=np.linspace(-40,40,40001)
def post_mean(x,prior_pdf):
    w=prior_pdf(grid)*stats.norm.pdf(x-grid); return (grid*w).sum()/w.sum()
tau=1.0
priors={
 'normal (sd 1)': lambda t: stats.norm.pdf(t,0,tau),
 'Laplace (sd 1)': lambda t: stats.laplace.pdf(t,0,tau/np.sqrt(2)),
 't3 (sd 1)': lambda t: stats.t.pdf(t/(tau/np.sqrt(3)),3)/(tau/np.sqrt(3)),
 'mixture 95% N(0,.8^2)+5% N(0,4^2)': lambda t: .95*stats.norm.pdf(t,0,.8)+.05*stats.norm.pdf(t,0,4),
}
print("observed x:   "+"  ".join(f"{x:>5}" for x in [1,2,3,4,6,8]))
for name,f in priors.items():
    pull=[x-post_mean(x,f) for x in [1,2,3,4,6,8]]
    print(f"{name:34s} pull back: "+"  ".join(f"{p:5.2f}" for p in pull))
# accuracy cost when truth really is normal(0,1): Bayes risk of each posterior mean rule
rng=np.random.default_rng(0); th=rng.normal(0,1,40000); X=th+rng.standard_normal(40000)
xs=np.linspace(-8,8,321)
for name,f in priors.items():
    pm=np.array([post_mean(x,f) for x in xs]); est=np.interp(X,xs,pm)
    print(f"{name:34s} MSE if truth N(0,1): {np.mean((est-th)**2):.3f}   (raw x: {np.mean((X-th)**2):.3f}, normal Bayes 0.5)")
