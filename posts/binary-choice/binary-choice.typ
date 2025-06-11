// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let d = (:)
  let fields = old_block.fields()
  fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.abs
  }
  return block.with(..fields)(new_content)
}

#let empty(v) = {
  if type(v) == str {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == content {
    if v.at("text", default: none) != none {
      return empty(v.text)
    }
    for child in v.at("children", default: ()) {
      if not empty(child) {
        return false
      }
    }
    return true
  }

}

// Subfloats
// This is a technique that we adapted from https://github.com/tingerrr/subpar/
#let quartosubfloatcounter = counter("quartosubfloatcounter")

#let quarto_super(
  kind: str,
  caption: none,
  label: none,
  supplement: str,
  position: none,
  subrefnumbering: "1a",
  subcapnumbering: "(a)",
  body,
) = {
  context {
    let figcounter = counter(figure.where(kind: kind))
    let n-super = figcounter.get().first() + 1
    set figure.caption(position: position)
    [#figure(
      kind: kind,
      supplement: supplement,
      caption: caption,
      {
        show figure.where(kind: kind): set figure(numbering: _ => numbering(subrefnumbering, n-super, quartosubfloatcounter.get().first() + 1))
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => {
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          }

          quartosubfloatcounter.step()
          it
          counter(figure.where(kind: it.kind)).update(n => n - 1)
        }

        quartosubfloatcounter.update(0)
        body
      }
    )#label]
  }
}

// callout rendering
// this is a figure show rule because callouts are crossreferenceable
#show figure: it => {
  if type(it.kind) != str {
    return it
  }
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {
    return it
  }
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let old_title = old_title_block.body.body.children.at(2)

  // TODO use custom separator if available
  let new_title = if empty(old_title) {
    [#kind #it.counter.display()]
  } else {
    [#kind #it.counter.display(): #old_title]
  }

  let new_title_block = block_with_new_content(
    old_title_block, 
    block_with_new_content(
      old_title_block.body, 
      old_title_block.body.body.children.at(0) +
      old_title_block.body.body.children.at(1) +
      new_title))

  block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1))
}

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  block(
    breakable: false, 
    fill: background_color, 
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), 
    width: 100%, 
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%, 
      below: 0pt, 
      block(
        fill: background_color, 
        width: 100%, 
        inset: 8pt)[#text(icon_color, weight: 900)[#icon] #title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: body_background_color, width: 100%, inset: 8pt, body))
      }
    )
}



#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: "libertinus serif",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "libertinus serif",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  pagenumbering: "1",
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)
  if title != none {
    align(center)[#block(inset: 2em)[
      #set par(leading: heading-line-height)
      #if (heading-family != none or heading-weight != "bold" or heading-style != "normal"
           or heading-color != black or heading-decoration == "underline"
           or heading-background-color != none) {
        set text(font: heading-family, weight: heading-weight, style: heading-style, fill: heading-color)
        text(size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(size: subtitle-size)[#subtitle]
        }
      } else {
        text(weight: "bold", size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(weight: "bold", size: subtitle-size)[#subtitle]
        }
      }
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)

#show: doc => article(
  title: [Is Choice Binary?],
  authors: (
    ( name: [Brian Weatherson],
      affiliation: [University of Michigan],
      email: [] ),
    ),
  date: [2025-06-11],
  abstract: [There is a natural view about how preference relates to choice. On this view, an option is choiceworthy iff no alternative is strictly preferred to it. I'm going to argue against this, for two reasons. First, the view makes a false prediction about which options are choiceworthy in games and in choices between options that differ along multiple dimensions. Second, choice is fundamentally about how options are evaluated prior to a decision, while preference is about how they are (or will be) evaluated post decision. Several consequences of rejecting this natural view are explored, including how it simplifies the relationship between game theory and decision theory, and how it complicates several debates about so-called 'incomplete' preferences.

],
  abstract-title: "Abstract",
  sectionnumbering: "1.1.a",
  pagenumbering: "1",
  toc_title: [Table of contents],
  toc_depth: 3,
  cols: 1,
  doc,
)

Decision theory is, as the name suggests, about how rational decisions should be made. In real life situations, a chooser has many options available. But the usual way decision theory is formulated gives special place to the chooser's thoughts either about individual options, or about pairs of options. Typically, it either says here's a value function, which maps options to values, and chooser should choose the one with highest value, or it says here's a preference relation, and chosoer should choose one to which no other option is preferred. In this paper, I'm going to argue both these approaches are mistaken. Decision theory has to pay attention to the distinctive features of choices involving more than two options. This is both interesting in its own right, and has implications for theories of so-called 'incomplete' preferences.

= Historical Background
<sec-history>
There is a long tradition in both the economic literature (e.g., #cite(<Samuelson1938>, form: "prose");) and the psychological literature (e.g., #cite(<Luce1956>, form: "prose");), of taking choice dispositions to be the central focus of study, as opposed to values or preferences. Some of the reasons for this were based on behaviourist or positivist commitments. Choices, unlike values or preferences, are observable, and so, went the theory, they are the appropriate subject matter for scientific inquiry. The theorists taking this line would have endorsed this recent statement of the irrelevance of mental states to economics.

#quote(block: true)[
Standard economics does not address mental processes and, as a result, economic abstractions are typically not appropriate for describing them. @GulPesendorfer2008[ 24]
]

That's not going to be my approach here. I'm going to start not with observable choice dispositions, like Samuelson, or choice frequencies, like Luce, but with chooser's beliefs about which options are choiceworthy. In familiar terminology#footnote[See, for instance, #cite(<sep-preferences>, form: "prose");, where I learned about the Gul and Pesendorfer quote];, I'm taking a mentalist approach not a behaviourist approach. Much of the formal work on choice theory has been done by theorists from the behaviourist side, and I'll be inevitably drawing from them. But the most important source I'll be using is someone much more sympathetic to mentalism: Amartya Sen.~In particular, I'll draw heavily on his "Collective Choice and Social Welfare" @Sen1970sec. So I need to start with the way he talks about preferences in that book, which is slightly different to the current philosophical orthodoxy.

Sen starts with a binary relation #emph[R];, defined over options, which is glossed as #emph[xRy] means that #emph[x] is at least as good as #emph[y];. This is potentially misleading. It does not mean that #emph[x] is either better than #emph[y];, or exactly as good as #emph[y];. Rather, it means that #emph[x] is no worse than #emph[y];. Sen introduces two more binary relations, #emph[xPy];, meaning #emph[x] is preferred to #emph[y];, and #emph[xIy];, meaning the chooser is between #emph[x] and #emph[y];. These can both be defined in terms of #emph[R];, as in (1) and (2). (Throughout, I'm leaving off wide scope universal quantifiers over free variables.)

#block[
#set enum(numbering: "(1)", start: 1)
+ #emph[xPy];~↔︎ (#emph[xRy] ∧ ¬#emph[yRx];)
+ #emph[xIy];~↔︎ (#emph[xRy] ∧ #emph[yRx];)
]

A more common way of doing things in contemporary philosophy is to start with #emph[P] and a fourth relation #emph[E];, where #emph[xEy] means that #emph[x] and #emph[y] are equally good. On this picture, both (1) and (2), but the explanatory direction in (1) is right-to-left. So #emph[xRy] just is ¬#emph[xPy];, and then #emph[xIy] is still defined via (2). On the version Sen uses, it's a little trickier to define #emph[E];, but (3) looks like a plausible conjecture.

#block[
#set enum(numbering: "(1)", start: 3)
+ #emph[xEy] ↔︎ \[(#emph[xRz] ↔︎ #emph[yRz];) ∧ (#emph[zRx] ↔︎ #emph[zRy];)\]
]

That is, two options are equally good iff they are substitutable in other preference relations. Given all these results, we can show that the following claims are all tightly connected.

