from fractions import Fraction as F
def prod(P,Q): return {(a,b):P[a]*Q[b] for a in P for b in Q}
def gs(P,t): return {s for s in P if sum(v for v in P.values() if v>P[s])<t}
def comps(n,total=20):
    def rec(n,total,mx):
        if n==1:
            if 1<=total<=mx: yield (total,)
            return
        for x in range(min(mx,total-(n-1)),0,-1):
            for rest in rec(n-1,total-x,x): yield (x,)+rest
    return rec(n,total,total)
res=[]
for nq in (3,):
  for nr in (3,4):
    for q in comps(nq):
      for r in comps(nr):
        Q={i:F(x,20) for i,x in enumerate(q)}; R={i:F(x,20) for i,x in enumerate(r)}
        J=prod(Q,R)
        for t in [F(1,2),F(3,5),F(7,10),F(4,5),F(9,10)]:
            BQ=gs(Q,t);BR=gs(R,t)
            rect={(a,b) for a in BQ for b in BR}
            pm=sum(J[c] for c in rect)
            if pm>=t:
                BJ=gs(J,t)
                if not BJ<=rect:
                    res.append((len(BQ)+len(BR)+len(BJ),q,r,str(t),float(pm),sorted(BJ-rect)))
res.sort(key=lambda x:x[0])
for x in res[:8]: print(x)
print(len(res))
