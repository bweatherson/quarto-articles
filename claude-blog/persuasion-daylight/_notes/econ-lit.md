# Annotated bibliography: the economics of selection vs. design in persuasion

Compiled 2026-09-29. Every citation below was checked against a publisher, RePEc, or author page unless marked otherwise. Items I could not verify are flagged as such. One fetch failed: the arXiv HTML of "Robust/Ex-Ante Design of Persuasion Games" (2312.02465) was refused by the fetch proxy (HTTP 429), so that item is described only from search-result snippets.

Notation used throughout: μ = prior on the sender-favoured state; t = receiver's acceptance threshold (act iff posterior ≥ t).

---

## 1. Bayesian persuasion (design)

### Kamenica, Emir, and Matthew Gentzkow. 2011. "Bayesian Persuasion." *American Economic Review* 101(6): 2590–2615. DOI: 10.1257/aer.101.6.2590

**What it shows.** A sender who cannot lie and cannot hide results, but who commits *before* the state is realised to a signal structure (an "experiment") π(·|ω) that the receiver observes in full, can nonetheless move a Bayesian receiver's action in the sender's favour. The fully rational receiver knows π, sees the realisation, and updates correctly; her beliefs are calibrated in expectation (posteriors are a mean-preserving spread of the prior: the "Bayes-plausibility" constraint). The sender's problem reduces to choosing a Bayes-plausible distribution over posteriors.

**Main theorem (concavification).** Let v̂(μ) be the sender's expected payoff when the receiver holds belief μ and best-responds. Let V be the concave closure of v̂ (the smallest concave function everywhere ≥ v̂). Then the value of the optimal experiment is V(μ₀), and "Sender benefits from persuasion if and only if V(μ₀) > v̂(μ₀)" (Corollary 2). Proposition 4 gives a sufficient condition: the sender benefits when (i) there is information she would like the receiver to have and (ii) the receiver's preference is "discrete at the prior" (the default action is not knife-edge). For finite action spaces the optimal signal has the structure: whenever the receiver takes the sender's least-preferred action she is certain of the state; every other realisation leaves her exactly indifferent between the action she takes and the next-worse one, i.e. the sender induces the "worst beliefs consistent with a given action."

**The prosecutor example (Section I).** Prior Pr(guilty) = 0.3. The judge gets 1 for a correct verdict and 0 otherwise, so convicts iff posterior ≥ 0.5. The prosecutor gets 1 for conviction regardless of guilt. The uniquely optimal investigation is binary: π(g | guilty) = 1, π(g | innocent) = 3/7 (so π(i | innocent) = 4/7). After g the posterior is exactly 0.5; after i it is 0. Conviction occurs with probability 0.3 + 0.7·(3/7) = 0.6, although 70% of defendants are innocent. The judge is fully informed about the procedure and fully rational; her beliefs remain calibrated but her decision is moved.

**Bearing on the thesis.** This is the "design retains its power" half of the thesis, stated with the strongest possible receiver: full knowledge of the process, full rationality. Note the general binary-state/binary-action formula that follows from the "worst beliefs" property. With prior μ < t, the sender sets π(g | favourable) = 1 and π(g | unfavourable) = q with μ/(μ + (1−μ)q) = t, i.e. q = μ(1−t)/[(1−μ)t]; the receiver acts with probability μ/t, and her probability of a correct decision is μ + (1−μ)(1−q) = 1 − μ(1−t)/t. With μ = 0.3, t = 0.5 this gives 0.7 (she is wrong in exactly the 0.3 mass of innocents convicted). So the formula in the thesis is a one-line corollary of KG's binary case; see §6 for whether it appears explicitly anywhere.

### Kamenica, Emir. 2019. "Bayesian Persuasion and Information Design." *Annual Review of Economics* 11: 249–272. DOI: 10.1146/annurev-economics-080218-025739

**What it shows.** Survey of the post-2011 literature: the belief-based approach, applications (grading, traffic, bank stress tests), multiple senders, multiple receivers, dynamic persuasion, privately informed receivers, computational aspects. Emphasises that restricting information can improve the sender's outcome "despite full rationality" of the receiver. The abstract page I fetched does not indicate a section on receiver-side commitment; I did not see one in the table of topics.

