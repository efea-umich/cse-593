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
  node((1,0), [Receive message (in Chinese)], name: <ReceiveMsg>, fill: color_step, width: 10em),
  node((0,1), [Read message on watch], name: <WatchRead>, fill: color_step, width: 10em),
  node((2,1), [Check phone for full text], name: <PhoneRead>, fill: color_step, width: 10em),
  node((0.8,1), [Response is long], name: <BDownPrivate>, fill: color_breakdown, width: 8em),
  node((1,1.4), [Only in private space], name: <BDownPrivate>, fill: color_breakdown, width: 10em),
  node((1,2), [Press Voice Input button], name: <VoiceInput>, fill: color_step, width: 10em),
  node((2,2), [Type response on phone], name: <PhoneType>, fill: color_step, width: 10em),
  node((0.42,3.43), [Attempt short reply], name: <WatchShortReply>, fill: color_intent, width: 10em),
  node((0,3), [Find suggested words written (in English)], name: <WatchSugged>, fill: color_step, width: 10em),
  node((1,3), [Speak to watch], name: <WatchTalk>, fill: color_step, width: 10em),
  node((1.7,3), [Speak to phone], name: <PhoneTalk>, fill: color_step, width: 8em),
  node((1.6,2.5), [Attempt fast and detailed reply (either in Chinese or English)], name: <WatchShortReply>, fill: color_intent, width: 27em),
  node((0,4), [Send message on watch], name: <WatchSend>, fill: color_step, width: 10em),
  node((1.35,3.5), [Check transcribed text], name: <WatchTrans>, fill: color_breakdown, width: 13em),
  node((2.7,4), [Send longer reply], name: <IntentDetailed>, fill: color_intent, width: 6em),
  node((2,4), [Send message on phone], name: <PhoneSend>, fill: color_step, width: 10em),

  edge(<ReceiveMsg.south>, <WatchRead.north>, "->"),
  edge(<ReceiveMsg.south>, <PhoneRead.north>, "->"),
  edge(<WatchRead.south>, <WatchSugged.north>, "->"),
  edge(<WatchRead.east>, <VoiceInput.north>, "->", corner: right),
  edge(<WatchRead.east>, <PhoneRead.west>, "->"),
  edge(<PhoneRead.west>, <VoiceInput.north>, "->"),
  edge(<VoiceInput.east>, <PhoneTalk.north>, "->"),
  edge(<PhoneTalk.south>, <PhoneSend.west>, "->"),
  edge(<VoiceInput.south>, <WatchTalk.north>, "->"),
  edge(<WatchTalk.south>, <WatchSend.east>, "->", corner: right),
  edge(<WatchSugged.south>, <WatchSend.north>, "->"),
  edge(<PhoneRead.south>, <PhoneType.north>, "->"),
  edge(<PhoneType.south>, <PhoneSend.north>, "->"),
)