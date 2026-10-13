#!/usr/bin/env python3
"""
Illustration (not proof) of the gap between a law's description length and
the cost of finding it.  Three data-generating "laws", each fixed by a short
secret, and several inquirers.

  HASH  : bits of SHA-256(seed || counter), seed of d bits.   (stand-in PRG)
  LFSR  : linear-feedback shift register, L-bit state AND L unknown tap bits
          (description length d = 2L).
  GEFFE : three LFSRs of L bits (known taps, unknown states, d = 3L) combined
          by the Geffe multiplexer.

Inquirers:
  * brute force over all 2^d secrets (the "Occam/Kolmogorov" inquirer)
  * generic statistical learners on windows of previous bits (logistic
    regression, gradient boosting, a small neural net) + monobit/serial tests
  * Berlekamp-Massey (a polynomial-time method specific to linear recurrences)
  * divide-and-conquer correlation attack on Geffe

Everything is seeded.  Run:  python3 findable_demo.py [--quick]
"""
import hashlib, time, json, sys, math, zlib
import numpy as np

RNG = np.random.default_rng(20261012)
QUICK = "--quick" in sys.argv

# ---------------------------------------------------------------- generators
def hash_bits(seed, nbits):
    out = bytearray(); ctr = 0
    sb = seed.to_bytes(8, "little")
    while len(out) * 8 < nbits:
        out += hashlib.sha256(sb + ctr.to_bytes(4, "little")).digest(); ctr += 1
    return np.unpackbits(np.frombuffer(bytes(out), dtype=np.uint8))[:nbits]

def lfsr_bits(taps, state, nbits):
    """taps, state: lists of 0/1 of length L. s_{t+L} = XOR_i taps[i]*s_{t+i}."""
    L = len(taps); s = list(state); out = []
    for _ in range(nbits):
        out.append(s[0])
        fb = 0
        for i in range(L):
            if taps[i] and s[i]: fb ^= 1
        s = s[1:] + [fb]
    return np.array(out, dtype=np.uint8)

def rand_lfsr(L, weight=None):
    """Random taps (optionally with exactly `weight` nonzero taps, tap 0 always set) and random nonzero state."""
    while True:
        if weight is None:
            taps = RNG.integers(0, 2, L).tolist()
        else:
            taps = [0]*L; taps[0] = 1
            for j in RNG.choice(np.arange(1, L), weight-1, replace=False): taps[int(j)] = 1
        taps[0] = 1  # c_L != 0
        state = RNG.integers(0, 2, L).tolist()
        if any(state): return taps, state

def berlekamp_massey(s):
    """Return (L, C) minimal LFSR over GF(2) generating s; C[0]=1 connection poly."""
    n = len(s); C = [1] + [0]*n; B = [1] + [0]*n; L = 0; m = 1
    for i in range(n):
        d = s[i]
        for j in range(1, L+1): d ^= C[j] & s[i-j]
        if d == 0: m += 1
        elif 2*L <= i:
            T = C[:]
            for j in range(n+1-m): C[j+m] ^= B[j]
            L = i + 1 - L; B = T; m = 1
        else:
            for j in range(n+1-m): C[j+m] ^= B[j]
            m += 1
    return L, C[:L+1]

def bm_predict(s_train, n_more):
    L, C = berlekamp_massey(list(map(int, s_train)))
    s = list(map(int, s_train)); 
    for _ in range(n_more):
        t = len(s); b = 0
        for j in range(1, L+1): b ^= C[j] & s[t-j]
        s.append(b)
    return np.array(s[len(s_train):], dtype=np.uint8), L

# --------------------------------------------------- 1. brute force scaling
def brute_force(data_bits, d):
    m = len(data_bits)//8; target = np.packbits(data_bits[:8*m]).tobytes()
    t0 = time.perf_counter(); calls = 0
    for s in range(1 << d):
        calls += 1
        if hashlib.sha256(s.to_bytes(8, "little") + b"\0\0\0\0").digest()[:m] == target:
            return s, calls, time.perf_counter() - t0
    return None, calls, time.perf_counter() - t0

