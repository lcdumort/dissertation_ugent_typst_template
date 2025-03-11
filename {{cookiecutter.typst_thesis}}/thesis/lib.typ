#let part(
  title,
  number,
) = {
  page(
    numbering: none,
    v(7cm) +
    align(center, text(size: 4em)[Part #number]) +
    align(center, text(weight: 300, size: 2em, title)),
    margin: (bottom: 2cm, top: 2cm, left: 1.5cm, right: 1.5cm),
  )
  // pagebreak()
}

#let book(
  // The book's title.
  title: [Book title],

  // The book's author.
  author: "Author",

  // A dedication to display on the third page.
  dedication: none,

  // Details about the book's publisher that are
  // display on the second page.
  publishing-info: none,

  // The book's content.
  symbols: none,
  abbreviations: none,
  quote: none,
  preface: none,
  summary: none,
  samenvatting: none,
  papers: none,
  publications: none,
  presentations: none,
  appendices: none,
  acknowledgements: none,
  body,
) = {
  // Set the document's metadata.
  set document(title: title, author: author)
  let part2 = "Peer-Reviewed Publications, Preprints, and Conference Contributions"

  // Set the body font. TeX Gyre Pagella is a free alternative
  // to Palatino.
  set text(size: 11.0pt)

  // Configure the page properties.
  set page(
    width: 16cm,
    height: 24cm,
    margin: (bottom: 2cm, top: 2cm, left: 2cm, right: 2cm),
  )


  // Display publisher info at the bottom of the second page.
  if publishing-info != none {
    align(center + bottom, text(0.8em, publishing-info))
  }

  // pagebreak()

  let part-counter = counter("part")
  let new-part(title) = {
    part-counter.step()
    heading(
      level: 1,
      numbering: "I",
      [Part #part-counter.display(): #title]
    )
  }

  // Table of contents
  // Configure heading numbering
  let titles_roman = (
    "Summary (EN)", "Summary (NL)", "List of Symbols",
    "List of Abbreviations",
  )
  let titles_ABC = ("A Selection of Peer-Reviewed Publications and Preprints",)

  if quote != none {
    set text(11pt)
    set block(spacing: 0.78em)
    quote
    pagebreak()
  }

  set heading(numbering: "1.1")
  outline()

  set page(
    numbering: numbering("i", 1),
    number-align: center,
  )
  set par(leading: 0.78em, first-line-indent: 12pt, justify: true)

  page(numbering: none)[]
  page(numbering: none)[]
  counter(page).update(1)
  if preface != none {
    heading(numbering: none, outlined: true, "Acknowledgements")
    preface
    pagebreak()
  }

  if summary != none {
    heading(numbering: none, outlined: true, "Summary")
    summary
    pagebreak()
  }
  if samenvatting != none {
    heading(numbering: none, outlined: true, "Samenvatting")
    samenvatting
    pagebreak()
  }

  // List of Symbols
  if symbols != none {
    heading(numbering: none, outlined: true, "List of Symbols")
    table(
      columns: (auto, auto),
      inset: 4pt,
      stroke: none,
      align: (center + horizon, horizon + left),
      ..symbols.map(((symbol, description)) => (
        [$ #symbol $],
        [#description]
      )).flatten()
    )
    pagebreak()
  }

  // List of Abbreviations
  if abbreviations != none {
    heading(numbering: none, outlined: true, [List of Abbreviations])
    table(
      columns: (auto, auto),
      inset: 4pt,
      stroke: none,
      align: (center, left),
      ..abbreviations.map(((abbr, full)) => (
        text(weight: 700, abbr),
        [#full]
      )).flatten()
    )
    pagebreak()
  }


  // Books like their empty pages.
  // pagebreak(to: "odd")
  page(numbering: none)[]
  part(title, "I")
  counter(heading).update(0)
  counter(page).update(1)

  // Configure paragraph properties.
  set par(leading: 0.78em, first-line-indent: 12pt, justify: true, spacing: 0.78em)

  // configure equations?
  set math.equation(numbering: "(1)")

  // Configure page properties.
  set page(
    numbering: numbering("1", 1),
    number-align: center
  )

  set figure(numbering: it => {
    // let numbering-string = it.numbering
    let num_chapter = counter(heading).display().first()
    [#num_chapter.#it]
  })

  show figure.caption: it => {
    block(
      width: 90%,
      spacing: 0.9em,
      par(leading: 0.3em, text(10pt, it)),
    )
  }


  // Configure chapter headings
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => context {
    pagebreak(to: "odd")

    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)

    let number = if it.numbering != none {
      counter(heading).display("1")
      h(7pt, weak: true)
    }
    align(right, {
      v(-1em)
      text(9em, weight: 300, number, fill: luma(70%))
      v(-10em)
      text(1.4em, weight: 700, it.body)
    })
    v(1em)
  }

  show heading.where(level: 2): it => {
    v(1em)
    align(center, it)
    v(0.5em)
  }
  pagebreak()

  body

  let hidden-heading(body, level: 1) = {
    // Create a dummy heading that won't be displayed but can be queried
    [#heading(
      body,
      level: level,
      outlined: true,
      numbering: none
    )#box(width: 0pt, height: 0pt)
    ]
  }

  let publication-page(
    number: "",
    title: "",
    authors: "",
    journal: "",
    contributor: "",
    copyright: "",

    num_pages: none,  // ignored
  ) = {
    set page(
      width: 16cm,
      height: 24cm,
      margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm),
      header: none,
    )
    hidden-heading(level: 2, [Paper #number])

    // v(3cm)
    // align(
    //   center,
    //   text(size: 12pt)[#underline[Paper #number]],
    // )
    v(0.5cm)
    align(center, text(size: 12pt, weight: "bold")[#title])
    v(0.5cm)
    align(center, authors)
    v(0.5cm)
    align(center, journal)
    v(9cm)

    contributor
    v(1cm)
    text(size: 9pt)[
      Reprinted with permission.\
      #copyright
    ]
  }
  counter(heading).update(0)
  set page(header: none)
  show heading.where(level: 1): it => context {
    pagebreak(to: "odd")

    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)

    let number = if it.numbering != none {
      counter(heading).display("A")
      h(7pt, weak: true)
    }
    align(right, {
      v(-1em)
      text(9em, weight: 300, number, fill: luma(70%))
      v(-10em)
      text(1.4em, weight: 700, it.body)
    })
    v(1em)
  }

  // insert page for part II
  // page(v(10cm) + align(center, "part II"))
  // pagebreak()
  part(part2, "II")
  heading(level: 1, outlined: true, "Selected Publications and Preprints")
  pagebreak()

  for paper in papers {
    publication-page( 
        number: paper.at("number"),
        title: paper.at("title"),
        authors: paper.at("authors"),
        journal: paper.at("journal"),
        contributor: paper.at("contributor"),
        copyright: paper.at("copyright"),
        num_pages: paper.at("num_pages"),)
    pagebreak()

  figure(
  image("papers/dumortier-et-al-2024/page_001.svg", width: 130%),
)

  }

  let show-publication(
    index: none,
    title: none,
    authors: none,
    journal: none,
  ) = {
    v(0.1cm)
    grid(
      columns: (2em, auto),
      align: (top, top + left),
      text(index),
      text(weight: "bold", title) + linebreak() +
      authors + linebreak() +
      journal
    )
  }
  let show-presentation(
    index: none,
    title: none,
    authors: none,
    event: none,
    date: none,
    location: none,
  ) = {
    v(0.1cm)
    grid(
      columns: (2em, auto),
      align: (top, top + left),
      text(index),
      text(weight: "bold", title) + linebreak() +
      authors + linebreak() +
      emph(event) + linebreak() +
      date + linebreak() +
      location
    )
  }

  set heading(numbering: "A.1")
  heading(level: 1, outlined: true, "Appendices")
  for i in array.range(appendices.len()) {
    let a = appendices.at(i)
    heading(level: 2, outlined: true, a.at("title"))
    a.at("body")
  }


  heading(level: 1, outlined: true, "List of Publications and Conference Contributions")
  set heading(numbering: none)
  heading(level: 2, outlined: true, "Publications and Preprints")
  for i in array.range(publications.len()) {
    show-publication(index: str(i + 1), ..publications.at(i))
  }

  heading(level: 2, outlined: true, "Presentations at Conferences & Workshops")
  text[The following list enumerates only those presentations for which I was the main
  presenter.]
  for i in array.range(presentations.len()) {
    show-presentation(index: str(i + 1), ..presentations.at(i))
  }


  set page(
    header: none,
    margin: (bottom: 2cm, top: 2cm, left: 2cm, right: 2cm),
  )
  show heading: it => {
    pagebreak(to: "odd")
    v(1em)
    text(20pt, weight: 500, it.body)
  }
  bibliography(style: "american-physics-society", "references.bib")
  if acknowledgements != none {
    pagebreak()
    acknowledgements
  }
}

#let to_roman(num) = {
  let roman = (
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  )
  let result = ""
  for (value, symbol) in roman {
    while num >= value {
      result += symbol
      num -= value
    }
  }
  result
}

#let paper(n) = {
  text(
    weight: 700,
    size: 11pt,
    "Paper " + to_roman(n)
  )
}
