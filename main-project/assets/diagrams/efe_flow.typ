#import "@preview/fletcher:0.5.4": diagram as diagram_, node, edge

#let step(..args, content) = node(
  ..args,
  shape: rect,
  fill: blue.lighten(65%),
  box(width: 0.8in, content)
)

#let intent(..args, content) = node(
  ..args,
  shape: rect,
  fill: orange.lighten(65%),
  box(width: 0.8in, content)
)

#let breakdown(..args, content) = node(
  ..args,
  shape: rect,
  box(width: 1in)[
    #place(top + right, box(emoji.lightning))
    #box(inset: (right: 1em), content)
  ]
)

#let diagram(..args) = {
  set par(justify: false)
  align(center, diagram_(..args))
}

#let nnode(..args, name) = node(..args, shape: rect, name: label(name), [#box(height: 20pt, name)])

#[
  #set text(size: 0.9em)
  #diagram(
    spacing: (5em, 6em),
    node-stroke: 1pt,
    edge-stroke: 1pt,
    nnode((0, 0), "Smartwatch"),
    nnode((0, 3), "Phone"),
    nnode((-2, 2), "User"),
    nnode((-2, 1), "Text Entry Interface"),
    nnode((2, 3), "Sender"),
    edge(<Smartwatch>, <Phone>, "-|>", shift: 10pt, label-pos: 70%, label-side: left)[Forward sent text],
    edge(<Phone>, <Smartwatch>, "-|>", shift: 10pt, label-pos: 70%, label-side: left)[Forward received text],
    edge(<Sender>, <Phone>, "-|>", shift: 5pt, label-side: left)[Send text],
    edge(<Phone>, <Sender>, "-|>", shift: 5pt, label-side: left)[Deliver response],
    edge(<Phone>, <User>, "-|>", shift: 5pt, label-pos: 30%, label-side: left)[Notify user],
    edge(<User>, <Phone>, "-|>", shift: 5pt, label-pos: 20%, label-side: left)[Type response on phone],
    edge(<User>, label("Text Entry Interface"), "-|>",)[Scribble/Type Response],
    edge(label("Text Entry Interface"), <Smartwatch>, "-|>",)[Create response message],

    edge(<User>, "l,u,u", <Smartwatch>, "-|>")
  )
]