**Bearing on the thesis.** Useful as the canonical survey citation and as evidence that receiver commitment is *not* one of the standard extensions in the core literature (it sits instead in the law-and-economics and evidence-games literature; see §6).

### Bergemann, Dirk, and Stephen Morris. 2019. "Information Design: A Unified Perspective." *Journal of Economic Literature* 57(1): 44–95. DOI: 10.1257/jel.20181489

**What it shows.** Unifies Bayesian persuasion, communication in games, and robust predictions under the heading of "information design": the designer chooses an information structure, and the set of implementable outcomes is characterised by Bayes correlated equilibrium (an obedience constraint). Gives both the "literal" (an actual designer) and "metaphorical" (analyst characterising all information structures) readings.

**Bearing on the thesis.** Provides the vocabulary in which "design" is a choice of Blackwell experiment and shows the framework generalises far beyond one sender and one receiver. The obedience-constraint formulation is also the natural place to state a receiver who commits: she is then the "designer" of an action rule and the sender chooses the experiment subject to it.

---

## 2. Verifiable disclosure and unravelling (selection)

### Grossman, Sanford J. 1981. "The Informational Role of Warranties and Private Disclosure about Product Quality." *Journal of Law and Economics* 24(3): 461–483. DOI: 10.1086/466995

**What it shows.** A seller who knows quality and can make verifiable (non-falsifiable) statements, with disclosure costless, discloses fully in equilibrium: buyers treat silence as the worst possible news, so every type above the worst strictly prefers to disclose, and the market "unravels" to full revelation.

**Bearing on the thesis.** The original unravelling result: a receiver who conditions on the *fact* of non-disclosure neutralises selective silence.

### Milgrom, Paul R. 1981. "Good News and Bad News: Representation Theorems and Applications." *Bell Journal of Economics* 12(2): 380–391. (JSTOR 3003562)

**What it shows.** Introduces the monotone-likelihood-ratio (MLRP) notion of "good news," proves representation theorems, and applies them to a persuasion game in which an interested party holds verifiable information and chooses what to reveal. With a sceptical receiver who assumes withheld information is the worst consistent with what was shown, the sender reveals everything: the "persuasion game" unravels.

**Bearing on the thesis.** Together with Grossman, the canonical statement that *selection* of which true results to pass on is neutralised when the receiver reasons about the process. Milgrom's "sceptical" receiver is exactly the receiver who conditionalises on the generating process.

### Milgrom, Paul, and John Roberts. 1986. "Relying on the Information of Interested Parties." *RAND Journal of Economics* 17(1): 18–32.

**What it shows.** Extends unravelling to settings with competing interested parties and a less sophisticated decision-maker. Key result: if the decision-maker is sceptical (assumes the worst about what is not shown), full revelation obtains even with one sender; with competing senders whose interests are opposed, full revelation can obtain even if the decision-maker is naive, because each side reveals what the other hides. Also shows how a strategically sophisticated decision-maker can extract information by adopting the sceptical stance.

