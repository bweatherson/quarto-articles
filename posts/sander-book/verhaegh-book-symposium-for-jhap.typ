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
          emph[Logical Positivism and the Rise of Analytic Philosophy],
          align(right, strong(counter(page).display())))
      }
    }
  },
  numbering: none,
)
#show: doc => article(
  title: [Logical Positivism and the Rise of Analytic Philosophy],
  authors: (
    ( name: [Brian Weatherson],
      affiliation: [University of Michigan],
      email: [] ),
    ),
  date: [2026],
  abstract: [One of the interesting stories in Sander Verhaegh's #emph[Logical Positivism: An American History], is how positivism feeds into the development of 'analytic' philosophy after 1945. A coalition of 'scientific', or later 'analytic' philosophers is formed, with positivists being central to this coalition. What unified this coalition was not doctrinal agreement, but a commitment to putting logic and philosophy of science at the centre of philosophy, and to hiring and promoting people who did that, even if they disagreed on core philosophical theses. In effect, this became an alliance between positivists and prominent strands of realism, and within a couple of decades it took over all the leading philosophy departments in the United States. I suggest that given the structural advantages these kinds of coalitions have over philosophical schools with stronger doctrinal commitments, and the absence of any other coalition until the rise of 'Continental' philosophy many years later, this success was almost inevitable given the structural arrangements in place in the 1940s. I close with some questions about what would have had to happen for analytic philosophy not to become the dominant faction, and what such a world would look like.

],
  abstract-title: "Abstract",
  sectionnumbering: "1.1",
  toc_title: [Table of contents],
  toc_depth: 3,
  doc,
)

#emph[Logical Positivism] \(#link(<ref-Verhaegh2026>)[Verhaegh 2026]) is a great book.#footnote[In what follows, page references are to this book unless otherwise indicated.] It combines careful attention to archival records, quantitative data, and social context, to tell an incredibly rich story about the rise, and I guess fall, of logical positivism in America. I'm going to recommend it to all my students as crucial background for how philosophy in America got to where it is, and a correction to several popular narratives.

On the data side, this is one of the best examples you'll see of data use that highlights simple, understandable statistics. The main statistic the book uses is simply how often different philosophers are mentioned in leading American philosophy journals. This is not a simple statistic to gather; it takes an immense amount of data cleaning and analysis to tell whether, for example, a given mention is of Roy Wood Sellars or of Wilfrid Sellars. But Sander Verhaegh's team at Tilburg has done a mountain of work to get the data in a form where they can tell, with some confidence, who is being referred to at any point. (They have also made this data freely available to other researchers, for which they deserve a lot of credit.) And now, in a book like this, claims about changes in philosophy can be backed up with these statistics about how often philosophers are mentioned.

The book also has a number of tables of outliers, e.g., which philosophers are mentioned most often or, relative to expectation, least often in a particular period or in a particular journal. These tables strike me as an absolutely incredible feat. Whenever I build tables of outliers, they just reveal data errors; the most common words are usually bits of meta-data that haven't been cleaned from the text. Of course, it's very easy to understand a table of who was mentioned most or least often, so it's great for the reader to have something like this, but I suspect it was an enormous effort to get the tables to be so useful.

This note will largely be about Verhaegh's discussion of how positivism fed into the rise of analytic philosophy in America, but first I'll briefly discuss two smaller points about the book.

#emph[Logical Positivism] is primarily a book about a movement within academic institutions. But it isn't entirely about that. The effects of the outside world on positivism are clearly important; we don't get a generation of exiled empiricists without something causing their exile. It is discussed well in the book. It isn't just that there were exiles; who they were, when they came, and where they came from also matter, and in part 1 of the book we learn a lot more about these questions and why they matter.

What's more distinctive, though, is the book's discussion of the effects of positivism on the outside world. In the context of the book, especially in the discussion of positivism's effect on culture in chapter 11, positivism is a radical outside force that comes in to shake things up and is opposed by the conservative mainstream. I had a question about whether the positivists might have had a lasting and dramatic effect on American education.

Many American schoolchildren these days are taught that there is a very sharp fact/opinion distinction. They get worksheets asking them to classify claims into facts and opinions. These are worksheets, so there is meant to be a right and wrong answer. Whatever the background of these worksheets, which I really don't know, they are positivist in effect. The answers which will be marked correct could have been taken straight from #emph[Language, Truth and Logic]. That's to say, they have a very expansive conception of what's 'opinion' as opposed to 'fact', a much more expansive one than many of the American positivists Verhaegh discusses would endorse. The conservative complaints about positivism that Verhaegh discusses in chapter 11, complaints that positivists were separating facts and values, would look really weird to modern American students who have been taught that this distinction is vitally important. Was getting this into the curriculum a success story for positivism, or does it have some other history? I'm not sure, but it feels like an interesting research topic for people who want to look further into the social effects of positivism.

