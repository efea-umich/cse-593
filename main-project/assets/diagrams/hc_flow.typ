#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#let color_step = blue.desaturate(75%)
#let color_intent = orange.desaturate(75%)
#let color_breakdown = red.desaturate(75%)
#diagram(
    node-stroke: 2pt,
    edge-stroke: 1pt,
    node-outset: 4pt,
    node((0, 2), [Participant], name: <Participant>),
    node((1.5, 1), [Text entry interface], name: <TextEntry>, width: 6em),
    node((1.5, 3), [Voice input interface], name: <VoiceEntry>, width: 6em),
    node((4, 0), [Smartwatch], name: <Smartwatch>),
    node((4, 4), [Phone], name: <Phone>),
    node((6, 4), [Sender], name: <Sender>),
    edge(<Sender>, <Phone>, [#text("Send text")], "->", label-side: left, shift: 10pt),
    edge(<Phone>, <Smartwatch>, [Forward notification], "->", label-pos: 0.7, shift: -20pt),
    edge(<Smartwatch>, <Phone>, [Forward reply], "->", label-pos: 0.4, label-side: right, shift: 10pt ),
    edge(<Smartwatch>, <Participant>, [Receive notification], "->", bend: -35deg, label-size: 10pt),
    edge(<Participant>, <Phone>, [Notify], "->", bend: -35deg, label-size: 10pt),
    edge(<Phone>, <Participant>, [Type response], "->", bend: 35deg, label-size: 10pt, shift: 10pt, label-side:right),
    edge(<Participant>, <TextEntry>, [Type / Use suggested reply], "->", label-side: right, shift: 10pt),
    edge(<TextEntry>, <Smartwatch>, [Create response], "->"),
    edge(<VoiceEntry>, <Phone>, [Create response], "->", label-pos: 0.1),
    edge(<VoiceEntry>, <Smartwatch>, [Create response], "->", label-pos: 0.2, label-side: right),
    edge(<Phone>, <Sender>, [#text("Deliver response")], "->"),
    edge(<Participant>, <VoiceEntry>, [Speak], "->"),
)