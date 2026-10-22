import itertools
from fractions import Fraction as F
def pl(w):
    n=len(w); out={}
    for perm in itertools.permutations(range(n)):
        p=F(1); rem=list(range(n))
        for h in perm:
            p*=F(w[h])/sum(F(w[r]) for r in rem); rem.remove(h)
        out[perm]=p
    return out
for w in [(4,2,2,2),(3,1,1,1),(5,2,2,1)]:
    pr=pl(w); n=len(w)
    print("weights",w)
    for pos in range(n):
        m=[sum(p for perm,p in pr.items() if perm[pos]==h) for h in range(n)]
        print("  pos",pos+1,[float(x) for x in m])
    best=max(pr,key=pr.get); print("  modal order",best,float(pr[best]))
