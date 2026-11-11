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
          emph[$if(title)$$title$$endif$],
          align(right, strong(counter(page).display())))
      }
    }
  },
  numbering: none,
)