The other small point I want to note is that it's really pleasing to see how central #emph[public] universities are to the story in #emph[Logical Positivism]. The focus is so often on the famous Ivy League schools, and indeed five of the Ivies are central to Verhaegh's book. But his story relies on the big public universities too. We see Schlick get a huge audience at Berkeley very early on in the reception of positivism in America (144), then Feigl gets hired by Iowa and given more resources at Minnesota (268, 323). Reichenbach, after many challenges, is hired at UCLA (147). The central university at the end of the narrative, and still the home of the most important positivist archive, is Pitt (395ff). After Charles Stevenson is denied tenure at Yale, he gets a permanent home at Michigan (253, 268), where I'm based. To this day, our most prestigious research prize for graduate students is the Stevenson prize. Stevenson was succeeded at Michigan by Alan Gibbard, so we stayed a center for non-cognitivist meta-ethics for over half a century.

The main thing I want to talk about is the story Verhaegh tells, primarily in chapters 9 and 10, of how logical positivism feeds into the spectacular rise of analytic philosophy in America post-WWII. As with all plausible narratives of this rise, Verhaegh's starts with the vexed question of just what this thing, analytic philosophy, is that ended up winning. The story he gives, and for which he marshals excellent evidence, is that it becomes in effect the merger of the realist and positivist traditions. It's a merger of especially the Cambridge realist tradition with less doctrinaire versions of positivism.

One really striking thing about the narrative is that the label, 'analytic philosophy', gets used for this would-be coalition before there is any sign of it being a coalition. It's not the only term that gets used; 'scientific' philosophy is just as common. But two projects by Feigl and Wilfrid Sellars seem to be important in the terminological shift. One is the collection #emph[Readings in Philosophical Analysis] \(#link(<ref-FeiglSellars1949>)[Feigl and Sellars 1949])\; the other is the founding of the journal #emph[Philosophical Studies] with the subtitle #emph[An International Journal for Philosophy in the Analytic Tradition]. To a large extent, Feigl and Sellars are inventing this tradition, or perhaps more charitably discovering it, and labeling it.#footnote[Verhaegh quotes Feigl and Sellars as saying that the two traditions "have increasingly merged" (323). I think that's true in terms of which questions they were asking, which approaches they were using, and which answers they took seriously. It wasn't true in terms of which answers they gave.] The labeling is a bit of what we'd now call conceptual engineering. It's massively successful. The forces of 'scientific' philosophy really just run over all before them in the top American universities.

This coalition, the realists and the positivists, looks so unstable. What exactly do they have in common? This is why the definitional question is so hard. The question about commonality can be traced back to the figures who are conscripted into this new tradition. What exactly do Carnap, Moore, and Anscombe have in common, which they don't also share with Peirce?

Here Verhaegh also has a good pair of answers. First, what they have in common is a connection to #emph[Russell]. Verhaegh shows the positivists very consciously built a narrative where they were part of a common tradition with Russell, which helped fend off the charge that they were just a passing fad (241, 298). Second, there seems to have been something almost deliberate about writing Peirce into the anti-canon (334).

