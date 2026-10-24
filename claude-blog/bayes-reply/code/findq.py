"""Find quotes in the published Meehan & Zhang PDF and report page numbers (journal pagination = pdf page + 284)."""
import subprocess, re, sys
PDF = '/mnt/user-data/outputs/bayes-reply/research/texts/mz-published.pdf'
def pages():
    n = int(re.search(r'Pages:\s+(\d+)', subprocess.run(['pdfinfo', PDF], capture_output=True, text=True).stdout).group(1))
    out = []
    for i in range(1, n+1):
        t = subprocess.run(['pdftotext', '-f', str(i), '-l', str(i), PDF, '-'], capture_output=True, text=True).stdout
        t = re.sub(r'Downloaded from http\S+ by MIT LIBRARIES user on \d+ \w+ \d+', ' ', t)
        out.append(t)
    return out
def norm(s):
    s = s.replace('’', "'").replace('‘', "'").replace('“', '"').replace('”', '"').replace('ﬁ', 'fi').replace('ﬂ', 'fl').replace('ﬀ', 'ff')
    s = re.sub(r'-\s*\n\s*', '', s)
    return re.sub(r'\s+', ' ', s)
P = [norm(p) for p in pages()]
for q in sys.argv[1:]:
    qn = norm(q)
    hits = [i for i, p in enumerate(P) if qn in p]
    if not hits:
        # try across page boundary
        hits = [f"{i}-{i+1}" for i in range(len(P)-1) if qn in P[i] + ' ' + P[i+1]]
    print(f"{q[:70]!r}: 0-based pdf index {hits} -> journal pp. {[ (int(str(h).split('-')[0])+285) for h in hits]}")
