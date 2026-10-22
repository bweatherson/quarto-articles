import numpy as np, sys
from collections import defaultdict
rng = np.random.default_rng(2026)
def weights(rule, N, w, rounds, losses, off=None, won=None):
    if off is None: off = np.zeros(N)
    if won is None: won = w > 0
    if rule == 'M': return np.ones(N)
    if rule.startswith('S'):   # shortfall rule as in the paper: 1/N + (k/N) * standing, floored at 0; standing = shortfall
        k = float(rule[1:]); x = rounds / N - w + off; return np.maximum(0.0, 1.0 / N + (k / N) * (x - x.mean()))
    if rule.startswith('U'):   # uncentred variant used in drafts before 21 Oct 2026: max(0, 1 + k*shortfall), normalised
        k = float(rule[1:]); return np.maximum(0.0, 1 + k * (rounds / N - w))
    if rule == 'A': return 1.0 + losses
    if rule == 'V': return 1.0 + losses**2
    if rule == 'Q': return (losses == losses.max()).astype(float)
    if rule == 'G':   # Grand Canyon river-permit style (NPS FAQ): points = years since last trip, one point in the year after a trip, capped at 5; never-winners sit at the cap
        return np.where(won, np.minimum(5.0, losses + 1.0), 5.0)
def churn(rule, N, T, q, reps):
    rep_stats = []
    for r in range(reps):
        w = np.zeros(N); rounds = np.zeros(N); losses = np.zeros(N); off = np.zeros(N)
        bw = defaultdict(float); bn = defaultdict(int); sf = []; newc = []; clipped=0; cp=0; newp=[]
        for t in range(T):
            wt = weights(rule, N, w, rounds, losses, off)
            if t>200 and rule.startswith('S'): clipped += int((wt==0).sum()); cp += N
            if wt.sum() == 0: wt = np.ones(N)
            p = wt / wt.sum()
            if t > 200:
                nz = np.where(rounds == 0)[0]
                if len(nz): newc.extend(p[nz].tolist()); newp.extend(p[nz].tolist())
            i = rng.choice(N, p=p)
            w[i] += 1; rounds += 1; losses += 1; losses[i] = 0
            ex = rng.random(N) < q
            idx = np.where(ex)[0]
            if t > 200:
                for j in idx:
                    L = int(rounds[j]); bw[L] += w[j]; bn[L] += 1; sf.append(w[j] - L / N)
            # standing = shortfall + off; a newcomer enters at the pool's mean standing (off = mean standing of the others)
            w[idx] = 0; rounds[idx] = 0; losses[idx] = 0
            if len(idx):
                stay = np.ones(N, bool); stay[idx] = False
                m = (rounds[stay] / N - w[stay] + off[stay]).mean() if stay.any() else 0.0
                off[idx] = m
        rep_stats.append((np.mean(newc) * N, {L: (bw[L], bn[L]) for L in bw}, np.std(sf), clipped/cp if cp else 0, np.std(newp) * N))
    newc = np.array([s[0] for s in rep_stats]); sds = np.array([s[2] for s in rep_stats])
    out = {'newcomer': (newc.mean(), newc.std(ddof=1)/np.sqrt(reps)), 'sd': (sds.mean(), sds.std(ddof=1)/np.sqrt(reps)), 'clip': np.mean([s[3] for s in rep_stats]), 'newsd': np.mean([s[4] for s in rep_stats])}
    for L in (1, 10, 30):
        vals=[]; counts=0
        for s in rep_stats:
            if L in s[1] and s[1][L][1] > 0: vals.append(s[1][L][0]/s[1][L][1]/(L/N)); counts += s[1][L][1]
        vals=np.array(vals); out[f'L{L}'] = (vals.mean(), vals.std(ddof=1)/np.sqrt(len(vals)), counts)
    return out
N=10; q=0.1; reps=int(sys.argv[1]) if len(sys.argv)>1 else 200
for rule in ('M','S0.5','S1','S2','S10','A','V','Q','G'):
    o=churn(rule,N,1500,q,reps)
    print(f"{rule:>4} | newcomer {o['newcomer'][0]:.3f}±{o['newcomer'][1]:.3f} | " + ' | '.join(f"L{L} {o[f'L{L}'][0]:.3f}±{o[f'L{L}'][1]:.3f} (n={o[f'L{L}'][2]})" for L in (1,10,30)) + f" | sd {o['sd'][0]:.3f}±{o['sd'][1]:.3f} | clip {o['clip']:.4f} | newcomer state-sd {o['newsd']:.3f}", flush=True)

# ---- Fixed population (Section 5.1): expected number of claimants left with nothing, N = T = 10
def fixed_pop(rule, N, T, reps):
    tot = 0
    for r in range(reps):
        w = np.zeros(N); rounds = np.zeros(N); losses = np.zeros(N)
        for t in range(T):
            wt = weights(rule, N, w, rounds, losses)
            if wt.sum() == 0: wt = np.ones(N)
            i = rng.choice(N, p=wt / wt.sum()); w[i] += 1; rounds += 1; losses += 1; losses[i] = 0
        tot += int((w == 0).sum())
    return tot / reps
print("fixed population N=T=10, expected number with nothing:")
print(f"  closed form, forgetting: N(1-1/N)^T = {N*(1-1/N)**10:.3f}")
for rule in ('M','S1','S2','S10'):
    print(f"  {rule:>3}: {fixed_pop(rule, N, 10, 200000 if reps>=200 else 20000):.3f}")
print("closed forms (valid while clipping is rare): fixed-pool sd of shortfall sqrt((N-1)/(2 k N)); sd at exit under churn sqrt((N-1)/(N (N q + 2 k (1-q))))")
for k in (0.5, 1, 2):
    print(f"  k={k}: fixed-pool {np.sqrt((N-1)/(2*k*N)):.3f}; at exit {np.sqrt((N-1)/(N*(N*q+2*k*(1-q)))):.3f}")
print(f"  k=0: at exit {np.sqrt((N-1)/(N*N*q)):.3f}")

# ---- Bottleneck (Section 5.3): pool of N kept full, one unit per period, forgetting rule.
# A claimant's wait W = number of periods before she is served = number of others served ahead of her;
# each period she is passed over with probability 1-1/N, so P(W >= k) = (1-1/N)^k and E[W] = N-1.
print("bottleneck, forgetting rule, N=10:")
print(f"  expected wait E[W] = N-1 = {N-1}; P(W >= 40) = (1-1/N)^40 = {(1-1/N)**40:.4f} = 1/{1/(1-1/N)**40:.1f}")
print(f"  a queue serves every arrival after the N-1 = {N-1} ahead of her: wait {N-1} for everyone")
