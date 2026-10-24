"""Find a phrase in the published B&H text (whitespace/hyphen-insensitive) and print page number + context."""
import re, sys
t = open('/mnt/user-data/outputs/fiction-paper/research/texts/bh2025-published.txt').read()
pages = t.split('\f')
def pno(pg):
    for line in pg.splitlines():
        s = line.strip()
        if re.fullmatch(r'\d{3}', s): return s
    return '?'
def norm(s):
    s = re.sub(r'Downloaded from .*?2026', ' ', s)
    s = s.replace('­','')
    s = re.sub(r'-\s*\n\s*', '', s)
    return re.sub(r'\s+', ' ', s)
for q in sys.argv[1:]:
    nq = re.sub(r'\s+', ' ', q)
    found = False
    for i, pg in enumerate(pages):
        n = norm(pg)
        j = n.lower().find(nq.lower())
        if j >= 0:
            found = True
            print(f"== p.{pno(pg)} :: ...{n[max(0,j-200):j+len(nq)+300]}...\n")
    if not found: print(f"!! NOT FOUND: {q}\n")
