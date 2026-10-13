"""Counterexample counts against adversarial and random oracles for analyses over n binary case-features.
Run: python3 sim_oracles.py   (a few seconds)

The theorist proposes an analysis; the oracle answers with a case on which the proposal and the (hidden)
target disagree, or says nothing if none exists (we stop then).  'adversarial' = the oracle picks the
counterexample that removes the fewest candidates; 'random' = uniform over the cases of disagreement.
"""
import random, math, itertools, statistics

random.seed(7)

# ---------------------------------------------------------------- single-feature analyses ("F iff feature i")
def single_feature(n, oracle, improper=False, trials=200):
    counts = []
    for _ in range(trials if oracle == 'random' else 1):
        t = random.randrange(n) if oracle == 'random' else n - 1   # adversary: target is the last survivor
        surv = list(range(n))
        k = 0
        while True:
            if not improper:
                h = random.choice(surv) if oracle == 'random' else surv[0]
                if len(surv) == 1 and h == t:
                    break
                if h == t:
                    break
                if oracle == 'adversarial':
                    # case with feature h on and every other surviving feature off: only h is eliminated
                    x = [0] * n; x[h] = 1
                else:
                    xh = random.randint(0, 1)
                    x = [random.randint(0, 1) for _ in range(n)]; x[h] = xh; x[t] = 1 - xh
                label = x[t]
                surv = [j for j in surv if x[j] == label]
                k += 1
            else:
                # improper: predict by majority vote of survivors (the case-by-case predictor)
                if len(surv) == 1:
                    break
                if oracle == 'adversarial':
                    # pick a case on which survivors split as evenly as possible; the label goes against the majority
                    half = len(surv) // 2 + len(surv) % 2   # ceil
                    x = [0] * n
                    for j in surv[:half]:
                        x[j] = 1
                    ones = sum(x[j] for j in surv)
                    maj = 1 if ones * 2 > len(surv) else 0
                    # force the truth to be the minority label that still leaves a consistent target
                    label = 1 - maj if (1 - maj) in [x[j] for j in surv] else maj
                    surv = [j for j in surv if x[j] == label]
                    k += 1
                else:
                    x = [random.randint(0, 1) for _ in range(n)]
                    ones = sum(x[j] for j in surv)
                    maj = 1 if ones * 2 > len(surv) else 0
                    label = x[t]
                    if label == maj or (ones * 2 == len(surv)):
                        # no mistake (or tie, treated as no mistake); the case is not a counterexample
                        if label != maj:
                            surv = [j for j in surv if x[j] == label]; k += 1
                        continue
                    surv = [j for j in surv if x[j] == label]
                    k += 1
        counts.append(k)
    return statistics.mean(counts)

# ---------------------------------------------------------------- monotone conjunctions
def conj(n, tsize, oracle, trials=200):
    out = []
    for _ in range(trials if oracle == 'random' else 1):
        T = set(random.sample(range(n), tsize)) if oracle == 'random' else set(range(tsize))
        h = set(range(n))   # elimination learner: start from the conjunction of every feature
        k = 0
        while h != T:
            if oracle == 'adversarial':
                i = min(h - T)
                x = [1] * n; x[i] = 0         # a positive case lacking exactly one wrongly-included feature
            else:
                while True:
                    x = [random.randint(0, 1) for _ in range(n)]
                    for j in T: x[j] = 1
                    if any(x[j] == 0 for j in h):
                        break
            h = {j for j in h if x[j] == 1}
            k += 1
        out.append(k)
    return statistics.mean(out)

# ---------------------------------------------------------------- unrestricted analyses: cases listed one by one
def unrestricted(n, oracle, trials=30):
    m = 2 ** n
    if oracle == 'adversarial':
        return m   # every counterexample fixes exactly one case; the adversary always has an unfixed case left
    out = []
    for _ in range(trials):
        tgt = [random.randint(0, 1) for _ in range(m)]
        known = {}
        k = 0
        default = 0
        while True:
            dis = [x for x in range(m) if known.get(x, default) != tgt[x]]
            if not dis:
                break
            x = random.choice(dis); known[x] = tgt[x]; k += 1
        out.append(k)
    return statistics.mean(out)

if __name__ == '__main__':
    print("single-feature analyses ('F iff feature i'), mean number of counterexamples endured")
    print(f"{'n':>5} {'proper/adv':>11} {'proper/rand':>12} {'improper/adv':>13} {'improper/rand':>14} {'floor(log2 n)':>14} {'ln n':>6}")
    for n in (4, 8, 16, 64, 256, 1024):
        pa = single_feature(n, 'adversarial'); pr = single_feature(n, 'random')
        ia = single_feature(n, 'adversarial', improper=True); ir = single_feature(n, 'random', improper=True)
        print(f"{n:5d} {pa:11.1f} {pr:12.1f} {ia:13.1f} {ir:14.1f} {int(math.log2(n)):14d} {math.log(n):6.1f}")
        assert pa == n - 1 and ia <= math.floor(math.log2(n))
    print("\nmonotone conjunctions with t of n features (elimination learner), counterexamples endured")
    print(f"{'n':>5} {'t':>3} {'adversarial':>12} {'random':>8}")
    for n, t in ((8, 0), (8, 4), (32, 0), (32, 8), (128, 0), (128, 16)):
        print(f"{n:5d} {t:3d} {conj(n,t,'adversarial'):12.1f} {conj(n,t,'random'):8.1f}")
    print("\nunrestricted Boolean analyses over n features (2^n cases)")
    print(f"{'n':>5} {'adversarial':>12} {'random (mean)':>14} {'2^(n-1)':>8}")
    for n in (3, 5, 7, 9):
        print(f"{n:5d} {unrestricted(n,'adversarial'):12d} {unrestricted(n,'random'):14.1f} {2**(n-1):8d}")
