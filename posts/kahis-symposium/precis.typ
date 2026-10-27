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
  // Quarto passes these too when the paper sets them. Only keywords and
  // thanks are used; the others are accepted so that setting them in a paper
  // doesn't stop the build (this template sets its own fonts and colours).
  keywords: (),
  thanks: none,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  doc,
) = {
  // PDF metadata: title, author, keywords
  let plain(c) = {
    if c == none { "" }
    else if type(c) == str { c }
    else if c.has("text") { c.text }
    else if c.has("children") { c.children.map(plain).join("") }
    else if c.has("body") { plain(c.body) }
    else if c.func() == [ ].func() { " " }
    else { "" }
  }
  set document(title: plain(title), keywords: keywords)
  set document(author: authors.map(a => plain(a.name)).join(", ")) if authors != none and authors != ()
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

  // ---- References made by Pandoc (citeproc: true, the default here) -------
  // Pandoc writes the reference list as a block labelled <refs>. Give it the
  // same look as above: EB Garamond, hanging indents, and a small
  // "References" heading -- unless the paper already supplies one with
  // `# References {-}`, in which case that heading is shown small instead.
  show heading.where(numbering: none): it => {
    if it.body == [References] {
      // the level-1 heading rules above have already scaled the text by 1.2,
      // so these sizes are divided by 1.2 to match the heading used below
      block(above: 1.5em, below: 0.75em,
        text(size: 1.05em / 1.2, it.body))
    } else { it }
  }
  show <refs>: it => {
    set text(font: ("EB Garamond",))
    set par(first-line-indent: 0em, hanging-indent: 1.5em, justify: false)
    set block(above: 0.6em, below: 0.6em)
    context {
      let before = query(selector(heading).before(here()))
      if before.len() == 0 or before.last().body != [References] {
        block(above: 1.8em, below: 0.9em,
          text(font: heading-family, weight: heading-weight, size: 1.05em)[References])
      }
    }
    it
  }

  // ---- Title block ------------------------------------------------------
  if title != none {
    align(center)[
      #v(1em)
      #text(font: ("EB Garamond",), style: "italic", size: 2em)[#title]#if thanks != none { footnote(thanks, numbering: "*") }
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
          emph[Précis of #emph[Knowledge: A Human Interest Story]],
          align(right, strong(counter(page).display())))
      }
    }
  },
  numbering: none,
)
#show: doc => article(
  title: [Précis of #emph[Knowledge: A Human Interest Story]],
  authors: (
    ( name: [Brian Weatherson],
      affiliation: [University of Michigan],
      email: [] ),
    ),
  date: [2026],
  abstract: [In #emph[Knowledge: A Human Interest Story], I argue for an interest-relative theory of knowledge. The argument rests on principles connecting knowledge and action, combined with some judgments about which actions are rational in a particular low-stakes game. In this short piece, I set out that argument, and highlight the distinctive features of version of interest-relativity I defend: that odds rather than stakes matter to knowledge; that merely hypothetical and theoretical questions can change what one knows; that questions about what to do must be separated from questions about what maximises expected utility; and that knowledge is a constraint on the starting points of inquiry, not its endings.

],
  abstract-title: "Abstract",
  sectionnumbering: "1.1",
  keywords: ("pragmatic encroachment","interest-relativity","knowledge","rational action","inquiry","epistemology",),
  toc_title: [Table of contents],
  toc_depth: 3,
  doc,
)

My original plan for #emph[Knowledge: A Human Interest Story] was to concatenate my various writings on interest-relativity over the years. That plan failed, because it turned out I'd changed my mind on too many things. The result is, I hope, better than the original plan; the presentation of a coherent theory built out of the not always consistent ideas in those earlier papers.