def exp_bruteforce():
    rows = []
    dmax = 20 if QUICK else 24
    for d in range(12, dmax+1, 2):
        n = 8*math.ceil((d + 32)/8)          # data length: d+32 rounded up to bytes
        trials = 6 if d <= 18 else 3
        calls_h, t_h, hit, fp_calls = [], [], 0, []
        for _ in range(trials):
            seed = int(RNG.integers(0, 1 << d))
            x = hash_bits(seed, n)                         # PRG world
            s, c, t = brute_force(x, d); calls_h.append(c); t_h.append(t); hit += (s is not None)
        # chance world: full scan finds nothing (false-positive prob ~ 2^-32)
        xr = RNG.integers(0, 2, n).astype(np.uint8)
        s, c, t = brute_force(xr, d)
        rows.append(dict(d=d, n=n, trials=trials, prg_identified=hit,
                         mean_calls_prg=float(np.mean(calls_h)), full_scan_calls=c,
                         full_scan_sec=round(t, 3), chance_world_false_match=(s is not None)))
        print("BF", rows[-1], flush=True)
    return rows

def exp_data_needed(d=12, reps=300):
    """Unbounded inquirer: how long must the data be?  False-match rate on chance data vs n."""
    seeds = np.arange(1 << d)
    # precompute first 4 bytes of hash for all seeds (so n up to 32 bits tested here)
    first = np.array([int.from_bytes(hashlib.sha256(int(s).to_bytes(8, "little") + b"\0\0\0\0").digest()[:3], "big")
                      for s in seeds], dtype=np.uint32)     # 24 bits
    res = []
    for n in range(8, 25, 2):
        pref = (first >> (24 - n)).astype(np.uint32)
        table = set(pref.tolist()); fm = 0
        for _ in range(reps*10):
            x = int(RNG.integers(0, 1 << n)); fm += (x in table)
        res.append(dict(n=n, d=d, empirical_false_match=fm/(reps*10), predicted=min(1.0, 2.0**(d-n))))
        print("DN", res[-1], flush=True)
    return res

# ---------------------------------------------------- 2. feasible learners
def windows(bits, w):
    N = len(bits) - w
    idx = np.arange(w)[None, :] + np.arange(N)[:, None]
    return bits[idx].astype(np.float32), bits[w:].astype(int)

