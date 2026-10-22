import numpy as np, itertools
rng=np.random.default_rng(1)
# Plackett-Luce races: n horses, strengths w. Joint over orders.
def pl_probs(w):
    n=len(w); out={}
    for perm in itertools.permutations(range(n)):
        p=1.0; rem=list(range(n))
        for h in perm:
            p*=w[h]/sum(w[r] for r in rem); rem.remove(h)
        out[perm]=p
    return out
def marg(probs,pos,n):
    m=np.zeros(n)
    for perm,p in probs.items(): m[perm[pos]]+=p
    return m
n=4; N=3000; clash=0; clash_any=0
for _ in range(N):
    w=rng.dirichlet(np.ones(n)*1.0)
    pr=pl_probs(w)
    guesses=[np.argmax(marg(pr,k,n)) for k in range(n)]
    if len(set(guesses))<n: clash_any+=1
    if guesses[1]==guesses[2]: clash+=1
print("PL races, 4 horses: marginal guesses for positions not a permutation:",clash_any/N,"; 2nd==3rd:",clash/N)
# Non-PL: random distribution over orders of 3 horses
N=20000; c=0
for _ in range(N):
    p=rng.dirichlet(np.ones(6)*0.5); pr=dict(zip(itertools.permutations(range(3)),p))
    g=[np.argmax(marg(pr,k,3)) for k in range(3)]
    if len(set(g))<3: c+=1
print("random dists over 3-horse orders: marginal position-guesses inconsistent:",c/N)
# Monty Hall unequal priors: pick door i, host opens a goat door among others, switch -> win prob 1-p_i
p=np.array([.5,.3,.2])
for i in range(3):
    print("pick",i,"stick win",p[i],"switch win",1-p[i])
