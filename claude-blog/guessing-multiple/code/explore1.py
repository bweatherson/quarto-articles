import numpy as np, itertools
rng=np.random.default_rng(0)
def greedy(P, order):
    # P: 2D joint over (Q1 answers, Q2 answers); order: (0,1) or (1,0)
    if order==(0,1):
        a=np.argmax(P.sum(1)); b=np.argmax(P[a]); return (a,b)
    else:
        b=np.argmax(P.sum(0)); a=np.argmax(P[:,b]); return (a,b)
N=100000; diff=0; subopt=0; flip_against_marg=0
for _ in range(N):
    P=rng.dirichlet(np.ones(9)*0.5).reshape(3,3)
    g12=greedy(P,(0,1)); g21=greedy(P,(1,0))
    joint=np.unravel_index(np.argmax(P),P.shape)
    if g12!=g21: diff+=1
    if g12!=joint or g21!=joint: subopt+=1
    # in order 2->1, does the answer to Q1 differ from Q1's marginal best guess?
    if g21[0]!=np.argmax(P.sum(1)): flip_against_marg+=1
print("orders disagree:",diff/N," some order misses joint mode:",subopt/N," Q1 answer flips vs marginal when asked second:",flip_against_marg/N)