Like many people, I started thinking about interest-relativity because of work by Jeremy Fantl and Matthew McGrath \(#link(<ref-FantlMcGrath2002>)[2002]). In that paper, and in the literature that followed, there were two big arguments for interest-relativity. One was an argument from cases. Those arguments made interest-relativity appear to be both similar to, and also a competitor to, contextualism. The cases that motivated it were similar, and a lot of the development of the argument was designed to show that interest-relative theories provided a better explanation of the intuitions about cases than contextualism.

I've long been sceptical of that line of argument, and instead more interested in a different line that, I think, was always present. That line starts with the clash between three principles and an intuition about rational action. The three principles are:

+ We know a lot.
+ What we know can be taken for granted in decision making.
+ What we know is independent of which decision we are facing.

Then the intuition is that for some things we know, and some bets that win if the known thing is true, it is irrational to take the bet. The argument for interest-relativity is that something has to give, and the least costly thing to give up is the decision-invariance of knowledge. What we know depends on what decision we're making.

This argument doesn't rely on intuitions about what is or is not knowledge. It does rely on intuitions about rational action, but I think these are fairly widely shared. And it does rely on various principles, which arguably rest in turn on theoretical intuitions. But it doesn't have a role for intuitions about cases of knowledge.

The book is structured around a version of this argument, focussing on the kind of bets involved in a game I call the Red-Blue game. Here's how the game works. Two sentences are displayed to the player, one in red, the other in blue. The player has to pick a colour and a truth-value. They win iff the sentence with the colour they pick has the truth-value they pick. So if they say "Red-True", they win iff the red sentence is true. 'Winning' here means getting a non-trivial but not huge reward; in the book I make it \$50. The players know these rules of the game and don't know anything else relevant about the game. Now consider an instance of the game with these sentences.

/ Red: #block[
Two plus two equals four.
]

/ Blue: #block[
The Battle of Agincourt was in 1415.
]

For people with normal levels of historical expertise, the only rational play here is Red-True. Or, at least, that's the intuition I want to rest on, and it's one that has been #emph[fairly] widely shared by people I speak to. Now here's a sceptical argument. If the player knew that the Battle of Agincourt was in 1415, they would know Blue-True is a winning move, while they'd only know that Red-True wins if two plus two equals four. So Blue-True would, in a sense, weakly dominate Red-True. So it's at least #emph[permissible] to play Blue-True. But it's not permissible to play Blue-True, so the player does not know that the Battle of Agincourt was in 1415. By varying the blue sentence, we can similarly argue that the player knows very little, contradicting the claim 'we know a lot'.

The solution I prefer is that once this game comes up, what the player knows changes. They may have known when the Battle of Agincourt was, and they may know it tomorrow, but they don't know it now. That's the canonical instance of interest-relativity in the book. This is still, I think, basically the same argument as in earlier arguments for interest-relativity, but focussing on this case has several distinctive features.

I've already mentioned one of these features. The book does not rest on an intuition that the player loses knowledge. To be honest, even after all these years, I still find that counter-intuitive. It rests on an argument that the player loses knowledge, which in turn rests on intuitions about rational play, and principles connecting knowledge and rational play.

Another obvious consequence is that the view has nothing to do with high #emph[stakes]. I didn't put more at stake than \$50. I don't think the intuitions change much if you lower the payouts a fair bit from that. I say, here agreeing with Schroeder (#link(<ref-Schroeder2012>)[2012]), that what matters are the odds the player faces, not the stakes.

What if the player did not in fact face this choice, but is idly planning about what to do should it come up? This might strike you as a little over the top, but I've spent quite a bit of time wondering about this in the course of the book. I say the argument that they don't know when the Battle was still goes through. Just being interested in a question can change what one knows. That's because knowing something requires being properly willing to treat it as well supported enough to use it, should it be relevant, in any inquiry you are engaged in.#footnote[The 'well supported enough to use' locution does some work in the presentation in KAHIS; it's meant to be compatible with not using a piece of knowledge for reasons other than it's lack of evidential support. I now think it would be better to make the distinction I make in the Replies (later in this symposium) between finding out inquiries, and checking inquiries, and say that anything you know can, if relevant, be used in any finding out inquiry. But that's not what I said in KAHIS.]

In earlier work, I understood questions about what one should be willing to use as being settled by the #emph[outputs] of the inquiry. The above argument inferred that one should not start inquiry with knowledge of the Battle's date from the fact that this would lead to the wrong conclusion: Play Blue-True! I used to think that was what made it wrong to use the Battle's date. This extra step is, I now think, a mistake. Knowledge is not a constraint on where one ends inquiry, but on where one starts it. The relevant constraint is that for someone inquiring into #emph[Q?], and #emph[p] is relevant in the right way to that question, they know #emph[p] only if the questions #emph[Q?] and #emph[If p, Q?] are in a deep sense the same question, and they are answered in the same way. If #emph[p] is not something relevant to anything one is currently inquiring into, the constraint is that there is some possible inquiry where one would use #emph[p] as the first step. This move avoids some very implausible consequences of what I'd previously said about knowledge of practically (and theoretically) irrelevant propositions.