#block[
#set enum(numbering: "(1)", start: 4)
+ #emph[xPy] ∨ #emph[xEy] ∨ #emph[yPx]
+ (#emph[xPy] ∧ #emph[yIz];) → #emph[xPz]
+ (#emph[xIy] ∧ #emph[yIz];) → #emph[xIz]
]

(4) is what #cite(<Chang2017>, form: "prose") calls the trichotomy thesis. (5) is what Sen calls PI-transitivity, and (6) is what he calls II-transitivity.

Sen makes very few assumptions about #emph[R];, but it will simplify our discussion to start introducing some assumptions here.#footnote[In part this is because he was interested in exploring what assumptions about preference are crucial to the impossibility theorem that #cite(<Arrow1951>, form: "prose") derives. He initially noticed that without (6), the theorem didn't go through. This turned out to be less significant than it seemed, because Allan #cite(<Gibbard2014>, form: "prose") proved that a very similar theorem can be proven even without (6). See #cite(<Sen1969>, form: "prose") for the original optimism that this might lead to an interesting way out of the Arrovian results, and #cite(<Sen1970sec>, form: "prose") for a more pessimistic assessment in light of Gibbard's result. Sen reports that Gibbard originally proved his result in a term paper for a seminar at Harvard in 1969 that he co-taught with Arrow and Rawls. Much of what I'm saying in this paper can be connected in various ways to the literature on Arrow's impossibility theorem, but I won't draw out those connections here.] We'll assume that #emph[R] is reflexive, everything is at least as good as itself, and that #emph[P] is transitive. (Sen calls this quasi-transitivity.) #cite(<Sen1970sec>, form: "prose", supplement: [66]) notes that if #emph[P] is transitive and #emph[R] is 'complete' in the sense of the next paragraph, then (5) and (6) are equivalent. It's also easy to show that given (3) plus these assumptions, (4) and (6) are equivalent.#footnote[Proof: Assume (4) is false. So the right hand side of (3) is false. Without much loss of generality, assume that #emph[xRz] ∧ ¬#emph[yRz];; the other cases all go much the same way. So all the disjuncts are false. From ¬#emph[xPy] and ¬#emph[yPx] we get #emph[yRx] ∧ #emph[xRy];, i.e., #emph[xIy];. And #emph[xRz] implies #emph[zIx];. So we have a counterexample to II-transitivity, since #emph[zIx] and #emph[xIy];, but since ¬#emph[yRz];, #emph[yIz] is false. So if (4) is false, (6) is false. In the other direction, assume we have a counterexample to (6), i.e., #emph[xIy] and #emph[yIz] but not #emph[xIz];. From #emph[xIy] we immediately get that the two outer disjuncts of (4) are false. From #emph[yIz] we get #emph[yRz] and #emph[zRy];. So if #emph[xEy];, (3) implies that #emph[xRz] and #emph[zRx];, i.e., #emph[xIz];. But we assumed that ¬#emph[xIz];. So all three disjuntcs of (4) are false. That is, if (6) fails, so does (4), completing the proof that they are equivalent.]

What should we call the principle (4)? Most philosophers call it #emph[completeness];, and its denial #emph[incompleteness];. In his economic work, #cite(<Sen1970sec>, form: "prose") uses the term 'completeness' for a different property of preference relations, namely #emph[xRy] ∨ #emph[yRx];. This is a useful notion to have. If Chooser has never thought of #emph[x];, there is a good sense in which #emph[xRy] ∨ #emph[yRx] is false, even though of course ¬#emph[yPx] is true. Still, using the term for (4) is more common in philosophy. When writing primarily for philosophers, #cite(<Sen2004>, form: "prose") uses 'completeness' for (4), and I'll do the same. I'll call use #emph[definedness] for #emph[xRy] ∨ #emph[yRx];, and unless stated otherwise, will assume it holds.

There isn't as much discussion of (4) as such in the economics literature, but there is a long tradition of discussing (6), going back to important works by Wallace E. Armstrong #cite(<Armstrong1939>, form: "year");#cite(<Armstrong1948>, form: "year");#cite(<Armstrong1950>, form: "year");. In most of those works it is assumed that #emph[P] is transitive, so (4) and (6) are equivalent, so this is really discussing the same thing. Still, it makes the terminology confusing.

When it makes it clearer, I'll use the term #cite(<Chang2017>, form: "prose") suggests for (4). That is, I'll say that preference relations for which this holds are #emph[trichotomous];.

= Properties of Choice Functions
<sec-properties>
In philosophy we're familiar enough with possible properties of preference relations, e.g., that they are transitive, reflexive, acyclic, etc, that these terms don't need to be defined. We're mostly less familiar with properties of choice functions. So in this short section I'll lay out six properties that will be important in what follows. The first four are discussed in some detail by #cite(<Sen1970sec>, form: "prose");, and I'll use his terminology for them. The fifth is due to #cite(<Aizerman1981>, form: "prose");, and is usually named after Aizerman. The sixth is discussed by #cite(<Blair1976>, form: "prose");.

/ Property α: #block[
(#emph[x] ∈ #emph[C];(#emph[S];) ∧ #emph[x] ∈ #emph[T] ∧ #emph[T] ⊆ #emph[S];) → #emph[x] ∈ #emph[C];(#emph[T];)
]

That is, if #emph[x] is choiceworthy in a larger set, then it is choiceworthy in any smaller set it is a member of. This is sometimes called the #emph[Chernoff condition];, after Herman #cite(<Chernoff1954>, form: "prose");, and sometimes called #emph[contraction consistency];.

/ Property β: #block[
(#emph[x] ∈ #emph[C];(#emph[T];) ∧ #emph[y] ∈ #emph[C];(#emph[T];) ∧ #emph[T] ⊆ #emph[S];) → (#emph[x] ∈ #emph[C];(#emph[S];) ↔ #emph[y] ∈ #emph[C];(#emph[S];))
]

That is, if #emph[x] and #emph[y] are both choiceworthy in a smaller set, then in any larger set they are either both choiceworthy or neither is. Intuitively, if #emph[x] is not chosen in the larger set because one of the new members is better than it, then the new member is also better than #emph[y];.

/ Property γ: #block[
(#emph[x] ∈ #emph[C];(#emph[S];) ∧ #emph[x] ∈ #emph[C];(#emph[T];)) → (#emph[x] ∈ #emph[C];(#emph[S] ∪ #emph[T];))
]

That is, if #emph[x] is choiceworthy in two sets, it is choiceworthy in their union. This is sometimes called #emph[expansion];, e.g., in #cite(<Moulin1985>, form: "prose");.

/ Property δ: #block[
(#emph[x] ∈ #emph[C];(#emph[T];) ∧ #emph[y] ∈ #emph[C];(#emph[T];) ∧ #emph[T] ⊆ #emph[S];) → ({#emph[y];} ≠ #emph[C];(#emph[S];))
]

This is a weakening of β. It says that if #emph[x] and #emph[y] are both choiceworthy in the smaller set, then after options are added, it can't be that only one of them is the only choiceworthy option remaining. If #emph[x] is not choiceworthy in the larger set, that's because some other option, not #emph[y];, is chosen in place of it.

/ Property Aiz: #block[
(#emph[C];(#emph[S];) ⊆ #emph[T] ∧ #emph[T] ⊆ #emph[S];) → #emph[C];(#emph[T];) ⊆ #emph[C];(#emph[S];)
]

That is, if the smaller set contains all of the choiceworthy members of the larger set, then no option is choiceworthy in the smaller set but not the larger set. If #emph[x] is a unchoiceworthy member of #emph[S];, then the only way to make it choiceworthy is by deleting choiceworthy members of #emph[S];, not unchoiceworthy ones.

/ Path Independence: #block[
#emph[C];(#emph[S] ∪ #emph[T];) = #emph[C];(#emph[C];(#emph[S];) ∪ #emph[C];(#emph[T];))
]

The same options are choiceworthy from a union of two sets as are choiceworthy from the union of the choiceworthy members of those sets. This is a sort of independence of irrelevant alternatives principle; the availability or otherwise of unchoiceworthy members of #emph[S] and #emph[T] doesn't affect what should be chosen from #emph[S] ∪ #emph[T];.

I'll describe the effects of these properties in more detail in subsequent sections.

= Property α
<sec-alpha>
This is the most commonly used constraint on choice functions, and it does seem intuitive. If #emph[x] is choiceworthy from a larger set, deleting unchosen options shouldn't make it choiceworthy. #cite(<Sen1970sec>, form: "prose", supplement: [323-326]) discusses two possible counterexamples.

One is where the presence of options on the menu gives Chooser relevant information. If the only two options are tea with a particular friend or staying home, Chooser will take tea. But if the option of cocaine with that friend is added, Chooser will stay home. The natural thing to say here is that when one gets new information, #emph[C] changes, so there isn't really a single #emph[C] here which violates α.#footnote[For a quick argument for that, if Chooser learns the only options are tea and staying home because the friend has just run out of cocaine, they might still stay home.]

The more interesting case is where the value Chooser puts on options is dependent on what options are available. So imagine Chooser prefers more cake to less, but does not want to take the last slice. If the available options are zero slices or one slice of cake, Chooser will take zero. But if two slices of cake is an option, Chooser will take one, again violating α.

