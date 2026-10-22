import numpy as np
grid=np.linspace(-80,80,160001)
def rho(u,k): a=np.abs(u); return np.where(a<=k,0.5*u**2,k*a-0.5*k**2)
def pm(x,lp,s=1.0):
    l=lp(grid)-0.5*((x-grid)/s)**2; l-=l.max(); w=np.exp(l); return (w*grid).sum()/w.sum()
# (1) groups differ in spread; Huber with k fixed in prior-sd units (k=1) vs slope fixed in noise units (L=1)
print("same mean 0; tau_A=1, tau_B=0.5; gap E_A-E_B at x")
A1=lambda t: -rho(t/1.0,1.0)          # slope 1
B1=lambda t: -rho(t/0.5,1.0)          # slope 2 (k in sd units)
B2=lambda t: -rho(t/0.5,0.5)          # slope 1 (L in noise units): k=L*tau=0.5
for x in [1,2,4,8,16]:
    print(x, "sd-units gap %.3f"%(pm(x,A1)-pm(x,B1)), " noise-units gap %.3f"%(pm(x,A1)-pm(x,B2)), " normal gap %.3f"%(x*(1/2)-x*(0.25/1.25)))
# (2) Aigner-Cain: same prior N(0,1)/Huber, noise s_A=0.7, s_B=1
print("same prior; noise s_A=.7, s_B=1; gap at x (normal vs Huber L=1)")
H=lambda t: -rho(t,1.0)
N=lambda t: -0.5*t**2
for x in [1,2,4,8,16]:
    print(x, "normal %.3f"%(pm(x,N,.7)-pm(x,N,1)), " huber %.3f"%(pm(x,H,.7)-pm(x,H,1)))
# (3) log-concave, bulk N(0,tau^2) to R, linear beyond -> cap L=R/tau^2; tight group tau=.3
for tau,R in [(0.3,0.6),(0.3,0.3),(0.3,0.09)]:
    L=R/tau**2; lp=lambda t: -rho(t/tau,R/tau)
    xs=np.linspace(0,30,301); pulls=[x-pm(x,lp) for x in xs]
    print(f"tau={tau} bulk to R={R}: tail slope L={L:.2f}, max pull {max(pulls):.2f}")
# (4) prior density bound with L=1: max density L/2 -> P(|theta-M|<=0.1) <= 0.1
