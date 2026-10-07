import numpy as np, sys
from collections import defaultdict
rng = np.random.default_rng(2026)
def weights(rule, N, w, rounds, losses):
    if rule == 'M': return np.ones(N)
    if rule.startswith('S'):
        k = float(rule[1:]); return np.maximum(0.0, 1 + k * (rounds / N - w))
    if rule == 'A': return 1.0 + losses
    if rule == 'V': return 1.0 + losses**2
    if rule == 'Q': return (losses == losses.max()).astype(float)
def churn(rule, N, T, q, reps):
    rep_stats = []
    for r in range(reps):
        w = np.zeros(N); rounds = np.zeros(N); losses = np.zeros(N)
        bw = defaultdict(float); bn = defaultdict(int); sf = []; newc = []; clipped=0; cp=0
        for t in range(T):
            wt = weights(rule, N, w, rounds, losses)
            if t>200 and rule.startswith('S'): clipped += int((wt==0).sum()); cp += N
            if wt.sum() == 0: wt = np.ones(N)
            p = wt / wt.sum()
            if t > 200:
                nz = np.where(rounds == 0)[0]
                if len(nz): newc.extend(p[nz].tolist())
            i = rng.choice(N, p=p)
            w[i] += 1; rounds += 1; losses += 1; losses[i] = 0
            ex = rng.random(N) < q
            idx = np.where(ex)[0]
            if t > 200:
                for j in idx:
                    L = int(rounds[j]); bw[L] += w[j]; bn[L] += 1; sf.append(w[j] - L / N)
            w[idx] = 0; rounds[idx] = 0; losses[idx] = 0
        rep_stats.append((np.mean(newc) * N, {L: (bw[L], bn[L]) for L in bw}, np.std(sf), clipped/cp if cp else 0))
    newc = np.array([s[0] for s in rep_stats]); sds = np.array([s[2] for s in rep_stats])
    out = {'newcomer': (newc.mean(), newc.std(ddof=1)/np.sqrt(reps)), 'sd': (sds.mean(), sds.std(ddof=1)/np.sqrt(reps)), 'clip': np.mean([s[3] for s in rep_stats])}
    for L in (1, 10, 30):
        vals=[]; counts=0
        for s in rep_stats:
            if L in s[1] and s[1][L][1] > 0: vals.append(s[1][L][0]/s[1][L][1]/(L/N)); counts += s[1][L][1]
        vals=np.array(vals); out[f'L{L}'] = (vals.mean(), vals.std(ddof=1)/np.sqrt(len(vals)), counts)
    return out
N=10; q=0.1; reps=int(sys.argv[1]) if len(sys.argv)>1 else 200
for rule in ('M','S1','S2','S10','A','V','Q'):
    o=churn(rule,N,1500,q,reps)
    print(f"{rule:>4} | newcomer {o['newcomer'][0]:.3f}±{o['newcomer'][1]:.3f} | " + ' | '.join(f"L{L} {o[f'L{L}'][0]:.3f}±{o[f'L{L}'][1]:.3f} (n={o[f'L{L}'][2]})" for L in (1,10,30)) + f" | sd {o['sd'][0]:.3f}±{o['sd'][1]:.3f} | clip {o['clip']:.4f}", flush=True)
