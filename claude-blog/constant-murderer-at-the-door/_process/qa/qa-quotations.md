# QA: quotations, translations, page references, attributions

Paper checked: `process/qa/v3-as-reviewed.qmd` ("Constant's Key").
Sources used: Constant 1797 (OCR plus PDF scan; the printed page is the PDF page minus 4 throughout pp. 4–109, checked against running heads); Laboulaye 1872 vol. 1 (OCR running heads, checked against the Institut Coppet reprint of the 1815 text); AA 8:421–430, 8:275, 6:185–190; Timmermann 2025 (HTML page markers, with each footnote's page taken from where its reference falls in the main text).

## Must fix

1. **Wrong page: Laboulaye "(92–93 n. 1)" (§4).** The note is keyed on p. 91 ("…requis dans le colonel¹") and continues on p. 92. All three quoted phrases ("émané de l'autorité qui a droit de le donner", "formalités prescrites", "Un innocent peut être arrêté très-légalement, si on le soupçonne") are on **p. 92**. The note numbered 1 on p. 93 is a different note, on the law of 13 germinal an VI. → `[@Constant1872, 91–92 n. 1]`.
2. **Bare page numbers in §4 point to the wrong work.** Footnote 1 says that after it, bare page numbers mean Constant 1797, but "(129)", "(92–93 n. 1)" and "(93)" in §4 refer to Laboulaye 1872. Constant 1797 has no p. 129. → `[@Constant1872, 129]`, `[@Constant1872, 91–92 n. 1]`, `[@Constant1872, 93]`.
3. **"Chapter VIII, 'Des principes', begins with a definition" is false.** The chapter opens on p. 64 ("On a tant et si cruellement abusé du mot *principes*…"). The definition comes two pages later, on p. 66. The paper itself has just quoted p. 64, the chapter's first page, for "individual exceptions". → e.g. "Two pages into chapter VIII, 'Des principes', comes a definition:".
4. **The abstract misstates the premise Kant rejects.** The abstract says "the duty of truthfulness is owed to those with a right to it". Kant's πρῶτον ψεῦδος is "Die Wahrheit zu sagen ist eine Pflicht, **aber nur** gegen denjenigen, welcher ein Recht auf die Wahrheit hat" (8:425). → "owed **only** to those with a right to it", matching §1.
5. **Translation error at 6:190 n.** The original is "Aufrichtigkeit … muß man von jedem Menschen fordern **können**" ("one must be able to demand it of every human being"), not "must be demanded of every human being". → "Sincerity, Kant adds, is something 'one must be able to demand of every human being' (6:190 n.)".
6. **Date: "for reasons he had given three years before" (end of §3).** The letter is dated 16 December 1794 (Timmermann 44) and the pamphlet March 1797, a gap of about 2¼ years. Timmermann (43) says "two or so years later". → "two years before" or "in 1794".
7. **Misattribution through wording, §5: "the juridical argument Kant built on it".** "It" is Constant's premise. Kant built his juridical argument *against* that premise, not on it. → "the juridical argument Kant built against it" (or "Kant's juridical counter-argument").

## Should consider (minor)

- **"signed on 10 germinal year V".** The date conversion is correct (1 vendémiaire V = 22 Sept 1796, so 10 germinal V = 30 Mar 1797). But no signature or date is visible in this scan. The preface (PDF p. 5) breaks off at "Une loi posi-", and the following leaf is missing: PDF p. 6 shows only the table of contents bleeding through. The .bib says "Preface dated Hérivaux". Check a complete copy, and align the wording with the .bib: "whose preface is dated 10 germinal year V".
- **8:427 "well thought".** *Wohldenkend* means right-minded or well-meaning (Adelung: "edel denkend"). It is paired by *zugleich* with *richtig*, so the two words name different merits. → "well-meant (right-minded) and at the same time correct". The remark is strictly "über die Verschreiung solcher strenger … Grundsätze", i.e. about the decrying of strict principles.
- **"Then the example (74), introduced as a dilemma".** On p. 74 the example is offered as *proof* ("Nous en avons la preuve…"). The dilemma is stated on p. 75. Reword slightly.
- **"the arbitrary offers individuals no asylum" (87).** In context the individuals are those "qui le composent", i.e. members of the government. The point is that arbitrary power gives no safety even to those who wield it. It is quoted without that context.
- **"when it tells a people its laws are insufficient, 'all the legitimate authority … falls'" (86).** This compresses the passage. In Constant, authority falls "à ces mots", that is, at the people's reply "nous voulons d'autres loix".
- **"gives the same rights that it takes" (86).** The original is plural: "les gouvernemens donnent les mêmes droits qu'ils prennent". Either quote it in the plural or move "a government that…" outside the quotation marks.
- **6:187 "on pain of losing their station".** *bei Verlust ihres Standes* is ambiguous. Grammatically, *ihres* is plural and fits "geistliche Obere oder Lehrer"; in the same sentence Kant refers to *das Volk* as *es*. The paper's English makes it the people's station. That reading is defensible, but it is not the only one.
- **"Timmermann's denial that the case is about the state" (§4).** Timmermann's n. 60 (p. 96) concerns what "society" Constant says would be made impossible ("human beings … live side by side"). His n. 59 (p. 95) rejects Wood's political reading. The paper's gloss is fair overall, but it stretches n. 60 a little.
- **"its direction" (73).** The French is "l'esprit des hommes a dû s'y consacrer davantage, et que *sa* direction…", where *sa* most naturally refers to *l'esprit des hommes*, not *la morale*. Also, "depositaries" is a calque; "holders" reads better.
- **Block quote (67–68), "so far makes up its essence".** This can be misread as "up to now". → "so completely constitutes its essence".
- **Footnote 1, "Translations from Constant and Kant are mine".** The Charrière letter, written by Constant, is quoted in Timmermann's translation. That is flagged in the text, but adding "unless otherwise indicated" to the footnote would remove the clash.
- **Witness example.** It goes back to Wolff, *Jus naturae* § 214, as cited by Annen (Timmermann 100 n. 11). This is optional to mention.
- **.bib.** Benton1982 and Hare1981 are not cited in v3; this is harmless under Quarto. None of the cited keys is missing.

## Full table

Verdict key: OK, page wrong, translation problem, misattributed, not found, out of context, unverified (source not available here).

### Abstract

| # | Quoted / claimed | Location claimed | Original found | Verdict | Correction |
|---|---|---|---|---|---|
| A1 | "when pretended laws demand the truth of us only to proscribe us, we do not owe them the truth." | 1815 note (= Laboulaye 128–129 n. 1) | "Quand de prétendues lois n'exigent de nous la vérité que pour nous proscrire, nous ne leur devons pas la vérité." (end of n. 1, foot of p. 129) | OK | — |
| A2 | "no one has a right to a truth that harms others" (paraphrase) | 1797, 76 | "Or nul homme n'a droit à la vérité qui nuit à autrui." | OK | — |
| A3 | "the premise Kant called Constant's fundamental error, that the duty of truthfulness is owed to those with a right to it" | 8:425 | "Das πρωτον ψευδος liegt hier in dem Satze: 'Die Wahrheit zu sagen ist eine Pflicht, aber nur gegen denjenigen, welcher ein Recht auf die Wahrheit hat.'" | Misstated (drops "only") | "owed only to those with a right to it" |
| A4 | "agrees with Kant that the questioner is not wronged" | 8:426 | "ob ich zwar dem, welcher mich ungerechterweise zur Aussage nöthigt, nicht Unrecht thue…" (also Timmermann 100 n. 10) | OK | — |

### §1 Constant's example

| # | Quoted / claimed | Location claimed | Original found | Verdict | Correction |
|---|---|---|---|---|---|
| 1 | "a German philosopher" … "that towards assassins who asked you whether your friend, whom they are pursuing, has not taken refuge in your house, a lie would be a crime" | 1797, 74 | "un philosophe allemand, qui va jusqu'à prétendre, qu'envers des assassins qui vous demanderoient, si votre ami qu'ils poursuivent n'est pas réfugié dans votre maison, le mensonge seroit un crime." | OK | — |
| 2 | "the eighth chapter" | ch. VIII | Ch. VIII "Des principes" runs pp. 64–79 (ch. IX begins p. 80) | OK | — |
| 3 | "signed on 10 germinal year V (30 March 1797)" | — | Conversion correct. No signature or date in the scan: the preface leaf after PDF p. 5 is missing. The .bib says "Preface dated Hérivaux". | Unverified; wording | "whose preface is dated 10 germinal year V (30 March 1797)" |
| 4 | Kant "admitted in a note that he had said something of the kind" | 8:425 | "Daß dieses wirklich an irgend einer Stelle, deren ich mich aber jetzt nicht mehr besinnen kann, von mir gesagt worden, gestehe ich hiedurch. I. Kant." | OK | — |
| 5 | Kant read Cramer's German translation | 8:425 | "In der Schrift: Frankreich im Jahr 1797, sechstes Stück, Nr. I: von den politischen Gegenwirkungen…" plus Cramer's note "K. Fr. Cramer" | OK | — |
| 6 | "replied in September" | — | Timmermann 39: *Berlinische Blätter*, 6 September 1797 | OK | — |
| 7 | "On a Supposed Right to Lie from Love of Humanity" | 8:423/425 | "Über ein vermeintes Recht aus Menschenliebe zu lügen" | OK | — |
| 8 | Timmermann: "eighteenth-century commonplace" | T 96 | "The idea of a forfeitable right to the truth is introduced as what it is: an eighteenth-century commonplace" (just after the p. 96 marker) | OK | — |
| 9 | Timmermann: Constant "is not talking about the state" | T 96 n. 60 | n. 60 (reference on p. 96): "…would make it impossible for human beings to live side by side. He is not talking about the state." | OK | — |
| 10 | Zupančič 179; Loparic 63–65; Wood 2011 citing Holmes 1984; Troitskiy 2016; Rousselière 2018 | — | Not available here. Cited pages fall within the .bib page ranges (173–190; 57–72). Timmermann n. 17 quotes Holmes 1984: 108 on the revolutionary context; his n. 59 cites Wood **2008**: 249 for the political reading. | Unverified | Check that Wood 2011 does cite Holmes. |

### §2 What a principle is

| # | Quoted / claimed | Location claimed | Original found | Verdict | Correction |
|---|---|---|---|---|---|
| 11 | Chs VII–IX defend principles against those who exaggerate them until they become inapplicable, and against those who conclude from the excesses that principles are useless | 1797 chs VII–IX | p. 57 "qu'ils confondent d'abord ceux qui les exagèrent"; p. 61 "l'exagération des principes, étant le moyen le plus infaillible de les rendre inapplicables"; p. 77 "Dire que les principes abstraits ne sont que de vaines et inapplicables théories…" | OK | — |
| 12 | Burke: axioms "metaphysically true" can be "politically false" | 81 | "prétendant avec Burke que des axiomes, métaphysiquement vrais, peuvent être politiquement faux" (ch. IX) | OK | — |
| 13 | "exceptions without number in favour of your own interests" | 62 | "et qui faites des exceptions sans nombre, en faveur de vos propres intérêts." (an anticipated charge: "dira-t-on") | OK | — |
| 14 | the mass has no interest in "individual exceptions" and every interest in general principles being observed | 64 | "n'ayant aucun intérêt aux exceptions individuelles, en a un très-pressant à ce que les principes généraux soient observés" (first page of ch. VIII) | OK | — |
| 15 | "Chapter VIII, 'Des principes', begins with a definition" | — | Ch. VIII begins p. 64: "On a tant et si cruellement abusé du mot principes…". Definition on p. 66. | Inaccurate | "Two pages into chapter VIII … comes a definition" |
| 16 | Block: "A principle is the general result … becomes a principle." | 66 | "Un principe est le résultat général d'un certain nombre de faits particuliers. Toutes les fois que l'ensemble de ces faits subit quelques changemens, le principe qui en résultoit se modifie : mais alors cette modification elle-même devient principe." | OK | — |
| 17 | "and this result is always the same, whenever the combinations are the same" | 66 | "et ce résultat est toujours pareil, toutes les fois que les combinaisons sont les mêmes." | OK | — |
| 18 | "only in relation to the combinations from which it results … only in a relative and not an absolute way" | 66 | "n'est général que par rapport aux combinaisons desquelles il résulte. Il n'est donc général que d'une manière relative et non d'une manière absolue." | OK | — |
| 19 | universal principles exist because some data are present in all combinations (paraphrase) | 66–67 | "parce qu'il y a des données premières, qui existent également dans toutes les combinaisons" | OK | — |
| 20 | "resulting from each particular combination" | 67 | "d'autres principes, résultant de chaque combinaison particulière" | OK | — |
| 21 | "one of the links of the chain" | 67 | "C'est avoir perdu l'un des anneaux de la chaîne" | OK | — |
| 22 | Block: "Secondary principles are just as immutable … all its utility resides in it." | 67–68 | "Les principes secondaires sont tout aussi immuables que les principes premiers. Chaque interruption de la grande chaîne n'a pour la remplir qu'un seul anneau. […] Chaque circonstance appelle seulement le principe qui lui est propre, car l'essence d'un principe n'est pas d'être général, ni applicable à beaucoup de cas, mais d'être fixe ; et cette qualité compose si bien son essence, que [68] c'est en elle que réside toute son utilité." | OK (style) | "so completely constitutes its essence" |
| 23 | morality is "an assemblage of rules on which individuals must be able to count mutually in their social relations" | 82 | "la morale étant un assemblage de règles, sur lesquelles les individus doivent pouvoir compter mutuellement dans leurs relations sociales" (inside the counterfactual "L'arbitraire, en fait de morale, seroit la perte de toute morale") | OK | — |
| 24 | institutions "are only contracts", whose nature "is to set fixed limits" | 84 | "Les institutions politiques ne sont que des contrats. La nature des contrats est de poser des bornes fixes" | OK | — |
| 25 | "the absence of rules, of limits, of definitions, in a word the absence of all that is precise" | 80 | "c'est l'absence des règles, des limites, des définitions, en un mot, l'absence de tout ce qui est précis." | OK | — |
| 26 | "only circumstances remain, and each person is judge of the circumstances" | 78 | "il ne reste que des circonstances, et chacun est juge des circonstances." | OK | — |
| 27 | Kant: "well thought and at the same time correct" | 8:427 | "Wohldenkend und zugleich richtig ist hiebei Hrn. Constants Anmerkung über die Verschreiung solcher strenger … Grundsätze." | Translation problem (minor) | "well-meant (right-minded) and at the same time correct" |
| 28 | Constant's political example: no one bound by laws he has not helped to make; representation in a large society | 72 | "nul homme ne peut être lié que par les loix auxquelles il a concouru … les individus peuvent concourir à la formation des loix, soit par eux-mêmes, soit par leurs représentans." (continues to p. 73) | OK (72–73 also fine) | — |
| 29 | Kant restates it as axiom, postulate, problem | 8:429 | "1) ein Axiom … 2) ein Postulat … 3) ein Problem … (nämlich vermittelst eines repräsentativen Systems)" | OK | — |
| 30 | "the closer determination [*nähere Bestimmung*] of their application to cases" / "never exceptions" | 8:430 | "die hier sogenannten mittleren können nur die nähere Bestimmung ihrer Anwendung auf vorkommende Fälle (nach Regeln der Politik), aber niemals Ausnahmen von jenen enthalten" | OK | — |
| 31 | Hinz: ch. VIII answers Kant's 1793 essay | T 43 n. 16 | n. 16 (reference on p. 43): "Hinz argues that Chapter 8 of On Political Reactions in its entirety should be read as a response to Kant's essay (Hinz 2004: 288, 294)." | OK | — |
| 32 | "it was not the fault of the theory, but that there was not enough theory" | 8:275 | "Da lag es dann nicht an der Theorie, wenn sie zur Praxis noch wenig taugte, sondern daran, daß nicht genug Theorie da war" | OK | — |
| 33 | "surveying its whole circumference" / "the link that unites it to another principle" | 74–75 | "en parcourant toute sa circonférence, [75] nous trouverons le lien qui l'unit à un autre principe." | OK | — |
| 34 | "It is an idea perhaps new … its means of application" | 77 | "C'est une idée peut-être neuve, mais qui me paroît infiniment importante, que tout principe renferme, soit en lui-même, soit dans son rapport avec un autre principe, son moyen d'application." | OK | — |
| 35 | act of judgement; rules cannot always be given, "because that would go on to infinity" | 8:275 | "muß ein Actus der Urtheilskraft hinzukommen … nicht immer wiederum Regeln gegeben werden können … (weil das ins Unendliche gehen würde)" | OK | — |
| 36 | "personal judgement has no role to play because the scope of one principle is limited by another" | T 94 n. 56 | n. 56 (reference on p. 94): "Personal judgement has no role to play because the scope of one principle is limited by another." | OK | — |

### §3 The 1797 key

| # | Quoted / claimed | Location claimed | Original found | Verdict | Correction |
|---|---|---|---|---|---|
| 37 | "a science much more advanced than politics" | 73 | "La morale est une science beaucoup plus approfondie que la politique" | OK ("more thoroughly worked out" is an alternative) | — |
| 38 | its direction "was not distorted by the personal interests of the depositaries or usurpers of power" | 73 | "l'esprit des hommes a dû s'y consacrer davantage, et que sa direction n'étoit pas faussée par les intérêts personnels des dépositaires, ou des usurpateurs du pouvoir." | OK (antecedent of *sa* is probably *l'esprit des hommes*) | Optional: "holders" for "depositaries" |
| 39 | "Then the example (74), introduced as a dilemma." | 74 | p. 74 gives the example as proof ("Nous en avons la preuve dans les conséquences très-directes…"). The dilemma comes on p. 75. | Minor inaccuracy | "Then the example (74). Returning to it, Constant states a dilemma:" |
| 40 | "is inapplicable. It would destroy society. But if you reject it, society will be no less destroyed, for all the foundations of morality will be overturned" | 75 | "Ce principe isolé est inapplicable. Il détruiroit la société. Mais si vous le rejetez, la société n'en sera pas moins détruite, car toutes les bases de la morale seront renversées." | OK | — |
| 41 | Block: "Telling the truth is a duty. … But no man has a right to a truth that harms others." | 75–76 | "Dire la vérité est un devoir. Qu'est-ce qu'un devoir ? L'idée de devoir est inséparable de celle de droits : un devoir est ce qui, dans un être, correspond aux droits d'un autre. Là où il n'y a pas de droits, il n'y a pas de devoirs. Dire la vérité n'est donc un devoir qu'envers ceux qui ont droit à la vérité. Or nul [76] homme n'a droit à la vérité qui nuit à autrui." | OK | — |
| 42 | "There, it seems to me, is the principle become applicable" | 76 | "Voilà, ce me semble, le principe devenu applicable." | OK | — |
| 43 | "we have found the precise modification of the principle of truth, which excludes all arbitrariness and all uncertainty" | 76–77 | "nous avons trouvé la modification précise du principe [77] de la vérité, qui exclut tout arbitraire et toute incertitude." | OK | — |
| 44 | "this modification itself becomes a principle" | 66 | "cette modification elle-même devient principe" | OK | — |
| 45 | "qui nuit à autrui" | 76 | as in row 41 | OK | — |
| 46 | Timmermann: "knowing and acting on this truth will harm another" | T 100 | "agents do not have a right to another's telling them the truth if their knowing and acting on this truth will harm another." (after the p. 100 marker) | OK | — |
| 47 | Timmermann: "those who intend to do harm lose their right to be told the truth" | T 44 | "…simple intermediate principles, for example, the principle that those who intend to do harm lose their right to be told the truth." | OK | — |
| 48 | Charrière letter, Dec. 1794: "absolute and independent duty"; happiness "differs in the imagination of each individual"; "Duty is thus ground to bits … no longer a duty" (Timmermann's translation) | T 44 | Verbatim match: "…between absolute and independent duty, which for that very reason is simple, and composite duty … I absolutely side with the former. … by necessity, it differs in the imagination of each individual. Duty is thus ground to bits in accordance with [the preferences of] each individual head. What is more, a duty that turns into calculations of happiness is no longer a duty." (dated 16 December 1794). The absolute/composite distinction is Charrière's, "following Kant"; Constant endorses it. | OK | — |
| 49 | "for reasons he had given three years before" | — | 16 Dec 1794 to March 1797 is about 2¼ years | Date imprecise | "two years before" or "in 1794" |
| 50 | Kant's variation: the friend slips out and the lie sends the murderer to meet him | 8:427 | "…hast du aber gelogen und gesagt, er sei nicht zu Hause, und er ist auch wirklich … ausgegangen, wo denn der Mörder ihm im Weggehen begegnete…" | OK | — |
| 51 | Michaelis: "I can never be certain whether this or that untruth may not be very harmful to another" | T 169 | "Michaelis rejects the distinction between mendacia and falsiloquia on the grounds 'that I can never be certain whether this or that untruth may not be very harmful to another' (Michaelis 1792: 159)" (p. 169) | OK (second-hand, correctly signalled) | — |
| 52 | Kettner and Annen pressed the witness objection; Timmermann links it to harming vs wronging | T 100 n. 11 | n. 11 (reference on p. 100): "Annen mentions another problem with [5], which was also spotted by Kettner … a courtroom witness must tell the truth even if that is certain to harm the accused (Jus naturae, 1743, § 214…) … very close in spirit to Kant's later allegation that Constant conflates 'causing harm' and 'doing wrong'" | OK | Optional: the witness case goes back to Wolff |
| 53 | the harm is "merely a coincidence (*casus*)" | 8:428 | "Es war bloß ein Zufall (casus), daß die Wahrhaftigkeit der Aussage dem Einwohner des Hauses schadete" | OK (same rendering as Timmermann; "accident" is the traditional alternative) | — |
| 54 | Kant draws the harming/wronging distinction to deny that the householder wrongs his friend | 8:428 | "so verwechselte 'der französische Philosoph' die Handlung, wodurch jemand einem anderen schadet (nocet) … mit derjenigen, wodurch er diesem Unrecht thut (laedit)" | OK | — |

### §4 Pretended laws

| # | Quoted / claimed | Location claimed | Original found | Verdict | Correction |
|---|---|---|---|---|---|
| 55 | "Timmermann's denial that the case is about the state" | T 96 n. 60 (and 95 n. 59) | n. 60 is about the "society" a strict duty would make impossible; n. 59: "Neither philosopher is concerned with sincerity in the public sphere" (against Wood 2008) | OK, slightly stretched | Optional: cite 95 n. 59 as well |
| 56 | Schaumann 1796: "someone in a fury" pursues an innocent man hiding in my house; a likely source | T 46 | "If someone in a fury is pursuing an innocent man, who – as I very well know – is hiding in my house…" (Schaumann 1796: 194). Timmermann: "a very strong candidate"; "This reconstruction is still speculative" | OK | — |
| 57 | "assassins", "your friend" | 74 | "des assassins … votre ami" | OK | — |
| 58 | incited followers "to the assassination of their accomplices"; made "national vengeance illegal and atrocious" | 6 | "ils excitoient à l'assassinat de leurs complices. Ils rendoient la vengeance nationale illégale et atroce, pour marcher devant elle et pour lui échapper." | OK | — |
| 59 | "proscription would be without end and without limits" | 50 | "Si ce système affreux triomphoit, la proscription seroit sans terme et sans bornes" | OK | — |
| 60 | "a proscribed and terrible race, which would have no asylum on earth but beneath the ruins of the social order" | 56–57 | "faire une race à-la-fois proscrite et terrible, qui n'ait d'asyle sur la terre que sous [57] les débris de l'ordre social" (checked on the scan; the OCR garbles it) | OK | Optional: "a race at once proscribed and terrible" |
| 61 | rallying "to the government, when it moderates opinion" | 56–57 (the words are on 57) | "que ralliés, non pas à l'opinion qui suit les crises, mais au gouvernement, lorsqu'il modère l'opinion" | OK | — |
| 62 | "the next chapter, 'De l'arbitraire'" | — | Ch. IX "De l'arbitraire" begins p. 80 | OK | — |
| 63 | "there is nothing existing in an institution but what exists by right" | 85 | "il n'y a d'existant en institution que ce qui existe de droit." | OK | — |
| 64 | "gives the same rights that it takes" | 86 | "les gouvernemens donnent les mêmes droits qu'ils prennent." | OK (number changed inside quotation marks) | "governments 'give the same rights that they take'" |
| 65 | when it tells a people its laws are insufficient, "all the legitimate authority of a government falls: only force remains to it; it is no longer a government" | 86 | "En disant à un peuple, vos loix sont insuffisantes …, ils autorisent ce peuple à répondre : si nos loix sont insuffisantes, nous voulons d'autres loix, et à ces mots, toute l'autorité légitime d'un gouvernement tombe : il ne lui reste plus que la force ; il n'est plus gouvernement." | OK (compressed: authority falls at the people's reply) | Optional rewording |
| 66 | "A people and a government are always in reciprocity of duties" … "will likewise be in the arbitrary" | 86–87 | "Un peuple et un gouvernement sont toujours en réciprocité de devoirs, si la relation du gouvernement au peuple est dans la loi, dans la loi aussi sera la relation du peuple au gouvernement ; mais si la relation [87] … sera de même dans l'arbitraire." | OK | — |
| 67 | "the arbitrary offers individuals no asylum" | 87 | "l'arbitraire n'est d'aucun secours à un gouvernement, sous le rapport de la sûreté des individus qui le composent. Car l'arbitraire n'offre aux individus aucun asyle." | Out of context (mild): the individuals are the government's own members | Add "even to those who wield it", or gloss |
| 68 | Chapter XVII of the *Principes* | — | "CHAPITRE XVII. DE LA LIBERTÉ RELIGIEUSE." (Laboulaye p. 128) | OK | — |
| 69 | Rousseau's sovereign fixes articles and may banish unbelievers "as unsociable" (paraphrase) | 128 | "dont il appartient au souverain de fixer les articles … il peut bannir de l'État quiconque ne les croit pas … comme insociable." | OK | — |
| 70 | Rousseau's addition: "he has lied before the laws" | 128 n. 1 | "qu'il soit puni de mort ; il a commis le plus grand des crimes, il a menti devant les lois." | OK | — |
| 71 | Block quote, "But he who has the misfortune … we do not owe them the truth." | 128–129 n. 1 | "Mais celui qui a le malheur de ne pas croire ces dogmes, ne peut avouer ses doutes sans s'exposer au bannissement ; et si ses affections le retiennent, s'il a une famille, une femme, des enfants qu'il hésite à quitter pour se précipiter dans l'exil, n'est-ce pas vous, vous seul qui le forcez à ce que vous appelez le plus grand des crimes, au mensonge devant les lois ? Je dirai, du reste, que, dans cette circonstance, ce mensonge me paraît loin d'être un crime. Quand de prétendues [129] lois n'exigent de nous la vérité que pour nous proscrire, nous ne leur devons pas la vérité." | OK | — |
| 72 | Footnote: "the note reads the same in a recent reprint" | — | Institut Coppet 2025 reprint (principes.txt): identical wording | OK | — |
| 73 | "a hypothetical morality, no less subtle, no less foreign to its natural jurisdiction" | (129), bare | Laboulaye 129: "si elle se perd dans une morale hypothétique, non moins subtile, non moins étrangère à sa juridiction naturelle ?" (a rhetorical question) | Text OK; citation form wrong (bare page means 1797) | `[@Constant1872, 129]` |
| 74 | sovereignty "exists only in a limited and relative way"; "at the point where independence and individual existence begin, the jurisdiction of this sovereignty stops" | 1872, 9 | "La souveraineté n'existe que d'une manière limitée et relative. Au point où commencent l'indépendance et l'existence individuelle, s'arrête la juridiction de cette souveraineté." (ch. I, p. 9) | OK | — |
| 75 | "nous ne leur devons pas"; "pretended"; "only to proscribe" | 129 | as row 71 | OK | — |
| 76 | limits of obedience "cannot be described, because it is impossible to foresee all the cases that may arise; but they are felt"; each "is judge of them, and necessarily the only judge … at his own risk and peril" | 1872, 92 | "ces limites ne se laissent pas décrire, parce qu'il est impossible de prévoir tous les cas qui peuvent se présenter : mais elles se sentent, la raison de chacun l'en avertit. Il en est juge, et il en est nécessairement le seul juge : il en est le juge à ses risques et périls." (ch. XI) | OK | — |
| 77 | order "emanates from the authority that has the right to give it", bears "the prescribed formalities"; "an innocent man may be arrested quite legally, if he is suspected" | (92–93 n. 1), bare | Note keyed on p. 91, continued on p. 92: "Un innocent peut être arrêté très-légalement, si on le soupçonne. … c'est que l'ordre soit légal, c'est-à-dire, émané de l'autorité qui a droit de le donner, et qu'il soit revêtu des formalités prescrites." The note on p. 93 is a different one. | **Page wrong**, and citation form wrong | `[@Constant1872, 91–92 n. 1]` |
| 78 | "there is uncertainty in all human things. To free himself from all uncertainty, man would have to cease to be a moral being" | (93), bare | "Mais il y a incertitude dans toutes les choses humaines. Pour se délivrer de toute incertitude, l'homme devrait cesser d'être un être moral." (p. 93) | Text and page OK; citation form wrong | `[@Constant1872, 93]` |
| 79 | the arbitrary that remains is checked by juries who judge each case once and have no permanent interest in power (unquoted) | — | Laboulaye 94–95: "L'on dira que je mets l'arbitraire dans les jurés … à des hommes qui ne l'exercent que dans une seule circonstance … que si vous la confiez à des hommes qui ont pour intérêt permanent leurs prérogatives particulières." | OK | Optional: add `[@Constant1872, 93–95]` |
| 80 | "each person is judge of the circumstances"; "excludes all arbitrariness and all uncertainty" (repeated) | 1797 78; 76–77 | as rows 26 and 43 | OK | — |

### §5 What remains

| # | Quoted / claimed | Location claimed | Original found | Verdict | Correction |
|---|---|---|---|---|---|
| 81 | "Although I do no wrong to him who unjustly compels me to a statement if I falsify it" | 8:426 | "ob ich zwar dem, welcher mich ungerechterweise zur Aussage nöthigt, nicht Unrecht thue, wenn ich sie verfälsche" | OK | — |
| 82 | "in the most essential part of duty in general" | 8:426 | "im wesentlichsten Stücke der Pflicht überhaupt Unrecht" | OK | — |
| 83 | making declarations unbelievable (paraphrase); "a wrong done to humanity in general" | 8:426 | "daß Aussagen (Declarationen) überhaupt keinen Glauben finden … welches ein Unrecht ist, das der Menschheit überhaupt zugefügt wird." | OK | — |
| 84 | "towards everyone" | 8:426 | "formale Pflicht des Menschen gegen jeden" | OK | — |
| 85 | "makes no distinction between persons" | 8:429 | "weil die [429] Pflicht der Wahrhaftigkeit … keinen Unterschied zwischen Personen macht" (the sentence begins on 428) | OK | — |
| 86 | πρῶτον ψεῦδος; "telling the truth is a duty, but only towards someone who has a right to the truth" | 8:425 | "Das πρωτον ψευδος liegt hier in dem Satze: 'Die Wahrheit zu sagen ist eine Pflicht, aber nur gegen denjenigen, welcher ein Recht auf die Wahrheit hat.'" (accents added by the paper) | OK | — |
| 87 | Timmermann: "the juridical argument Kant built on it is weak", absolutism rests on the ethical duty to oneself | T 156–157 | p. 156: "Kant is committed to an absolute, non-negotiable duty of truthfulness in his ethics"; draft "Sincerity … is a formal duty to oneself"; p. 157: "we know that it is weak … It merely shifted from one part of the Metaphysics of Morals to the other." | Pages and substance OK; "built **on** it" misdescribes Kant's relation to Constant's premise | "built against it" |
| 88 | Constant read the *Religion* in 1794, according to Kloocke | T 42 | "We know, he [Kloocke] tells us, that Constant was familiar … with Kant's Religion … Constant was apparently reading both works around the same time, in the summer of 1794" (pp. 42–43) | OK | — |
| 89 | "on pain of losing their station" | 6:187 | "ob geistliche Obere oder Lehrer es … dem Volke als Glaubensartikel (bei Verlust ihres Standes) zu bekennen auferlegen dürfen" | OK, but ambiguous in the original (see above) | Optional note |
| 90 | profess what they "cannot know to be true" (paraphrase) | 6:187 | "was es als ein solches doch nicht gewiß weiß" | OK | — |
| 91 | "would himself act against conscience" | 6:187 | "Sein geistlicher Oberer würde hiebei selbst wider Gewissen verfahren" | OK | — |
| 92 | "must answer for all the misuse arising from such compulsory faith" | 6:187 | "weil er allen Mißbrauch aus einem solchen Frohnglauben verantworten muß" | OK | — |
| 93 | "there may be truth in what is believed, but at the same time untruthfulness in the believing (or even in its merely inner profession), and this is in itself damnable" | 6:187 | "Es kann also vielleicht Wahrheit im Geglaubten, aber doch zugleich Unwahrhaftigkeit im Glauben (oder dessen selbst bloß innerem Bekenntnisse) sein, und diese ist an sich verdammlich." | OK | — |
| 94 | Sincerity "must be demanded of every human being" | 6:190 n. | "Aber Aufrichtigkeit (daß alles, was man sagt, mit Wahrhaftigkeit gesagt sei) muß man von jedem Menschen fordern können" (note to l. 8, printed on 190) | **Translation problem** (drops *können*) | "one must be able to demand [it] of every human being" |
| 95 | "is it not you, you alone, who force him" / "far from being a crime" | 1815 note | "n'est-ce pas vous, vous seul qui le forcez" / "ce mensonge me paraît loin d'être un crime" | OK | — |

## Dates and attributions

- 10 germinal an V = 30 March 1797: **correct** (computed from 1 vendémiaire V = 22 Sept 1796). That it is the date on the pamphlet could not be verified from this scan (leaf missing; see above).
- Kant's reply published September 1797: **correct**. Timmermann 39 gives *Berlinische Blätter*, 6 September 1797.
- December 1794 letter to Charrière: **correct**, dated 16 December 1794 (Timmermann 44). "Three years before" overstates the interval (must-fix 6).
- Hinz, Kloocke, Schaumann (1796), Michaelis, Kettner/Annen: all attributed as in Timmermann at the pages given.
- "Kant calls…" (8:427), "restates…" (8:429), "concludes…" (8:430), "admitted in a note" (8:425), "What Kant calls … πρῶτον ψεῦδος" (8:425): all correctly placed.
- "Timmermann glosses…" / "describes the result in terms of forfeiture" (100, 44): correct quotations. Timmermann's chapter VI summary also uses the word "forfeited".

## Bibliography (`draft/constant.bib`)

- **Constant1797.** "address = {[France]}" and "publisher = {[s.n.]}" are acceptable. The note "Preface dated Hérivaux, 10 germinal an V" cannot be confirmed from the scan. The paper says "signed"; align the two (see must-fix list and minor notes).
- **Constant1872.** Matches the title page: *Cours de politique constitutionnelle ou collection des ouvrages publiés sur le gouvernement représentatif*, ed. Laboulaye, 2nd ed., vol. 1, Paris: Guillaumin, 1872. The *Principes* follow Laboulaye's introduction as the first work, so the footnote's description is accurate.
- **KantAA.** Fine.
- **Timmermann2025.** Fine. The DOI 10.1017/9781108992435 matches the chapter DOIs (…435.007 etc.); print year 2025.
- **Zupancic1993, Loparic2006, Wood2011, Troitsky2016, Rousseliere2018, Holmes1984.** No obvious errors. The cited pages fall inside the stated page ranges. Not independently verifiable here. The key "Troitsky2016" spells the name differently from the author field "Troitskiy"; this is harmless.
- **Benton1982, Hare1981.** Present but not cited in v3. Harmless; remove them if a clean .bib is wanted.
- No cited key is missing from the .bib.
