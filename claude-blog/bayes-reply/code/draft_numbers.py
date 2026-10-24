import sys, math, itertools
import numpy as np
sys.path.insert(0, 'code')
from checks import subsets, brier, logscore, cond, factive_situations, tea
from dominance import interior, proj_simplex_face
# Dana's prior space, M&Z all-propositions Brier, equal weighting over all 64 factive situations
n = 3; SUBS = subsets(n) if False else [frozenset(c) for r in range(0, n+1) for c in itertools.combinations(range(n), r)]
pi = [0.2, 0.6, 0.2]
Es = factive_situations(n); w = [1.0]*len(Es)
def flog(p):
    I = interior(p, n)
    return cond(pi, I) if I else cond(pi, p)
def fbr(p):
    I = interior(p, n)
    if not I: return cond(pi, p)
    return list(proj_simplex_face(np.array(cond(pi, p)), I, n))
b = lambda p: cond(pi, p)
for name, r in [("bcond", b), ("f_log", flog), ("f_Br", fbr)]:
    print(name, "avg EA (Brier, all props) per situation:", round(tea(r, Es, w, pi, n, brier, SUBS)/len(Es), 4),
          " log:", tea(r, Es, w, pi, n, logscore, SUBS)/len(Es))
# Symmetric clock (circle) n=6, uniform prior: E(s) = {s-1,s,s+1}; martingale and bcond vs prior
for n in [5, 6, 8]:
    SUBS = [frozenset(c) for r in range(0, n+1) for c in itertools.combinations(range(n), r)]
    pi = [1/n]*n
    E = tuple(frozenset({(s-1) % n, s, (s+1) % n}) for s in range(n))
    exp_post = np.zeros(n); ea_b = 0; ea_d = 0
    for s in range(n):
        c = cond(pi, E[s]); exp_post += pi[s]*np.array(c)
        ea_b += pi[s]*brier(c, s, n, SUBS); ea_d += pi[s]*brier(pi, s, n, SUBS)
    print(f"clock n={n}: E[posterior]={np.round(exp_post,4)}, EA bcond {ea_b:.3f} vs prior {ea_d:.3f}")