This is a trickier case, and the natural thing to say is that Chooser doesn't really have the same options in the two cases. Taking the last slice of cake isn't the same thing as taking one slice when two are available. But this move has costs. In particular, it makes it hard to say that #emph[C] should be defined for any set of options. It doesn't clearly make sense to ask Chooser to pick between #emph[taking one slice, which is the last];, and #emph[taking three slices when five are available];.

Still, I'm going to set those issues aside and assume, like most theorists do, and mostly assume that α is a constraint on coherent choice functions, and that choice functions are defined over arbitrary sets of options. In #ref(<sec-mixed>, supplement: [Section]) I'll come back to this last assumption, but otherwise I'll assume it is in place.

= Assumptions
<sec-assumptions>
I've said a few times I'm assuming this or that, so it's a good time to put in one place the assumptions I'm making. These aren't intended to stack the deck in my favour; if any of them are false, I think it makes something like my view (a) more plausible, but (b) harder to state. Anyway, here's what has been assumed.

+ #emph[P] is transitive, i.e., #emph[xRy] ∧ #emph[yRz] → #emph[xRz]
+ #emph[R] is 'defined', i.e., #emph[xRy] ∨ #emph[yRx];.
+ #emph[R] is reflexive, i.e., #emph[xRx];.
+ #emph[C] is non-empty, i.e., #emph[C];(#emph[S];) ≠ ∅.
+ #emph[C] is defined everywhere, i.e., there is a universe of options #emph[U] all subsets of #emph[U] are in the domain of #emph[C];.
+ #emph[C] satisfies α.
+ The universe #emph[U] of options, that #emph[S] is a subset of, and #emph[x] is drawn from, is finite.

In #ref(<sec-alpha>, supplement: [Section]) we saw one reason to reject 5, namely that we might want to individuate options in terms of what else is available. We'll see another in #ref(<sec-mixed>, supplement: [Section]) when we get to games with no pure strategy equilibrium. But unless stated otherwise, I'll be assuming these six things without comment.

When #emph[R] satisfies 1-3, I'll follow #cite(<Luce1956>, form: "prose") and call it a #emph[semiorder];. When it also satisfies trichotomy, i.e., (4), I'll follow standard practice and call it a #emph[weak order];.

= Defining binariness
<sec-defining>
With these seven assumptions on board, it's easy to state what it is for a choice function to be binary. Without them there would be a lot of choice points in the definition, but now everything is simple.

First, we'll define an inversion function #emph[B] (for binary) that maps preference relations to choice functions, and vice-versa. Both of these are sets of ordered pairs, and we'll define the ordered pairs directly. I'll assume that there is a universe #emph[U] of options, and every option and set of options is drawn from it.

If the input to #emph[B] is a preference relation #emph[R];:

#block[
#set enum(numbering: "(1)", start: 7)
+ #emph[B];(#emph[R];) = {⟨#emph[S];, #emph[x];⟩: ∀#emph[y];(#emph[y] ∈ #emph[S] → #emph[xRy];)}
]

That is, #emph[B];(#emph[R];) is the choice function which for any set #emph[S] selects what Sen calls 'maximal' members, those members to which nothing is strictly preferred.#footnote[#cite(<Hansson2009>, form: "prose") calls this the 'liberal maximisation' rule. He contrasts it with five other rules, which are distinct in general but equivalent given #emph[R] is a semiorder.]

If the input to #emph[B] is a choice function #emph[C];:

#block[
#set enum(numbering: "(1)", start: 8)
+ #emph[B];(#emph[C];) = {⟨#emph[x];, #emph[y];⟩: x ∈ #emph[C];({#emph[x];, #emph[y];})}
]

That is, #emph[B];(#emph[R];) is the preference relation which says that in any choices from pair sets, an element is chosen only if it is at least as good as the other member. #cite(<Sen1970sec>, form: "prose", supplement: [319]) calls this the 'base relation' as opposed to a more complicated 'revealed preference relation', and notes that the two are equivalent given α. Since we're assuming α, we'll use the simpler version.

A choice function #emph[C] is #strong[binary] if (9) holds:#footnote[Sen calls these functions 'basic binary', but the distinction he's drawing attention to by adding 'basic' doesn't make a difference given #emph[R] is a semi-order and α.]

#block[
#set enum(numbering: "(1)", start: 9)
+ #emph[C] = #emph[B];(#emph[B];(#emph[C];))
]

That is, if you convert #emph[C] into a preference relation, and back into a choice function, you get the same thing back.

The core claim of this paper is that there are coherent choice functions which are not binary. A related claim is that a plausible pair of coherence constraints that you can state using #emph[B] do not in fact hold. The constraints are that if #emph[C] and #emph[R] are an agent's choice function and preference relation, then #emph[C] = #emph[B];(#emph[R];), and #emph[R] = #emph[B];(#emph[C];).

= Property β
<property-β>
If we start with choice functions, the definition of #emph[E] in (3) is too simple. A better definition is in (10).

#block[
#set enum(numbering: "(1)", start: 10)
+ #emph[xEy] ↔ ∀#emph[S];({#emph[x];, #emph[y];} ⊆ #emph[S] → (#emph[x] ∈ #emph[C];(#emph[S];) ↔ #emph[y] ∈ #emph[C];(#emph[S];)))
]

That is, #emph[x] and #emph[y] are equal iff one is never chosen when the other is not.#footnote[Without α, this is too weak, since it doesn't entail that #emph[x] and #emph[y] are intersubstitutable in general. But we won't worry about that.] Given this notion of equality, there is an intuitive gloss on β: Two options are both choiceworthy iff they are equal.#footnote[This gloss also assumes α.]

To see this, think about choice functions that are defined by starting with numerical value functions, e.g., expected utility, and saying that the choiceworthy options are those with maximal value. If #emph[x] and #emph[y] are both choiceworthy in any set, they must have the same value. That means in any set where either is choiceworthy, i.e., either has maximal value, they both have maximal value, so both are choiceworthy.

More generally, given the assumptions we're making, #emph[C] satisfies β iff #emph[B];(#emph[C];) is trichotomous, which is equivalent to #emph[B];(#emph[C];) satisfying II-transitivity. Unsurprisingly, the two historically significant cases of intuitive counterexamples to II-transitivity also generate intuitive counterexamples to β.

The first example involves distinct but indistinguishable options.#footnote[The idea that humans can't distinguish similar options is important in #cite(<Fechner1860>, form: "prose");, a work which is discussed in #cite(<sep-fechner>, form: "prose");. The earliest connection I've found between this and indifference being intransitive is in #cite(<Armstrong1939>, form: "prose");. Armstrong's example is rather confusing; the one I'll use here is based on #cite(<Luce1956>, form: "prose");.] Assume that Chooser prefers more sugar in their coffee to less, but can only tell two options apart if they differ by 10 grains of sugar or more. Now consider these three options:

#quote(block: true)[
#emph[x] = Coffee with 100 grains of sugar. \
#emph[y] = Coffee with 106 grains of sugar. \
#emph[z] = Coffee with 112 grains of sugar.
]

This is said to be a counterexample to II-transitivity because Chooser is indifferent between #emph[x] and #emph[y];, and between #emph[y] and #emph[z];, but strictly prefers #emph[z] to #emph[x];. It's also a counterexample to β. Chooser would choose either from #emph[x] and #emph[y];, but when #emph[z] is added, #emph[y] is still choiceworthy but #emph[z] is not.

This example was historically important, but it's not discussed that much in the contemporary philosophical literature. It could be because philosophers were convinced by the argument in #cite(<Fara2001>, form: "prose") that phenomenal indistinguishability is in fact transitive. But it did get widely discussed in economics, especially once it started being discussed by R. Duncan Luce #cite(<Luce1956>, form: "year");#cite(<Luce1959>, form: "year");, who used these examples to argue that preferences form a semi-order.

The cases that were more important in the philosophical literature are what #cite(<Chang1997>, form: "prose") call 'small improvement' cases. The earliest case I know of fitting this form is from #cite(<LuceRaiffa1957>, form: "prose");.#footnote[I haven't found a case like this in Luce's sole-authored works, and indeed #cite(<Debreu1960>, form: "prose") notes that a related case raises problems for one of the central assumptions of #cite(<Luce1959>, form: "prose");.] (In this, #emph[P];(#emph[x];,#emph[y];) is the probability that Chooser will select #emph[x] when #emph[x] and #emph[y] are both available.)

