# Checks for the idea memo: Latif reversed; murder order effect; Skipper-measure factorisation.
import numpy as np, itertools, math
def filtered_top(probs, k):  # top-k union
    idx=np.argsort(-np.array(probs)); return sorted(idx[:k].tolist())
# Latif: Yale .3 Harvard .25 Stanford .25 NYU .2
P={'Y':.3,'H':.25,'S':.25,'N':.2}
print("Q->R: where? ->", max(P,key=P.get), "; then whether-Yale? given Yale -> yes")
cond={k:v/(1-P['Y']) for k,v in P.items() if k!='Y'}
print("R->Q: whether-Yale? P(Y)=.3 -> no; then where? given not-Yale:",{k:round(v,3) for k,v in cond.items()})
# Murder: B&K .40, B&G .15, G&G .45, G&K 0
J={('B','K'):.40,('B','G'):.15,('G','G'):.45,('G','K'):0.0}
pB=J[('B','K')]+J[('B','G')]; pGun=J[('B','G')]+J[('G','G')]
print("P(butler)=",pB," P(gun)=",pGun)
print("who first: butler; then weapon | butler: knife",J[('B','K')]/pB)
print("weapon first: gun; then who | gun: gardener",J[('G','G')]/pGun)
print("joint mode:",max(J,key=J.get))
# Skipper log-specificity factorisation: S(q&r on QR)=S(q on Q)+S(r on R) for rectangles
nQ,nR,m,n=3,5,1,2
S=lambda N,k: math.log(N/k)
print("log-spec additive:", S(nQ*nR,m*n), S(nQ,m)+S(nR,n))
# D&M proportion measure: Q_{q&r} = 1-(1-a)(1-b)
a=1-m/nQ; b=1-n/nR
print("D&M prop:",1-(m*n)/(nQ*nR), a+b-a*b, " effective J exponent on b:",1-a)
