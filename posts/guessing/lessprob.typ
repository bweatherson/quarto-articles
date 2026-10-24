// Simple numbering for non-book documents
#let equation-numbering = "(1)"
#let callout-numbering = "1"
#let subfloat-numbering(n-super, subfloat-idx) = {
  numbering("1a", n-super, subfloat-idx)
}

// Theorem configuration for theorion
// Simple numbering for non-book documents (no heading inheritance)
#let theorem-inherited-levels = 0

// Theorem numbering format (can be overridden by extensions for appendix support)
// This function returns the numbering pattern to use
#let theorem-numbering(loc) = "1.1"

// Default theorem render function
#let theorem-render(prefix: none, title: "", full-title: auto, body) = {
  if full-title != "" and full-title != auto and full-title != none {
    strong[#full-title.]
    h(0.5em)
  }
  body
}
// Some definitions presupposed by pandoc's typst output.
#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms.item: it => block(breakable: false)[
  #text(weight: "bold")[#it.term]
  #block(inset: (left: 1.5em, top: -0.4em))[#it.description]
]

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let fields = old_block.fields()
  let _ = fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.abs
  }
  block.with(..fields)(new_content)
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
        show figure.where(kind: kind): set figure(numbering: _ => {
          let subfloat-idx = quartosubfloatcounter.get().first() + 1
          subfloat-numbering(n-super, subfloat-idx)
        })
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => block({
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          })

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
  let children = old_title_block.body.body.children
  let old_title = if children.len() == 1 {
    children.at(0)  // no icon: title at index 0
  } else {
    children.at(1)  // with icon: title at index 1
  }

  // TODO use custom separator if available
  // Use the figure's counter display which handles chapter-based numbering
  // (when numbering is a function that includes the heading counter)
  let callout_num = it.counter.display(it.numbering)
  let new_title = if empty(old_title) {
    [#kind #callout_num]
  } else {
    [#kind #callout_num: #old_title]
  }

  let new_title_block = block_with_new_content(
    old_title_block,
    block_with_new_content(
      old_title_block.body,
      if children.len() == 1 {
        new_title  // no icon: just the title
      } else {
        children.at(0) + new_title  // with icon: preserve icon block + new title
      }))

  align(left, block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1)))
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
        inset: 8pt)[#if icon != none [#text(icon_color, weight: 900)[#icon] ]#title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: body_background_color, width: 100%, inset: 8pt, body))
      }
    )
}



// Typst styling for the paper, approximating the LaTeX look set by
// quarto2024.tex: EB Garamond, italic title, small "Abstract:" block,
// indented paragraphs with no indent after headings, quiet tables,
// no footnote rule. Edit the values here to adjust the look.