I've spoken liberally about questions here, but the last few points that are distinctive to the book turn on being a bit more careful about what a question is. In earlier work I'd equated, sometimes explicitly, sometimes implicitly, the following two questions:

- Which live option maximises expected utility?
- What should I do?

But these are not the same question, and some of the challenges for an interest-relative view turn on getting clear on the difference between them. Here are four important differences.

First, if two options have the same expected utility, I still might have to decide which to do. I want a can of Coke, there are two on the shelf. It would do just as well to take either, but I have to actually take one. Knowing the answer to the utility question, they have the same utility, doesn't settle what my arm should do.

Second, if two options have #emph[really similar] expected utility, I shouldn't always take the one with higher expected utility. It might be more trouble than it's worth to calculate which has higher utility, and I might be (faultlessly) unreliable at choosing the higher expected utility without calculating. Maybe it would be less work by some miniscule amount to pick up the left can rather than the right can. It could, I say, still be practically rational to act like the cans are equally good, and choose arbitrarily. In chapter 6, I show that some objections to interest-relative accounts, which work as long as we equate these questions, no longer work if we separate them.

Third, it's not obvious how to use the expected utility framework to model mathematical uncertainty. But mathematical uncertainty might be something we want the interest-relative story to capture. If I'm playing the red-blue game, and the blue sentence is #emph[67 plus 58 equals 125], my intuition is that only Red-True is rational to choose. I'm just more likely to make an error about this calculation than about two plus two. But working this into an expected utility model raises extra complications.

Fourth, an expected utility comparison needs a probability function, and the usual picture is that the probability in question is #emph[evidential] probability. This raises problems if there are propositions that, if known, are part of one's evidence, and whether they are known is interest-relative. For instance, imagine that there is a Ford outside my window, in fact a Mustang with a distinctive shape, and I'm looking straight at it. I'm asked to play the red-blue game with the blue sentence being #emph[There is a Ford outside my window]. I think in that context I don't know there is a Ford outside, so it's not part of my evidence there is a Ford outside. This makes the very notion of expected utility complicated. In chapter 8, I suggest a way of dealing with that complication.

The last new point in the book which I'll mention here concerns double-checking. The argument from the red-blue game to interest-relativity requires some principles linking knowledge and action. It has been argued, quite plausibly, that these principles are inconsistent with the rationality of double checking something one already knows. After all, if one knows #emph[p], then checking #emph[p] seems worse than just reasoning from one's knowledge that #emph[p] must be true. I argue, in chapter 5, this isn't right. There are many goals to inquiry. One possible goal is forming a more #emph[sensitive] belief about some subject. Even if one knows #emph[p], then an inquiry that aims to maximise sensitivity should not simply reason from #emph[p] to the truth of #emph[p]. This is, I hope, an independently interesting claim about inquiry, but the role it plays here is to defend principles connecting knowledge and action from counterexamples involving double-checking.

#heading(level: 1, numbering: none)[References]
<references>
#block[
#block[
Fantl, Jeremy, and Matthew McGrath. 2002. "Evidence, Pragmatics, and Justification." #emph[Philosophical Review] 111 (1): 67--94. doi: #link("https://doi.org/10.2307/3182570")[10.2307/3182570].

] <ref-FantlMcGrath2002>
#block[
Schroeder, Mark. 2012. "Stakes, Withholding and Pragmatic Encroachment on Knowledge." #emph[Philosophical Studies] 160 (2): 265--85. doi: #link("https://doi.org/10.1007/s11098-011-9718-1")[10.1007/s11098-011-9718-1].

] <ref-Schroeder2012>
] <refs>


// Bibliography partial for the bwpaper Typst format.
// Uses the site's chicago-with-note.csl via a project-root path ("/..."),
// because some Quarto versions mangle "../../" paths when writing them into
// Typst (they come out as "\../../...", which Typst rejects).

