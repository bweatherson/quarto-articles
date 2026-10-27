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
          emph[Reply to commentators],
          align(right, strong(counter(page).display())))
      }
    }
  },
  numbering: none,
)
#show: doc => article(
  title: [Reply to commentators],
  authors: (
    ( name: [Brian Weatherson],
      affiliation: [University of Michigan],
      email: [] ),
    ),
  date: [2026],
  abstract: [Matthew McGrath and Jane Friedman provided great comments on #emph[Knowledge: A Human Interest Story]. Here I reply to them, making some concessions, and relying on a distinction I wish I'd drawn in the book. The distinction is between inquiries that aim at finding something out, and inquiries that aim at checking something. These two inquiries relate differently to knowledge. Any knowledge one has is fair game to use as a starting point to finding things out, but there are different constraints on how you check things. Making this distinction allows for a cleaner statement of the role of knowledge in certain kinds of inquiry, i.e., findings out, while allowing that knowers can sensibly check what they already know.

],
  abstract-title: "Abstract",
  sectionnumbering: "1.1",
  keywords: ("pragmatic encroachment","interest-relativity","inquiry","checking","knowledge","sensitivity",),
  toc_title: [Table of contents],
  toc_depth: 3,
  doc,
)

I'm really happy to reply to these comments, not least because #emph[Knowledge: A Human Interest Story] (hereafter, KAHIS), wouldn't exist without their work. Like many people, I started thinking about interest-relativity because of Jeremy Fantl and Matthew McGrath \(#link(<ref-FantlMcGrath2002>)[2002]), and the view defended in the book is built on foundations that were laid in that paper and in their \(#link(<ref-FantlMcGrath2009>)[2009]) book. And before reading what Jane Friedman \(#link(<ref-Friedman2019a>)[2019b], #link(<ref-Friedman2019b>)[2019a], #link(<ref-Friedman2020>)[2020]) had to say about inquiry, I wouldn't have thought to restructure the theory in an inquiry-centric way.

I'll start with McGrath's comments, taking them slightly out of order, because what I say in response to one of his later questions helps set up what I want to say both to his earlier questions, and to Friedman's comments.

= Reply to McGrath
<sec-mcgrath>
== Checking and Inquiring
<sec-mcgrath-checking>
I'll start with McGrath's third comment. In KAHIS I agreed that typically one cannot inquire into what one knows, but argued that there are some atypical cases where you can. In particular, when the purpose of inquiry is getting sensitive beliefs, it is fine to inquire into things one knows. Since saying to oneself "#emph[p], therefore #emph[p]" would not increase the sensitivity of one's belief in #emph[p], this isn't a good inquiry, even though it starts with what one knows and uses clearly valid steps. (Is this a counterexample to the principle that you can always start with what you know? No, because what's wrong with this inquiry is not where it starts, but the result that running through it fails at the aim of increasing sensitivity.)

McGrath suggests that these cases are better described as #emph[checking] than as inquiring. As he points out, ordinary language agrees here. When he looks into the office at the insistence of a sceptical colleague, it is natural to say he is #emph[checking] whether the (department) chair is there, and unnatural to say one is inquiring into whether she is there.

I'm happy to accept his amendment, but I don't think this is the end of the story, for a couple of reasons. First, this leaves open what exactly it is to check something. It isn't just inquiring into what we know. Grabbing an old flashlight to take to the basement while a storm approaches, my spouse might sensibly say "You should check that's still working." This isn't because we already know it is working; quite the contrary. So checking is compatible with ignorance. On the other hand, not all inquiry is checking. If I go into a philosopher's archives and start reading with no fixed goal, I might be trying to find out something about them, but I'm not checking anything. Exactly what checking is feels like a bigger question.#footnote[The most important recent work on checking is #emph[Knowing and Checking] \(#link(<ref-Melchior2019>)[Melchior 2019]). We'll come back to it at more length in #ref(<sec-friedman-checking>, supplement: [Section]).]

Or, perhaps I should say, it feels like #emph[two] bigger questions. One question is how the ordinary term 'check' gets used. The other question is whether there is a theoretically interesting class of activities picked out by this word, or in the vicinity of what this word picks out. I suspect the answer to the latter question is #emph[yes], but that's for another day.

This leads to my other worry about McGrath's argument. I said above that it isn't natural to describe McGrath's checkers as inquiring into something. But it's rarely natural to say someone is 'inquiring into' something. That's a theorist's construction, not ordinary language. There's a response to this, and it's right there in what McGrath said. Some inquirers are #emph[trying to find something out]. The person who checks because of a sceptical colleague is not doing that. They know where the chair is, they aren't trying to find it out.

This all suggests a nice synthesis. There are two related activities: #emph[checking] and #emph[finding out]. We can do both at once; I find out whether the flashlight is working by checking it. But they can come apart in both directions. Open-ended archival research is finding out without checking; satisfying a sceptical colleague is checking without finding out. Which of these is 'inquiry'? I'd rather say they #emph[both] are kinds of inquiry; more on this in #ref(<sec-friedman-checking>, supplement: [Section]).

What's more important is that with this distinction in hand, we can say something more systematic about the relationship between knowledge and inquiry. When you are simply trying to find things out, it's permissible to start with any (relevant) fact you know. That's enough to get the argument for pragmatic encroachment off the ground. More carefully, I want to accept the principle KS-FIND, and reject the principle KS-CHECK.#footnote[The 'KS' here is short for 'Knowledge Starts'.]

/ KS-FIND: #block[
When you are trying to find something out, it's permissible to start with anything relevant you know.
]

/ KS-CHECK: #block[
When you are trying to check something, it's permissible to start with anything relevant you know.
]