Let's step back. One simple narrative, already visible in philosophy's self-conception, was that there were three primary schools in American philosophy before positivism arrived. These were idealism, pragmatism, and realism \(#link(<ref-Perry1928>)[Perry 1928]\; #link(<ref-Morris1935>)[Morris 1935]\; #link(<ref-Verhaegh2026>)[Verhaegh 2026, 154]).#footnote[I'd say that is roughly their order of importance at the time, but making that claim about their relative position stick would require a major detour from this narrative.] There were other smaller schools; in a post-war survey of the state of philosophy Edgar Sheffield Brightman (#link(<ref-Brightman1947>)[1947]) also lists naturalists, Thomists, personalists and Kantians. But these three were the largest, not least because they had distinctive sub-schools. It helps to start with these three.

The coalition the positivists formed with the realists was not doctrinal; the positivists did not suddenly go around espousing realist theses.#footnote[For a long time, there was at least a negative thesis the members of the coalition had in common: opposition to idealism. But as we've seen in recent years, even that can be given up while still staying within analytic philosophy, provided one keeps using the right logical tools, and responding to the right arguments. See, e.g., Builes (#link(<ref-Builes2024>)[2024]), and, for a survey of the options, Chalmers (#link(<ref-Chalmers2019>)[2019]).] Rather, it was administrative. When philosophy departments were expanding in the post-war years, the realists and positivists worked together to make sure positions were set aside for 'scientific'/'analytic' philosophers. But at least during the period analytic philosophy was taking over American philosophy, the positivists were a key part of the coalition. Why did they enter into #emph[this] coalition, not into a coalition with one of the other major schools? The short answer is that neither of the other coalitions worked.

It would have made sense for pragmatists and positivists to work together. They are both anti-metaphysical. This led people to treat them similarly at the time. Verhaegh quotes Feigl, Morris, Nagel, and Hook as treating them as a pair (164, 173, 216). If the two are really different, where do you put Ramsey? (I come back to him below.) Later in life, Ayer does an interview with Bryan Magee \(#link(<ref-MageeAyer1978>)[Magee and Ayer 1978]) where he says pragmatism was "very akin to" positivism.

But this union doesn't work. Verhaegh suggests that it is because the pragmatists were allergic to dichotomies (185, 187), like the fact/value one, and that seems plausible. There was also a difference in how they treated formalism (168). It all seems very contingent; it's easy to imagine that if Ramsey had lived, he alone might have made the idea of pragmatist positivism work. But he didn't, and this pairing fails; the pragmatists at Columbia become some of the staunchest opponents of positivism.

It's a bit more of a stretch, but you can see how a positivist/idealist coalition could work. Especially in early versions of positivism, they both put conscious experience right at the center. Verhaegh quotes Carnap complaining that people were reading the #emph[Aufbau] as idealist (151, 155, 210). While Carnap is plausibly right that it's a misreading, it's not an unintelligible one; there is a synthesis there if someone wants to develop it. But no one did. It's interesting to think about what a philosophical landscape would look like where positivism/idealism vs pragmatism/realism was the main dividing line; perhaps Ayer vs Austin on sense-data would be taught as the central debate in philosophy.#footnote[I've elsewhere argued that the standard stories of the development of analytic philosophy in the actual world don't give enough emphasis to Austin's role \(#link(<ref-Weatherson2007-WEADPW>)[Weatherson 2007]). In this counterfactual he is much more clearly central.] But that will remain forever a counterfactual; it's not the way philosophy developed.

Instead, we get a positivist/realist coalition. Doctrinally, this seems very unstable. But it gets you two advantages, which Verhaegh stresses. One is that it gets you Russell inside the coalition, without worrying about Russell's changes of views over time (321). (At least, you don't have to worry if you ignore Russell's youthful idealism.) More importantly, it gets you a coalition between philosophers who think that logic and philosophy of science are central to philosophy. Before WWII, you already have Morris (#link(<ref-Morris1935>)[1935]) noting how much more comfortable the realists are with mathematical approaches to philosophy than the other schools are. This becomes the defining characteristic of this new school; not what answers they give to philosophical questions, but which questions they ask (including questions from philosophy of science), and how they answer them (with tools from mathematics and logic). This turned out to be enough.

Here's my contentious claim. Once that was the dividing line, the victory for the analytics was close to inevitable. We're taught to hate inevitability claims in history, and rightly so. And I do think it was really contingent that this became the dividing line. There are many things that could have happened before WWII that could have upset it. (I already noted that Ramsey's survival alone might have complicated the story significantly.) But once those are the sides, I think the analytics have to win. That's for two reasons.

One is that idealism, especially in America, was dying. And pragmatism was just not strong enough to fight this new coalition on its own. Verhaegh has some damning numbers on this. At the key moment, eleven of Columbia's thirteen faculty were homegrown (187). If Deweyan pragmatism had really been strong, there would have been graduate students so good you couldn't help hiring them. There weren't.

The bigger reason is that this coalition left the opposing forces hopelessly divided. This is already clear in Verhaegh's telling of the story. At Columbia, the anti-analytics wanted Deweyan pragmatism (260). At Princeton, they wanted Christian humanism (269). At Yale, they wanted a department that stayed a stronghold of metaphysics and humanist ethics. It's not that surprising that it was hard to put together a unified opposition; if the realists and positivists had to stretch to find things in common, the idealists, pragmatists, Thomists, etc., who opposed them had almost nothing in common except a dislike of the new analytic philosophy.

When analytic philosophy did face a threat, it was from 'continental philosophy'. Now continental philosophy, like analytic philosophy, covers a multitude of sins. But the advantage each has is that it will work with a pretty broad range of others under the umbrella, at least for institution building. That's needed to fight a battle like this, and the 1950s anti-analytics didn't have it.

Looking at things from a broadly institutional perspective makes it clear why coalitions, like analytic or continental philosophy, are going to be well placed to overrun more cohesive schools. For a graduate student, it is much safer to start working in an analytic program, or a continental program, than in a program dedicated to pragmatism, or to Thomism. You can change your mind on key philosophical questions and still feel at home in the program. If the coalition has a big role in hiring, which it does, there is a better chance of a good job at the other end. Both these factors suggest that once a coalition like this gets rolling, it will start sweeping up graduate students. Indeed, that's basically what happened both when the 'analytic' coalition began to form after WWII and when the 'continental' coalition began to form a decade or two later.

There is also an advantage at the hiring end. Academics are always fond of hiring people who share their views, at least about what the interesting questions are, if not always about what the right answers are. (Though the latter happens too, of course.) It's sometimes a challenge, but rarely impossible, to get academics on board with the idea of hiring in an area they are familiar with but don't think much of. It's much harder to get them to hire in areas that they are completely unfamiliar with, which they didn't study in graduate school, and which they don't interact with. One effect of this is that a school of philosophy centered around a few universities, even prominent ones, will lose out if students elsewhere are not learning about it: by the time those students are involved in hiring, they will have no interest at all in hiring from that school.

The coalitional approach avoids this problem. The realists and positivists who were trained by post-war scientific philosophers disagreed on any number of doctrinal points. But they knew about each other; indeed, they usually had friends from each side of the various disputes, and they were willing to hire people who looked like their teachers or classmates, even if they had disagreed with those teachers or classmates. (Again, this isn't a point about analytic philosophy; I think you can tell the same story about continental philosophy, and how the existence of continental programs creates philosophers who are willing to hire from the different traditions within continental philosophy.)

So I'll end with a question, one that I guess relates to the discussion of explanation in #emph[Logical Positivism]. I think counterfactuals are crucial to explanation. If we want to explain why analytic philosophy became dominant, we need to ask what the philosophical world would have looked like if it never became dominant. My question is, what does that world look like? And how late can it reasonably and feasibly differ from actual history? My guess is that the deviation from actual history has to come relatively early; by 1950, the outcome is baked in, even though the analytics don't actually take over for several more years. The more expansive analytic programs are going to have an easier job attracting good graduate students, and then those students will be more willing to hire from within this new 'analytic tradition'. I'd like to be convinced I'm wrong; I get nervous with inevitability claims! But this institutional story seems fairly compelling in retrospect.

As will hopefully be clear by now, #emph[Logical Positivism] is not just full of fascinating details about how positivism developed in America; it also tells a compelling story which opens up new ways of looking at the recent history of philosophy. It's a fantastic book, and I hope it's really widely read.

#block[
#block[
Brightman, Edgar Sheffield. 1947. "Philosophy in the United States 1939--1945." #emph[The Philosophical Review] 56 (4): 390--405. doi: #link("https://doi.org/10.2307/2181317")[10.2307/2181317].

] <ref-Brightman1947>
#block[
Builes, David. 2024. "Modal Idealism." In #emph[Oxford Studies in Philosophy of Mind], edited by Uriah Kriegel, 4:46--107. Oxford: Oxford University Press. doi: #link("https://doi.org/10.1093/9780198924159.003.0002")[10.1093/9780198924159.003.0002].

] <ref-Builes2024>
#block[
Chalmers, David J. 2019. "Idealism and the Mind-Body Problem." In #emph[The Routledge Handbook of Panpsychism], edited by William Seager, 353--73. London: Routledge. doi: #link("https://doi.org/10.4324/9781315717708-28")[10.4324/9781315717708-28].

] <ref-Chalmers2019>
#block[
Feigl, Herbert, and Wilfrid Sellars, eds. 1949. #emph[Readings in Philosophical Analysis]. New York: Appleton-Century-Crofts.

] <ref-FeiglSellars1949>
#block[
Magee, Bryan, and A. J. Ayer. 1978. "Logical Positivism and Its Legacy: Bryan Magee Talked to A. J. Ayer." British Broadcasting Corporation. #link("https://philpapers.org/rec/MAGLPA-2").

] <ref-MageeAyer1978>
#block[
Morris, Charles W. 1935. "Some Aspects of Recent American Scientific Philosophy." #emph[Erkenntnis] 5 (1): 142--51. doi: #link("https://doi.org/10.1007/BF00172290")[10.1007/BF00172290].

] <ref-Morris1935>
#block[
Perry, Ralph Barton. 1928. "Peace Without Victory---in Philosophy." #emph[Journal of Philosophical Studies] 3 (11): 300--312. #link("https://www.jstor.org/stable/3745271").

] <ref-Perry1928>
#block[
Verhaegh, Sander. 2026. #emph[Logical Positivism: An American History]. New York: Oxford University Press.

] <ref-Verhaegh2026>
#block[
Weatherson, Brian. 2007. "Doing Philosophy with Words." #emph[Philosophical Studies] 135 (3): 429--37. doi: #link("https://doi.org/10.1007/s11098-006-9026-3")[10.1007/s11098-006-9026-3].

] <ref-Weatherson2007-WEADPW>
] <refs>


// Bibliography partial for the bwpaper Typst format.
// Uses the site's chicago-with-note.csl via a project-root path ("/..."),
// because some Quarto versions mangle "../../" paths when writing them into
// Typst (they come out as "\../../...", which Typst rejects).

