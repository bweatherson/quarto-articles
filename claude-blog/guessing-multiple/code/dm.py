# Dorst & Mandelkern Jamesian guess: choose union p of cells maximizing P(p)*J**(frac of cells ruled out)
import numpy as np, itertools
def dm_guess(probs, J):
    n=len(probs); idx=np.argsort(-np.array(probs)); best=None; bv=-1
    # filtered guesses are top-k unions (ties: include all tied to respect Fit)
    for k in range(1,n+1):
        # skip k that crosscuts a tie
        if k<n and abs(probs[idx[k-1]]-probs[idx[k]])<1e-12: continue
        v=sum(probs[i] for i in idx[:k])*J**((n-k)/n)
        if v>bv+1e-12: bv=v; best=sorted(idx[:k].tolist())
    return best
# lottery sequence under 'join' policy: after k tickets asked, cells = {1 wins..k wins, rest}
for J in [2, np.e, 5]:
    N=1000; switch=None
    for k in range(1,N):
        probs=[1/N]*k+[(N-k)/N]
        g=dm_guess(probs,J)
        if g!=[k]: switch=k; break
    print("J=%.2f: join-policy stops guessing 'none of the asked tickets wins' at k=%s"%(J,switch))
# Favorite (3,1,1,1): guess on 'who is second' marginal
print("who second (3,1,1,1):",[dm_guess([.3,.7/3,.7/3,.7/3],J) for J in [1.5,2,np.e,5]])
