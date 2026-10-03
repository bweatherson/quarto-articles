"""
Potential-function search for lexical countermodels to Arrhenius-style impossibility
theorems (Thomas's formulations).

We look for an additive potential Phi(P) = sum_l w_l * c_l(P) (c_l = number of lives at
level l) and the axiology  P >= Q  iff  (min(0,Phi(P)), T(P)) >=_lex (min(0,Phi(Q)), T(Q)).

Sufficient conditions for this axiology to satisfy a transfer condition "L ≼ R":
  (a) Phi(R) - Phi(L) >= 0  (then J is monotone and T decides ties; T respects every
      transfer condition of Arrhenius's for suitable witnesses), or
  (b) the transfer is only licensed in backgrounds where both populations have Phi >= 0
      (so both J = 0); this is available for a condition whose background is restricted
      to levels >= 0, provided w_l >= 0 for all l >= 0.
To refuse a conclusion of the form "for all N: L_N ≺ R" we need Phi(L_N) < min(0, Phi(R))
for all N, which (since N·3 occurs in L_N) forces w_3 <= 0 and so, with monotonicity
(from ED) and w >= 0 on non-negative levels, w_0 = w_1 = w_2 = w_3 = 0.

Witness sizes (G, n, D) are fixed to small values; existence over witnesses is a
disjunction, so feasibility is sufficient for a countermodel and infeasibility for all
small witnesses is evidence (not proof) that none of this shape exists.
"""
import itertools, numpy as np
from scipy.optimize import linprog

A = 4
LEVELS = list(range(-4, A + 3))   # -4..6
idx = {l: i for i, l in enumerate(LEVELS)}
nv = len(LEVELS)

def vec(*pairs):
    v = np.zeros(nv)
    for n, l in pairs: v[idx[l]] += n
    return v

class LP:
    def __init__(self): self.A_ub = []; self.b_ub = []; self.A_eq = []; self.b_eq = []
    def ge0(self, v):            # v·w >= 0  ->  -v·w <= 0
        self.A_ub.append(-v); self.b_ub.append(0.0)
    def ge(self, v, c):          # v·w >= c
        self.A_ub.append(-v); self.b_ub.append(-c)
    def eq0(self, v): self.A_eq.append(v); self.b_eq.append(0.0)
    def solve(self):
        c = np.zeros(nv)
        res = linprog(c, A_ub=np.array(self.A_ub) if self.A_ub else None, b_ub=self.b_ub or None,
                      A_eq=np.array(self.A_eq) if self.A_eq else None, b_eq=self.b_eq or None,
                      bounds=[(-10, 10)] * nv, method='highs')
        return res

def base_constraints(lp):
    # ED: monotone weights (n·x ≺ n·y for x<y needs Phi(n·y) >= Phi(n·x))
    for x, y in zip(LEVELS, LEVELS[1:]): lp.ge0(vec((1, y)) - vec((1, x)))
    # cap condition: w_l >= 0 for l >= 0 (so negative-free populations have Phi >= 0)
    for l in LEVELS:
        if l >= 0: lp.ge0(vec((1, l)))

def refuse_misery_conclusion(lp):
    """refuse VRC/VRA-type conclusions: need w_3 <= 0 (hence = 0) and some w_z < 0, z<0.
    We normalise by requiring w_{-1} <= -1 (scale is free)."""
    lp.ge0(-vec((1, 3)))
    lp.ge(-vec((1, -1)), 1.0)

def GNEP(lp, G):
    for z in LEVELS:
        if z - 1 not in idx: continue
        for x in LEVELS:
            if x < A: continue
            for y in (1, 2, 3):
                lp.ge0(vec((1, z - 1), (G, x)) - vec((1, z), (G, y)))

def NE(lp, n, restricted=True):
    n = int(n)
    for x in LEVELS:
        for y in LEVELS:
            if not (y < x - 1) or (x - 1) not in idx: continue
            if restricted and x == A and y >= 0:
                continue      # licensed only in negative-free backgrounds: handled by the cap
            lp.ge0(vec((n + 1, x - 1)) - vec((1, x), (n, y)))

def WNS(lp, D, Z=-4):
    for x in LEVELS:
        if x <= 0: continue
        for m in (1, 2, 3): lp.ge0(vec((m, x)) - vec((D, Z)))

def Q(lp, q):
    for w in LEVELS:
        if w <= 1 or (w - 1) not in idx: continue
        for m in (1, 2): lp.ge0(vec((q, w - 1)) - vec((m, w)))

def DA(lp):
    for x in LEVELS:
        for y in LEVELS:
            if not x > y: continue
            for z in LEVELS:
                if z <= 0: continue
                for m, n in ((1, 1), (2, 1), (1, 2)): lp.ge0(vec((m, x), (n, z)) - vec((m, y)))

def IA(lp, C):
    for x, y, z in itertools.combinations(sorted(LEVELS, reverse=True), 3):
        for m in (1, 2): lp.ge0(vec((m, y), (C, y)) - vec((m, x), (C, z)))

def NS(lp):
    for x in LEVELS:
        if x <= 0: continue
        for z in LEVELS:
            if z >= 0: continue
            for m, n in ((1, 1), (1, 3), (3, 1)): lp.ge0(vec((m, x)) - vec((n, z)))

def NEP(lp, B):
    lp.ge0(vec((1, -1), (B, A)) - vec((1 + B, 3)))

def refuse_RC_or_RA(lp):
    """refuse RC / RA: for all N, N·3 (+P) must not beat n·A (+P).  Since T(N·3) grows without
    bound, the lexical layer must do it: J(N·3 + P) < J(n·A + P) for all large N, which needs
    Phi(N·3) -> -infinity, i.e. w_3 < 0.  But the cap condition requires w_3 >= 0.  So the
    refusal is incompatible with the shape of the axiology, independently of the transfer
    conditions; the LP reports this as infeasibility.  (Normalise w_3 <= -1.)"""
    lp.ge(-vec((1, 3)), 1.0)

def run(name, conds, refuse):
    for wit in (1, 2, 3):
        lp = LP(); base_constraints(lp); refuse(lp)
        for c in conds:
            try: c(lp, wit)
            except TypeError: c(lp)
        res = lp.solve()
        if res.status == 0:
            w = {l: round(float(res.x[idx[l]]), 3) for l in LEVELS}
            print(f"{name:40s} witness={wit}: FEASIBLE  w = {w}")
            return
    print(f"{name:40s} infeasible for witness sizes 1..3")

if __name__ == '__main__':
    run('T6: ED,GNEP,NE,WNS  (refuse VRA)', [GNEP, NE, WNS], refuse_misery_conclusion)
    run('T5: ED,DA,GNE,GNEP  (refuse VRC)', [DA, lambda lp, n: NE(lp, n, restricted=False), GNEP], refuse_misery_conclusion)
    run('T4: ED,GNEP,NE,WNS  (refuse RA)', [GNEP, NE, WNS], refuse_RC_or_RA)
    run('T3: ED,IA,NS,NEP  (refuse RA)', [IA, NS, NEP], refuse_RC_or_RA)
    run('T2: ED,DA,IA  (refuse RC)', [DA, IA], refuse_RC_or_RA)
    run('T1: ED,Q  (refuse RC)', [Q], refuse_RC_or_RA)