If you have that pair of judgments, it makes sense to accept KP-FIND, and reject KP-CHECK.#footnote[The 'KP' here is short for 'Knowledge Permits'.]

/ KP-FIND: #block[
It is not permissible, by the standards of inquiry, to try to find out something you already know.
]

/ KP-CHECK: #block[
It is not permissible, by the standards of inquiry, to try to check something you already know.
]

My guess is that McGrath and I agree about all of these verdicts, but we might disagree about which activities are #emph[inquiries]. Let's leave that last point for now, because it will make more sense to discuss it in the context of Friedman's comments.

== Questions About Probability
<sec-mcgrath-probability>
The view in KAHIS has a striking consequence concerning probability. It says that when one is trying to find out how likely it is that #emph[p], either the answer is 1, or one doesn't know #emph[p]. McGrath says that this is implausible when #emph[p] is #emph[At least one player will hit a free throw in tonight's NBA games]. (Assume it's mid-season, and there are ten games on.) If I stick to this verdict, I have to say, implausibly according to McGrath, that either the answer to the likelihood question is 1, or the inquirer doesn't know #emph[p]. I'm not going to try wriggling out of this; I think the second option is right: the inquirer doesn't know #emph[p]. That is not exactly what intuition says, so I better argue for it.

Start with how you'd try to figure out this likelihood. You'd look at the frequency of made free throws over the last few hundred games, the number of free throw attempts awarded per game, perhaps something about how those attempts are distributed. What you would not do, under any circumstances, is start with "Well, at least one will be made tonight, so let's take that as given." That premise is simply unavailable in #emph[this] inquiry, because of which question is being asked.

In the previous subsection I distinguished checking whether #emph[p] from trying to find out whether #emph[p], and I endorsed a strong principle about the latter: when you are trying to find something out, you can use whatever relevant fact you know. I'd like to keep that principle exceptionless, and the view that you lose knowledge that #emph[p] when working out the likelihood of #emph[p] is the only way to keep it. On McGrath's picture, the inquirer knows that some player will make a free throw, that's obviously relevant to the likelihood they are trying to deduce, but they can't use it. The connection between knowledge and sensible methods for finding stuff out has been broken, and once it is broken, for me the interest of inquiring into the nature of knowledge goes with it.

