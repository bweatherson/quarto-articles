import numpy as np
from math import log
grid = np.linspace(-80, 80, 400001)
def pm(x, lp):
    l = lp(grid) - 0.5*(x-grid)**2; l -= l.max(); w = np.exp(l); return (w*grid).sum()/w.sum()
q=0.6744897501960817; b=q/log(2); g=q
pri = {
 'normal': lambda m: (lambda t: -0.5*(t-m)**2),
 'DE':     lambda m: (lambda t: -np.abs(t-m)/b),
 'cauchy': lambda m: (lambda t: -np.log1p(((t-m)/g)**2)),
}
print("gap E[theta|x, group mean 0] - E[theta|x, group mean -1], noise sd 1, prior scale matched to N(.,1)")
for x in [0,1,2,4,8,16]:
    print(x, *["%s=%.3f"%(k, pm(x,f(0))-pm(x,f(-1))) for k,f in pri.items()])