**Bearing on the thesis.** Provides the two routes by which selection is neutralised: receiver scepticism (the thesis's route) or adversarial competition (see §5). The naive/sceptical contrast anticipates the cursed-receiver point in §3.

### Dye, Ronald A. 1985. "Disclosure of Nonproprietary Information." *Journal of Accounting Research* 23(1): 123–145.

**What it shows.** If the receiver is uncertain whether the sender *has* any information, unravelling fails: silence pools the uninformed with the informed-with-bad-news, so bad types can hide behind "I had nothing to report." Equilibrium is a threshold: disclose iff news is above a cutoff.

**Bearing on the thesis.** Identifies the crucial condition for the thesis's "selection is neutralised" claim: the receiver must know (or be able to infer) that results exist. When the receiver does not know how many experiments were run, selection regains some power. This is the mechanism exploited by Dai–Fudenberg–Pei and Arieli–Stewart in §8.

### Jung, Woon-Oh, and Young K. Kwon. 1988. "Disclosure When the Market Is Unsure of Information Endowment of Managers." *Journal of Accounting Research* 26(1): 146–153.

**What it shows.** Formalises and generalises Dye's point: with probability p the manager is informed; the market cannot distinguish "uninformed" from "informed and silent"; the unique equilibrium is a disclosure threshold that rises with p (as it becomes more likely the sender is informed, silence is punished more and the threshold approaches the unravelling limit).

**Bearing on the thesis.** Gives the comparative static that matters for the thesis: unravelling is the limit as the receiver becomes sure that evidence exists. Selection is neutralised *only* when the receiver knows the experiment count; a pre-registration regime is precisely a device for making p → 1.

### Milgrom, Paul. 2008. "What the Seller Won't Tell You: Persuasion and Disclosure in Markets." *Journal of Economic Perspectives* 22(2): 115–131. DOI: 10.1257/jep.22.2.115

**What it shows.** Non-technical survey of the disclosure literature: unravelling, its failure conditions (disclosure costs, uncertainty about whether the sender is informed, unsophisticated receivers, multidimensional information), and the role of mandatory-disclosure law.

**Bearing on the thesis.** The best single survey citation for §2; it also lists the naive-receiver case, which connects to §3.

---

## 3. Cursed equilibrium

### Eyster, Erik, and Matthew Rabin. 2005. "Cursed Equilibrium." *Econometrica* 73(5): 1623–1672. DOI: 10.1111/j.1468-0262.2005.00631.x

**What it shows.** A solution concept in which players correctly predict the *distribution* of others' actions but underestimate (fully cursed: ignore) the correlation between others' actions and others' private information. A χ-cursed player puts weight χ on the belief that others' actions are type-independent and 1−χ on the correct conditional. Explains the winner's curse in common-value auctions and trade in adverse-selection settings where standard theory predicts no trade.

**How it applies to selection.** In a disclosure game the sender's *action* (which results to pass on) is a function of her *private information* (the full set of results). A receiver who updates on the content of what she is shown but treats the act of showing it as uninformative — who does not ask "what does the fact that I was shown this, and not something else, tell me?" — is exactly a fully cursed receiver in Eyster–Rabin's sense: she takes the disclosure as if it were drawn independently of the undisclosed evidence. The unravelling argument of §2 requires χ = 0. Note the asymmetry with design: in KG the sender's choice of experiment is made *before* she has any private information, so there is no type–action correlation to be cursed about; the KG receiver is fully uncursed and is still moved. This is the cleanest way to say why selection and design differ.

---

## 4. Research, approval, and persuasion

### Henry, Emeric. 2009. "Strategic Disclosure of Research Results: The Cost of Proving Your Honesty." *Economic Journal* 119(539): 1036–1064. DOI: 10.1111/j.1468-0297.2009.02265.x

**What it shows.** A biased sender runs experiments (costly) and can verifiably disclose a selected subset; the receiver does not observe how many were run. To persuade, the sender must sometimes reveal unfavourable results to establish credibility ("the cost of proving your honesty"). The need to prove honesty dampens the incentive to do research.

**Bearing on the thesis.** Directly models "selection" with a receiver who is uncertain about the number of trials (the Dye/Jung–Kwon condition) and shows the sender's residual power is bought at the cost of partial self-incrimination. Supports the claim that selection is largely, though not perfectly, neutralised by a process-conditioning receiver.

### Henry, Emeric, and Marco Ottaviani. 2019. "Research and the Approval Process: The Organization of Persuasion." *American Economic Review* 109(3): 911–955. DOI: 10.1257/aer.20171919

**What it shows.** An informer sequentially collects costly evidence (a Brownian signal) to persuade an evaluator to approve. The welfare benchmark is Wald's sequential-test solution for a single statistician whose payoff is the sum of both parties'. The paper compares organisational arrangements differing in *who has authority and who can commit*: informer authority; evaluator authority without commitment (evaluator decides after seeing the evidence); evaluator with commitment to an approval standard (the regulatory case, e.g. FDA). Informer authority is socially optimal when information acquisition is sufficiently costly.

**Bearing on the thesis.** This is the closest published treatment of "receiver commits to a demanding standard, sender then chooses how much evidence to generate." The evaluator-commitment case is a dynamic version of the thesis's threshold commitment. The paper's emphasis is on the *cost* of research (too demanding a standard kills research), which is the natural objection to the thesis's claim that a demanding t is good for the receiver: it is good only when the sender's experimentation is costless or the receiver internalises no research cost.

### Di Tillio, Alfredo, Marco Ottaviani, and Peter Norman Sørensen. 2017. "Persuasion Bias in Science: Can Economics Help?" *Economic Journal* 127(605): F266–F304. DOI: 10.1111/ecoj.12515

**What it shows.** Models three manipulations of an RCT by a researcher who wants approval: *selective sampling* (choosing favourable sites/subjects after learning about them; threatens external validity), *selective assignment* (non-random allocation to treatment; threatens internal validity), and *selective reporting* (run several, report the best). A rational evaluator anticipates the manipulation and raises the acceptance threshold. The welfare effects differ by manipulation: for a demanding evaluator, selective assignment can *help* (it reduces noise in the treatment–control comparison) while selective sampling harms. Registration is mentioned only in a closing footnote as a policy avenue.

**Bearing on the thesis.** The most explicit economics contrast between "choosing what to report" and "choosing how the experiment is done," and it shows that even against a rational evaluator who adjusts her threshold, design-side manipulations (sampling/assignment) have non-trivial and sign-ambiguous welfare effects, whereas reporting-side manipulation is discounted. Directly relevant to §8.

### Di Tillio, Alfredo, Marco Ottaviani, and Peter Norman Sørensen. 2021. "Strategic Sample Selection." *Econometrica* 89(2): 911–953. DOI: 10.3982/ECTA17288

**What it shows.** Is a sample consisting of the k highest draws from a larger presample more or less informative than a random sample of size k, for a decision-maker who knows the selection occurred? Answer depends on the data distribution: selection always benefits (harms) the evaluator when the reverse hazard rate is log-supermodular (log-submodular). Applications: auctions (winning bids become less informative as bidders increase), jury selection, experimental design.

**Bearing on the thesis.** Shows that known selection is not simply "neutralised": the receiver corrects for it, but the corrected evidence can be Blackwell-better or Blackwell-worse than unselected evidence. This qualifies the thesis's "selection is neutralised" claim: neutralised as to *bias*, not as to *informativeness*.

### Felgenhauer, Mike, and Elisabeth Schulte. 2014. "Strategic Private Experimentation." *American Economic Journal: Microeconomics* 6(4): 74–105. DOI: 10.1257/mic.6.4.74

**What it shows.** An agent privately runs a sequence of costly imperfect experiments and can conceal unfavourable ones. Persuasion is possible if signal precision is high enough (the agent shows many favourable signals), but if the number of transmissible signals is capped and the agent's stakes are high, persuasion is impossible.

**Bearing on the thesis.** Selection with hidden experiment count; the receiver's scepticism scales with the sender's stakes, which is the unravelling logic in a sequential setting.

### Felgenhauer, Mike, and Petra Loerke. 2017. "Bayesian Persuasion with Private Experimentation." *International Economic Review* 58(3): 829–856. DOI: 10.1111/iere.12237

**What it shows.** Sender designs each experiment in a sequence contingent on past results, privately, and selectively reveals. Compared with public experimentation (KG-style commitment), private experimentation yields a lower persuasion probability and better information for the receiver, and receiver decision quality improves as sender stakes rise.

**Bearing on the thesis.** Explicitly combines design and selection and finds that removing the receiver's ability to observe the process *helps* the receiver relative to public design. This is a striking corollary of the thesis: public, observed design (KG) is the sender's best case; hidden selection is worse for the sender because it unravels.

### Felgenhauer, Mike. 2021. "Experimentation and Manipulation with Preregistration." *Games and Economic Behavior* 130: 400–408. DOI: 10.1016/j.geb.2021.09.002

**What it shows.** Pre-registration (documenting the plan before running the study) deters p-hacking/selective reporting but, in the model, can induce more outright fabrication.

**Bearing on the thesis.** The only paper I found in this cluster that treats pre-registration as a commitment device formally. It supports the thesis's implicit claim that pre-registration kills selection, while warning that it does nothing about design (and may shift manipulation elsewhere).

### Libgober, Jonathan. 2022. "False Positives and Transparency." *American Economic Journal: Microeconomics* 14(2): 478–505. DOI: 10.1257/mic.20190218

**What it shows.** A sender chooses a multidimensional experiment; the receiver sees the outcome but not necessarily all dimensions of the design. Surprisingly, the receiver may prefer some design dimensions to stay hidden, even bias-relevant ones, because the sender then compensates on the observable dimension.

**Bearing on the thesis.** A design-side result: full transparency about the *process* is not always in the receiver's interest. This cuts against the intuition that the thesis's process-conditioning receiver is always better off knowing more about the design.

### Lou, Yichuan. 2023. "Private Experimentation, Data Truncation, and Verifiable Disclosure." arXiv:2305.04231; SSRN 4440316. (Working paper; not verified as published.)

**What it shows.** Sender runs private sequential experiments and can verifiably disclose individual outcomes but not that all outcomes were disclosed. The dynamic problem reduces to a static one in which the sender chooses a single signal from a restricted set, solved by concavification over that set.

**Bearing on the thesis.** Shows that hidden selection over a designed sequence is equivalent to a constrained design problem; useful if the paper wants to say that selection is a *special case* of design once the receiver conditions on the process.

---

## 5. Competition among senders

### Gentzkow, Matthew, and Emir Kamenica. 2017. "Competition in Persuasion." *Review of Economic Studies* 84(1): 300–322. DOI: 10.1093/restud/rdw052

**What it shows.** Multiple senders simultaneously choose experiments about a common state. The effect of competition on information is ambiguous in general. There is a condition on the information environment (each sender can generate any signal that is "Blackwell-connected" to what the others generate — in the published paper the condition is on the set of available signals, not on preferences) that is necessary and sufficient for every equilibrium to be no less informative than the collusive outcome, for every profile of preferences; the same condition governs whether adding senders or making preferences less aligned increases revelation.

**Bearing on the thesis.** Competition is the classic alternative to receiver scepticism for neutralising selection (Milgrom–Roberts 1986). For *design*, GK show that competition helps only under a richness condition; with limited signal spaces, adding a sender can reduce information. So the thesis's receiver-commitment route is not dominated by the "just add an opposing sender" route.

### Gradwohl, Ronen, Niklas Hahn, Martin Hoefer, and Rann Smorodinsky. 2022. "Reaping the Informational Surplus in Bayesian Persuasion." *American Economic Journal: Microeconomics* 14(4): 296–317. DOI: 10.1257/mic.20200399

**What it shows.** Multiple senders commit to signals; the receiver then chooses *one* sender to consult at the interim stage. Whenever senders are uncertain about each other's preferences (cannot rule out that a rival is aligned with the receiver), the receiver obtains all the informational surplus in every equilibrium.

**Bearing on the thesis.** Despite the title, this is a multi-sender result, not a receiver-commitment result. It is nonetheless a second route by which a receiver "recovers the informational surplus," via choice among senders rather than a threshold.

---

## 6. Receiver commitment: what is known

Summary answer: I found no paper that states the formula 1 − μ(1−t)/t, or the claim that a receiver committing to threshold t forces the KG sender's optimal experiment to have false-positive rate μ(1−t)/[(1−μ)t] and thus receiver correctness 1 − μ(1−t)/t. The formula is, however, an immediate consequence of KG's binary-case characterisation (§1), and the qualitative point — that a receiver who can precommit to a demanding acceptance rule extracts more information from an interested party — is established in several adjacent literatures. Two cautions for the paper: (a) in the pure KG binary model with costless experimentation, t = 1 gives the receiver *full* information (the sender's best response to t = 1 is the fully revealing experiment, which still yields her μ > 0), so "nearly fully informative" is only needed if t < 1 is imposed for tie-breaking reasons, if experimentation is costly, or if the state space is richer; (b) the same commitment is worthless against *selection* (Hart–Kremer–Perry below), which is a nice asymmetry for the paper to exploit.

### Glazer, Jacob, and Ariel Rubinstein. 2004. "On Optimal Rules of Persuasion." *Econometrica* 72(6): 1715–1736. DOI: 10.1111/j.1468-0262.2004.00551.x

**What it shows.** A listener commits to a "persuasion rule": a message space, which aspect of the speaker's claim to verify, and an accept/reject rule. The speaker knows the state (two aspects; the listener can check only one). The listener's optimal rule minimises the probability of error and can be found by linear programming; the optimal mechanism is deterministic and does not require randomisation.

**Bearing on the thesis.** The founding "receiver commits to a rule" paper. It is about a sender who *already has* the evidence (a disclosure/verification game), so it concerns selection, not design. The listener's commitment matters here only because verification is limited.

### Glazer, Jacob, and Ariel Rubinstein. 2006. "A Study in the Pragmatics of Persuasion: A Game Theoretical Approach." *Theoretical Economics* 1(4): 395–410. (Citation from memory; the PhilPapers record confirms the paper exists but I did not fetch the journal page.)

**What it shows.** Listener commits to a rule mapping arguments to accept/reject and can verify one fact; characterises the optimal rule and shows it can be implemented without commitment in some cases.

**Bearing on the thesis.** Companion to the 2004 paper; same caveat that it is a disclosure setting.

### Hart, Sergiu, Ilan Kremer, and Motty Perry. 2017. "Evidence Games: Truth and Commitment." *American Economic Review* 107(3): 690–713. DOI: 10.1257/aer.20150913 (volume/pages from the AEA record; the Hart page I fetched gives only the abstract).

**What it shows.** In an evidence game (an informed agent chooses which verifiable pieces of evidence to disclose; the principal chooses a reward), under natural conditions on the evidence structure and the "prominence of truth," the outcome when the principal *commits* to a reward rule before disclosure coincides with the equilibrium outcome without commitment. Receiver commitment has no value in disclosure games.

**Bearing on the thesis.** This is the exact counterpart of the thesis's commitment claim on the selection side: against a sender who chooses which existing results to show, the receiver gains *nothing* from committing to a threshold, because her sceptical best response already does the work (unravelling). Against a sender who chooses the experiment, commitment strictly helps. This asymmetry is worth stating as a theorem-pair in the paper.

### Sanchirico, Chris William. 1997. "The Burden of Proof in Civil Litigation: A Simple Model of Mechanism Design." *International Review of Law and Economics* 17(3): 431–447. DOI: 10.1016/S0144-8188(97)00020-3

**What it shows.** An optimally designed tribunal, facing limited resources and uncertainty about case strength, "precommit[s] to a recovery policy in which plaintiffs recover nothing unless they prove their cases with a threshold degree of certainty." The threshold is derived as the solution to a mechanism-design problem rather than assumed.

**Bearing on the thesis.** The earliest law-and-economics statement I found of "the receiver's threshold is a commitment device that disciplines the evidence the sender brings." It does not use the KG apparatus and does not compute the receiver's correctness.

### Demougin, Dominique, and Claude Fluet. 2006. "Preponderance of Evidence." *European Economic Review* 50(4): 963–976.

**What it shows.** Under adversarial evidence production, the preponderance standard (t = 1/2) maximises deterrence/accuracy when evidence is costly and parties choose how much to produce.

**Bearing on the thesis.** A competing normative benchmark: with costly and *adversarial* evidence production, the optimal standard is 1/2, not "as high as possible." The thesis's demanding-t result therefore depends on evidence being free for the sender and on there being one sender.

### Kaplow, Louis. 2012. "Burden of Proof." *Yale Law Journal* 121(4): 738–859.

**What it shows.** Normative analysis of the standard of proof in terms of deterrence and chilling of desirable conduct rather than error-cost minimisation; argues that the conventional "probability threshold" framing is the wrong object and that the optimal standard depends on how it changes the behaviour that generates cases.

**Bearing on the thesis.** Background for the claim that the acceptance threshold should be chosen for its effect on upstream behaviour (here, the sender's experiment choice), which is the thesis's logic transplanted to law.

### Ichihashi, Shota. 2019. "Limiting Sender's Information in Bayesian Persuasion." *Games and Economic Behavior* 117: 276–288. DOI: 10.1016/j.geb.2019.07.005 (journal details from the ScienceDirect record; the working-paper version is Bank of Canada WP 2019-10.)

**What it shows.** A designer (possibly the receiver) can restrict the most informative signal available to the sender before the KG game. With binary receiver action, the implementable payoff pairs are characterised; the receiver-optimal restriction coincides with the outcome of the "flipped" game in which the receiver persuades the sender. Key negative result: "whenever Sender prefers one action uniformly across all states, restricting information produces no impact on Receiver's payoff."

**Bearing on the thesis.** A different receiver-side lever (restrict the sender's information) that *fails* precisely in the prosecutor case (state-independent sender preferences), whereas the thesis's threshold commitment succeeds there. Good contrast.

### Yamashita, Takuro, and Shuguang Zhu. 2022. "Bayesian Persuasion Followed by Receiver's Mechanism Design." Working paper, 6 August 2022 (fetched from a SAET conference upload; not verified as published).

**What it shows.** After observing the sender's public KG signal, the receiver designs a screening mechanism to elicit the sender's remaining private information. Public and private signals are substitutes; the receiver's payoff is highest when she can design the mechanism and lowest under plain Bayesian persuasion; both parties can be better off.

**Bearing on the thesis.** Receiver-side commitment *after* the experiment (to a mechanism) rather than before (to a threshold). Confirms the general point that giving the receiver a commitment instrument reduces the sender's persuasion rents.

### Hancart, Nathan. 2025. "The (No) Value of Commitment." arXiv:2510.07994. (Working paper.)

**What it shows.** A sufficient condition under which a principal gains nothing from committing to a mechanism: the agent's strategy set is limited and the principal's objective is continuous in the mechanism.

**Bearing on the thesis.** Generalises the Hart–Kremer–Perry "no value of commitment" logic; may help state exactly why commitment is worthless against selection but valuable against design (the KG sender's strategy set, the set of all experiments, is rich).

### Not found

Searches for "Bayesian persuasion" + "receiver commitment" / "committed receiver" / "standard of proof" returned no paper in which a single receiver commits ex ante to a posterior threshold against a KG sender and the receiver's resulting accuracy is computed. The nearest items are Henry–Ottaviani 2019 (evaluator commitment to an approval standard, with costly sequential research) and the legal standard-of-proof papers above. The "Robust/Ex-Ante Design of Persuasion Games" arXiv paper (2312.02465) may be relevant — its title suggests a designer choosing rules before the persuasion game — but the fetch was rate-limited and I could not read it; treat as unverified.

---

## 7. Narratives and heterogeneous audiences

### Eliaz, Kfir, and Ran Spiegler. 2026. "News Media as Suppliers of Narratives (and Information)." *Theoretical Economics* 21: 928–972. (arXiv:2403.09155, March 2024.)

**What it shows.** Media supply both signals (Blackwell experiments about the state) and narratives (causal models saying which variables cause outcomes: true, empowering, fatalistic, denial). Consumers maximise anticipatory utility. A monopolist pairs optimistically skewed signals with empowering narratives; with heterogeneous consumers the optimal menu polarises beliefs; competition can improve information yet harm some consumers.

**Bearing on the thesis.** Introduces a third instrument beyond selection and design: the *interpretive model* applied to the evidence. Worth a sentence to delimit the thesis's scope (it holds the receiver's causal model fixed).

### Alonso, Ricardo, and Odilon Câmara. 2016. "Persuading Voters." *American Economic Review* 106(11): 3590–3605. DOI: 10.1257/aer.20140737

**What it shows.** A politician designs a public experiment to persuade voters with *common* priors but heterogeneous preferences under a voting rule. Under non-unanimous rules she targets different winning coalitions with different realisations; under simple majority a majority of voters can be strictly worse off than with no information.

**Bearing on the thesis.** Shows the KG "beliefs calibrated, decisions moved" effect survives aggregation and can make the median voter worse off.

### Alonso, Ricardo, and Odilon Câmara. 2016. "Bayesian Persuasion with Heterogeneous Priors." *Journal of Economic Theory* 165: 672–706. DOI: 10.1016/j.jet.2016.07.006 (DOI/pages from the ScienceDirect record; abstract not separately fetched).

**What it shows.** When sender and receiver have different priors, the sender can profit from designing experiments that exploit the disagreement; characterises when the sender benefits and how the optimal experiment depends on prior heterogeneity.

**Bearing on the thesis.** The heterogeneous-priors variant the query asked about is this JET paper, not "Persuading Voters." Its relevance is to show that design's power does not depend on common priors.

---

## 8. Papers explicitly contrasting result-selection with design

### Dai, Yifan, Drew Fudenberg, and Harry Pei. 2025. "Bayesian Persuasion with Selective Disclosure." Working paper, 7 November 2025 (fetched from Pei's Northwestern page; an earlier version circulated as "Persuasion without Commitment" on Fudenberg's MIT page).

**What it shows.** The sender publicly commits to an initial experiment (design), then may secretly run up to T additional experiments and disclose a chosen subset (selection), where T is private information. If the KG-optimal experiment induces only "credible" beliefs (posteriors at which the sender cannot gain by revealing more), the sender attains the full commitment payoff regardless of the distribution of T. If it induces a non-credible belief, there is an open set of T-distributions under which the sender's payoff in every equilibrium is bounded strictly below the KG value. With T concentrated, near-KG payoffs are restored; with unbounded T, equilibria exist in which the sender gets only the full-disclosure payoff.

**Bearing on the thesis.** The most direct economic treatment of selection-on-top-of-design. It supports the thesis in the following form: the ability to select, when the receiver conditions on the process, never helps the sender beyond the design value and can hurt her, because it makes designed posteriors non-credible.

### Arieli, Itai, and Colin Stewart. 2025. "Bayesian Persuasion without Commitment." arXiv:2511.18662. (Working paper.)

**What it shows.** A sender with no commitment privately runs experiments and verifiably discloses a subset; the receiver does not know the sender's experimental capacity. The sender can achieve the full-commitment KG payoff.

**Bearing on the thesis.** A cautionary result: when the receiver does not know how many experiments could have been run (the Dye/Jung–Kwon failure of unravelling), selection can replicate design. The thesis's "selection is neutralised" claim needs the receiver to know the process, including the number of trials. Read together with Dai–Fudenberg–Pei, the two papers bracket the case.

### Fréchette, Guillaume R., Alessandro Lizzeri, and Jacopo Perego. 2022. "Rules and Commitment in Communication: An Experimental Analysis." *Econometrica* 90(5): 2283–2318. DOI: 10.3982/ECTA18585

**What it shows.** A framework nesting cheap talk, verifiable disclosure, and Bayesian persuasion by two parameters: whether messages are verifiable and whether the sender commits (probability ρ) before learning the state. Theory: with verifiable information, commitment *reduces* information transmitted (a committed sender designs a garbling; an uncommitted verifiable sender unravels); with unverifiable information, commitment *increases* it. Experiment: qualitative predictions confirmed, but about 30% of senders exhibit "commitment blindness."

**Bearing on the thesis.** This is the cleanest published statement of the thesis's core contrast in the economics literature: verifiable disclosure without commitment (selection) unravels to full information, whereas commitment to an experiment (design) lets the sender withhold. The paper also gives experimental evidence on how real subjects respond, which the philosophy paper can cite for the "fully rational receiver" idealisation.

### Degan, Arianna, et al. 2023. "An Experimental Investigation of Persuasion through Selective Disclosure of Evidence." *Canadian Journal of Economics* 56(?). DOI: 10.1111/caje.12695 (only the DOI and title verified; co-authors and pages not checked).

**What it shows.** Lab test of selective disclosure of verifiable evidence; examines whether receivers discount undisclosed evidence as unravelling predicts.

**Bearing on the thesis.** Behavioural evidence on whether real receivers are cursed in the §3 sense.

### Philosophy side

I did not find a philosophy paper that explicitly contrasts cherry-picking results with choosing experimental design as persuasion strategies against a rational receiver. The closest economics statements of the contrast are Di Tillio–Ottaviani–Sørensen 2017 (selective reporting vs. selective sampling/assignment) and Fréchette–Lizzeri–Perego 2022 (disclosure vs. commitment). If a philosophy citation is needed, the natural anchors are the total-evidence / selection-effect literature (e.g., discussions of the "fact of observation" as evidence), which I did not survey here.

---

## Items I could not verify or did not fetch

- Glazer & Rubinstein 2006, *Theoretical Economics* 1(4): 395–410: citation from memory; existence confirmed via PhilPapers, journal page not fetched.
- Alonso & Câmara 2016 JET: DOI and pages from the ScienceDirect listing; abstract not read.
- Ichihashi 2019 GEB: journal volume/pages from the ScienceDirect listing; I read the working-paper version.
- Hart, Kremer & Perry 2017 AER: volume/pages from the AEA listing; I read the abstract on Hart's page.
- Degan et al. 2023 CJE: co-authors and pages unchecked.
- "Robust/Ex-Ante Design of Persuasion Games," arXiv:2312.02465: fetch refused (HTTP 429); not read.
- Kaplow 2012: issue number (4) inferred from pagination; the journal page gives "121 Yale L.J. 738 (2012)".
