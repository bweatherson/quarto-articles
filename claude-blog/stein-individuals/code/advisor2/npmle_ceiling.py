import numpy as np
from scipy import stats
rng=np.random.default_rng(3)
p=500
th=rng.normal(0,1,p); X=th+rng.standard_normal(p)
grid=np.linspace(X.min(),X.max(),400)   # NPMLE support lies within data range (Lindsay 1983)
w=np.ones(len(grid))/len(grid)
L=stats.norm.pdf(X[:,None]-grid[None,:])
for it in range(3000):
    post=L*w; post/=post.sum(1,keepdims=True); w=post.mean(0)
def pmean(x):
    l=stats.norm.pdf(x-grid)*w; return (l*grid).sum()/l.sum()
print("max x in batch %.2f; NPMLE support max with mass>1e-4: %.2f"%(X.max(), grid[w>1e-4].max()))
for x in [2,3,4,5,6,8,10]:
    print(f"new record x={x}: NPMLE post mean {pmean(x):.2f}, pull {x-pmean(x):.2f} | normal-EB(tau^2 est) pull {x*(1/(1+max(X.var()-1,0.01))):.2f}")