#quote(block: true)[
Suppose that #emph[a] and #emph[b] are two alternatives of roughly comparable value to some person, e.g., trips from New York City to Paris and to Rome. Let #emph[c] be alternative a plus \$20 and #emph[d] be alternative #emph[b] plus \$20. Clearly, in general #emph[P];(#emph[a];, #emph[c];) = 0 and #emph[P];(#emph[b];, #emph[d];) = 0. It also seems perfectly plausible that for some people #emph[P];(#emph[b];, #emph[c];) \> 0 and #emph[P];(#emph[a];, #emph[d];) \> 0, in which event #emph[a] and #emph[b] are not comparable, and so axiom 2 \[i.e., (4)\] is violated. @LuceRaiffa1957[ 375]
]

An example with the same structure, involving a boy, a bicycle, and a bell, is discussed in #cite(<LehrerWagner1985>, form: "prose");, and mistakenly attributed to #cite(<Armstrong1939>, form: "prose");.#footnote[Many authors subsequently made the same attribution; if you want to see some examples, search for the word 'pony' among the citations of Armstrong's paper on Google Scholar.]

The usual way these cases are discussed, starting with Luce and Raiffa, is that they violate a certain kind of comparability. For example, Luce and Raiffa say there is a sense in which the two holidays are 'not comparable'. I want to resist this reading. The core intuition here, I think, is that β fails. Chooser would choose either option from {#emph[a];, #emph[b];}, but if #emph[c] is added as an option, #emph[a] becomes unchoiceworthy. If we add the assumption that #emph[R] = #emph[B];(#emph[C];), then it does follow that trichotomy fails, and there is a sense in which they are incomparable. But without that assumption, it's consistent to say that these are counterexamples to β but not to trichotomy. We'll return to this point in #ref(<sec-dorr>, supplement: [Section]).

= Properties γ and δ
<sec-gamma>
Assume #emph[R] does not satisfy trichotomy, but is a semiorder, and #emph[C] = #emph[B];(#emph[R];). Then β will fail, but γ and δ will hold. Conversely, for any #emph[C] where γ and δ hold, there is a semiorder #emph[R] such that #emph[C] = #emph[B];(#emph[R];) @Sen1970sec[ 320]. We're not going to be very interested in δ, but we will be very interested in γ.

The reason γ holds when #emph[R] is a semiorder and #emph[C] = #emph[B];(#emph[R];) is instructive. If #emph[x] is choiceworthy among #emph[S];, then nothing in #emph[S] is better than #emph[x];. Similarly, if #emph[x] is choiceworthy among #emph[T];, then nothing in #emph[T] is better than #emph[x];. So nothing in #emph[S] ∪ #emph[T] is better than #emph[x];. So #emph[x] is choiceworthy among #emph[S] ∪ #emph[T];.#footnote[This argument doesn't appeal to #emph[R] being a semiorder, but if it is not, most theorists would not define #emph[B] this way.]

Conversely, if there are cases where #emph[C] should not satisfy γ, then we'll have an argument that #emph[C] should not be based in some semiorder #emph[R];. Showing that there are such cases will be one of the main tasks of the rest of this paper.

We had two kinds of counterexamples to β, but only one of them will be relevant here. I don't think there are any intuitive counterexamples to γ that start with Fechner-style reflections on the intransitivity of indifference. But there are going to be variations on the bicycle and pony example that generate intuitive counterexamples to γ. We'll come back to these in #ref(<sec-badcomp>, supplement: [Section]).

It is common to say that when #emph[C] = #emph[B];(#emph[R];) for some semiorder #emph[R];, that #emph[C] is #strong[rationalizable];, and when #emph[R] is a partial order, that #emph[C] is #strong[rationalizable by a partial order];. I find this terminology tendentious - why should semiorders be the only things that can make #emph[C] rational? And as we'll see in #ref(<sec-games>, supplement: [Section]), it conflicts with the notion of a choice being #emph[rationalizable] in game theory. But it's a common enough terminology that I wanted to mention it here.

= Aizerman's Property
<sec-aiz>
The property Aiz is not particularly intuitive. Fortunately, it turns out to be equivalent, given our assumptions to one that is: Path-Independence.#footnote[Unless stated otherwise, the results in this section, along with proofs, can be found in the helpful survey by Hervé #cite(<Moulin1985>, form: "prose");.] That principle says that to find what's choiceworthy from a union of sets, you only have to consider which options are choiceworthy in the smaller sets.

Note that this isn't just saying that the options choiceworthy from the union are choiceworthy from one of the members. That is implied by α. What it is saying is that whether the unchosen options from S and T are or aren't on the menu doesn't make a difference to which options are choiceworthy from the union.

There is a very natural kind of model where α and Path-Independence holds, but β and γ do not. Let #emph[O] be a set of total orderings of #emph[U];. (A total ordering is a relation #emph[R] such that #emph[xRy];~∨~#emph[yRx];~∨~x=y.) Then #emph[C];(#emph[S];) is the set of Pareto-optimal members of #emph[S] relative to those orderings. That is, it is the members of #emph[S] such that no other member of #emph[S] is better according to every member of the set of orderings.

In fact, it turns out the converse of this is also true. If #emph[C] satisfies α and Aiz, then there is some set of total orderings such that #emph[C];(#emph[S];) is the set of Pareto optimal members of #emph[S] according to that set.

It might seem strange after all the talk of weak orderings and semiorders that we're now using total orders. Given that #emph[U] is finite, this turns out to be unsurprising. Any semiorder, and hence any weak order, is such that there is some set of total orders such that #emph[x] is strictly preferred to #emph[y] in the semiorder iff it is preferred in all the total orders. (In fact we can put a sharp cap on how many such orders there must be.) So being Pareto optimal relative to some set of semiorders (or weak orders) is equivalent to being Pareto optimal relative to a larger set of total orders.

If #emph[C] is determined by a set of orders in this way, it is said to be #strong[pseudorationalizable];. These choice functions are not always binary. Consider one simple example, where #emph[U] is {#emph[x];,~#emph[y];,~#emph[z];}, #emph[C];(#emph[U];)~=~{#emph[x];,~#emph[z];}, and for any other #emph[S];, #emph[C];(#emph[S];)~=~#emph[S];. That is the choice function determined by the pair of orderings #emph[x];~\>~#emph[y];~\>~#emph[z];~and #emph[z];~\>~#emph[y];~\>~#emph[x];. This satisfies α, δ and Aiz, but not β or γ. And it isn't binary. #emph[B];(#emph[C];) is the universal relation #emph[R];, since whenever #emph[S] is a pair set, #emph[C];(#emph[S];)~=~#emph[S];.

I'm going to argue over subsequent sections that this is a coherent choice function, and hence not all coherent choice functions are binary.

= Preference and Trade
<sec-trade>
Let's go back to why we might have wanted to focus on binary preference relations. One natural reason is that our primary aim in looking at preferene is to explain trade, and it is natural to give preferences a central role in explaining trade. If Chooser trades a cow for some magic beans, it's natural to explain that by saying Chooser preferred the magic beans.

When we are looking to explain trade in a non-monetary economy, that seems like a good reason to give preferences a central role in the story. But very little trade these days involves barter like this. Most trade involves money. Money is primarily valuable instrumentally. If Chooser buys some shoes for \$100, we could say that Chooser prefers the shoes to the money. But that doesn't seem like the end of the story, since there is a reason why Chooser values the money as they do. The deeper point is that the money Chooser has gives them a budget constraint, and Chooser really thinks that the shoes are a better use of the \$100 than anything else available. That is, it seems more informative to describe Chooser as choosing the shoes from the menu of things that cost \$100 than to describe them as preferring the shoes to the money, since it's the fact about choice that explains why they have that preference.

Not everyone will think these kinds of pragmatic considerations about what we're aiming to explain should be relevant to what kinds of attitudes we take to be primary. If so, you should think this point about monetary economies is irrelevant to whether we should start with preferences or choices. But if you do think the pragmatic considerations are relevant, then you should think that choice functions are a better starting point than preference relations for explaining economic behaviour in monetary economies.

To be sure, if the original motivations for starting with preferences are bad, the original motivations for moving to choice functions might be worse. The focus on choice functions originally came from economists who thought that preferences were unobservable, and hence that we should focus on something observable like choice. If that's the best argument against taking preference to be the basic notion, and hence accepting #emph[C];~=~#emph[B];(#emph[R];), I'd stick with preferences. But as we'll see, there are better reasons to be sceptical of this preference-first approach.

= Degenerate Games
<sec-games>
Say a two-player game is #strong[degenerate] iff the payoffs to one of the players are constant in all outcomes of the game. For convenience, say Column is the player with a constant outcome. So #ref(<tbl-upmid>, supplement: [Table]), #ref(<tbl-middown>, supplement: [Table]) and #ref(<tbl-allthree>, supplement: [Table]) are degenerate games.

#figure([
#table(
  columns: 3,
  align: (right,center,center,),
  table.header([], [Left], [Right],),
  table.hline(),
  [Up], [10,0], [0,0],
  [Middle], [1,0], [1,0],
)
], caption: figure.caption(
position: top, 
[
A degenerate two-option game
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-upmid>


#figure([
#table(
  columns: 3,
  align: (right,center,center,),
  table.header([], [Left], [Right],),
  table.hline(),
  [Middle], [1,0], [1,0],
  [Down], [0,0], [10,0],
)
], caption: figure.caption(
position: top, 
[
Another degenerate two-option game
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-middown>


#figure([
#table(
  columns: 3,
  align: (right,center,center,),
  table.header([], [Left], [Right],),
  table.hline(),
  [Up], [10,0], [0,0],
  [Middle], [1,0], [1,0],
  [Down], [0,0], [10,0],
)
], caption: figure.caption(
position: top, 
[
A degenerate three-option game
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-allthree>


Start with the following two assumptions, which seem fairly weak relative to most practice in game theory.

- If a move is part of a Nash equilibrium, it is choiceworthy.
- A move is choiceworthy only if there is some probability distribution over the other player's moves such that the move maximises expected utility given that distribution.#footnote[The notion of a rationalizable choice, in the sense of #cite(<Bernheim1984>, form: "prose") and #cite(<Pearce1984>, form: "prose");, slightly strengthens this. A choice is rationalizable iff it maximises expected utility relative to a probability assignment that only gives positive probability to the other player, or players, making rationalizable choices. That's circular as stated, but one can remove the circularity at the cost of making the definition somewhat less intuitive.]

In degenerate games, these necessary and sufficient conditions for choiceworthiness coincide, but in general they are rather different.#footnote[Since rationalizability is between these notions, it also coincides with them for degenerate games.]

In #ref(<tbl-upmid>, supplement: [Table]) and #ref(<tbl-middown>, supplement: [Table]), both options are choiceworthy by this standard. Middle-Right is a Nash equilibrium in #ref(<tbl-upmid>, supplement: [Table]), and Middle-Left is a Nash equilibrium in #ref(<tbl-middown>, supplement: [Table]). But in #ref(<tbl-allthree>, supplement: [Table]), the only choiceworthy options are Up and Down. Whatever probability Row assigns to Left/Right, Middle will not maximise expected utility. So this is a counterexample to γ. Middle is choiceworthy from {Up, Middle} and from {Middle, Down}, but not from their union.

It follows immediately from Lemma 3 in #cite(<Pearce1984>, form: "prose") that in degenerate games, a choice satisfies those conditions for being choiceworthy iff it is not strictly dominated, where this includes being dominated by mixed strategies. So in #ref(<tbl-allthree>, supplement: [Table]), Middle is strictly dominated by the 50/50 mixture of Up and Down. This means that the choices will satisfy Path-Independence. An option is not dominated by the options in #emph[S] ∪ #emph[T] iff it is not dominated by the undominated options in #emph[S] ∪ #emph[T];, i.e., by the options in #emph[C];(#emph[S];) ∪ #emph[C];(#emph[T];). So removing options that are not choiceworthy in #emph[S] and #emph[T] from the union doesn't change what is undominated, i.e., choiceworthy.

This last paragraph is the start of a pattern in the examples that follow. Although I'll be arguing against γ, I won't be arguing against Aiz/Path-Independence. I'm not going to offer anything like a conclusive argument for Aiz, but the pattern suggests that it is the right constraint to add to α.

= Choice Under Uncertainty
<sec-uncertainty>
#cite(<LuceRaiffa1957>, form: "prose") discuss what they call choices under 'uncertainty', by which they mean choices where Chooser cannot assign probabilities to the states. #cite(<Peterson2017>, form: "prose") calls these choices under 'ignorance'. None of the proposed decisive rules for choice under uncertainty/ignorance are particularly compelling; all lead to very strange outcomes.

The best approach, in my opinion, is to treat these choices like degenerate games. Indeed, degenerate games are really a paradigm of choice under ignornace; Row has no reason to assign any particular probability to Column's choice. Further, what the game theory textbooks say about degenerate games seems fairly plausible; any undominated option is choiceworthy. The same goes for choices under ignorance; any undominated option is choiceworthy.

If that's right, then the three examples from #ref(<sec-games>, supplement: [Section]) can be repurposed as examples of choice under uncertainty, replacing Left and Right with #emph[p] and ¬#emph[p];, and the same analysis will hold. Again γ will fail, because Middle is choiceworthy when there is one other option, but not when they are two. So there's no binary comparison of Middle with the other two options that explains the facts about what is choiceworthy in the three cases.

= Multiple Equilibria
<sec-multieq>
This is a decision theory paper, so we need to introduce a demon who can reliably predict Chooser's choices. We'll work with a version of what #cite(<Skyrms1982>, form: "prose") calls 'Nice Demon'. In #ref(<tbl-nice-demon>, supplement: [Table]), Chooser selects Up or Down, and Demon either predicts Up (PU), or predicts Down (PD). Whatever Chooser does, Demon is very likely to have predicted correctly.

#figure([
#table(
  columns: 3,
  align: (right,center,center,),
  table.header([], [PU], [PD],),
  table.hline(),
  [Up], [6], [0],
  [Down], [0], [4],
)
], caption: figure.caption(
position: top, 
[
First version of Nice Demon
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-nice-demon>


Jack #cite(<Spencer2023>, form: "prose") argues against views, like that defended by Dmitri #cite(<Gallow2020>, form: "prose");, which say only Up is choiceworthy in #ref(<tbl-nice-demon>, supplement: [Table]). His argument relies on a simple principle. If Chooser plans to play Down, then Chooser knows Down will have the best return, and it's not irrational to make the choice one knows will have the best return. #cite(<Gallow2024>, form: "prose") argues that knowledge might not be a strong enough state to make this principle work, because of high stakes gambles. I think knowledge should play the role in practical reasoning Spencer assigns it (#cite(<WeathersonKAHIS>, form: "prose");), so I'll assume Spencer is right here, and both Up and Down are choice-worthy in #ref(<tbl-nice-demon>, supplement: [Table]). Indeed generally in any problem with a nice demon, any option that would be best were it chosen, is choiceworthy for just the reason Spencer gives.

Now add a third option, Exit, which has a guaranteed return of 1. So the game table looks like #ref(<tbl-nice-demon-exit>, supplement: [Table]).

#figure([
#table(
  columns: 3,
  align: (right,center,center,),
  table.header([], [PU], [PD],),
  table.hline(),
  [Up], [6], [0],
  [Exit], [1], [1],
  [Down], [0], [4],
)
], caption: figure.caption(
position: top, 
[
Second version of Nice Demon
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-nice-demon-exit>


In #ref(<tbl-nice-demon-exit>, supplement: [Table]), Exit is not choiceworthy. Whatever credences Chooser has about what Demon has done, it is better in expectation to choose one of Up or Exit. But if either Up or Down were unavailable, Exit would be choiceworthy. So again this case is a counterexample to γ.

There is an important general lesson from this case. What makes an option choiceworthy in cases like this is that it is utility maximising #emph[once it is chosen];. We'll turn next to a more dramatic illustration of this point.

= Mixed Strategies
<sec-mixed>
Demon has stopped being nice, and now wants to play Rock-Paper-Scissors with Chooser. Given Demon's powers, this could go badly for Chooser. Happily, Chooser can choose to randomise#footnote[I'm not going to argue for this here, but I think it is part of being ideally practically rational that one is able to randomise, just like it is part of being ideally practically rational that one can make calculations costlessly.];, and all Demon can predict is the probability that Chooser's random process will come up with any option. So the best thing for Chooser to do is to pick one of the three options at random. That alone will maximise expected utility conditional on being chosen.

Not coincidentally, the only Nash equilibrium of Rock-Paper-Scissors is for each player to randomise. Nash equilibria are arguably the only sensible strategies if one assumes that every other player has Demon-like abilities to detect what one is doing. But it's a long running puzzle in game theory how it can be uniquely rational to randomise. Why can choosing randomly be better than choosing one of the things one is randomising between? To turn this rhetorical question into an argument, note that the following three principles are inconsistent.

#block[
#set enum(numbering: "(1)", start: 11)
+ Randomising is the only choiceworthy strategy in Rock-Paper-Scissors.
+ If only one choice is choiceworthy, it is rationally preferred to all other choices.
+ It is irrational to prefer a random mixture of some choices to every one of the choices.
]

