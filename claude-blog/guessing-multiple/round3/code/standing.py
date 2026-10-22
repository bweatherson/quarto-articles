"""Check the 'standing' rule on the data.
Worlds = cells of a base partition with credences. A question = partition of worlds (list of frozensets).
A guess = frozenset of worlds. Filtered at Q (D&M): a union of Q-cells such that if it includes a cell it
includes every strictly more probable cell. A set S of (guess, question) pairs is LIVE iff the conjunction
of its guesses is filtered at the join of its questions (and nonempty)."""
from itertools import combinations
from fractions import Fraction as F

def join(qs, worlds):
    sig = {}
    for w in worlds:
        key = tuple(next(i for i,c in enumerate(q) if w in c) for q in qs)
        sig.setdefault(key, set()).add(w)
    return [frozenset(c) for c in sig.values()]

def P(s, cr): return sum(cr[w] for w in s)

def filtered(g, Q, cr):
    if not g: return False
    cells_in = [c for c in Q if c <= g]
    if frozenset().union(*cells_in) != g: return False   # not a union of Q-cells
    m = min(P(c, cr) for c in cells_in)
    return all(c <= g for c in Q if P(c, cr) > m)

def live(S, worlds, cr):
    if not S: return True
    g = frozenset(worlds)
    for gi, _ in S: g &= gi
    return filtered(g, join([q for _, q in S], worlds), cr)

def maximal_live(S, worlds, cr):
    S = list(S); out = []
    for r in range(len(S), -1, -1):
        for sub in combinations(range(len(S)), r):
            if live([S[i] for i in sub], worlds, cr) and not any(set(sub) < set(o) for o in out):
                out.append(sub)
    return [[S[i] for i in o] for o in out]

def best_filtered(Q, cr, given=None):
    """smallest filtered answer (top cell(s), ties included) to Q given a set of worlds."""
    if given is not None:
        Q = [c & given for c in Q if c & given]
    top = max(P(c, cr) for c in Q)
    return frozenset().union(*[c for c in Q if P(c, cr) == top])

def polar(x, worlds): return [frozenset([x]), frozenset(worlds) - {x}]

def report(name, worlds, cr, S, final_Q, label):
    full = live(S, worlds, cr)
    ml = maximal_live(S, worlds, cr)
    meet = set(range(len(S)))
    idx = [[S.index(p) for p in m] for m in ml]
    for m in idx: meet &= set(m)
    card = max(idx, key=len)
    g_meet = frozenset(worlds)
    for i in meet: g_meet &= S[i][0]
    g_card = frozenset(worlds)
    for i in card: g_card &= S[i][0]
    print(f"--- {name}: full set live? {full}; #maximal live subsets {len(ml)}; full-meet size {len(meet)}; max-card size {len(card)}")
    print("    full-meet answer:", label(best_filtered(final_Q, cr, g_meet)), "| max-card answer:", label(best_filtered(final_Q, cr, g_card)))

# D1 / D5 Latif
W = ['Y','H','S','N']; cr = dict(Y=F(30,100),H=F(28,100),S=F(22,100),N=F(20,100))
where = [frozenset([w]) for w in W]
lab = lambda s: '/'.join(sorted(s))
notY = (frozenset(W)-{'Y'}, polar('Y',W))
report("D1 Latif (no to Yale) -> So where?", W, cr, [notY], where, lab)
S5 = [(frozenset(W)-{x}, polar(x,W)) for x in W]
report("D5 Latif all four no -> So where?", W, cr, S5, where, lab)

# D2 Clue
W2 = ['bk','bg','gg']; cr2 = dict(bk=F(40,100), bg=F(15,100), gg=F(45,100))
who = [frozenset(['bk','bg']), frozenset(['gg'])]; weapon = [frozenset(['bk']), frozenset(['bg','gg'])]
report("D2 Clue butler -> with what?", W2, cr2, [(frozenset(['bk','bg']), who)], weapon, lab)

# D6 Bond (Pearson's numbers)
W6 = ['Lon','Mun','Ber']; cr6 = dict(Lon=F(4,10), Mun=F(3,10), Ber=F(3,10))
city = [frozenset([w]) for w in W6]; country = [frozenset(['Lon']), frozenset(['Mun','Ber'])]
report("D6 Bond London -> which country?", W6, cr6, [(frozenset(['Lon']), city)], country, lab)

# D&M fn 6 stickiness: where? Yale -> will he go to Yale?
report("D&M fn6 where=Yale -> whether Yale?", W, cr, [(frozenset(['Y']), where)], polar('Y',W), lambda s: 'yes' if s==frozenset(['Y']) else ('no' if 'Y' not in s else lab(s)))

# Raffle: A .40, 60 tickets .01
WR = ['A'] + [f'#{i}' for i in range(1,61)]
crR = {'A': F(40,100)}; crR.update({f'#{i}': F(1,100) for i in range(1,61)})
whoR = [frozenset([w]) for w in WR]
def labR(s):
    if len(s) == 1: return next(iter(s))
    if 'A' not in s: return f'one of {len(s)} small tickets (not A)'
    return f'{len(s)}-way set incl A'
noA = (frozenset(WR)-{'A'}, polar('A',WR))
nos = lambda k: [(frozenset(WR)-{f'#{i}'}, polar(f'#{i}',WR)) for i in range(1,k+1)]
report("Raffle 1-no (A) -> So who?", WR, crR, [noA], whoR, labR)
for k in (10, 20, 21, 30, 59, 60):
    S = [noA] + nos(k)
    # maximal_live is exponential; use shortcut: test full set, set without A, and note pattern
    full = live(S, WR, crR); dropA = live(nos(k), WR, crR)
    g = frozenset(WR)
    for gi,_ in S: g &= gi
    print(f"Raffle no to A,#1..#{k}: full live? {full}; drop-notA live? {dropA}; P(conj)={float(P(g,crR)):.2f}")

# --- selection-function check: maximum-cardinality standing subsets ---
print("\n# Fang-style tournament: race1 A .45 B .35 C .20; race2 D .40 E .22 F .18 G .12 H .08")
r1 = dict(A=F(45,100), B=F(35,100), C=F(20,100)); r2 = dict(D=F(40,100), E=F(22,100), F_=F(18,100), G=F(12,100), H=F(8,100))
WT = [(a,b) for a in r1 for b in r2]; crT = {(a,b): r1[a]*r2[b] for a,b in WT}
Q1 = [frozenset(w for w in WT if w[0]==a) for a in r1]; Q2 = [frozenset(w for w in WT if w[1]==b) for b in r2]
gA = (frozenset(w for w in WT if w[0]=='A'), Q1); gDE = (frozenset(w for w in WT if w[1] in ('D','E')), Q2)
S = [gA, gDE]
print("A filtered at Q1:", filtered(gA[0], Q1, crT), "| D-or-E filtered at Q2:", filtered(gDE[0], Q2, crT))
print("{A, D-or-E} stands at QR:", live(S, WT, crT))
QR = [frozenset([w]) for w in WT]
for sub in ([gA], [gDE]):
    g = sub[0][0]
    ans = sorted(w for w in WT if w in g and crT[w] == max(crT[x] for x in g))
    # filtered answer within g at QR, smallest = top cell; Fang's 'A vs D or A vs E' is top-2 within A x {D,E}
    print("  build on", 'A' if sub[0] is gA else 'D-or-E', "-> top cell(s) at QR within:", ans)
print("  fresh at QR top cells:", sorted(sorted(WT, key=lambda w: -crT[w])[:3]), [float(crT[w]) for w in sorted(WT, key=lambda w: -crT[w])[:3]])
