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
  == 3. Which arm do you typically wear a watch on?
  - Left
  - Right
  - Either arm
  - I don't typically wear a watch
  ]
  #q[
  == 4. Which is your dominant hand?
  - Left
  - Right
  - Ambidextrous
  - Other
  ]
  #q[
  == 5. How comfortable are you with typing on a regular keyboard?
  + Very Uncomfortable
  + 
  + 
  + 
  + Very Comfortable
  ]
  #q[
  == 6. If you do wear a smartwatch, how comfortable do you feel entering text relative to your comfort at a keyboard?
  1. I strongly prefer the keyboard 
  + 
  +
  +
  + I strongly prefer the watch
  ]
  #q[
  == 7. If you strongly prefer the keyboard, what issues come with typing on a watch?
  - [ ] The buttons are too small
  - [ ] I can't access special symbols
  - [ ] Drawing each character is cumbersome
  - [ ] Other
  ]
  #q[
  == 8. How often do you use your smartwatch for text-entry purposes (e.g., replying to messages, writing notes)?
  - Very Often
  - Occasionally
  - Rarely
  - Never
  ]
  #q[
  == 9. What type of text-entry method do you primarily use on your smartwatch?
  - On-screen keyboard (QWERTY)
  - Voice input (speech-to-text)
  - Gesture-based typing (swiping/gesturing)
  - Emoji/picture-based input
  - Other
  ]
  #q[
  == 10. How would you rate the speed of text-entry on your smartwatch?
  1. Very Slow
  +
  +
  +
  + Very Fast
  ]
  #q[
  == 11. If you could improve the text-entry process on smartwatches, what feature would you add or change?
  - [ ] Bigger font/keyboard size
  - [ ] Faster predictive typing
  - [ ] More accurate autocorrect
  - [ ] Better swipe/gesture-based typing
  - [ ] Integration with other devices (e.g., typing from a phone to a smartwatch)
  - [ ] More emoji or shorthand suggestions
  - [ ] Other
  ]
  #q[
  == 12. What features do you primarily use on your smartwatch?
  - [ ] Fitness tracking (steps, heart rate, etc.)
  - [ ] Receiving notifications (calls, messages, apps)
  - [ ] Music/Media control
  - [ ] Voice assistant (e.g., Siri, Google Assistant)
  - [ ] Text-entry or messaging
  - [ ] Health monitoring (e.g., sleep, ECG, blood oxygen)
  - [ ] Other
  ]
  #q[
  == 13. How much time do you spend daily using your smartwatch for text-based activities?
  - Less than 10 minutes
  - 10-30 minutes
  - 30-60 minutes
  - More than an hour
  - I don’t use my smartwatch for text-entry
  ]
  #q[
  == 14. How do you feel about using a smartwatch for tasks that traditionally require a smartphone (e.g., messaging, emails)?
  - I enjoy it, it’s convenient
  - It’s okay, but I prefer using my phone
  - I don’t use my smartwatch for these tasks
  - I find it inefficient and would rather use my phone
  ]
]