Since (11) is a standard view in game theory, (12) is a standard view in choice theory, and (13) is a standard view in preference-based decision theory, it is a little disconcerting to see they are inconsistent.

The example in #ref(<sec-multieq>, supplement: [Section]) shows how to steer through this trilemma. Choiceworthiness is fundamentally an ex ante notion, and preference is fundamentally an ex post notion. The reason Spencer's view about #ref(<tbl-nice-demon>, supplement: [Table]) is right is not that the rational chooser is indifferent between Up and Down. It's that they don't have preferences between them until they have chosen, and once they choose, they prefer the choice.

Similarly in Rock-Paper-Scissors (especially against a Demon), what's true is that prior to deciding, the only rational choice is to randomise. Once one has chosen, one shouldn't have any preference over the options; they each have the same expected utility. Indeed, one should not prefer to re-randomise rather than just put into effect the result of the random process.

So we should reject (12) in its most natural interpretation. Randomising in Rock-Paper-Scissors is the only choiceworthy option, but until a choice is made, Chooser simply shouldn't have preferences over these options.

Most of the arguments in this paper against the binariness of choice turn on counterexamples to γ, but this is a distinct argument. Sometimes, as in Rock-Paper-Scissors, there are grounds for rational choice, but no grounds for rational preference. The only preferences that would ground the choice would violate (13). So rational choiceworthiness cannot be grounded in rational preference.

