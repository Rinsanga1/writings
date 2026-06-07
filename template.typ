// Rina Ralte's article template for Typst
// Recreates the look of a standard LaTeX article class with Computer Modern

#let rin(
  title: none,
  authors: (),
  date: none,
  abstract: none,
  body,
) = {
  // Page: US Letter, LaTeX article-class margins
  set page(
    paper: "us-letter",
    margin: (top: 1in, bottom: 1in, left: 2in, right: 2in),
    numbering: "1",
    number-align: center,
  )

  // Font: New Computer Modern (ships with Typst)
  set text(
    font: "New Computer Modern",
    size: 10pt,
    lang: "en",
  )

  // Paragraphs: indented, no spacing between (LaTeX default)
  set par(
    first-line-indent: 1.5em,
    justify: true,
    leading: 0.55em,
    spacing: 0.55em,
  )

  // --- Headings ---

  set heading(numbering: "1.1")

  show heading.where(level: 1): it => {
    v(1.5em)
    block({
      set text(size: 12pt, weight: "bold")
      if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      it.body
    })
    v(0.8em)
    par(text(size: 0pt, ""))
  }

  show heading.where(level: 2): it => {
    v(1.2em)
    block({
      set text(size: 10pt, weight: "bold")
      if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      it.body
    })
    v(0.6em)
    par(text(size: 0pt, ""))
  }

  show heading.where(level: 3): it => {
    v(1em)
    block({
      set text(size: 10pt, weight: "bold")
      if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      it.body
    })
    v(0.5em)
    par(text(size: 0pt, ""))
  }

  // --- Math ---
  set math.equation(numbering: "(1)")

  // --- Lists ---
  set enum(indent: 1.5em, body-indent: 0.5em)
  set list(indent: 1.5em, body-indent: 0.5em)

  // --- Figures ---
  show figure.caption: it => {
    set text(size: 9pt)
    it
  }

  // --- Links ---
  show link: set text(fill: rgb("#000000"))

  // --- Footnotes ---
  set footnote.entry(separator: line(length: 30%, stroke: 0.5pt))

  // --- Title block ---
  if title != none {
    v(2em)
    align(center, {
      text(size: 17pt, weight: "bold", title)
    })
  }

  if authors.len() > 0 {
    v(1.2em)
    align(center, {
      for (i, author) in authors.enumerate() {
        if i > 0 { h(2em) }
        text(size: 12pt, author)
      }
    })
  }

  if date != none {
    v(0.8em)
    align(center, text(size: 12pt, date))
  }

  if abstract != none {
    v(1.5em)
    block(inset: (left: 3em, right: 3em), {
      align(center, text(weight: "bold", size: 10pt, "Abstract"))
      v(0.4em)
      set text(size: 9pt)
      set par(justify: true)
      abstract
    })
  }

  v(2em)

  body
}

// --- Usage example ---

#show: rin.with(
  title: [The Title of the Paper],
  authors: ("Rina Ralte",),
  date: [June 7, 2026],
  abstract: [
    This is the abstract of the paper. It summarizes the main contributions
    and results. The abstract should be concise and self-contained.
  ],
)


#outline()


= Introduction

This template recreates the look of a standard article typeset with
Computer Modern. The margins, font sizes, paragraph indentation, and heading
styles match classic academic paper defaults.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris.

== A Subsection

Subsections are numbered and set in bold at the body text size, matching
the article class. Paragraphs after the first are indented.

This is a second paragraph to demonstrate the first-line indent. The
spacing between paragraphs is tight, with no extra vertical space — just
as LaTeX does by default.

=== A Subsubsection

Subsubsections follow the same pattern. Here is an equation:

$ E = m c^2 $ <eq:einstein>

We can reference @eq:einstein in the text. Numbered equations appear
centered with the number on the right margin, just like in LaTeX.

= Mathematics

Typst handles math natively. Here are some examples:

$ integral_0^infinity e^(-x^2) dif x = sqrt(pi) / 2 $

$ sum_(n=1)^infinity 1 / n^2 = pi^2 / 6 $

A matrix:

$ mat(
  a, b;
  c, d;
) $

= Lists

An enumerated list:

+ First item
+ Second item
+ Third item

A bullet list:

- Alpha
- Beta
- Gamma

= Conclusion

This template provides a starting point for papers in the style of
a classic article class. Adjust the margins, font size, or heading
format in the `rin` function to suit your needs.
