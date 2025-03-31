#import "@preview/subpar:0.2.1"

#let draft_state = state("draft", false)

#let authors_header(authors) = {
    set text(size: 8pt)
    align(right)[
      #if authors.len() > 0 {
        let formatted = authors.map(author => {
          let names = author.split(" ")
          if names.len() > 0 {
            names.at(0).at(0) + ". " + names.slice(1).join(" ")
          } else {
            author
          }
        })
        formatted.slice(0, -1).join(", ") + if formatted.len() > 1 { " and " } + formatted.last()
      }
    ]
}

#let make_title(title, authors, location, concepts, keywords, body) = {
  set par(first-line-indent: 0pt, spacing: 12pt)

  let contents = {
    text(weight: "bold", size: 14.5pt, font: "Linux Biolinum", title)
    parbreak()
    text(size: 12pt, font: "Linux Biolinum")[
      #set text(hyphenate: false, tracking: -0.1pt)
      #upper[
        #{authors.slice(0, -1).join(", ") + if authors.len() > 1 { " and " } + authors.last() + ","}
      ]
    ]
    text(size: 10pt, location)

    set text(size: 9pt)
    parbreak()
    {
      body
    }
    parbreak()

    [CCS Concepts:]
    {
      set text(weight: "bold")
      let concept_elements = ()
      for (i, (concept, keywords)) in concepts.pairs().enumerate() {
        concept_elements.push([
          #sym.bullet #concept #sym.arrow #keywords.join("; ")#if i == concepts.len() - 1 { "." }
        ])
      }
      [#concept_elements.join("; ")]
    }
    parbreak()
    [Additional Keywords and Phrases: #keywords.join(", ")]
  }

  v(24pt)
  block(below: 22pt, contents)
}

#let ffigure(..args, l: none) = {
  place(
    auto,
    scope: "parent",
    float: true,
    [
      #figure(..args) #if l != none {label(l)}
    ]
  )
}

#let appendix(content) = {
  counter(heading).update((..it) => 0)
  set heading(numbering: "A.1   ")
  
  [
    #content
  ]
}

#let hide_if_draft(enabled: true, content) = context {
  let is_draft = draft_state.get()
  if not is_draft or not enabled {
    content
  }
}


#let sketch(label: none, ..args) = [
  #set image(fit: "contain")
  #figure(
    kind: "sketch",
    supplement: "Sketch",
    ..args
  ) #if label != none {std.label(label)}
]

#let acmart(
  authors: (),
  title: "Title",
  draft: false,
  body
) = {
  draft_state.update(_ => draft)
  let page_header = {
      set text(font: "Linux Biolinum", size: 10pt)
      context if calc.rem(here().page(), 2) == 0 {
        authors_header(authors)
      } else if here().page() > 1 {
        title
      }
  }
  set page(
    paper: "us-letter",
    margin: (top: 84pt, bottom: 114pt, inside: 81pt, outside: 81pt),
    header-ascent: 16pt,
    numbering: (..args) => {
      text(size: 9pt, [#args.pos().at(0)])
    },
    header: {
      if not draft {
        page_header
      } else {
        text(size: 24pt, fill: red, smallcaps("Draft — Don't Submit"))
      }
    }
  )

  let heading_numbering(..args) = {
    args.pos().map(it => str(it)).join(".") + h(8pt)
  }
  
  set heading(numbering: heading_numbering)
  show heading: el => {
    set text(size: 11pt) if el.level == 1
    set text(size: 10.5pt) if el.level == 2
    set text(font: "Linux Biolinum", weight: "regular")

    let content = el
    if el.level == 1 {
      content = upper(el)
    }
    block(above: 18pt, below: 8pt, content)
  }

  show heading.where(level: 3): el => {
    let heading_number = heading_numbering(..counter(heading).get())
    block(spacing: 9pt) + text(style: "italic", weight: "regular", heading_number + el.body + ": ")
  }

  show heading.where(level: 4): el => {
    let heading_number = heading_numbering(..counter(heading).get())
    block(spacing: 9pt) + text(style: "italic", weight: "regular", heading_number + el.body + ": ")
  }

  set text(size: 10pt, font: "Libertinus Serif", tracking: -0.01pt)
  set par(justify: true, first-line-indent: 10pt, spacing: 5pt, leading: 5pt)
  set bibliography(
    title: [== References]
  )
  show bibliography: set text(size: 9pt)

  show figure: f => {
    set image(width: 75%)
    set align(center)
    set block(above: 24pt, below: 24pt)
    f
  }

  show table: set align(center)
  set table(align: left)
  show table: set block(spacing: 18pt)

  set table(stroke: (x, y) => {
    if (y == 0) {
      return (y: 0.5pt)
    }
  })

  set table.hline(stroke: 0.5pt)

  show figure: fig => {
    set figure.caption(position: top) if fig.kind == table
    fig
  }
  
  body
}