This is the deepest reason why #emph[C] = #emph[B];(#emph[R];) must be wrong; #emph[C] and #emph[R] are fundamentally about different kinds of attitudes. #emph[C] is about what is rational prior to making a choice, #emph[R] is about what's rational having made a choice. Outside of Newcomb-like cases, this distinction won't often matter, but it is another reason that the equation fails.

= Multiple Attributes and Decisiveness
<sec-sartre>
#cite(<Sartre1946>, form: "prose") has a famous example of a young man, we'll call him Pierre, caught between two imperatives. The actual example is complicated in interesting ways, but we'll work with a very simple version of this. Pierre lives in occupied France during WWII, and feels torn between his duty to care for his ailing mother, and his duty to fight for his occupied country. What should he do?

The case is horribly underdescribed, but the following verdicts have seemed plausible to many people. First, Pierre can rationally, and morally, choose what to do here. This are both noble impulses, and it's fine to follow other. Second, and this follows from the first and the fact the case is underdescribed, the options are not equally good. After all, a small improvement to either would not break a tie between them. Third, there is something wrong about Pierre going back and forth between the two choices; he should make a choice and stick to it. The intuition I'm interested in here is that there is something intrinsically good about settling on a choice and sticking to it. What makes this intuition less than fully clear is that in any practical version of the case, it will be very bad for Pierre to oscillate between the two views. He could spend the whole war travelling between England and France as he changes his mind on where he should be, and that would be bad. The intuition I want to press is that there is something good about taking a stance and committing to it, even outside of the practical costs of changing one's mind.#footnote[As #cite(<Moss2015>, form: "prose") points out, it is less clear this is intrinsically bad if there is more time between the reconsiderations; it makes more sense to change one's mind than to rapidly flip-flop. That is perhaps one way to support the intuition in the text. If Pierre resembles the young Thomas Schelling (as discussed by #cite(<Holton1999>, form: "prose");), firmly committing to one plan and then another over the course of successive nights, there's something wrong about that even if it isn't practically bad.]

A very simple model, which captures these intuitions, is that Pierre's situation is surprisingly like the person playing #ref(<tbl-nice-demon>, supplement: [Table]). There are two options here, and either is acceptable, but once one is chosen, it becomes the preferred one. There are two good values here, caring for family and caring for country, and Pierre's fundamental choice is to adopt one of these as his value. As #cite(<Chang2024>, form: "prose") puts it, he chooses to put 'his whole self' behind one of those values. Once that choice is made, his preferences and his actions follow naturally.

I do not want to say this is the only way to understand this example. Perhaps Pierre could, as Chang puts it, #emph[drift] into one choice. Perhaps he could adopt one path and sometime later rationally regret his choice, because the other value strikes his later self as more important. All I mean to say is that it seems possible that Pierre could be someone for whom both choices are rational, but once he has committed to one of them, it would be irrational to turn around and do the other. If that's right, toy models like #ref(<tbl-nice-demon>, supplement: [Table]) are surprisingly good models of real examples like this.

= β and Incompleteness
<sec-dorr>
The Pierre case in #ref(<sec-sartre>, supplement: [Section]) is, if the intuitions I was prodding are correct, a straightforward counterexample to β. Just to spell it out,

#quote(block: true)[
#emph[x] = Help mother \
#emph[y] = Fight Nazis \
#emph[z] = Help mother plus one extra ration book
]

If the choices are #emph[x] and #emph[y];, either is acceptable. If the choices are #emph[x];, #emph[y] and #emph[z];, #emph[x] alone is unchoiceworthy. So β fails.

This is the Small Improvement argument, and it is often thought to be an argument against completeness, i.e., (4). The point of this section is to say why that argument might fail, even if the argument against β works.

Imagine someone was convinced by the arguments in #cite(<DorrEtAl2023>, form: "prose") that (4) must be true. Their arguments turn on semantic properties of comparatives; since #emph[R] is a comparative, they say it must be complete since all comparatives are complete.#footnote[For what it's worth, I think this argument fails because of the case of 'stronger' in logic. They address this case, but I don't think their response works. But it would be a huge digression to follow that thread through.] Now it would be very strange if the semantics of comparatives in natural language entailed that these intuitions about β had to be false. And in fact these claims about semantics do not entail that.#footnote[I'm focussing here on the argument in #cite(<DorrEtAl2023>, form: "prose");, but a similar response works if someone is convinced of (4) by the argument in #cite(<Broome1997>, form: "prose");.]

The following view seems to me to be coherent, and if so it shows why this view of comparatives does not raise a problem for β.

- β fails in cases like Pierre's.
- An option is choiceworthy for Pierre iff no option is #emph[determinately] preferred to it.
- To make a choice, Pierre must determine which value is really his.
- Once he does that, his preferences will satisfy (4).
- Before he does that there are two possibilities. One is that his preferences aren't even defined over these options, so asking which is preferred is like asking whether the number 7 is taller, shorter, or the same height as justice. Another is that it is vague what Pierre's preferences are, but any resolution of the vagueness makes (4) true. This latter option fits nicely with the idea that #emph[C] should satisfy Aiz, since it should be determined by a set of orderings, each of them the possible precisifications, or determinations, of his current state.#footnote[This view of preference mirrors the view of credence defended by #cite(<Carr2020>, form: "prose");.]

One objection to this view is that it seems to imply that Pierre could rationally choose one option while he prefers, but does not determinately prefer, another. But this isn't what the view implies. Once Pierre makes the choice, he must, if he is rational, determine that his preferences match it. Preference, on this view, is fundamentally an ex post notion. Just like the player in #ref(<tbl-nice-demon>, supplement: [Table]) must, if they are rational, form beliefs that make their choice optimal, what's true of Pierre is that he can make a choice while some other option being preferred is consistent with his #emph[prior] preferences. But preference, on this view, is fundamentally an ex post notion. If Pierre is rational, he will choose what he prefers. It's just not true that he'll always choose what he preferred prior to the choice. Choice, on this picture, is prior to preference, both analytically and perhaps, in cases like this, causally.

When I say this is coherent, I don't mean to half-heartedly say that it is correct. My preferred view is that Pierre could rationally drift (in Chang's sense) into either option, and if he does, (4) would fail even ex post. All I mean to argue here is that the case against β doesn't turn on this view, and is compatible with preferences being complete.

= Bad Compromises
<sec-badcomp>
My version of the Pierre example was very simple, but it allows for some interesting complications. As stated, you might think Pierre isn't thinking through his choices well enough. He should join the local resistance, so he can stay close enough to his mother to help, while also fighting the Nazis.

But maybe that's a terrible option. We can easily imagine that the resistance is either so useless that it does practically nothing, or so good at recruiting that it has little useful work. It's just as easy to imagine that it creates busywork that dramatically reduces how much he can care for his mother, while not doing much to help the war effort. At risk of trivialising the issue, we can imagine that Pierre's options look like this, where the two columns represent how much each option respects/promotes the relevant value.

