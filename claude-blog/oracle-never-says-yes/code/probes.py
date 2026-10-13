"""Single-feature-flip membership probes: start from a positive case, flip each feature, record which flips change the verdict.
Works for conjunctions (n probes); fails for disjunctions of two conjunctions when the start case satisfies both (masking)."""
import itertools, random
def probe_relevant(f, x0):
    rel = []
    for i in range(len(x0)):
        y = list(x0); y[i] ^= 1
        if f(tuple(y)) != f(tuple(x0)): rel.append(i)
    return set(rel)
n = 6
conj = {0, 2, 3}
f1 = lambda x: all(x[i] for i in conj)
x0 = tuple([1]*n)
print("conjunction {0,2,3}: probes find", sorted(probe_relevant(f1, x0)), "in", n, "queries")
A, B = {0, 1}, {2, 3}
f2 = lambda x: all(x[i] for i in A) or all(x[i] for i in B)
print("DNF (x0&x1)|(x2&x3), start all-ones: probes find", sorted(probe_relevant(f2, x0)), "(true relevant features: 0,1,2,3)")
x1 = (1,1,0,0,0,0)
print("same DNF, start (1,1,0,0,0,0): probes find", sorted(probe_relevant(f2, x1)), "(features 2,3 invisible from this start)")
