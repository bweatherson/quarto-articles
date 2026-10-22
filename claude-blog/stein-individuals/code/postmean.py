import numpy as np
from math import sqrt, log
# x | theta ~ N(theta, 1); priors centred at 0 with matched quartiles to N(0, tau^2)
tau = 1.0
q = 0.6744897501960817  # Phi^{-1}(0.75)
grid = np.linspace(-80, 80, 400001)
dg = grid[1]-grid[0]
def post_mean(x, logprior):
    lp = logprior(grid) - 0.5*(x-grid)**2
    lp -= lp.max()
    w = np.exp(lp)
    return (w*grid).sum()/w.sum()
normal = lambda t: -0.5*t**2/tau**2
b = tau*q/log(2)          # DE scale matching quartiles: median|theta| = b ln 2
de = lambda t: -np.abs(t)/b
g = tau*q                 # Cauchy scale matching quartiles
cauchy = lambda t: -np.log1p((t/g)**2)
nu=4
from scipy.stats import t as tdist
s = tau*q/tdist.ppf(0.75, nu)
st4 = lambda t: -(nu+1)/2*np.log1p((t/s)**2/nu)
print("DE scale b=%.4f -> asymptotic shrinkage 1/b=%.4f; t4 scale=%.4f; cauchy scale=%.4f"%(b,1/b,s,g))
print("x | shrinkage x-E[theta|x]: normal  DE  t4  cauchy")
for x in [0.5,1,2,3,4,6,8,12,20,40]:
    print(x, *["%.4f"%(x-post_mean(x,f)) for f in (normal,de,st4,cauchy)])
