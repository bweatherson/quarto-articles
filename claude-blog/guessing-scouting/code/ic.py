import itertools, random
from fractions import Fraction as F

def prod(P,Q):
    return {(a,b):P[a]*Q[b] for a in P for b in Q}

# --- accounts: each returns the set B(P) of 'live' cells; believe p iff B subset p
def gs_mass(P,t):   # Goodman-Salow / Carter-Hawthorne Def 3: cell s in B iff mass of strictly more probable cells < t
    return {s for s in P if sum(v for v in P.values() if v>P[s])<t}
def ratio(P,r):     # Lin-Kelly / CH informal: cell in B iff P(s) >= r*max
    m=max(P.values()); return {s for s in P if P[s]>=r*m}
def stable(P):      # Leitgeb P-stable^{1/2} sets (strictly <1 prob or least prob-1 set); return list of stable sets, chain
    items=sorted(P,key=lambda s:-P[s]); out=[]
    # stable iff P(A)=1 or for all w in A P(w)>P(not A); A must be upper set
    for k in range(1,len(items)+1):
        A=set(items[:k]);
        # upper set w.r.t ties: require no outside cell with prob >= min inside? covered by condition
        pA=sum(P[s] for s in A)
        if pA>=1-1e-12:
            if all(P[s]>0 for s in A): out.append(A)
            break
        if all(P[s]>1-pA+1e-15 for s in A): out.append(A)
    return out
def is_upper_set(P,A):
    return all(not(P[x]>P[y] and y in A and x not in A) for x in P for y in P)

def ic_belief(PQ,PR,BQ,BR,BQR_fn):
    """Does B_QR subset B_Q x B_R? (belief version of Independent Closure)"""
    J=prod(PQ,PR); BJ=BQR_fn(J); rect={(a,b) for a in BQ for b in BR}
    return BJ<=rect, BJ, rect, J

print("=== Fang's horses (assumed numbers) ===")
Q={'A':.5,'B':.3,'C':.2}; R={'D':.4,'E':.3,'F':.15,'G':.1,'H':.05}
J=prod(Q,R)
rect={('A','D'),('A','E')}
print("rect upper set?",is_upper_set(J,rect), "P(B,D)=",J[('B','D')],"P(A,E)=",J[('A','E')])

print("\n=== G&S mass-threshold: example 1 (product mass < t) ===")
Q={'q1':.9,'q2':.1}; R={'r1':.9,'r2':.1}
t=.9
BQ=gs_mass(Q,t); BR=gs_mass(R,t)
ok,BJ,rect,J=ic_belief(Q,R,BQ,BR,lambda J:gs_mass(J,t))
print("BQ",BQ,"BR",BR,"BQR",sorted(BJ),"rect",rect,"IC holds?",ok, "P(rect)=",sum(J[c] for c in rect))

print("\n=== G&S mass: example 2 (rect mass > t but B_QR not subset of rect) ===")
random.seed(1)
def rand_dist(n):
    w=[random.random()**3 for _ in range(n)]; s=sum(w); return {i:x/s for i,x in enumerate(w)}
fails=0;tot=0;ex=None
for _ in range(20000):
    Q=rand_dist(random.randint(2,5)); R=rand_dist(random.randint(2,5)); t=random.choice([.5,.6,.7,.8,.9,.95,.99])
    BQ=gs_mass(Q,t); BR=gs_mass(R,t)
    ok,BJ,rect,J=ic_belief(Q,R,BQ,BR,lambda J:gs_mass(J,t))
    tot+=1
    if not ok:
        fails+=1
        pm=sum(J[c] for c in rect)
        if pm>=t and ex is None: ex=(Q,R,t,BQ,BR,BJ,rect,pm)
print("G&S mass: IC-belief fails in",fails,"of",tot)
print("first failure with rect mass >= t (pure Filtering-Failure-type):")
if ex:
    Q,R,t,BQ,BR,BJ,rect,pm=ex
    print({k:round(v,3) for k,v in Q.items()},{k:round(v,3) for k,v in R.items()},"t",t)
    print("BQ",BQ,"BR",BR,"rect mass",round(pm,3)); print("BQR",sorted(BJ)); print("BQR not in rect:",sorted(BJ-rect))
# count failures where rect mass >= t only
f2=0;tot2=0
for _ in range(20000):
    Q=rand_dist(random.randint(2,5)); R=rand_dist(random.randint(2,5)); t=random.choice([.5,.6,.7,.8,.9,.95,.99])
    BQ=gs_mass(Q,t); BR=gs_mass(R,t)
    ok,BJ,rect,J=ic_belief(Q,R,BQ,BR,lambda J:gs_mass(J,t))
    if sum(J[c] for c in rect)>=t:
        tot2+=1; f2+= (not ok)
print("among cases where product mass>=t: fails",f2,"of",tot2)

print("\n=== Ratio threshold (Lin-Kelly / CH informal) ===")
f3=0
for _ in range(20000):
    Q=rand_dist(random.randint(2,5)); R=rand_dist(random.randint(2,5)); r=random.choice([.05,.1,.2,.5,.8])
    BQ=ratio(Q,r); BR=ratio(R,r)
    ok,BJ,rect,J=ic_belief(Q,R,BQ,BR,lambda J:ratio(J,r))
    f3+= (not ok)
