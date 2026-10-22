"""Standing v2: HEREDITARY standing (every subset's conjunction is a filtered answer at its own join), fall-back to
maximum-cardinality hereditarily standing subsets (ties -> speaker's choice), and full meet for comparison.
Uses published Latif numbers (D&M/Teague: Y .38 H .30 S .20 N .12)."""
import itertools, sys
sys.path.insert(0, '.')
from standing import join, P, filtered, live, best_filtered, polar
from fractions import Fraction as F

def hstands(S, W, cr):
    return all(live([S[i] for i in c], W, cr) for r in range(1, len(S)+1) for c in itertools.combinations(range(len(S)), r))

def analyse(name, W, cr, S, Qf, lab):
    idx = range(len(S))
    hs = [c for r in range(len(S)+1) for c in itertools.combinations(idx, r) if hstands([S[i] for i in c], W, cr)]
    maxi = [c for c in hs if not any(set(c) < set(d) for d in hs)]
    m = max(len(c) for c in maxi); card = [c for c in maxi if len(c) == m]
    meet = set(idx)
    for c in maxi: meet &= set(c)
    def ans(c):
        g = frozenset(W)
        for i in c: g &= S[i][0]
        return lab(best_filtered(Qf, cr, g))
    print(f"--- {name}: whole set h-stands? {hstands(S,W,cr)}; maximal h-standing: {maxi}")
    print(f"    full meet {sorted(meet)} -> {ans(sorted(meet))} | max-card options -> {sorted(set(ans(c) for c in card))}")

lab = lambda s: '/'.join(sorted(s))
W = ['Y','H','S','N']; cr = dict(Y=F(38,100),H=F(30,100),S=F(20,100),N=F(12,100))
where = [frozenset([w]) for w in W]
analyse("Latif(.38/.30/.20/.12) no to Yale -> So where?", W, cr, [(frozenset(W)-{'Y'}, polar('Y',W))], where, lab)
analyse("Latif all four no -> So where?", W, cr, [(frozenset(W)-{x}, polar(x,W)) for x in W], where, lab)
analyse("Latif where=Yale -> So will he go to Yale?", W, cr, [(frozenset(['Y']), where)], polar('Y',W), lambda s: 'yes' if s==frozenset(['Y']) else 'no')

# canon agent's counterexample
W6=['Cat','Dog','Eel','Fox','Gnu','Hen']
c6=dict(Cat=F(22,100),Dog=F(8,100),Eel=F(7,100),Fox=F(26,100),Gnu=F(13,100),Hen=F(24,100))
def pq(sub, yes):
    Q=polar_set(frozenset(sub)); g=Q[0] if yes else Q[1]; assert filtered(g,Q,c6); return (g,Q)
polar_set = lambda s: [s, frozenset(W6)-s]
S6=[pq(['Hen','Gnu','Dog'],False), pq(['Hen'],False), pq(['Eel','Hen','Dog','Cat'],True), pq(['Eel','Fox'],False)]
analyse("Canon counterexample g0..g3 -> which animal?", W6, c6, S6, [frozenset([w]) for w in W6], lab)

# raffle (structure-based check, small version with 25 small tickets at .024 and A .40 keeps the same shape)
WR=['A']+[f'#{i}' for i in range(1,61)]
crR={'A':F(40,100)}; crR.update({f'#{i}':F(1,100) for i in range(1,61)})
noA=(frozenset(WR)-{'A'}, polar('A',WR))
nos=lambda ks: [(frozenset(WR)-{f'#{i}'}, polar(f'#{i}',WR)) for i in ks]
# hereditary standing of {notA}+nos(1..k): worst subset is the full set (smallest conjunction vs A); subsets of nos alone always stand
for k in (20,21,59):
    full = [noA]+nos(range(1,k+1))
    print(f"raffle k={k}: full set stands {live(full,WR,crR)}; nos-only stands {live(nos(range(1,k+1)),WR,crR)}; notA+20 nos stands {live([noA]+nos(range(1,21)),WR,crR)}")