#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  lang: "en",
  region: "US",
  // As in the LaTeX version: upright text in EB Garamond Math, italics and bold
  // in EB Garamond (see the emph/strong rules below). Typst uses the first font
  // in the list that it can find, so this falls back to EB Garamond if needed.
  font: ("EB Garamond Math", "EB Garamond"),
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: ("EB Garamond",),
  heading-weight: "semibold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  // ---- Body text --------------------------------------------------------
  set text(lang: lang, region: region, font: font, size: fontsize,
           number-type: "old-style")
  // leading ~ LaTeX's \setstretch{1.1}; spacing = no extra gap between paragraphs
  set par(justify: true, leading: 0.72em, spacing: 0.72em,
          first-line-indent: 1.5em)
  // Math: Garamond-Math (a true math font, as in the LaTeX version) if Typst can
  // see it; otherwise EB Garamond Math, then Typst's built-in math font.
  show math.equation: set text(font: ("Garamond-Math", "EB Garamond Math", "New Computer Modern Math"))
  // Italic and bold come from EB Garamond, mirroring ItalicFont/BoldFont in LaTeX
  show emph: set text(font: ("EB Garamond",))
  show strong: set text(font: ("EB Garamond",))

  // ---- Headings ---------------------------------------------------------
  // Space measured in em, so it scales with the text; adjust above/below here.
  set heading(numbering: sectionnumbering)
  show heading: set text(font: heading-family, weight: heading-weight)
  show heading.where(level: 1): set text(size: 1.2em)
  show heading.where(level: 1): set block(above: 2em, below: 1em)
  show heading.where(level: 2): set text(size: 1.08em)
  show heading.where(level: 2): set block(above: 1.6em, below: 0.8em)

  // ---- Definition blocks (e.g. "Guess the Most Probable") ---------------
  // Term on its own line, definition indented below it, with extra space
  // between the two and around the whole block.
  // Newer Quarto styles each item with its own `show terms.item` rule; this one
  // replaces it, because rules set here take precedence. In current Typst the
  // space around the block has to go on the item itself.
  show terms.item: it => block(breakable: false,
                               above: 1.2em + 3pt, below: 1.2em + 3pt)[
    #set par(first-line-indent: 0em)
    #strong(it.term)
    #v(0.5em)
    #pad(left: 1.5em, it.description)
  ]

  // ---- Numbered example sentences, (1), (2), ... -------------------------
  // Indented, with a hanging indent for wrapped lines, and 7pt of extra
  // space above and below so they stand out from the text.
  set enum(body-indent: 0.8em)
  show enum: it => {
    set par(first-line-indent: 0em)
    pad(left: 2em, top: 7pt, bottom: 7pt, it)
  }

  // ---- Block quotes: same space above and below -------------------------
  show quote.where(block: true): set block(above: 1.1em, below: 1.1em)
  show quote.where(block: true): it => pad(left: 2em, right: 2em, it.body)

  // ---- Footnotes: no rule, slightly smaller text ------------------------
  set footnote.entry(separator: none, gap: 0.5em)
  show footnote.entry: set text(size: 0.85em)

  // ---- Tables: no rules, as in the LaTeX version ------------------------
  set table(inset: 5pt, stroke: none)
  // no justification or hyphenation inside tables, so headers wrap cleanly
  show table: set par(justify: false)
  show table: set text(hyphenate: false)
  // Quarto's tables are figures of kind "quarto-float-tbl"; 6pt more above them
  show figure.where(kind: "quarto-float-tbl"): set block(above: 1.2em + 6pt)

  // ---- Citations ---------------------------------------------------------
  // Quarto writes [-@Key] as "(" + a year-only citation + ")", but Typst drops
  // any locator in that form, so add it back:
  // [-@DorstMandelkern2022, fn. 15] gives "(2022, fn. 15)".
  // (Quarto 1.8 did not add the parentheses itself; 1.10 does.)
  show cite.where(form: "year"): it => {
    it
    if it.supplement != none [, #it.supplement]
  }

  // ---- Bibliography: much smaller heading --------------------------------
  // Typst's own bibliography heading ignores the heading rules above, so it is
  // turned off and replaced with a small one, titled as in the PDF version.
  set bibliography(title: none)
  show bibliography: it => {
    // bibliography italics are set directly rather than as emphasis, so give the
    // whole bibliography EB Garamond, which has true italics
    set text(font: ("EB Garamond",))
    block(above: 1.8em, below: 0.9em,
      text(font: heading-family, weight: heading-weight, size: 1.05em)[References])
    // make each DOI a link to https://doi.org/...
    // (stops before a trailing full stop, which is punctuation, not part of the DOI)
    show regex("10\.\d{4,9}/[^\s]*[^\s.]"): d => link("https://doi.org/" + d.text, d)
    it
  }

  // ---- Title block ------------------------------------------------------
  if title != none {
    align(center)[
      #v(1em)
      #text(font: ("EB Garamond",), style: "italic", size: 2em)[#title]
      #if subtitle != none { parbreak(); text(size: subtitle-size)[#subtitle] }
    ]
  }
  if authors != none {
    align(center)[
      #v(0.5em)
      #text(size: 1.2em)[#authors.map(a => a.name).join(", ")]
    ]
  }
  if date != none {
    align(center)[#v(0.3em)#text(size: 1.2em)[#date]]
  }
  if abstract != none {
    v(0.8em)
    pad(left: 2.5em, right: 2.5em)[
      #set text(size: 0.9em)
      #set par(first-line-indent: 0em)
      #emph[Abstract]: #abstract
    ]
    v(0.8em)
  }

  if toc {
    outline(title: toc_title, depth: toc_depth, indent: toc_indent)
  }

  if cols == 1 { doc } else { columns(cols, doc) }
}
#let brand-color = (:)
#let brand-color-background = (:)
#let brand-logo = (:)

// Page setup for the Typst version of the paper.
// Mirrors the LaTeX settings in quarto2024.tex and posts/_metadata.yml:
// 7in x 9.5in page, twoside margins, running heads, bold page number outside.

#set page(
  width: 7in,
  height: 9.5in,
  margin: (inside: 1.1in, outside: 1in, top: 0.8in, bottom: 0.8in),
  header-ascent: 40%,
  header: context {
    let p = here().page()
    if p > 1 {
      set text(size: 0.9em)
      if calc.even(p) {
        // even (left-hand) pages: number outside, author in the centre
        grid(columns: (1fr, auto, 1fr),
          align(left, strong(counter(page).display())),
          emph[Brian Weatherson],
          [])
      } else {
        // odd (right-hand) pages: title in the centre, number outside
        grid(columns: (1fr, auto, 1fr),
          [],
          emph[Guessing the Less Probable],
          align(right, strong(counter(page).display())))
      }
    }
  },
  numbering: none,
)
#show: doc => article(
  title: [Guessing the Less Probable],
  authors: (
    ( name: [Brian Weatherson],
      affiliation: [University of Michigan],
      email: [] ),
    ),
  date: [2026],
  abstract: [A common assumption in recent work on guessing is that it is best to guess the most probable answer to the question asked. This note presents three cases where this assumption looks improbable.

],
  abstract-title: "Abstract",
  sectionnumbering: "1.1",
  toc_title: [Table of contents],
  toc_depth: 3,
  doc,
)

