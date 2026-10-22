import json,sys,urllib.request,urllib.parse,time
def q(s,rows=3,flt=None):
    url="https://api.crossref.org/works?rows=%d&query.bibliographic=%s"%(rows,urllib.parse.quote(s))
    if flt: url+="&filter="+flt
    req=urllib.request.Request(url,headers={'User-Agent':'bibcheck/1.0 (mailto:research@example.org)'})
    for t in range(3):
        try:
            d=json.load(urllib.request.urlopen(req,timeout=40)); break
        except Exception as e: time.sleep(2)
    else: print("FAIL",s); return
    for i in d['message']['items']:
        au="; ".join((a.get('family','')+", "+a.get('given','')) for a in i.get('author',[])[:4])
        yr=(i.get('published-print') or i.get('published-online') or i.get('issued') or {}).get('date-parts',[[None]])[0][0]
        print(" |",i.get('DOI'),"|",au,"|",yr,"|",(i.get('title') or [''])[0],"|",(i.get('container-title') or [''])[0],i.get('volume'),i.get('issue'),i.get('page'))
for s in sys.argv[1:]:
    print("Q:",s); q(s)
