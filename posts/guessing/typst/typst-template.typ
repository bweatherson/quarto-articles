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
