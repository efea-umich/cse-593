#[
#import "@preview/cheq:0.2.2": checklist
#import "@preview/fletcher:0.5.4": diagram, node, edge

#show: checklist
#let q(content) = {
  metadata("question")
  
  show heading.where(level: 2): set heading(
    numbering: none
  )
  
  set enum(
    numbering: num => {
      set text(size: 0.8em, style: "normal")
      circle(radius: 5pt, align(center + horizon, [#num]))
    },
    body-indent: 0.75em
  )
  show enum: it => {
    set text(style: "italic")
    show block: set align(horizon)
    it
  }

  set list(
    body-indent: 0.75em,
    marker: circle(radius: 0.35em)
  )

  show heading.where(level: 2): it => {
    v(1em)
    set text(weight: "regular", size: 11pt)
    it.body
    v(0.25em)
  }
  
  
  block(breakable: false, content)
}

#q[
== 1. What is your age?
- 18 - 26
- 27 - 35
- 36 - 44
- 45 - 53
- 54 - 62
- 63+
]

#q[
== 2. What is your gender?
- Male
- Female
- Non-binary
- Other
]
#q[
== 3. Which is your dominant hand?
- Left
- Right
- Ambidextrous
- Other
]
#q[
== 4. Which arm do you typically wear a smartwatch on?
- Left
- Right
- Either arm
- I don't typically wear a smartwatch
]
#q[
== 5. What features do you use most often on your smartwatch?
- [ ] Checking the time
- [ ] Fitness tracking (e.g., steps, heart rate)
- [ ] Receiving notifications (e.g., calls, messages, apps)
- [ ] Responding to notifications (e.g., sending texts or emails)
- [ ] Recording notes
- [ ] Music/Media control
- [ ] Voice assistant (e.g., Siri, Google Assistant)
- [ ] Health monitoring (e.g., sleep, ECG, blood oxygen)
- [ ] I don't use a smartwatch
- [ ] Other
]
#q[
== 6. What type of text-entry method do you use most often on your smartphone?
- Predictive text/suggested responses
- On-screen keyboard (QWERTY)
- Voice input (speech-to-text)
- Gesture-based typing (swiping/gesturing)
- Emoji/picture-based input
- I don't use a smartphone
- Other
]
#q[
== 7. What type of text-entry method do you use most often on your smartwatch?
- Predictive text/suggested responses
- On-screen keyboard (QWERTY)
- Voice input (speech-to-text)
- Gesture-based typing (swiping/gesturing)
- Emoji/picture-based input
- I don't use a smartwatch
- Other
]
#q[
== 8. How comfortable are you with entering text onto your smartphone (via typing, voice-to-text, handwriting, etc.)?
- Very Uncomfortable
- Uncomfortable
- Neutral
- Comfortable
- Very Comfortable
- I don't use a smartphone
]
#q[
== 9. How comfortable are you with entering text onto your smartwatch (via typing, voice-to-text, handwriting, etc)?
- Very Uncomfortable
- Uncomfortable
- Neutral
- Comfortable
- Very Comfortable
- I don't use a smartwatch
]
#q[
== 10. How comfortable are you with entering text on a smartwatch relative to your comfort with a smartphone?
- I strongly prefer the smartphone 
- I prefer the smartphone
- I have no preference
- I prefer the smartwatch
- I strongly prefer the smartwatch
- I don't use a smartwatch
]
#q[
== 11. How would you rate your speed of text-entry on your smartwatch relative to your smartphone?
- Much Slower
- Slower
- About the same speed
- Faster
- Much Faster
- I don't use a smartwatch
]
#q[
== 12. How comfortable are you with using a smartwatch for tasks that traditionally require a smartphone (e.g., responding to messages or emails)?
- I enjoy it, it’s convenient
- It’s okay, but I prefer using my phone
- I don't use my smartwatch for these tasks
- I find it inefficient and would rather use my phone
- I don't use a smartwatch 
]
#q[
== 13. Do you experience any of these issues while typing on a smartwatch?
- [ ] It's hard to type with only one hand
- [ ] It's hard to use multiple fingers
- [ ] It's hard to type accurately on a small screen
- [ ] It's hard to read text on a small screen
- [ ] I can't access special symbols
- [ ] Drawing each character is cumbersome
- [ ] Other
]
#q[
== 14. How often do you use your smartwatch for text-entry purposes (e.g., replying to messages, writing notes)?
- Daily
- At least once a week
- At least once a month
- Rarer than once a month
- I don't use a smartwatch
]
#q[
== 15. How much time do you spend daily entering text on your smartwatch?
- Less than 10 minutes
- 10-29 minutes
- 30-60 minutes
- More than an hour
- I don't use my smartwatch for text-entry
]
#q[
== 16. If you could improve the text-entry process on smartwatches, what feature(s) would you add or change?
- [ ] Bigger font/keyboard size
- [ ] Faster predictive typing
- [ ] More accurate auto-correct
- [ ] Better swipe/gesture-based typing
- [ ] Integration with other devices (e.g., typing from a phone to a smartwatch)
- [ ] More emoji or shorthand suggestions
- [ ] I have no suggestions
- [ ] Other
]

]