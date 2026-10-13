"""Exact machinery for finite concept classes under counterexample (equivalence-query) feedback.

A class is a list of concepts over a finite case space X = range(m); each concept is a tuple of m bits
(its verdict on each case).  States of the game are version spaces, stored as Python-int bitmasks over
concept indices.

Quantities computed exactly (all by memoised search, no sampling):

  ldim(C)            Littlestone dimension (depth of the deepest complete mistake tree; Littlestone 1988).
  eq_value(C, H)     minimax number of counterexamples a theorist who must put forward a member of H
                     at every stage can be forced to endure, against an adversarial oracle that always
                     supplies a counterexample consistent with some surviving target in C.
                     H = all functions (improper) gives the 'case-by-case predictor'; H = C is the
                     'definition at every stage' theorist.  Returns INF when the adversary can stall.
  inconsistency(C)   size of the largest minimal C-unrealizable consistent partial labelling of X
                     (K* below).  HLM's dual Helly number K of C relative to C equals max(2, K*)
                     because a labelled set containing both labels of one case is trivially unrealizable.
"""
import itertools, functools, math, random

INF = 10 ** 9


class Cls:
    def __init__(self, m, concepts):
        self.m = m
        seen = {}
        for c in concepts:
            c = tuple(int(b) for b in c)
            assert len(c) == m
            seen.setdefault(c, len(seen))
        self.C = list(seen)
        self.N = len(self.C)
        # lab[x][y] = bitmask of concepts with verdict y on case x
        self.lab = [[0, 0] for _ in range(m)]
        for i, c in enumerate(self.C):
            for x in range(m):
                self.lab[x][c[x]] |= 1 << i
        self.full = (1 << self.N) - 1

    # ---- Littlestone dimension -------------------------------------------------
    def ldim(self):
        lab, m = self.lab, self.m

        @functools.lru_cache(maxsize=None)
        def L(V):
            if V & (V - 1) == 0:
                return 0
            best = 0
            for x in range(m):
                V0, V1 = V & lab[x][0], V & lab[x][1]
                if V0 and V1:
                    d = 1 + min(L(V0), L(V1))
                    if d > best:
                        best = d
            return best

        return L(self.full)

    # ---- equivalence-query game -------------------------------------------------
    def eq_value(self, H):
        """H: list of hypothesis tables (tuples of m bits) the theorist may put forward."""
        lab, m = self.lab, self.m
        Hs = [tuple(h) for h in H]
        cidx = {c: i for i, c in enumerate(self.C)}

        @functools.lru_cache(maxsize=None)
        def val(V):
            if V & (V - 1) == 0:  # single surviving target
                c = self.C[V.bit_length() - 1]
                return 0 if c in set(Hs) else INF
            best = INF
            for h in Hs:
                worst = 0
                for x in range(m):
                    Vn = V & lab[x][1 - h[x]]
                    if not Vn:
                        continue  # no surviving target disagrees with h at x
                    if Vn == V:
                        worst = INF
                        break
                    v = 1 + val(Vn)
                    if v > worst:
                        worst = v
                        if worst >= best:
                            break
                if worst < best:
                    best = worst
                    if best == 0:
                        break
            return best

        return val(self.full)

    def all_functions(self):
        return list(itertools.product((0, 1), repeat=self.m))

    # ---- inconsistency size K* ---------------------------------------------------
    def inconsistency(self):
        """K*: largest minimal unrealizable consistent partial labelling.

        A labelled case (x, y) excludes the concepts whose verdict on x differs from y; a set of labelled
        cases is unrealizable iff the exclusions cover C, and minimal iff every member has a concept that
        only it excludes.  K* is the size of the largest such irredundant cover (0 if C is all functions).
        Cases whose labelled copies exclude the same set of concepts are interchangeable, so we dedupe.
        """
        lab, m, full = self.lab, self.m, self.full
        E = set()
        for x in range(m):
            for y in (0, 1):
                e = full & ~lab[x][y]
                if e:
                    E.add(e)
        E = sorted(E)
        best = 0

        def dfs(start, chosen, covered):
            nonlocal best
            if covered == full:
                best = max(best, len(chosen))
                return
            for i in range(start, len(E)):
                e = E[i]
                if e & ~covered == 0:
                    continue
                new = chosen + [e]
                # every member must keep a private concept
                ok = True
                for j, f in enumerate(new):
                    others = 0
                    for k, g in enumerate(new):
                        if k != j:
                            others |= g
                    if f & ~others == 0:
                        ok = False
                        break
                if ok:
                    dfs(i + 1, new, covered | e)

        dfs(0, [], 0)
        return best

    def specifying_size(self, target):
        """smallest set of labelled cases (labels from target) whose only consistent member of C is target."""
        t = self.C.index(tuple(target))
        for k in range(0, self.m + 1):
            for pts in itertools.combinations(range(self.m), k):
                mask = self.full
                for x in pts:
                    mask &= self.lab[x][self.C[t][x]]
                if mask == 1 << t:
                    return k
        return None


# ---------------------------------------------------------------- concept classes
def cube(n):
    return list(itertools.product((0, 1), repeat=n))


def table(f, n):
    return tuple(int(bool(f(x))) for x in cube(n))


def dictators(n):
    return Cls(2 ** n, [table(lambda x, i=i: x[i], n) for i in range(n)])


def monotone_conjunctions(n):
    cs = []
    for T in itertools.product((0, 1), repeat=n):
        cs.append(table(lambda x, T=T: all(x[i] for i in range(n) if T[i]), n))
    return Cls(2 ** n, cs)


def conjunctions(n):
    """conjunctions of literals (each variable absent, positive or negated), plus the constant-false concept."""
    cs = []
    for T in itertools.product((0, 1, 2), repeat=n):  # 0 absent, 1 positive, 2 negated
        cs.append(table(lambda x, T=T: all((T[i] == 0) or (T[i] == 1 and x[i]) or (T[i] == 2 and not x[i]) for i in range(n)), n))
    cs.append(tuple([0] * 2 ** n))
    return Cls(2 ** n, cs)


def juntas(n, k):
    cs = set()
    for S in itertools.combinations(range(n), k):
        for bits in itertools.product((0, 1), repeat=2 ** k):
            cs.add(tuple(bits[sum(x[S[j]] << j for j in range(k))] for x in cube(n)))
    return Cls(2 ** n, cs)


def all_boolean(n):
    return Cls(2 ** n, itertools.product((0, 1), repeat=2 ** n))


def monotone_dnf(n, maxterms):
    """monotone DNF with at most maxterms terms (terms = nonempty sets of variables)."""
    terms = [T for r in range(1, n + 1) for T in itertools.combinations(range(n), r)]
    cs = {tuple([0] * 2 ** n)}
    for r in range(1, maxterms + 1):
        for ts in itertools.combinations(terms, r):
            cs.add(table(lambda x, ts=ts: any(all(x[i] for i in T) for T in ts), n))
    return Cls(2 ** n, cs)