def learners(bits, w=32):
    from sklearn.linear_model import LogisticRegression
    from sklearn.ensemble import HistGradientBoostingClassifier
    from sklearn.neural_network import MLPClassifier
    X, y = windows(bits, w); cut = int(0.8*len(y))
    out = {}
    for name, mk in [("logreg", lambda: LogisticRegression(max_iter=300)),
                     ("gboost", lambda: HistGradientBoostingClassifier(max_iter=150, random_state=0)),
                     ("mlp",    lambda: MLPClassifier((128, 64), max_iter=40, random_state=0))]:
        m = mk().fit(X[:cut], y[:cut]); acc = float((m.predict(X[cut:]) == y[cut:]).mean())
        out[name] = round(acc, 4)
    # simple statistical checks
    out["monobit_freq"] = round(float(bits.mean()), 4)
    out["lag1_agree"] = round(float((bits[1:] == bits[:-1]).mean()), 4)
    out["zlib_ratio"] = round(len(zlib.compress(np.packbits(bits).tobytes(), 9)) / (len(bits)//8), 4)
    out["test_n"] = int(len(y) - cut)
    return out

def exp_learners():
    N = 60_000 if QUICK else 200_000
    res = {}
    d = 24
    seed = int(RNG.integers(1 << d)); res["hash_d24"] = learners(hash_bits(seed, N), w=48); print("L hash", res["hash_d24"], flush=True)
    for wt in [3, 5, 7, 11, 15]:
        taps, st = rand_lfsr(24, wt); key = "lfsr_L24_d48_taps%d" % wt
        res[key] = learners(lfsr_bits(taps, st, N), w=48); res[key]["n_taps"] = sum(taps)
        print("L", key, res[key], flush=True)
    res["uniform_random"] = learners(RNG.integers(0, 2, N).astype(np.uint8), w=48); print("L rand", res["uniform_random"], flush=True)
    return res

def exp_bm():
    rows = []
    for L in [12, 20, 64, 256, 1024]:
        taps, st = rand_lfsr(L)
        s = lfsr_bits(taps, st, 2*L + 4000)
        t0 = time.perf_counter(); pred, Lh = bm_predict(s[:2*L], 2000); dt = time.perf_counter() - t0
        ok = bool((pred == s[2*L:2*L+2000]).all())
        rows.append(dict(L=L, description_bits=2*L, data_bits_used=2*L, recovered_L=Lh,
                         predicts_next_2000_exactly=ok, seconds=round(dt, 3)))
        print("BM", rows[-1], flush=True)
    return rows

# --------------------------------------------------------- 3. Geffe attack
def lfsr_all_states(taps_mask, L, n):
    """Vectorised: output bits for every nonzero L-bit initial state. Returns (2^L-1, n) uint8.
    state bit i is s_{t+i}; output s_t = bit 0; feedback = parity(state & mask)."""
    states = np.arange(1, 1 << L, dtype=np.uint32); out = np.empty((len(states), n), dtype=np.uint8)
    st = states.copy()
    for t in range(n):
        out[:, t] = st & 1
        x = st & np.uint32(taps_mask)
        x ^= x >> 16; x ^= x >> 8; x ^= x >> 4; x ^= x >> 2; x ^= x >> 1
        fb = x & 1
        st = (st >> 1) | (fb << (L-1))
    return out

def geffe_exp():
    rows = []
    for L in ([8, 10, 12] if QUICK else [8, 10, 12, 14, 16]):
        n = 40 * L // 2 + 100
        masks = [int(RNG.integers(1, 1 << L)) | 1 for _ in range(3)]
        st = [int(RNG.integers(1, 1 << L)) for _ in range(3)]
        def run(mask, s0):
            A = lfsr_all_states(mask, L, n); return A[s0-1], A
        x1, A1 = run(masks[0], st[0]); x2, A2 = run(masks[1], st[1]); x3, A3 = run(masks[2], st[2])
        z = (x1 & x2) ^ ((1 - x2) & x3)
        t0 = time.perf_counter()
        r1 = int(np.argmax((A1 == z).sum(1))) + 1
        r3 = int(np.argmax((A3 == z).sum(1))) + 1
        x1h = A1[r1-1]; x3h = A3[r3-1]
        zz = (x1h[None, :] & A2) ^ ((1 - A2) & x3h[None, :])
        r2 = int(np.where((zz == z).all(1))[0][0]) + 1 if (zz == z).all(1).any() else -1
        dt = time.perf_counter() - t0
        rows.append(dict(L=L, description_bits=3*L, recovered=[r1, r2, r3] == st,
                         work_divide_and_conquer=3*(2**L), work_brute_force=2**(3*L),
                         seconds=round(dt, 2), data_bits=n))
        print("GEFFE", rows[-1], flush=True)
    return rows

if __name__ == "__main__":
    t0 = time.time()
    R = dict(quick=QUICK)
    R["bruteforce"] = exp_bruteforce()
    R["data_needed"] = exp_data_needed()
    R["learners"] = exp_learners()
    R["berlekamp_massey"] = exp_bm()
    R["geffe"] = geffe_exp()
    R["total_seconds"] = round(time.time() - t0, 1)
    json.dump(R, open("findable_demo_results.json", "w"), indent=1)
    print("done", R["total_seconds"], "s")