There has been a flurry of recent interest in #emph[guessing]. Most of this work has taken for granted something like the following principle:

/ Guess the Most Probable: #block[
If one is asked #emph[Q#super[?]], and responds by guessing a complete answer, that answer is appropriate iff it is the most probable answer, given one's credences, to the question.
]

Something like #strong[Guess the Most Probable] is a consequence of views defended by Sophie #cite(<Horowitz2019>, form: "prose"),#footnote[Horowitz only commits to this for cases where there are only two possible answers, but doesn't give any indication that the principle won't generalise further.] Kevin Dorst and Matthew Mandelkern (#cite(<DorstMandelkern2022>, form: "year")), Ben #cite(<Holguin2022>, form: "prose"), Mattias #cite(<Skipper2023>, form: "prose"), Richard #cite(<Teague2024>, form: "prose"), and Niels Linnemann and Feraz Azhar (#cite(<LinnemannAzhar2025>, form: "year")). A puzzle that Helena #cite(<Fang2026>, form: "prose") raises for a generalisation of #strong[Guess the Most Probable] might make one suspect that there will be problem cases for it. The point of this note is to build on Fang's idea and describe three cases where #strong[Guess the Most Probable] fails. In all cases, some guesses which are not the most probable are permitted, and indeed in all three the most probable guess has some notable shortcomings.#footnote[This is not to say that it is impermissible; the cases are hard, and any answer might seem defective. But in all cases the most probable answer seems weird enough that it permits alternative answers.]

= Guess the Order
<sec-order>
At the start of every Premier League season, the #emph[Guardian Football Weekly] asks each of its panellists to guess the order that the 20 teams will finish in. This is obviously absurd; there are 20! possible orders, and while some can be ruled out fairly comprehensively, there are too many reasonable ones to guess any with any confidence. But guess they do, and it is a useful framing device for talking about the upcoming season.

Inspired by that, I started looking at guessing the order of finishers in somewhat smaller competitions. So consider a simple four-team league, where each team plays each other once, not twice as in the Premier League. You're probably familiar with these competitions; they are the standard form of the group stage at major international tournaments. We have four teams, imaginatively called A, B, C and D, and our expert is asked to guess the order that they'll finish in.

Our expert has to deal with two kinds of uncertainty.

First, she doesn't know exactly how good each team is. She knows each team has an underlying quality, and for each team she has a distribution over their possible quality values, but she could be wrong. We'll simplify greatly; in each case the probability distribution is a normal distribution with identifiable mean and variance. Crucially, she is very unsure about one of the teams, namely C. For that team, her credence about their quality has a very high variance, while she is fairly confident about the other three.

Second, soccer games are just random. You may remember Saudi Arabia beating Argentina in the 2022 World Cup. That was not because Saudi Arabia was the better team; sometimes the better team loses. The closer the teams are in quality, the more likely an upset is. But even for quite large quality differences, like Saudi Arabia and Argentina, the upset is possible.

Here's the model this paper uses for this kind of guessing.#footnote[AI acknowledgment: I used Claude Opus 5.5 to build this model, having explained to it the kind of tournament that I wanted. Once it was done, it came up unprompted with some summary statistics about the model which in turn I use below.]

Each team $i$ has a real quality $q_i$. In each tournament simulation, the qualities are drawn from the normal distributions with means and standard deviations described in #ref(<tbl-quality>, supplement: [Table]). In any game, we start with the difference $d$ between the two team qualities (remember quality is held fixed across a tournament). If the home team#footnote['Home team' here is just the first listed team. We are not assuming any home field advantage.] is better, $d$ is positive; if they are worse $d$ is negative. Then we add a noise parameter drawn from $cal(N)\(0\,1\)$ and tripled. If the absolute value of the result is less than 1.2, the game is a draw. Otherwise, if the result is positive the home team wins, and if it is negative the away team wins.