print("ratio: IC-belief failures:",f3,"of 20000")
# but equality fails
Q={'a':.6,'b':.3,'c':.1}; R={'x':.6,'y':.3,'z':.1}; r=.3
BQ=ratio(Q,r); BR=ratio(R,r); J=prod(Q,R); BJ=ratio(J,r)
print("ratio r=.3: BQ",BQ,"BR",BR,"rect size",len(BQ)*len(BR),"BQR",sorted(BJ))

print("\n=== Leitgeb stable sets, independent partitions ===")
Q={'A':.6,'B':.4}; R={'C':.6,'D':.4}
print("stable(Q)",stable(Q),"stable(R)",stable(R))
J=prod(Q,R); print("stable(QR)",stable(J))
Q={'A':.7,'B':.3}; R={'C':.7,'D':.3}
J=prod(Q,R)
print("Q .7/.3: stable(Q)",stable(Q),"stable(QR)",stable(J),"rect {AC} probability",J[('A','C')])
Q={'A':.9,'B':.1}; R={'C':.9,'D':.1}
J=prod(Q,R)
print("Q .9/.1: stable(Q)",stable(Q),"stable(QR)",stable(J))
Q={'A':.95,'B':.05}; R={'C':.95,'D':.05}
J=prod(Q,R)
print("Q .95/.05: stable(Q)",stable(Q),"stable(QR)",stable(J),'rect', .95*.95)
# general: min cell product vs outside mass
def stab_fail_search():
    f=0;tot=0;ex=None
    for _ in range(20000):
        Q=rand_dist(random.randint(2,4)); R=rand_dist(random.randint(2,4))
        sq=stable(Q); sr=stable(R)
        for a in sq:
            for b in sr:
                rect={(x,y) for x in a for y in b}
                J=prod(Q,R)
                pr=sum(J[c] for c in rect)
                st=any(rect==S for S in stable(J))
                tot+=1
                if not st:
                    f+=1
                    if ex is None and pr<1-1e-9: ex=(Q,R,a,b,pr)
    return f,tot,ex
print(stab_fail_search())

print("\n=== Leitgeb 'may' version: exists stable S_QR within q x r (q,r = stable sets of Q,R)? ===")
f=0;tot=0
for _ in range(20000):
    Q=rand_dist(random.randint(2,4)); R=rand_dist(random.randint(2,4)); J=prod(Q,R); sj=stable(J)
    for a in stable(Q):
        for b in stable(R):
            rect={(x,y) for x in a for y in b}
            tot+=1
            if not any(S<=rect for S in sj): f+=1
print("fails",f,"of",tot)
# fraction among those where Q-stable set has prob<1 and R likewise
f=0;tot=0
for _ in range(20000):
    Q=rand_dist(random.randint(2,4)); R=rand_dist(random.randint(2,4)); J=prod(Q,R); sj=stable(J)
    for a in stable(Q):
        for b in stable(R):
            if sum(Q[x] for x in a)>=1-1e-9 or sum(R[y] for y in b)>=1-1e-9: continue
            rect={(x,y) for x in a for y in b}
            tot+=1
            if not any(S<=rect for S in sj): f+=1
print("nontrivial (both stable sets prob<1): fails",f,"of",tot)

print("\n=== Carter-Hawthorne Fact 1 check ===")
Pc={'HH':9/25,'HT':6/25,'TH':6/25,'TT':4/25}
for t in [0.2,0.3,0.36,0.37,0.4,0.48,0.5,0.6,0.61]:
    print("t",t,"Max(pi3)=",sorted(gs_mass(Pc,t)), " Max(pi1)=",sorted(gs_mass({'H':.6,'T':.4},t)))
print("\n=== CH bag example ===")
size={('black','small'):125,('black','large'):0}
for c in ['white','red','blue','green','yellow']:
    size[(c,'small')]=5; size[(c,'large')]=20
color={}; sz={}
for (c,s),n in size.items():
    color[c]=color.get(c,0)+n/250; sz[s]=sz.get(s,0)+n/250
print(color, sz)
for t in [.3,.4,.5,.55,.6,.65]:
    print("mass t",t,"Max(color)",sorted(gs_mass(color,t)),"Max(size)",sorted(gs_mass(sz,t)))
for r in [1.5,2,3,5]:
    # ratio reading: cell is among most normal iff max/P <= r
    mc={c for c in color if max(color.values())/color[c]<=r}
    ms={s for s in sz if max(sz.values())/sz[s]<=r}
    print("ratio r",r,"Max(color)",sorted(mc),"Max(size)",sorted(ms))

print("\n=== numeric examples for report ===")
Q={'A':.5,'B':.4,'C':.1}; R={'D':.4,'E':.3,'F':.2,'G':.1}
J=prod(Q,R)
for c in sorted(J,key=lambda c:-J[c]): print(c,round(J[c],3),end='; ')
print()
rect={('A','D'),('A','E')}
print("Guessing rect is upper set?",is_upper_set(J,rect))
# GS with t=.5
for t in [.5,.6,.9]:
    BQ=gs_mass(Q,t);BR=gs_mass(R,t);BJ=gs_mass(J,t)
    print("t",t,"BQ",sorted(BQ),"BR",sorted(BR),"BQR",sorted(BJ),"rect P",round(sum(J[(a,b)] for a in BQ for b in BR),3),"BQR subset rect?",BJ<={(a,b) for a in BQ for b in BR})
for r in [.7,.5,.3]:
    BQ=ratio(Q,r);BR=ratio(R,r);BJ=ratio(J,r)
    print("ratio",r,"BQ",sorted(BQ),"BR",sorted(BR),"BQR",sorted(BJ),"subset rect?",BJ<={(a,b) for a in BQ for b in BR})
