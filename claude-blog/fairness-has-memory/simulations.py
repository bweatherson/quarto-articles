"""Standard errors, cell counts and sensitivity for the churn table."""
import numpy as np, sys
from collections import defaultdict
rng = np.random.default_rng(99)

def weights(rule, N, w, rounds, losses):
    if rule == 'M': return np.ones(N)
    if rule.startswith('S'):
        k = float(rule[1:]); return np.maximum(0.0, 1 + k * (rounds / N - w))
    if rule == 'A': return 1.0 + losses
    if rule == 'V': return 1.0 + losses**2
    if rule == 'Q': return (losses == losses.max()).astype(float)

def churn(rule, N, T, q, reps):
    # per-rep statistics so we can compute SEs across reps
    rep_stats = []
    for r in range(reps):
        w = np.zeros(N); rounds = np.zeros(N); losses = np.zeros(N)
        bw = defaultdict(float); bn = defaultdict(int); sf = []; newc = []
        for t in range(T):
            wt = weights(rule, N, w, rounds, losses)
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
        rep_stats.append((np.mean(newc) * N, {L: (bw[L], bn[L]) for L in bw}, np.std(sf), len(sf)))
    newc = np.array([s[0] for s in rep_stats])
    sds = np.array([s[2] for s in rep_stats])
    out = {'newcomer': (newc.mean(), newc.std(ddof=1) / np.sqrt(reps)), 'sd': (sds.mean(), sds.std(ddof=1) / np.sqrt(reps)),
           'n_leavers': sum(s[3] for s in rep_stats)}
    for L in (1, 3, 10, 30):
        vals = []; counts = 0
        for s in rep_stats:
            if L in s[1] and s[1][L][1] > 0:
                vals.append(s[1][L][0] / s[1][L][1] / (L / N)); counts += s[1][L][1]
        vals = np.array(vals)
        out[f'L{L}'] = (vals.mean(), vals.std(ddof=1) / np.sqrt(len(vals)), counts) if len(vals) > 1 else (float('nan'), float('nan'), counts)
    return out

def show(tag, N, q, reps, T=1500, rules=('M', 'S1', 'S2', 'S10', 'A', 'V', 'Q')):
    print(f'=== {tag}: N={N}, q={q}, reps={reps}, T={T} ===')
    for rule in rules:
        o = churn(rule, N, T, q, reps)
        print(f"{rule:>4} | newcomer {o['newcomer'][0]:.3f}±{o['newcomer'][1]:.3f} | " +
              ' | '.join(f"L{L} {o[f'L{L}'][0]:.2f}±{o[f'L{L}'][1]:.2f} (n={o[f'L{L}'][2]})" for L in (1, 3, 10, 30)) +
              f" | sd {o['sd'][0]:.3f}±{o['sd'][1]:.3f} | leavers {o['n_leavers']}")
        sys.stdout.flush()

if __name__ == '__main__':
    show('main', 10, 0.1, 40)
    show('slow churn', 10, 0.05, 30)
    show('fast churn', 10, 0.2, 30)
    show('large pool', 100, 0.05, 6, T=3000, rules=('M', 'S1', 'S2', 'A', 'Q'))