#figure([
#table(
  columns: 3,
  align: (left,right,right,),
  table.header([Team], [Mean], [Standard deviation],),
  table.hline(),
  [A], [4.00], [0.2],
  [B], [3.00], [0.2],
  [C], [2.00], [1.6],
  [D], [1.55], [0.2],
)
], caption: figure.caption(
position: top, 
[
The expert's credences about team quality
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-quality>


To see what the probabilities were for various outcomes, we then simulated the season two million times. As in regular soccer, a team got three points for a win, and one point for a draw. After three games, we used a randomiser to split teams on equal points.#footnote[We could have tried to simulate not just results but scores, then used tie-breaking procedures, but this was getting complicated enough.] And we measured how often each of the 24 possible permutations of the teams came up over those runs.

Now this model obviously leaves out a lot. It doesn't allow for team quality changing over time, due to injuries. It doesn't allow for teams matching up particularly well or badly against other teams. But it's complicated enough to serve as an illustration.

Assume our expert knows her own mind, so she knows the numbers in #ref(<tbl-quality>, supplement: [Table]). And she knows how team quality relates to win probabilities, via noise parameters. She has just as many computational resources as we do, so she can build all the tables you'll see here. And she is asked, just like the podcast panellists, to guess the order in which teams will finish in this group.

If she gives a complete answer, and really that's what panellists are supposed to do, and #strong[Guess the Most Probable] is correct, then there is only one permissible answer. It's ABDC. The numbers are shown in #ref(<tbl-rank-frequency>, supplement: [Table]).

#figure([
#table(
  columns: 3,
  align: (right,left,right,),
  table.header([Rank], [Order], [Probability],),
  table.hline(),
  [1], [ABDC], [0.136],
  [2], [ABCD], [0.128],
  [3], [ACBD], [0.093],
  [4], [BADC], [0.082],
  [5], [BACD], [0.079],
  [6], [ADBC], [0.072],
)
], caption: figure.caption(
position: top, 
[
The six most probable finishing orders
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-rank-frequency>


But that's a surprising guess for at least three reasons.

First, she thinks that C is probably better than D. The mean of C's quality distribution is higher than the mean of D's. It's completely reasonable to rank teams in a task like this by your mean estimate of their quality. (I suspect that's more or less what people really do when asked to produce these rankings.)

Second, our expert will do better at predicting the relative finishing positions of pairs of teams if she guesses ABCD than if she guesses ABDC. There are six pairs of teams in the tournament, and we can ask for each pair who finished higher in any tournament run. For each pair, we can also ask whether the actual order of those two teams matches the order the expert predicted for them. It turns out, as shown in #ref(<tbl-pair-match>, supplement: [Table]), that in expectation she matches more pairs by guessing ABCD than guessing ABDC. Indeed, ABCD does better on this measure than any other order.

#figure([
#table(
  columns: 4,
  align: (left,right,right,right,),
  table.header([Order], [Probability], [Expected pairs], [Expected places],),
  table.hline(),
  [ABDC], [0.136], [4.054], [1.537],
  [ABCD], [0.128], [4.182], [1.563],
  [ACBD], [0.093], [3.913], [1.420],
  [BADC], [0.082], [3.737], [1.224],
  [BACD], [0.079], [3.866], [1.249],
  [ADBC], [0.072], [3.606], [1.305],
)
], caption: figure.caption(
position: top, 
[
Expected number of pairs in the right order, and of teams in the right place, for the six most probable finishing orders
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-pair-match>


The point here is not that thinking about relative finishing positions of pairs raises extra questions over and above the question of what the finishing order will be. To guess ABCD is, inter alia, to guess that C will finish above D. All that we need to make ABCD a sensible guess is that the guesser cares about these extra things that she commits herself to when she guesses an order.

There is a natural way to make this verdict fit with the picture that Dorst and Mandelkern give. At one point in their paper, they are interested in how the guesser might trade off between more and less specific guesses. (For example, when asked to guess who will win the group, when is it best to say A, and when is it best to say something less committal like A or B?) They use a standard epistemic utility model to model these decisions, where one of the factors is how accurate the guess is. Let $v_A\(g\,w\)$ be the accuracy value of guess $g$ in world $w$. Dorst and Mandelkern make the natural assumption that $v_A\(g\,w\)= 1$ if $g$ is true in $w$, and 0 otherwise. They also note that you might want a more complicated assumption if you care about verisimilitude or partial truth.

That provides a natural explanation for why ABCD may be a permissible guess even though ABDC is more probable. Say $v_A\(g\,w\)$ is the number of pairs whose finishing order is the same in $g$ and $w$. (So if $g$ is completely correct in $w$, $v_A\(g\,w\)= 6$\; if it just gets one pair flipped around, it's 5, and so on.) Then the guess with the highest expected accuracy, by this accuracy measure, will be ABCD. The expected pairs column in #ref(<tbl-pair-match>, supplement: [Table]) just is the expected accuracy score by this measure. In this case the guess which orders the teams by their mean quality will be a Condorcet winner. That is, one team will be guessed to finish higher than another iff the probability that it finishes higher is above 0.5.

Third, although it is very close, we can rerun the second argument if the guesser cares not about the relative positions of teams, but their absolute finishing position. Another natural setting for $v_A\(g\,w\)$ sets it equal to how many teams finish in the same position in $g$ and $w$. That's the right metric for a guesser who really wants to correctly guess who will finish first, and who will finish second, and so on. If we do that, the expected places column in #ref(<tbl-pair-match>, supplement: [Table]) shows that ABCD has, by a whisker, the highest expected accuracy. Like with the pairs, the absolute finishing positions of the teams isn't another thing to guess above their order; guessing ABCD just is a way to guess that C will finish third.

So there are several reasons to guess ABCD. There is still one reason to guess ABDC; it is the most probable. And I don't deny that it is, for that reason, a permissible guess. What I do deny is that it is the only permissible complete guess. It is permissible to rank teams by their mean quality, or to prefer the Condorcet ordering, or to maximise the expected number of finishing positions one correctly predicts, even if that means making a guess with a slightly lower probability of being perfectly correct. As long as ABCD is one of the permissible guesses, that is enough to refute #strong[Guess the Most Probable], which says that only ABDC is.

In the case I've described so far ABCD is the second-most probable guess; I couldn't find a model where it was best on both of the measures listed in #ref(<tbl-pair-match>, supplement: [Table]) and was lower than second-most probable. You might wonder whether this suggests that #strong[Guess the Most Probable] is at least close to true. If the argument about pairs is correct, and it is always permissible to guess the Condorcet ranking, then it is permissible to guess really improbable orderings. Imagine our expert was asked to provide a best guess about the finishing order of the group with teams E, F, G and H, where the means and standard deviations of her credences about their quality are given in table #ref(<tbl-high-variance>, supplement: [Table]).

#figure([
#table(
  columns: 3,
  align: (left,right,right,),
  table.header([Team], [Mean], [Standard deviation],),
  table.hline(),
  [E], [1.4], [0.2],
  [F], [1.3], [2.0],
  [G], [1.2], [2.0],
  [H], [1.1], [0.2],
)
], caption: figure.caption(
position: top, 
[
The expert's credences about team quality for the second group
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-high-variance>


As #ref(<tbl-high-variance-orders>, supplement: [Table]) shows, guessing that they will finish EFGH maximises the expected number of pairs one expects to order correctly. It's also the Condorcet order: whenever $x$ is more than 50% likely to finish about $y$, it is guessed to finish above $y$. But it is not the most probable order. In fact, it is the twenty-first most probable order out of twenty-four. The second-best guess by expected pairs guessed correctly is the twenty-second most probable order. Once we start caring about claims embedded within a guess, the best guess might be a long way down the probability ranking.

#figure([
#table(
  columns: 5,
  align: (left,right,right,right,right,),
  table.header([Order], [Rank], [Probability], [Expected pairs], [Expected places],),
  table.hline(),
  [FEHG], [1], [0.066], [3.085], [1.180],
  [GEHF], [2], [0.062], [3.013], [1.150],
  [FHEG], [3], [0.059], [2.987], [1.134],
  [FEGH], [7], [0.046], [3.112], [1.046],
  [EFHG], [8], [0.045], [3.111], [1.045],
  [GEFH], [11], [0.044], [3.064], [1.030],
  [EFGH], [21], [0.030], [3.138], [0.911],
  [EGFH], [22], [0.029], [3.115], [0.906],
)
], caption: figure.caption(
position: top, 
[
Statistics for the second group, showing the orders that finish in the top three on some interesting statistic or other.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-high-variance-orders>


That said, this second group is hard, and there are good reasons to not guess EFGH. It does not maximise the probability that one will guess the group winner correctly. It does maximise the probability that one will guess who the top two teams are correctly, which is often important in tournaments, but in that respect it's tied with more probable guesses. While it often correctly guesses the identity of the top two, it is much more rare that it guesses their order, i.e., who is first and who is second, which is also important for tournaments. Just like it is the twenty-first most likely order, it ranks twenty-first, out of twenty four, in the number of teams it is expected to correctly guess the position of. I still think that all things considered, EFGH is a reasonable guess, but there are many reasons for guessing other orders.

The general claim of this section, of this paper really, is that when asked to make a #emph[structured] guess, it is generally reasonable to have some kind of more complicated value function than just 1 for true and 0 for false. What's distinctive about structured guesses, like guessing which order the teams will finish in, is that they commit the guesser to answers to related questions. The guesser might, qua guesser, care about these extra answers being correct. And if they do, they have a reason purely within accuracy considerations to guess ABCD.

You might worry this will overgeneralise. Why does this have anything to do with structure? Imagine someone asked to guess where James Bond is, and they guess Vienna. Here is a parallel to the earlier arguments about commitment. By guessing Vienna, they commit to Bond being within 50 miles of Vienna, so their guess should get some accuracy points if he is in Bratislava. And they commit to Bond being in Austria, so they should get some accuracy points if he is in Salzburg. So even for unstructured questions like #emph[Where is James Bond?], there could be a reason to use something other than a 0/1 accuracy score, and hence reason to make some guess other than the most probable.

To respond to this worry, we need a tighter notion of commitment. It's true that Bond being in Bratislava or in Salzburg is, in different ways, like his being in Vienna. But the inferences from #emph[Bond is in Vienna] to #emph[Bond is near Vienna] or #emph[Bond is in Austria] involve a change of subject-matter. The core idea I'm using here is taken from #cite(<Yablo2014>, form: "prose")\; see #cite(<Fine2016>, form: "prose") and #cite(<Berto2022>, form: "prose") for related work. The inference from a conjunction to a conjunct, or from a ranking to a pair-ordering, does not involve changing the subject. If you guess a conjunction, the conjuncts are quite literally parts of the guess. So roughly (and see the earlier references for a less rough version), the idea is that by guessing $g$, you are committed to guessing anything that $g$ entails whose subject-matter is part of $g$'s. That's why the structured guesses allow for guessing the less probable; the relevant accuracy measure won't be the simple 0/1 measure.

Finally, a housekeeping note. Dorst and Mandelkern (#cite(<DorstMandelkern2022>, form: "year", supplement: [fn. 15])) list two reasons for thinking that the accuracy value might be something other than 0 or 1: verisimilitude or partial truth. The argument of the last few paragraphs is that partial truth really is important, but verisimilitude, i.e., closeness to the truth, is not. Guessing Bond is in Vienna when he's in Bratislava is close; it's less than 50 miles away! But for the #emph[Where is James Bond?] question, I've endorsed the claim that guesses should just be judged true or false, and the right (complete) guess is the most probable one. The examples that I do think make it reasonable for the guesser to have a more complicated value function are what they are calling partial truth cases. Not coincidentally, they cite Yablo as a place to look for more detail on partial truth, so the kinds of cases I'm using are pretty close to what they were considering.

= Follow Up Guesses
<sec-follow>
The next case is largely a variant on a case developed by Richard #cite(<Teague2024>, form: "prose")\; what I want to stress is the problem it raises for #strong[Guess the Most Probable].

Having settled the ABCD and EFGH groups, the expert is now thinking about the JKLM group. The means and standard deviations of her credences about team qualities in that group are given in #ref(<tbl-quality-sec-2>, supplement: [Table]). Note that the variance is now really high; she is very unsure about all these teams.

#figure([
#table(
  columns: 3,
  align: (left,right,right,),
  table.header([Team], [Mean], [Standard deviation],),
  table.hline(),
  [J], [4.0], [1],
  [K], [2.5], [4],
  [L], [1.1], [2],
  [M], [1.0], [3],
)
], caption: figure.caption(
position: top, 
[
The expert's credences about team quality in the JKLM group
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-quality-sec-2>


On a podcast previewing the tournament, they get to this group, and the following exchange occurs:

#quote(block: true)[
Host: Who will win this group? \ Expert: J. These teams are hard to judge, but J is likely best. \ Host: Makes sense. Who will finish second? \ Expert: \[panics\]
]

The reason that the expert panics at this point is that it is really unclear how she is supposed to answer. To see this, look at her credences for which team will finish in which position in #ref(<tbl-place-prob-sec-2>, supplement: [Table]).

#figure([
#table(
  columns: 5,
  align: (left,right,right,right,right,),
  table.header([Team], [First], [Second], [Third], [Fourth],),
  table.hline(),
  [J], [0.443], [0.355], [0.158], [0.043],
  [K], [0.313], [0.219], [0.214], [0.254],
  [L], [0.102], [0.223], [0.345], [0.331],
  [M], [0.142], [0.203], [0.283], [0.372],
)
], caption: figure.caption(
position: top, 
[
The expert's credences about where each team will finish
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-place-prob-sec-2>


If #strong[Guess the Most Probable] is correct, then she should answer J. That's the team with the highest probability of finishing second. But that would be a real violation of the conversational norms in this situation. Or, at least, I think it would be a pretty big breach. So #strong[Guess the Most Probable] is wrong.

To be sure, if this was the only problem with #strong[Guess the Most Probable], then it would be fairly easy to fix it to capture what the authors listed in the introduction want. The claim to fall back on is that the most probable option should be guessed when one is giving a complete answer to a question that is discourse-initial. It's arguably the earlier guess that's the problem here.

If the fix is so easy, why did I include the case? Three reasons. First, even if the fix is easy, it's worth making. Second, although intuitions may vary here, I think there's something a bit funny about answering #emph[J] if the first question is #emph[Who will finish second?]. I'm not sure about that intuition, and I don't have a great story about how to capture it, but it seems like an interesting puzzle. Third, the more interesting (to me) puzzle is about what the expert should say in the actual conversation. There are a few moves available.

She could just say the most probable team to finish second, i.e., J. That sounds terrible to me, but given the complications involved in the other answers, maybe that's the right thing to say.

She could say the team that's most likely to finish second consistent with her earlier answers. That, as #ref(<tbl-place-prob-sec-2>, supplement: [Table]) shows, is L. In some ways that's the simplest fix to #strong[Guess the Most Probable]\; say that in guesses that appear some way into a discourse, there is a requirement of consistency with past guesses.

This answer is not obviously optimal for similar reasons to why guessing ABDC was not obviously optimal. For one thing, K has the higher mean quality. For another, K has the highest probability, of the teams not yet listed, of finishing in the top two. For yet another, and this I think is most crucial, K has the highest probability of finishing second conditional on the previous guess being correct. The probabilities of each team finishing second given the earlier guess are given in #ref(<tbl-conditional-second>, supplement: [Table]), and K is clearly highest.

#figure([
#table(
  columns: 2,
  align: (left,right,),
  table.header([Team], [Probability],),
  table.hline(),
  [K], [0.373],
  [L], [0.332],
  [M], [0.295],
)
], caption: figure.caption(
position: top, 
[
Probability of finishing second, given that J wins the group
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-conditional-second>


So the third option is to guess K. One motivation for this is the idea that when asked to make a series of guesses, one is being asked to develop a coherent story. One should maximise not the probability of the next step, but the probability of the whole story given the possible continuations of it. That means guessing the option with the highest conditional probability, or, if it is a structured guess, the highest expected accuracy.#footnote[#cite(<Fang2026>, form: "prose", supplement: [fn. 36]) briefly discusses this idea, and dismisses it as changing the question. I am somewhat more optimistic that it can work.] That seems like a plausible story of what we're doing with sequential guesses, and it gets what I think is the intuitive answer here.

There is a fourth option, which isn't quite inconsistent with the previous ones. If sequential guessing is a matter of developing a story piece-by-piece, then guessers might want the option to eventually revise their previous guesses. After a while, a sequence of guesses might lead to too implausible a story. The point is not just that the story you end up with is absolutely implausible; sometimes the best guess will be very improbable. (Think of the pundits asked to choose which of 20! orderings of Premier League teams will be the right one.) Rather, the point is that sometimes when you see the full set of questions you are being asked, you can make a much more plausible set of guesses by retracting some earlier guesses.

It doesn't matter for this example, but one thing in general that the expert could do at the panic stage is to retract their earlier guess. That isn't really consistent with the norms of panel discussions in mass media, but might be consistent with the norms of guessing in less loaded contexts. They could say "Oh, you want me to guess the top two in that order; in that case I'd say…", or "Oh, you're going to ask for a full ranking; in that case I'd say…". The view that guesses should maximise conditional accuracy value, conditional on the previous guesses, leads to some very implausible outcomes if you don't add in a retraction option, so this fourth option might be best thought of as a complement to the third, rather than an alternative.

I don't have a good answer here to what the expert should do; apart from noting that the case suggests that #strong[Guess the Most Probable] needs to be at least amended, I'm mostly presenting it as a puzzle for further research.

= Guesses with Incoming Information
<sec-incoming>
The last case is basically an application of some points Sarah #cite(<Moss2015sp>, form: "prose") made about disjunctions and context-sensitivity. Let's leave soccer and return to a case beloved in the guessing literature: horse racing.

There is a big race tomorrow with thirteen runners. Three of them, N, O and P, are very good; the other ten are not. The expert has views on two questions: how well each horse runs in different conditions, and what the conditions are likely to be. The latter is important. There is a big storm moving towards the racetrack. It will reach us overnight. While the storm is large, it is concentrated, so it's possible it will pass just north of here, but it's also possible it will hit us hard. If it passes by, the track will be dry and fast; if it hits, the track will be a slow muddy mess. Horse N is good in all conditions, but O and P have preferred conditions. O is a flat-track bully, able to sprint away on dry, fast tracks. P is a mudlark, able to churn through mud better than most. So the expert's credences about the race results are highly dependent on what happens overnight with the storm. In #ref(<tbl-dry>, supplement: [Table]) and #ref(<tbl-wet>, supplement: [Table]), I've listed her credences as to who will win conditional on a dry track, and conditional on a wet track.

#quarto_super(
kind: 
"quarto-float-tbl"
, 
caption: 
[
The expert's win probabilities, conditional on the state of the track
]
, 
label: 
<tbl-going>
, 
position: 
top
, 
supplement: 
"Table"
, 
subcapnumbering: 
"(a)"
, 
[
#grid(columns: 2, gutter: 2em,
  [
#block[
#figure([
#table(
  columns: 2,
  align: (left,right,),
  table.header([Horse], [Win probability],),
  table.hline(),
  [N], [0.35],
  [O], [0.45],
  [P], [0.10],
  [Others, each], [0.01],
)
], caption: figure.caption(
position: top, 
[
Dry track
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-dry>


]
],
  [
#block[
#figure([
#table(
  columns: 2,
  align: (left,right,),
  table.header([Horse], [Win probability],),
  table.hline(),
  [N], [0.35],
  [O], [0.10],
  [P], [0.45],
  [Others, each], [0.01],
)
], caption: figure.caption(
position: top, 
[
Wet track
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-wet>


]
],
)
]
)
The expert thinks it is 50/50 which kind of track we get; the weather forecasts are very uncertain about the trajectory of the storm. So the highest win probability belongs to N, at 0.35. But guessing that N will win has some downsides. Notably, it violates a reflection principle for guessing. If the expert guesses N, she knows that whatever happens overnight, in the morning she'll want to change that guess. This feels like something we should avoid, if possible. And the expert has an easy way out. Instead of guessing N, she can say (1).

