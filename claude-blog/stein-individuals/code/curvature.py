"""Escape vs bounded pull come apart. Priors log pi = -|t-M|^a / a (generalised normal), x|t ~ N(t,1).
a=2 normal; 1<a<2 between normal and exponential; a=1 Laplace; a=4 thinner than normal.
Report pull x-E[t|x], group gap E_A-E_B (M_A=0, M_B=-1), posterior var, at large x.
Second-order Tweedie: dE/dx = Var[t|x]/s^2, so gap ~ (M_A-M_B)(1 - Var/s^2) asymptotically."""
import numpy as np
grid=np.linspace(-80,120,400001)
def post(x,a,M):
    l=-np.abs(grid-M)**a/a-0.5*(x-grid)**2; l-=l.max(); w=np.exp(l); w/=w.sum()
    m=(w*grid).sum(); v=(w*(grid-m)**2).sum(); return m,v
for a in [4,2,1.5,1.2,1.0]:
    print(f"a={a}")
    for x in [2,5,10,20,40,80]:
        mA,vA=post(x,a,0.0); mB,vB=post(x,a,-1.0)
        print(f"   x={x:3d} pull={x-mA:7.3f} gap={mA-mB:6.3f} postvar={vA:5.3f} 1-var={1-vA:6.3f}")
