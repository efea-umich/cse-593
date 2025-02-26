#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#let color_step = blue.desaturate(75%)
#let color_intent = orange.desaturate(75%)
#let color_breakdown = red.desaturate(75%)
#diagram(
  node((0, 0), [Step], fill:color_step),
  node((1, 0), [Intent], fill:color_intent),
  node((2, 0), [Breakdown], fill:color_breakdown)
)
#diagram(
  node-stroke: 2pt,
  edge-stroke: 1pt,
  node-outset: 4pt,
  spacing: 30pt,
  node((1, 0), [Receive text from parents], name: <Text>, fill: color_step),
  node((0, 1), [Read message on watch], name: <ReadWatch>, fill: color_step, width: 10em),
  node((0.75, 1), [Message too long for small screen], name: <SmallScreenWatch>, fill: color_breakdown, width: 8em),
  node((2, 1), [Read message on phone], name: <ReadPhone>, fill: color_step, width: 10em),
  node((0, 2), [Find suggested reply from watch], name: <AutoreplyWatch>, fill: color_step, width: 10em),
  node((0.75, 2), [Provide quick response], name: <WatchAutoReplyIntent>, fill: color_intent, width: 8em),
  node((2, 2), [Type response on phone], name: <TypePhone>, fill: color_step, width: 10em),
  node((2.88, 2), [Give detailed response], name: <LongerResponse>, fill: color_intent, width: 8em),
  node((2, 3), [Send message on phone], name: <SendPhone>, fill: color_step),
  node((0.75, 3), [Sometimes misses intended button], name: <CorrectMessage>, fill: color_breakdown, width: 8em),
  node((0, 3), [Send message on watch], name: <SendWatch>, fill: color_step, width: 10em),
  edge(<Text.south>, <ReadWatch.north>, "->"),
  edge(<Text.south>, <ReadPhone.north>, "->"),
  edge(<ReadPhone.south>, <TypePhone.north>, "->"),
  edge(<ReadWatch.south>, <TypePhone.west>, "->"),
  edge(<ReadWatch.east>, <ReadPhone.west>, "->"),
  edge(<ReadWatch.south>, <AutoreplyWatch.north>, "->"),
  edge(<AutoreplyWatch.south>, <SendWatch.north>, "->"),
  edge(<TypePhone.south>, <SendPhone.north>, "->"),
  edge(<SendWatch.east>, <SendPhone.west>, "->"),
)