#block[
#set enum(numbering: "(1)", start: 1)
+ If it is dry, O will win, or if it is wet, P will win.
]

She could rephrase this as (2).

#block[
#set enum(numbering: "(1)", start: 2)
+ It will be either dry or wet, so either O or P will win.
]

Finally, and this is where I'm borrowing most heavily from Moss, she might be in a situation where it is common ground that there is a substantial probability both that the storm will hit and that it will pass us by, that this fact is relevant to the win probabilities, and that O is a flat-track specialist while P is a mudlark. Then it seems she can say (3) as a way of expressing what she would say more explicitly as (2) or (1).

#block[
#set enum(numbering: "(1)", start: 3)
+ Either O or P will win.
]

If, in that context, (3) is a reasonable guess, then we have a counterexample to what Dorst and Mandelkern call #strong[Filtering], and what Holguín calls #strong[cogency]. This is a disjunctive guess that's permissible, despite there being another guess you could generate by swapping one of its disjuncts for a more probable complete answer, namely N.

Of course, it isn't a counterexample to #strong[Guess the Most Probable] because it isn't a complete guess. But we can fix that. Let's say a new forecast comes in and it's now 55% likely to be a wet track. Again, the expert is asked to predict the race, and they say (4).

#block[
#set enum(numbering: "(1)", start: 4)
+ I think it will be a wet track, so P.
]