#figure([
#table(
  columns: 3,
  align: (right,center,center,),
  table.header([], [Care for mother], [Fight Nazis],),
  table.hline(),
  [Stay Home], [10], [0],
  [Join resistance], [1], [1],
  [Join Free French], [0], [10],
)
], caption: figure.caption(
position: top, 
[
Pierre's options, including resistance
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-pierreresist>


I'll come back to whether this is plausible in the next two sections, but for now I'll just report an intuition that Pierre should not join the resistance; it's almost the worst of both worlds.

But the case might still be a counterexample to γ. Consider these two variants on the case.

#quote(block: true)[
#strong[No exit];: While Pierre is deliberating, he hears that the options for getting to the Free French have been decisively cut off. (In the original, he worries this might happen.) Now his only two options are to stay home, or to join the reistance.
]

#quote(block: true)[
#strong[Promise];: Pierre's brother Jean is fighting the Nazis. Pierre has promised Jean that if Jean is killed, Pierre will take up the fight in some way. Sadly, Jean is killed, and Pierre regards this promise as binding. Now his only options are to join the resistance, or join the Free French.
]

In either case, the resistance seems choiceworthy. In both cases, it is the option that does best of the remaining choices on one of the criteria. Pierre could decide he endorses that criteria as his own, and acts accordingly. So the resistance is choiceworthy amongst either pair of options, but not amongst their union.

This case is a counterexample to γ, but it does not seem to generate counterexamples to Path Independence. I can't see any variant of the case where the presence or absence of unchoiceworthy options makes a difference to what is choiceworthy.

= Levi and Sen
<sec-levisen>
In #emph[Hard Choices];, Isaac #cite(<Levi1986>, form: "prose") defended a view where the choiceworthy options are only those that maximise value on some resolution of the incompleteness in the agent's values. Levi also had views about what further constraints there should be on choice, so he did not defen the view I've been discussing where any option that is maximal on any resolution is choiceworthy. But his views are still relevant here, because this requirement that a choice be maximal on a resolution meant that he was committed to γ failing, and choices not being binary.

A central example which he uses, and which #cite(<Sen2004>, form: "prose") picks up on, involves an executive looking to hire a secretary. I'll follow Sen and call the executive Ms.~Jones.#footnote[I've also changed the secretaries' names.] She is looking for a secretary with good typing skills and good stenography skills. (This is the 1980s.) We'll conceive of these, a bit arbitrarily, as distinct values. There are three candidates: Jack, Danny, and Luke, and their value on each measure is given in #ref(<tbl-secretaries>, supplement: [Table]). (I've slightly adjusted the numbers to match the earlier examples.)

#figure([
#table(
  columns: 3,
  align: (right,center,center,),
  table.header([], [Typing Skill], [Stenography Skill],),
  table.hline(),
  [Jack], [10], [0],
  [Danny], [1], [1],
  [Luke], [0], [10],
)
], caption: figure.caption(
position: top, 
[
Three candidates for a secretarial position
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-secretaries>


Levi argues that if the numbers are like this, and Danny is barely better than the other two on each metric, he is not choiceworthy. That's true even though he might be choiceworthy if one or the other candidates was unavailable.

Sen argues that the right choice theory in this case should be "inarticulate", and say that any of the three is choiceworthy. He responds to the intuition Levi presents with a dilemma.

On the first horn, we understand these numbers as representing something an objective measure of the skills of the candidates at each of the tasks. As Sen points out, it's easy to imagine situations where someone who is not abysmal at either half of the job is more useful than someone who is an expert on one, and abysmal on the other.

On the other horn, we measure the "importance" @Sen2004[ 53] of each skill for the task at hand. Sen argues, by analogy with the difficulty in establishing a social welfare function out of the welfare of each individual, that there will be no way to do this. Let's turn to how we might go about it.

= Lotteries, Choices, and Values
<sec-lotteries>
In this section I'll offer a response, on Levi's behalf, to Sen's dilemma. The example will draw heavily on recent work by Harvey #cite(<Lederman2025>, form: "prose");.#footnote[See also #cite(<Lederman2023>, form: "prose");, and #cite(<LedermanEtAl2025>, form: "prose");. This is not to say Lederman would endorse anything like this response; as we'll see in the next section he is sympathetic to Sen's view. But every principle I'll use here is discussed, one way or another, in his work, and I've drawn heavily on that discussion in what follows.] We'll start by imagining that Ms.~Jones might have a choice not of secretaries, but of agencies, and she has a reasonable credal distribution over the skills of the people a particular agency might send. That is, each choice of agency will be a choice of a #emph[lottery];, where she doesn't choose a package of skills, but a probability distribution over some outcomes, where each outcome is a secretary with a numerical skill on each attribute.

To set this up, I'll need three new bits of notation. I'll write #emph[Lxy] for a lottery that has equal chance of returning outcomes #emph[x] and #emph[y];, where these might be secretaries or further lotteries. I'll write #emph[x];~=~#emph[y] for what I've previously written as #emph[xEy];. It means that #emph[x] and #emph[y] are equally good by Ms.~Jones's lights. It's perhaps suboptimal to introduce new notation for an old concept, but the mix of L's and E's became hard to read. Finally, I'll write ⟨#emph[x];, #emph[y];⟩ for a secretary with skill #emph[x] at typing and skill #emph[y] at stenography.

If the numbers in #ref(<tbl-secretaries>, supplement: [Table]) measure importance, then Ms.~Jones's preferences should satisfy (a special case of) what Lederman calls #strong[Unidimensional Expectations];.

/ Unidimensional Expectations (UE): #block[
L⟨#emph[x];#sub[1];, #emph[y];⟩⟨#emph[x];#sub[2];, #emph[y];⟩ = ⟨(#emph[x];#sub[1] + x#sub[2];)/2, #emph[y];⟩

L⟨#emph[x];, #emph[y];#sub[1];⟩⟨#emph[x];, #emph[y];#sub[2];⟩ = ⟨#emph[x];, (#emph[y];#sub[1] + y#sub[2];)/2⟩
]

That is, the value of a lottery where the possible outcomes agree on one dimension also has the same value on that dimension, and has the expected value of the other dimension. If the lottery does not involve value conflict, old fashioned expected value maximisation is the way to go.

This is enough to rule out the example Sen has in mind on the first horn, where a secretary with skill 1 on either dimension is more than half as valuable as a secretary with skill 10. But it's not enough to say that Ms.~Jones should not hire Danny. Unidimensional Expectations is consistent with one resolution of his indeterminate value being that the value of ⟨#emph[x];,#emph[y];⟩ is #emph[xy];. If that's a permissible resolution, then there will be a resolution on which Danny is maximally valuable. But there are further principles that do rule out Danny. The most intuitive argument I know uses the following.

/ Substitution of Identicals (SI): #block[
If #emph[x] = #emph[y];, then #emph[Lxz] = #emph[Lyz] and #emph[Lzx] = #emph[Lzy];.
]

/ No Trade-Off (NT): #block[
L⟨#emph[x];, #emph[x];⟩⟨#emph[y];, #emph[y];⟩ = ⟨(#emph[x] + #emph[y];)/2,(#emph[x] + #emph[y];)/2
]

/ Rearrangement of Outcomes (RO): #block[
#emph[L];(#emph[Lxy];)(#emph[Lvw];) = #emph[L];(#emph[Lxw];)(#emph[Lvy];)
]

/ Weak Independence (WI): #block[
If #emph[x] = #emph[Lxy] then #emph[x] = #emph[y]
]

Substitution of Identicals follows naturally from the idea that the outcomes are truly equal, so it doesn't matter whether one has a lottery has an outcome that results in one or the other. No Trade-Off, like Unidimensional Expectations, says that when we are just considering strictly better and worse options, so there are no relevant complications about resolving indeterminacy, we're back in the land of expected utility maximisation. Rearrangement of Outcomes follows from the fact that the compound lotteries on either side of the identity sign each have probability 1/4 of returning one of those four outcomes. And Weak Independence, which is probably the most contentious of the lot, says that if #emph[y] is not exactly as good as #emph[x];, then a 1/2 chance of #emph[y] should not be exactly as good as #emph[x];. Given these principles, we can argue as follows.

