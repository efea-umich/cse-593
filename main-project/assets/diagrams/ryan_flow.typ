#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge

#diagram(
  node-stroke: 2pt,
  edge-stroke: 1pt,
  node-outset: 4pt,
  node((0, 2), [Participant], name: <Participant>, radius: 3em),
  node((1, 1), [Suggested Reply], name: <WatchReply>, width: 5em),
  node((1, 3), [Written Response], name: <WrittenResponse>, width: 5em),
  node((2, 0), [Smartwatch], name: <Smartwatch>),
  node((2, 4), [Phone], name: <Phone>),
  node((3, 3), [Text Message], name: <Text>),
  node((4, 2), [Parents], name: <Parents>, radius: 3em),
  edge(<Parents>, <Text>, [#text("Send text (about graduation)\n or reply")], "->", label-side: left),
  edge(<Phone>, <Smartwatch>, [Forward notification], "->", label-pos: 0.7, shift: -10pt),
  edge(<Smartwatch>, <Phone>, [Forward reply], "->", label-pos: 0.6, shift: -10pt, label-side: right),
  edge(<Smartwatch>, <Participant>, [Receive notification], "->", bend: -35deg, label-size: 10pt),
  edge(<Participant>, <WatchReply>, [Use suggested reply], "->", label-side: right),
  edge(<WatchReply>, <Smartwatch>, "->"),
  edge(<WrittenResponse>, <Phone>, "->"),
  edge(<Phone>, <Parents>, "->", bend: 45deg, shift: -10pt),
  edge(<Text>, <Phone>, "->"),
  edge(<Participant>, <WrittenResponse>, [Type out message   #text(fill: red, "\nClarify wrong\nselected reply")], "->", label-side: right),
)