That all seems reasonable to me. It's a less probable guess than N, but it spells out the reason, and it is not known to be a reflection violation. In a context where it is obvious that you would only guess P if you thought it would be a wet track, and the wet track is 55% likely, I think you can even get (5) to come out appropriate.

#block[
#set enum(numbering: "(1)", start: 5)
+ I think P; he's the best in the mud.
]

And that is a violation of #strong[Guess the Most Probable]. Now I don't want to lean too heavily on the intuitions here; I don't think it's nearly as clear that #emph[P] is a good guess here as that #emph[ABCD] is a good guess to the ordering question in #ref(<sec-order>, supplement: [Section]). All I do want to say is that (a) it isn't obviously a bad guess, and (b) the fact that #strong[Guess the Most Probable] leads to guesses that one knows one will want to retract should count against it.

= Conclusion
<conclusion>
When presented with a question, and asked to guess, guessers can reasonably have many more goals than saying the thing that most likely is the true answer to that question. They might try to truly answer as many parts of the question as they can; that was the consideration behind the main example in #ref(<sec-order>, supplement: [Section]). They might try to craft a coherent story given their prior guesses; that was the consideration behind the main example in #ref(<sec-follow>, supplement: [Section]). They might try to make guesses that they have some chance of standing behind when new information comes in; that was the consideration behind the main example in #ref(<sec-incoming>, supplement: [Section]). By looking at cases like these, we get a much richer picture of what people are trying to do with guesses.

#set bibliography(style: "chicago-with-note.csl")

#bibliography(("guessing.bib"))