#table(
  columns: 3,
  align: (right,left,left,),
  [1.], [⟨5, 5⟩ = #emph[L];⟨10, 5⟩⟨0,5⟩], [UD],
  [2.], [⟨10, 5⟩ = #emph[L];⟨10, 10⟩⟨10,0⟩], [UD],
  [3.], [⟨0, 5⟩ = #emph[L];⟨0, 10⟩⟨0,0⟩], [UD],
  [4.], [⟨5, 5⟩ = #emph[L];(#emph[L];⟨10, 10⟩⟨10,0⟩)⟨0,5⟩], [1,3 SI],
  [5.], [⟨5, 5⟩ = #emph[L];(#emph[L];⟨10, 10⟩⟨10,0⟩)(#emph[L];⟨0, 10⟩⟨0,0⟩)], [2, 4 SI],
  [6.], [⟨5, 5⟩ = #emph[L];(#emph[L];⟨10, 10⟩⟨0,0⟩)(#emph[L];⟨0, 10⟩⟨10,0⟩)], [5 RO],
  [7.], [⟨5, 5⟩ = #emph[L];⟨10, 10⟩⟨0,0⟩], [NT],
  [8.], [⟨5, 5⟩ = #emph[L];⟨5, 5⟩(#emph[L];⟨0, 10⟩⟨10,0⟩)], [6, 7 SI],
  [9.], [⟨5, 5⟩ = #emph[L];⟨0, 10⟩⟨10,0⟩], [8 WI],
)
To complete the argument we just need the plausible principles that (a) #emph[x] is not choiceworthy from #emph[S] when #emph[x] is not choiceworthy from the set consisting of #emph[x] and #emph[Lyz];, for #emph[y];, #emph[z] in #emph[S];, and (b) #emph[x] is not choiceworthy from #emph[S] when an option that is strictly better on every dimension is in #emph[S];.

There are several assumptions here, and any one of them could be the subject of a whole paper. But they each seem very plausible, and they show how we can ground the intuition that Levi started with in a sensible theory of preferences over lotteries involving payoffs that differ in multiple dimensions.

= Negative Dominance
<sec-negdom>
Harvey #cite(<Lederman2025>, form: "prose") notes that the picture I've developed, where Danny is unchoiceworthy, has the following strange consequence. It violates what he calls #strong[Negative Dominance];. This is the version of Negative Dominance most relevant to the case.#footnote[In all the quotes I'll change the names and example to match the one I'm using.]

/ Negative Dominance (Goodness): #block[
If one game of chance is better for \[Ms.~Jones\] than another, some prize in the first game is better for her than some prize in the second. @Lederman2025[ 13]
]

This does look like a plausible principle, but there are a few reasons for thinking we be comfortable with a theory, like Levi's, which rejects it. The fundamental one is that it assumes that facts about which lotteries are choiceworthy is determined entirely by facts about which of the prizes are choiceworthy #emph[from menus with exactly two items];. It's true that the choiceworthiness of lotteries is determined by, and grounded in, facts about the choiceworthiness of various prizes. But we shouldn't think that choiceworthiness from pairs, which is what preferences in situations that are not Newcomb-like fundamentally amount to, is a sufficient basis for all choiceworthiness facts.

So when Lederman says,

#quote(block: true)[
a strict preference for one game of chance over another must be explained by a strict preference for one of the #emph[prizes] of the first, by comparison to one of the prizes of the second @Lederman2025[ 18, emphasis in original]
]

we should question the uses of 'one'. What's true at most is that a strict preference for game of chance over another should be explained by a preference for #emph[some] of the prizes of the first over #emph[some] of the prizes of the second. In particular, we should accept this choice-theoretic version of the principle:

/ Negative Dominance for Choices: #block[
If one game of chance is choiceworthy when another is available, there must be some prize in the second that is not choiceworthy when all the prizes in the first are available.
]

Given α and γ, this will entail Lederman's version of the principle. But without them, it does not.

Another argument Lederman gives more explicitly assumes γ. He says (with several changes made to match the examples):

#quote(block: true)[
it would be bizarre if in a three-way choice \[Ms.~Jones\] is rationally permitted to choose any of the certain outcomes (a) \[Danny\], (b) \[Jack\], (c) \[Luke\], but, in a two-way choice between (a) and a coin toss over (b) and (c), she is rationally required to choose the coin toss. @Lederman2025[ 18]
]

That would be bizarre, but violating Negative Dominance does not imply that it is rationally permitted. To get that it is, you need γ, since you need that if (a) is choiceworthy from {(a), (b)} and from {(a), (c)}, it is choiceworthy from {(a), (b), (c)}.

But the biggest argument Lederman gives is that we need to explain why Ms.~Jones prefers the Jack/Luke lottery to Danny, and that to offer the fact that the lottery does better #emph[in expectation] on both values is to "fetishize global features of games" @Lederman2025[ 22]. Now I think the explanation for why the lottery is better is that Danny ∉ #emph[C];({Jack, Danny, Luke}), and I'm not sure why that's a "global" feature of a game while facts that Lederman takes to be reasonable grounds, such as which secretaries are in #emph[C];(#emph[S];) for various pair sets, is not. But set that aside; there is a cleaner explanation to offer, as follows:

+ Ms.~Jones has two values, and it is indeterminate how they should be balanced. This means both that she hasn't decided how to balance them, and maybe it is unnecessary, or even inadvisable, to balance them.
+ Given Unidirectional Expectations and No Trade-Offs (as discussed in #ref(<sec-lotteries>, supplement: [Section])), the permissible only trade-offs are linear mixtures of the values.
+ Given the result from #cite(<Pearce1984>, form: "prose") discussed in #ref(<sec-games>, supplement: [Section]) (his Lemma 3), a choice is best on no linear resolution of the indecision in point 1 iff some lottery over other choices is better in expectation on every value.
+ A prize is choiceworthy from a menu of other prizes iff it is optimal on some permissible resolution of this indecision.
+ Negative Dominance for Choices holds.

By 5, Danny is choiceworthy from {Danny, L(Jack)(Luke)} iff he is choiceworthy from {Danny, Jack, Luke}. By 4, holds only if Danny is best on some permissible resolution of Ms.~Jones's indeterminate values. By 2, that means he is best on some linear mixture of the two values. By 3, this argument generalises to any secretary whose actual values are worse, on each dimension, than the expected values of L(Jack)(Luke).

In short, the focus on expected values comes not from any particular importance on expectations as such, but from the thought that permissible reactions to indeterminacy in values are constrained by permissible reactions to resolutions of that indeterminacy, combined with (a) constraints on resolutions like Unidimensional Expectations and No Trade-Offs, and (b) Pearce's result linking expected value to linear mixtures of values.

= Conclusion
<conclusion>
This paper has been ultimately about the grounding of facts about rational choice. I've been mostly concerned to argue against a popular, if largely implicit, view: rational choice is grounded in rational preference. If Chooser wants a holiday, and is choosing where to go, which destinations are rationally choiceworthy is grounded in Chooser's (rational) preferences over pairs of choices. I've rejected this for three reasons:

+ As argued in #ref(<sec-multieq>, supplement: [Section]) and #ref(<sec-mixed>, supplement: [Section]), choiceworthiness is an ex ante concept, and preference is an ex post concept, and hence choiceworthiness is analytically prior to preference, so should not be grounded in preference.
+ When there are no Newcomb-like considerations, and so the ex ante/ex post distinction doesn't matter, preferences are just choiceworthiness judgments with respect to pair sets, and pair sets aren't normatively distinctive.
+ Any choice function that violates γ cannot be generated from a preference relation, and there are many reasons for endorsing choice functions which violate γ.

If choiceworthiness is not grounded in preferences, what is it grounded in? Here there are a few options.

We could say that there are a special class of options, call them outcomes, and choiceworthiness in general is grounded in choiceworthiness with respect to sets of these outcomes, or perhaps in sets of outcomes and simple bets involving outcomes. This would mirror the approach to subjective decision theory that grounds everything in special classes of preferences, i.e., preferences over outcomes and simple bets.

I'd prefer to ground choiceworthiness in values, plurally, and the subject's identification with some of these values. What makes joining the resistance unchoiceworthy for Pierre is that he has two values, and there is no way of balancing these values which makes joining the resistance optimal. But the other two options are both choiceworthy because they are both valuable, and Pierre could decide that one of the values they represent is one of his value, or even that it is something good to do while working out what his values really are.

That's to say, once we drop the idea that binary comparisons, i.e., preferences, have a special role in grounding rational choice, it could make sense to focus on more general comparisons, e.g., choiceworthiness from sets of options, or from properties of individual options, i.e., values. Whichever way we go, it will be easier to defend the intuitive idea that hard choices like Pierre's violate β than if we start try to ground choiceworthiness in preference.

#block[
#heading(
level: 
2
, 
numbering: 
none
, 
[
References
]
)
]


 
  
#set bibliography(style: "../../chicago-with-note.csl") 


#bibliography("../../brian-quarto.bib")

