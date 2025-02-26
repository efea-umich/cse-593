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

#[
  #set text(size: 0.9em)
  #diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    spacing: (1em, 3em),
    step((0, 0))[Receive a text],
    edge("-|>"),
    edge("rrrr", <use-phone>, "-|>"),
    
    step((0, 1), name: <look-watch>)[Look at watch to read the text],
    breakdown((1, 1))[The text doesn't fit on the watch],
  
    edge(<look-watch.south>, (rel: (0, 0.2)), "rrrr", <use-phone>, "-|>", corner: right),
    
    edge(<look-watch>, (0,2), "-|>"),
    step((0, 2), name: <scribble>)[Scribble on the text-entry screen],
    intent((1, 2))[Write out her message],
    breakdown((2, 2))[The watch does not recognize a character],
    edge(<scribble.south>, (rel: (0, 0.2)), "rrrr", <use-phone>, "-|>", corner: right),
  
    edge((0, 2), (0, 3), "-|>"),
    step((0, 3))[Click the send button],
    intent((1, 3))[Send the message],
    breakdown((2, 3))[She misses the small send button],
  
    step((4, 3), name: <use-phone>)[Use her phone],
    intent((5, 3))[Write the message faster/ in more detail]
  )
]