McGrath objects that the reasoning I'm attributing to the knower is invalid: the premise #emph[p] is about the world, the conclusion #emph[Pr(p) = 1] is about an information state. True, but compare: #emph[This player hits 90% of his free throws, so the probability that he'll hit this one is 0.9]. That also goes from world to information state, it's also invalid (as can be seen by the fact that it fails if you add extra information), yet it looks perfectly fine. The natural thing to say is that it's enthymematic; the suppressed premise is something like #emph[and that's all the relevant information I have]. The reasoning from #emph[p] is enthymematic in the same way, with the suppressed premise even weaker: just that #emph[p] is among what can be taken as given. There are tricky questions here about exactly what we're doing when we reason from worldly facts to probabilities, but I suspect however they get answered, there will be a way to endorse the reasoning I'm attributing to the knower.

McGrath suggests the naturalness of the following speech raises a problem for my view here. One could concede a minuscule probability that no free throw is made, then add "But that's not going to happen; someone will make one"? That's fine I think, but look what it does. It #emph[sets a possibility aside]. Contra Lewis (#link(<ref-Lewis1996bn>)[1996]), I don't think the fact that we are attending to a possibility means we have to take it seriously. We can propose that we're not going to consider some possibility,#footnote[Here I'm basically in agreement with the criticisms that Blome-Tillmann (#link(<ref-MBT2009a>)[2009]) makes of the Rule of Attention that Lewis (#link(<ref-Lewis1996bn>)[1996]) proposes] and provided that everyone else goes along with this, we can act as if we know it. If this ignoring makes sense given our interests, we may in fact know it, so it's not just acting as if. All I insist on is that in doing that we are tacitly agreeing that we're no longer working out how many 9's there are at the start of the probability that at least one free throw will be hit tonight.

== Causal and Constitutive Dependence
<sec-mcgrath-constitutive>
I can be brief about the fourth point. McGrath grants that the Das-style argument I make in chapter 7 is correct as far as it goes: every plausible theory makes knowledge counterfactually depend on truth-irrelevant factors. That's already enough to push back against some of the claims that pragmatic encroachment is a radically new view. But he suggests that there is a way in which it is new, and which might be behind the critics' intuition that it is an unwanted intruder. The other dependencies are #emph[causal], while the dependence of knowledge on what one can properly take for granted is #emph[constitutive]. He suggests, rather generously to our mutual critics, that what's radical about pragmatic encroachment is that it makes knowledge constitutively depend on non-truth-relevant factors. Here's where I get off the boat; I think that constitutive dependence is already there once we insist on environmental reliability.

Consider the analogy McGrath uses. He agrees that reliability considerations mean that knowledge might depend on interests because they make me more likely to go to some places rather than others. But he insists this making is causal, "like weighting a coin." Let's think about that coin. Weighting the coin causes something: a mass distribution. The relationship between the mass distribution and the chance, however, is not causal; it's constitutive. There's no causal pathway from the mass distribution changing to the chance changing, and no temporal gap for that pathway to play out in. The same goes for the mental case. Suppose I prefer ebooks to printed books, and so am more likely to read something in an ebook. Whatever caused the preference caused a mental state, and that state, together with background conditions, grounds the likelihood facts. The preference doesn't sit causally upstream of the likelihood. There's no chain running between them. Like with the coin, there's no time for that chain to run through. As soon as I have the preference, I'm more likely to read ebooks. The preference might cause my actually reading the ebook not the printed book, but it doesn't cause my being more likely to do so.

So a non-truth-relevant fact, that I prefer ebooks to printed books, constitutively fixes the environment that's relevant to reliability evaluation. Facts about that environment fix, again constitutively, how likely I am to come across certain errors. So if we hold fixed the external world, which contains veridical printed books and erroneous ebooks, my change in preference is linked constitutively, not merely causally, to a decrease in reliability. Put another way, Das's real point was about individuation. What counts as #emph[my] environment, which reference class #emph[my] reliability is assessed against, depends on my interests. This individuation is not a causal matter at all. So constitutive dependence of knowledge on truth-irrelevant factors is not what separates pragmatic encroachment from traditional theories, as long as versions of reliabilism count as traditional. It may still be that encroachment strikes people as radical; but if so, the explanation is not that it alone has something truth-irrelevant among the things knowledge constitutively depends on, because on inspection, many many people do.

== Odds and Stakes
<sec-mcgrath-odds>
I'll end with McGrath's second point, where I actually agree with most of what he says. In KAHIS, I say that high stakes aren't directly relevant to knowledge changes. McGrath is right, though, to say that for some propositions it will be very hard in practice to get knowledge to change without high stakes.

McGrath's example of this is #emph[The Battle of Hastings was in 1066]. Funnily enough, when I was drafting KAHIS, I had originally used that example for the blue sentence. I dropped it because I wasn't sure it really was irrational to play Blue-True in that case! The intuition about rational play is load-bearing in the argument, and I didn't think in this case it would bear the load.

This points to a broader methodological point. I'm certainly not wanting to sign on for a general principle about logical strength in the red-blue game. If the blue sentence is #emph[2+2 is less than 100] and the red is #emph[2+2=4], I don't think either play is irrational. Maybe I could be convinced that one is, there are some really deep questions about the status of weak dominance arguments lurking in the background here, but for now I'm happy to sign up for either being rational here.#footnote[One might worry here that the appeal to weak dominance I made in the précis is inconsistent with what I say here. The careful version of what I'm saying is that if $X$ weakly dominates $Y$, that entails that choosing $X$ in a two-way choice between $X$ and $Y$ is #emph[permissible], but does not entail that it is #emph[required].] A nice bonus of this is that I avoid the sceptical worry McGrath presses, that maybe sometimes I'll end up saying one doesn't know that 2+2=4.

Still, even if I agree that it would take really high stakes to lose knowledge in the Hastings case, I want to insist that this isn't enough to resuscitate a connection between stakes and knowledge. If one loses knowledge in these cases, it's because the odds change. It might be practically impossible for the odds to change without the stakes changing, but that just means high stakes situations are tightly correlated with knowledge loss, not that being in a high stakes situation directly explains the knowledge loss.

The reason for this is that I'm worried that the notion of stakes isn't sharp enough to play a central role in grounding knowledge. Anderson and Hawthorne (#link(<ref-AndersonHawthorne2019a>)[2019]) argue that once we look at cases with more than two options, it's really unclear what the stakes are, and no precisification of the vague informal notion can work. Rather than trying to answer the challenge they posed, my view simply dodges it. 'High stakes' has a role in informally characterising the theory, not in the most careful statement of it.

= Reply to Friedman
<sec-friedman>
== How Interests Matter
<sec-friedman-interests>
Jane Friedman notices a couple of tensions within KAHIS, and asks for some clarifications on each. These are excellent points to press on. I'll clarify one thing, and concede one thing. Let's start with the clarification.

When I'm discussing practical choices, like what move to make in games, I stress the importance of the principle ($star.op$), where $L$ measures how much one might lose if #emph[p] is false, and $G$ measures how much one might gain if #emph[p] is true.

$ frac(Pr\(p\), 1 - Pr\(p\)) > L / G $

That's definitive of when interests matter for a very particular kind of inquiry: an inquiry into what to do when there are only two (salient) options, and the salient rule is #emph[Maximise expected utility!] Friedman notes that this principle, which starts looking so central, doesn't do any work when I start talking about theoretical interests. That's a fair point. Indeed, an even more general point would also be fair; ($star.op$) doesn't do much work in three-way choices, or in choices like the ones discussed in chapter 6 where considerations other than utility are relevant.

The short answer is, as Friedman suggests, the core principle in the book is that knowledge is a constraint on starting points in inquiry. There is one special kind of inquiry, inquiry into which of two options to choose when only utility is relevant to which is appropriate, where the main constraint on whether #emph[p] is a proper starting point is ($star.op$). But even in that case, it's not that there is some basic principle of knowledge that implies ($star.op$) is important; it's derived from the general principle about proper starting points.

So why do interests matter? They matter because the right principle connecting knowledge and inquiry quantifies over inquiries one is #emph[or should be] conducting. And sometimes, one's interests determine what one should be inquiring into. Those interests could be either practical or theoretical interests: presumably if someone is in fact inquiring into something they have to be at least minimally interested in it. Conversely, if one is really interested in something, there will be situations where one should be inquiring into it.

One of these theoretical investigations does a bit of work in KAHIS: the case where Anisa merely imagines playing the red-blue game. Friedman says she likes this case but isn't sure what intuitions she has there, and is a little doubtful that it tells us a lot. Actually, I don't have any strong intuitions there either; if anything my intuition is the opposite of the view in KAHIS that she loses historical knowledge even once she starts this hypothetical inquiry. But I was never in the business of trying to maximise agreement with case-intuitions. The following two things strike me as the most plausible things to say about it. First, there is no intuition about the case strong enough to overturn the plausibility of applying KS-FIND here. Second, it is a bit funny for her to make the following speech: "Hypothetically, if the blue sentence was #emph[Agincourt was in 1415], I could take either option. Oh look, that is the blue sentence. Guess my only option is red." If she doesn't lose knowledge in the hypothetical, theoretical, inquiry, I'm not sure what blocks that speech.

This case shows that even hypothetical options matter for knowledge. Both practical interests and theoretical interests are relevant. In KAHIS I suggested that the term 'interest' in the last sentence might usefully unify things here. The thought was that it wasn't a coincidence that we use a similar word to describe something practical, like (1), and something theoretical, like (2).

#block[
#set enum(numbering: "(1)", start: 1)
+ How vaccines are distributed around here is relevant to my (practical) interests.
+ I'm (theoretically) interested in how vaccines are distributed around here.
]

On reflection, I'm worried this is a bit of a coincidence. I'm not sure you do get the same word form used for 'interest' in these claims in enough languages. You do, I think, see similar words used when you translate (1) and (2) into most #emph[European] languages, but maybe not beyond that. So I'm a bit worried that calling my view 'interest-relative' because it takes the kind of facts reported by both (1) and (2) to be relevant to knowledge, because they are relevant to proper starting points for inquiry, is almost a pun. Friedman suggests that when I'm discussing 'theoretical interests' it might be better to describe the view as inquiry-relative than interest-relative. It might do better to unify things to say the whole view is inquiry-relative, it's just that sometimes the inquiry is into what to do.

== Finding Out and Checking
<sec-friedman-checking>
This is the point where I think I need to make a concession, and it relates to what I said in #ref(<sec-mcgrath-checking>, supplement: [Section]). The problem is that I'd talked myself into a muddle. Here are two things I say in KAHIS.

In the red-blue game, the player loses historical knowledge. They must lose that knowledge, because if they still had it, they could reason their way into rationally playing Blue-True, and that's impossible.

In the double-checking case, the player doesn't lose knowledge. They have knowledge, but given their aim of increasing sensitivity, they can't use it. That implies there are further constraints, given their aims, on what they can start inquiry with beyond knowledge and relevance.

This suggests a question, one that Friedman presses. Why can't the invariantist say the same thing about game playing as I say about checking? The player retains their historical knowledge, but they can't use it because using it is incompatible with their aim of maximising utility. What stops there being some other aim? Good question!

In KAHIS I gave some arguments that there couldn't be such a reason; that was the point of the arguments from Moore-paradoxicality. But those seemed like arguments from symptoms; they didn't explain why the cases are different. I now have the sketch of an answer; namely the principles I set out at the end of #ref(<sec-mcgrath-checking>, supplement: [Section]).

The difference between the cases is just the difference between finding out and checking. The game player is trying to find out what to do. Or, if that over-intellectualises it, they are trying to do whichever thing is the answer to the question #emph[What to do?] The double-checker is, well, checking. The relationship between knowledge and these two activities is rather different: KS-FIND and KP-FIND are true; KS-CHECK and KP-CHECK are false.

Combined with some intuitive judgments about who is checking and who is finding out, this gets plausible verdicts in all the cases. The surgeon from Brown (#link(<ref-Brown2008>)[2008]) and Florian the coffee maker are checking, and so don't lose knowledge; Darja who is trying to decide whether to check, the inquirer who bootstraps, and the red-blue game player are finding out (or at least trying to), and do lose knowledge.

In the previous paragraph, I said Brown's surgeon is a checking case. One might worry this is question-begging. As Friedman points out, there are two distinct choices here. The first is #emph[whether] to check or go straight into operating, the second is #emph[how] to check. Even if you grant me that it's consistent to say that she knows which kidney to remove but can't use that knowledge in checking, there is still the first decision. Here it looks like ($star.op$) tells us that she loses knowledge. Indeed, in a similar case in KAHIS, the case of Darja, I said it was a knowledge loss. Why is the surgeon different?

The difference, I think, is that the surgeon is a rule-follower, not an expected utility maximiser. She checks because she has, sensibly, adopted the policy of always checking. If she doesn't check, she violates a rule, and that's ruled out. That rule violation is not conditional on which kidney is meant to be removed. So I think ultimately the surgeon isn't actually making the first inquiry; it's already settled by her adoption of a standing policy. It doesn't matter here whether she adopted that policy or it is required by her job, though the point that not checking has costs independent of which kidney is to be removed is even cleaner if it is a required step. If, like Darja, the surgeon is making a real decision about whether to check or go straight to operating, and the only cost of operating is removing the wrong kidney, then I am committed to saying that she either loses knowledge or is being irrational. That doesn't strike me as the most realistic version of the case; the point of these pre-surgery checklists is to have policy replace decision-making in stressful circumstances.

At this point I'm leaning pretty heavily on distinctive features of checking. What does this imply for the relationship between knowledge and #emph[inquiry]? I think to answer that it helps to separate two questions:

- Is checking a form of inquiry?
- Does checking require losing knowledge?

McGrath argues the answer to the first is 'no'. I'm inclined to say it is 'yes', for a few reasons. One is a blatant appeal to authority: it's what Jane Friedman says in 'Checking Again': "First, checking is inquiring." \(#link(<ref-Friedman2019b>)[Friedman 2019a, 85]). A second is that some checks, like checking the flashlight, are uncontroversially inquiries. A third is that checks, even into what one knows, involve the same movements as these uncontroversial inquiries. A fourth (or maybe a defence of the third), is that the best example of someone who acts like an inquirer but is actually not---the murderous Morse in "Inquiry and Belief" \(#link(<ref-Friedman2019a>)[Friedman 2019b])---is also not a checker.#footnote[My intuition is that neither the case where Morse actually killed the doctor, nor the case where he falsely believes that he did, are cases of checking, but what's really crucial is the case where he actually did it.]

I won't rehearse the arguments that the answer to the second is 'no', because that's what I did in chapter 5 of KAHIS, and they aren't that different to what Arianna Falbo (#link(<ref-Falbo2021>)[2021]) and Elise Woodard (#link(<ref-Woodard2021>)[2024]) have already offered. So I can locate my position in #ref(<tbl-checking>, supplement: [Table]), where the rows are the first question, and the columns are the second question.

#figure([
#table(
  columns: (37.68%, 31.88%, 30.43%),
  align: (auto,auto,auto,),
  table.header([], [Loses knowledge: YES], [Loses knowledge: NO],),
  table.hline(),
  [#strong[Checking is inquiry: YES]], [Friedman], [Melchior],
  [#strong[Checking is inquiry: NO]], [???], [McGrath],
)
], caption: figure.caption(
position: top, 
[
Four options about checking, knowledge, and inquiry
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-checking>


I'm in the top-right corner, along with Guido Melchior.#footnote[See Melchior (#link(<ref-Melchior2019>)[2019]), and more recently Melchior (#link(<ref-Melchior2023>)[2023]), especially the replies to Miščević and to Siscoe.] Friedman's two 2019 papers commit her to the top-left corner, while McGrath's comments here put him in the bottom-right corner. I don't know who, if anyone, is in the bottom-left corner. It seems undermotivated, but now I've identified a position in logical space I'm optimistic it will get filled.

Relying on this distinction between finding out and checking is, I think, a concession. In KAHIS I suggested that the core principles about knowledge I was using followed from general principles about knowledge and inquiry, principles that had to be carefully qualified to not crash against the checking cases. But I didn't explain why there wouldn't be similar qualifications in the game-playing cases, or in cases like working out the probability that at least one free throw will be scored. What I should have said was that when someone is trying to find something out, whether that's when something happened, how likely something is, or what to do, they can start with any relevant knowledge. But when they are trying to check something, another important kind of inquiry, knowledge doesn't have a privileged role.

#heading(level: 1, numbering: none)[References]
<references>
#block[
#block[
Anderson, Charity, and John Hawthorne. 2019. "Knowledge, Practical Adequacy, and Stakes." #emph[Oxford Studies in Epistemology] 6: 234--57.

] <ref-AndersonHawthorne2019a>
#block[
Blome-Tillmann, Michael. 2009. "Knowledge and Presuppositions." #emph[Mind] 118 (470): 241--94. doi: #link("https://doi.org/10.1093/mind/fzp032")[10.1093/mind/fzp032].

] <ref-MBT2009a>
#block[
Brown, Jessica. 2008. "Subject-Sensitive Invariantism and the Knowledge Norm for Practical Reasoning." #emph[Noûs] 42 (2): 167--89. doi: #link("https://doi.org/10.1111/j.1468-0068.2008.00677.x")[10.1111/j.1468-0068.2008.00677.x].

] <ref-Brown2008>
#block[
Falbo, Arianna. 2021. "Inquiry and Confirmation." #emph[Analysis] 81 (4): 622--31. doi: #link("https://doi.org/10.1093/analys/anab037")[10.1093/analys/anab037].

] <ref-Falbo2021>
#block[
Fantl, Jeremy, and Matthew McGrath. 2002. "Evidence, Pragmatics, and Justification." #emph[Philosophical Review] 111 (1): 67--94. doi: #link("https://doi.org/10.2307/3182570")[10.2307/3182570].

] <ref-FantlMcGrath2002>
#block[
---------. 2009. #emph[Knowledge in an Uncertain World]. Oxford: Oxford University Press.

] <ref-FantlMcGrath2009>
#block[
Friedman, Jane. 2019a. "Checking Again." #emph[Philosophical Issues] 29 (1): 84--96. doi: #link("https://doi.org/10.1111/phis.12141")[10.1111/phis.12141].

] <ref-Friedman2019b>
#block[
---------. 2019b. "Inquiry and Belief." #emph[Noûs] 53 (2): 296--315. doi: #link("https://doi.org/10.1111/nous.12222")[10.1111/nous.12222].

] <ref-Friedman2019a>
#block[
---------. 2020. "The Epistemic and the Zetetic." #emph[Philosophical Review] 129 (4): 501--36. doi: #link("https://doi.org/10.1215/00318108-8540918")[10.1215/00318108-8540918].

] <ref-Friedman2020>
#block[
Lewis, David. 1996. "Elusive Knowledge." #emph[Australasian Journal of Philosophy] 74 (4): 549--67. doi: #link("https://doi.org/10.1080/00048409612347521")[10.1080/00048409612347521].

] <ref-Lewis1996bn>
#block[
Melchior, Guido. 2019. #emph[Knowing and Checking: An Epistemological Investigation]. Routledge Studies in Epistemology. New York: Routledge. doi: #link("https://doi.org/10.4324/9780429030239")[10.4324/9780429030239].

] <ref-Melchior2019>
#block[
---------. 2023. "Replies to the Critics of #emph[Knowing and Checking: An Epistemological Investigation]." #emph[Acta Analytica] 38 (1): 95--131. doi: #link("https://doi.org/10.1007/s12136-022-00541-0")[10.1007/s12136-022-00541-0].

] <ref-Melchior2023>
#block[
Woodard, Elise. 2024. "Why Double-Check." #emph[Episteme] 21: 664--67. doi: #link("https://doi.org/10.1017/epi.2022.22")[10.1017/epi.2022.22].

] <ref-Woodard2021>
] <refs>


// Bibliography partial for the bwpaper Typst format.
// Uses the site's chicago-with-note.csl via a project-root path ("/..."),
// because some Quarto versions mangle "../../" paths when writing them into
// Typst (they come out as "\../../...", which Typst rejects).

