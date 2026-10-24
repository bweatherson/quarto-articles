"""Numerical checks for the reply to Meehan & Zhang, 'Bayes Is Back'.
States are 0..n-1. A learning situation E is a tuple of frozensets with s in E[s] (factive).
Accuracy: M&Z's Brier score over ALL subsets of S (negative squared error), and log score for robustness."""
import itertools, math, random
from fractions import Fraction as F

def subsets(n):
    return [frozenset(c) for r in range(0, n+1) for c in itertools.combinations(range(n), r)]

def brier(c, s, n, SUBS):
    # c: list of probabilities over states; accuracy = -sum_{A subset S} (c(A) - v_s(A))^2
    tot = 0.0
    for A in SUBS:
        cA = sum(c[i] for i in A)
        v = 1.0 if s in A else 0.0
        tot += (cA - v)**2
    return -tot

def logscore(c, s, n, SUBS=None):
    return math.log(c[s]) if c[s] > 0 else -1e9

def cond(pi, p):
    z = sum(pi[i] for i in p)
    return [pi[i]/z if i in p else 0.0 for i in range(len(pi))]

def factive_situations(n, allowed=None):
    """All factive E; allowed(s) -> list of admissible evidence sets at s."""
    SUBS = subsets(n)
    opts = []
    for s in range(n):
        o = [A for A in SUBS if s in A]
        if allowed: o = [A for A in o if allowed(s, A)]
        opts.append(o)
    return [tuple(x) for x in itertools.product(*opts)]

def lam_p(Es, weights, n):
    """lambda_p(s) = sum of weights of E with E(s)=p."""
    L = {}
    for E, w in zip(Es, weights):
        for s in range(n):
            L[(E[s], s)] = L.get((E[s], s), 0.0) + w
    return L

def is_extensional(L, n, tol=1e-12):
    ps = set(p for (p, s) in L)
    for p in ps:
        vals = [L.get((p, s), 0.0) for s in p]
        if max(vals) - min(vals) > tol:
            return False
    return True

def tea(rule, Es, weights, pi, n, score, SUBS):
    tot = 0.0
    for E, w in zip(Es, weights):
        if w == 0: continue
        for s in range(n):
            tot += w * pi[s] * score(rule(E[s]), s, n, SUBS)
    return tot

def opt_rule_factory(L, pi, n):
    def r(p):
        wts = [pi[s] * L.get((p, s), 0.0) for s in range(n)]
        z = sum(wts)
        if z == 0: return cond(pi, p)
        return [x/z for x in wts]
    return r
