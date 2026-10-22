import numpy as np
rng=np.random.default_rng(0)
R=4000; T=2000; c=20.0
def run(fF, fG, label, truth='G'):
    hits=0; times=[]
    for r in range(R):
        p=rng.uniform(0.1,0.9,T)
        x=(rng.uniform(size=T)<p).astype(float)
        f=fF(p); g=fG(p)
        lr=np.cumsum(np.log(np.where(x==1,g,1-g))-np.log(np.where(x==1,f,1-f)))
        idx=np.argmax(lr>=np.log(c))
        if lr.max()>=np.log(c):
            hits+=1; times.append(idx+1)
    t=np.median(times) if times else None
    print(f"{label}: P(refuted by factor {c:.0f} within {T}) = {hits/R:.3f}; median time {t}")
truthful=lambda p:p
coarse=lambda p:np.clip(np.round((p-0.1)/0.2)*0.2+0.1,0.1,0.9)  # knows p to nearest 0.2 grid
coarse=lambda p:(np.floor((p-0.1)/0.2).clip(0,3)*0.2+0.2)          # bin centre of 4 bins
noisy=lambda p:np.clip(p+rng.uniform(-0.05,0.05,p.shape),0.01,0.99)
base=lambda p:np.full_like(p,0.5)
run(truthful,base,"truthful F vs base-rate G (Ville: <=0.05)")
run(coarse,truthful,"coarse expert (4 bins) vs truthful G")
run(noisy,truthful,"near-expert (+-0.05 noise) vs truthful G")
run(noisy,coarse,"near-expert vs coarse-expert G")
run(coarse,noisy,"coarse expert vs near-expert G")
run(base,coarse,"base-rate F vs coarse-expert G")
# mixture parasite: forecasts Bayes mixture of pool {truthful, base} with w=1/2 each; refuted by truthful?
def mix_run():
    hits=0
    for r in range(R):
        p=rng.uniform(0.1,0.9,T); x=(rng.uniform(size=T)<p).astype(float)
        lw=np.log([0.5,0.5]); lr=0; mx=-1e9
        for t in range(T):
            fs=np.array([p[t],0.5]); w=np.exp(lw-lw.max()); w/=w.sum()
            m=(w*fs).sum()
            lik=np.where(x[t]==1,fs,1-fs)
            lr+=np.log(lik[0])-np.log(m if x[t]==1 else 1-m)
            mx=max(mx,lr); lw+=np.log(lik)
        hits+= mx>=np.log(c)
    print(f"mixture parasite (w=1/2) vs truthful: P(refuted by factor {c:.0f}) = {hits/R:.3f} (bound: never, since LR<=2)")
R=500; mix_run()
