#import "@preview/fletcher:0.5.4" as fletcher: diagram, node, edge
#import "../acmart.typ": *

#let authors = (
  "Efe Akinci",
  "Ryan Chua",
  "Hyungchan Cho",
  "Nivedhitha Dondati Purushotham",
  "Kevin Sun",
  "Oskar Shiomi Jensen"
)

#let concepts = (
    "Human-centered computing": ("Interaction Techniques",)
)

#let keywords = (
  "text-entry",
  "smartwatch",
  "typing"
)

#show: acmart.with(
  title: "Clockworks",
  authors: authors
)

#make_title("Clockworks", authors, "University of Michigan, USA", concepts, keywords)[
Smartwatches are increasingly common for communication and health tracking, yet small screens deter many users from typing messages on these devices. Our project promises to address this shortfall by gathering detailed insights on when, how, and why people attempt text entry on their watches. A key obstacle lies in the mismatch between tiny touch interfaces and users' language or comfort needs, which exacerbates errors and slows interactions. To investigate, we administered think-aloud pilot surveys, refined surveys, and Contextual Inquiry interviews. We consolidated findings from Contextual Inquiry interviews of six participants who revealed frustrations with limited keyboards, uncertain predictive text, and distractions. Our consolidated results pave the way for users to spend less time correcting errors by overcoming small-screen constraints.
]

= Introduction

Smartwatches, such as the Apple Watch and Samsung Galaxy Watch, have grown in popularity over the past decade, with millions of units sold annually. As these devices continue to evolve, they are increasingly being integrated into everyday life for health tracking, communication, and productivity. However, despite their advanced capabilities, text entry remains a major usability challenge due to the limited screen size and lack of physical keys, making traditional QWERTY-style typing inefficient.

Building on this observation, our project centers on gathering detailed information about how people use and experience text entry on smartwatches. We conducted a pilot survey with six participants and a revised survey with thirty responses that hinted at widespread dissatisfaction with smartwatch text-entry but did not explore specific causes. We set out to examine those causes through Contextual Inquiry interviews, consolidating data from six participants with varying backgrounds and usage patterns.

Our promise is to identify practical ways of enabling quick, less error-prone text entry on watches. The main obstacle arises from the small screens and input constraints that undermine users' comfort and confidence in sending messages. We explored how participants managed or avoided these constraints, observing the decisions they made about when to use the smartwatch's keyboard or voice input, as well as their reasons for switching to a phone. We hypothesize that smartwatch text-entry can support more tasks if designs address short-message needs and reduce the friction associated with typing on a tiny screen.

We refined our approach by combining a revised survey with real-time interviews. The interviews revealed that participants treat their smartwatch as a passive device for viewing notifications, occasionally dabbling in short replies or predictive suggestions. Their frequent mistakes and discomfort, however, illustrate why text-entry features often go unused. Our findings converge on several themes, captured in an affinity diagram that highlights awkwardness with voice commands, the unnatural feel of small keyboards, and the participants' preference for brevity when typing on a watch. By consolidating these data, we uncovered opportunities to create straightforward, testable requirements for future smartwatch text-entry improvements.

= Related Work

Several alternative methods have been developed for smartwatch text entry, aiming to overcome the limitations imposed by small screen sizes and restricted input capabilities. Below, we summarize key approaches explored in previous research:

== Motion-Based Text Recognition @whiteboard
Researchers at ETH Zurich investigated a method where motion data was used to infer letters written on a whiteboard. Their algorithm achieved 99 percent accuracy within three guesses, with the first guess being correct more than 90 percent of the time. Additional disambiguation could be achieved through an audio recording, though this method performed optimally only in silent environments. The study also suggested that predictive modeling for the next letter could further improve accuracy by reducing false positives.

== WrisText: Wrist Gesture Typing @wristext
Another alternative, WrisText, enables text entry through wrist gestures. Letters are partitioned into groups around the screen, and an autocomplete function assists in predicting words as users flick their wrist to select a partition. After a few days of practice, users achieved typing speeds of 15 words per minute (WPM). While this method is particularly effective on round smartwatch screens, prolonged use could pose a risk of wrist strain, limiting its feasibility for extended text entry.

== Tap vs. Trace Input on QWERTY Keyboards @tapvstrace
A study examined text input performance on smartwatches using tap and trace (swipe) methods on a standard QWERTY keyboard. Participants, including both novices and experts in swipe input, demonstrated typing speeds comparable to or exceeding those reported for smartphones. Notably, tracing experts reached speeds of up to 37 WPM, suggesting that integrating trace input into QWERTY keyboards could be a viable and efficient approach for smartwatch text entry.

== AcousticType: Cross-Device Text Entry Using Acoustic Signals @acoustictype
Researchers developed AcousticType, a novel approach where a smartwatch leverages acoustic signals to infer text input from a physical keyboard @acoustictype. This method uses the smartwatch's built-in microphones to capture keystroke sounds, enabling cross-device text entry without requiring direct interaction with the smartwatch's screen. By circumventing the small screen size limitations, AcousticType presents an innovative alternative for smartwatch-based text entry.

== AirDraw: Motion Sensor-Based Text Input @airdraw
AirDraw utilizes smartwatch motion sensors to detect letters drawn in the air by the user. Machine learning models interpret motion data, allowing for text entry without relying on the smartwatch's touchscreen. Experimental evaluations demonstrated an accuracy rate of approximately 71 percent, indicating that motion-based text entry holds promise as a hands-free alternative for wearable devices.

= Establishing Focus: Initial Survey
To gain a better understanding of smartwatch usage and learn how users feel about entering text on them, we conducted multiple surveys. A pilot survey was drafted and tested on a limited number of people. After analyzing preliminary results and user feedback, we published a revised version of the survey.

== Method
The survey was designed to gather demographic information and insights on participants' experiences with text-entry on smartwatches. It included questions about their smartwatch usage, experiences with text-entry methods, and how these compared to using a smartphone for text-entry. The full survey is provided in Appendix B.

During the pilot phase, participants were instructed to think aloud while completing the survey. This was done to collect real-time feedback on the clarity of the questions and to understand how participants interpreted the survey items. Participants were not informed that this was the specific goal, ensuring natural responses. The responses from the pilot phase were used to refine and finalize the survey. The final published survey was distributed through Google Forms for wider participation.

== Tasks and Procedures
Each Think-Aloud session was fairly short - usually lasting around 10 minutes. Participants could end the session at any time if needed. In the published survey, a consent clause was placed at the beginning stating that all answers are completely voluntary.


=== Revisions to the Google Form
The pilot survey was designed to gather initial feedback on both the format and content of the questions. After conducting Think-Aloud sessions with a small group of participants, we refined the survey based on their comments. Participants in the pilot phase provided valuable insights regarding question clarity and the overall user experience, which led to several revisions:

*Question Format and Structure:*
We revised several questions to ensure they were more clear and concise. For instance, questions regarding text-entry comfort on smartwatches were reworded for clarity and provided more nuanced options to capture user experience better.

*Question Type Adjustments:*
Some questions in the pilot survey were closed-ended, but we added additional options or "Other" choices for certain items, allowing participants to provide more diverse responses. For example, the "text-entry method" question included categories like predictive text and gesture-based typing, but also allowed users to select "Other" to accommodate any alternative input methods they might use.

*Rating Scales:*
We carefully structured Likert scales to capture various levels of user comfort, speed, and preference. These scales (e.g., from "Very Uncomfortable" to "Very Comfortable" or "Much Slower" to "Much Faster") were designed to capture granular insights into participant experiences while avoiding ambiguous responses.

The finalized survey, however, was distributed via Google Forms, with a consent clause at the start stating that participation was voluntary and that no compensation would be provided.

== Participants

We selected 30 participants for the survey, aiming for a diverse group in terms of age, gender, and smartwatch usage experience. Participants were recruited through online platforms and word-of-mouth referrals to ensure a variety of perspectives. The sample size of 30 was chosen to provide meaningful insights while keeping the survey manageable and practical for analysis. We included both frequent and occasional smartwatch users to understand different experiences with text-entry on smartwatches.

=== Targeting Different Demographics
In order to ensure diverse representation, we aimed to gather responses from individuals across various age groups, genders, and levels of smartwatch usage. The demographic questions were structured to collect key information that could provide insights into how different groups perceive and use text-entry on smartwatches:

*Age Groups:*
The age ranges were specifically chosen to reflect common smartwatch usage demographics. This allowed us to analyze how user experience varied across different age groups (18–26, 27–35, etc.).

*Gender and Dominant Hand:*
The gender question offered a broader range of options to ensure inclusivity, including options for non-binary and "Other." Similarly, questions on dominant hand and the arm used for wearing a smartwatch were included to explore any potential patterns based on physical habits and user comfort.

*Smartwatch Usage:*
We specifically targeted participants who use smartwatches regularly, as the focus of the survey was on text-entry methods within this user group. The question about smartwatch usage habits (e.g., fitness tracking, receiving notifications) helped us understand what features were most commonly used and how text-entry fit into their daily routines.

=== Distribution and Modes of Sending the Survey
Once the final version of the survey was ready, we sought to maximize participant diversity by distributing the survey through a variety of channels:

*Online Platforms:*
Links to the Google Form were shared across various online platforms such as social media (e.g., Facebook, Twitter, Reddit) and student groups. This allowed us to reach a wider audience and engage participants from different backgrounds and demographics.

*Word of Mouth:*
To ensure the inclusion of more specific user groups, we encouraged participants to share the survey link with friends and family, reaching those who may not have been actively engaged online but still used smartwatches.

*Targeted Outreach:*
In addition to general distribution, we sent personalized invitations to individuals who were likely to have experience with smartwatches, such as members of fitness-related groups or technology enthusiasts, ensuring the survey reached individuals with varying levels of familiarity and usage.

== Results
Most respondents were between 18 and 26 years of age, with one participant in the 27-35 range and another in the 54-62 range. Among those who actually use a smartwatch, nearly everyone reported wearing it on the left arm.

For the rest of this discussion, we will focus on participants that did not select "I don't use a smartwatch" throughout the survey. Figure @fig:watch_usage shows that almost all participants were ``passive'' users of their smartwatch, with the most popular features used being the clock, fitness tracking (sleep, heart rate, etc.), and the hands-free notification viewing.

#figure(
  image("assets/charts/fig_4.png"),
  caption: "Main Smartwatch Features Used by Participants"
) <fig:watch_usage>

The dominant text entry method with smartphones was tapping the on-screen keyboard, with a few using primarily swipe typing, as seen in Figure @fig:SP_text_entry. 

#figure(
  image("assets/charts/fig_5.png"),
  caption: "Preferred Modes of Smartphone Text-Entry"
) <fig:SP_text_entry>

On smartwatches, the most prevalent method was also tapping each key, although by a small margin, as seen in Figure @fig:SW_text_entry. No typing method dominated on the smartwatch, but in almost all cases, respondents were uncomfortable with typing on it. This is reflected in the relative speed of text-entry question, where no participant said they could type faster on a smartwatch than a smartphone.

#figure(
  image("assets/charts/fig_6.png"),
  caption: "Preferred Modes of Smartwatch Text-Entry"
) <fig:SW_text_entry>

When asked about what issues arise with typing on a smartwatch, nearly 75% of respondents said that the small screen made it hard to type accurately. Notably, even respondents that don't typically use a smartwatch said this, suggesting that this factor dissuaded respondents from getting a smartwatch. The rest of the issues we listed had an even spread of responses, showing us that these problems are still relevant with today's smartwatches. These characteristics are shown in Figure @fig:issues.

#figure(
  image("assets/charts/fig_4.png"),
  caption: "Main Smartwatch Features Used by Participants"
) <fig:issues>

Overall, respondents wanted a better swipe or gesture based method of typing on a smartwatch and faster predictive features. The less taps required to convey a message, the better.

= Understanding Context of Use: Contextual Inquiry

Our main objective was to understand the wide range of real-world scenarios in which people try to enter text on a smartwatch, with a special focus on identifying the frequent obstacles that disrupt these attempts. We aimed to understand how people use ---and often avoid--- text-entry on their smartwatches in daily life by detecting consistent problem areas that hamper quick message composition, learning how participants adapt or abandon these features, and gathering context-specific details that could guide more reliable, compact typing solutions.

== Method
// What did the method entail?
We employed Contextual Inquiry interviews to observe participants' natural behaviors around smartwatch text-entry.
Each researcher interviewed one participant in the context-of-use where the participant typically uses their smartwatch for text entry tasks. The interview asked the participant to describe their typical workflow when performing text-entry tasks and used this information to ask more pointed questions.

We conducted a semi-structured interview where each interviewer was free to decide what follow-up questions to ask about the participants smartwatch usage. As the interview progressed, each interviewer noted down their interpretations. Each interviewer also recorded any confusion or inefficiencies that occurred when participants tried to compose text, whether by tapping, swiping, or using voice commands.
== Tasks and Procedures
// How was consent for participation sought and administered? What did the task entail? Were participants given any prior instructions? What were they? How long did the task take on an average? How did you go about ensuring quality control of tasks?
Like the pilot survey, participants were explained the purpose of the study and were told that participation was entirely voluntary and could be stopped at any time. Each interview started with the participant being asked to describe their smartwatch usage in the context of text-entry tasks. No tasks were assigned to any participant beyond attempting to use their smartwatch as they naturally would. We encouraged them to think aloud about any difficulties with typing or voice input. Interviews lasted about 20 minutes on average.

== Participants
// Please provide demographic information of participants: number of participants, by age, by gender, by disability if relevant for the study, by experience with task, location, any other criteria for recruitment, how they were recruited, were they given any incentives, mode of study conducted (virtual or in-person). How did you decide on the number of participants for your study?
// TODO: List demographic info of your participant here
// format: gender, age-range, virtual/in-person, experience using smartwatch, how recruited
- Male, 18-26, in,person, 2 years, friend (Ryan)
- Female, 18-26 (Efe)
- Male, 27-35, in-person, 1 year, friend (Hyungchan)
- Female, 18-26, in-person, 1 year, friend

== Results
// Please provide detailed summary of findings. Consult your consolidated affinity diagram to help craft the story.
We consolidated data by constructing sequence and flow diagrams that highlight each participant's interactions with text-entry. We also built an affinity diagram that revealed recurring themes across interviews, such as initial curiosity in typing features followed by a steep drop-off in daily use. Many participants felt uneasy speaking into their watch in public, especially if they perceived voice commands to be slow or inaccurate. Those who tried manual entry often gave up due to cramped keyboards, repeated mistakes, or the watch's awkward layout. Most participants ended up sending only short messages—like "OK," "Yes," or a numeric code—through their watch and reserved longer replies for their phone. Multiple participants saw the watch more as a passive display, suitable for reading but not writing.

The affinity diagram categorized comments into several groups. One group reflected that participants had explored text-entry at first but soon found it unhelpful, especially for multi-sentence conversations. Another group underscored the discomfort of using voice input in public or around coworkers, which stifled spontaneous verbal replies. A third cluster documented complaints about the watch interface feeling unnatural or too small for meaningful text composition. Users typically typed short or quick messages to avoid errors, then switched to their phone for anything substantial. Overall, mistakes were frequent, and participants considered text-entry on the watch to be unreliable. Nonetheless, these same users found the watch useful for passive tasks like dismissing notifications or glancing at messages.

= User Requirements and Functional Constraints
// Provide a comprehensive list of objective, testable requirements that are not implying solutions. Make sure you ground your user requirements in the context of use.

// below is a draft
Based on these themes, we identified objective, testable requirements that focus on text-entry without implying specific implementation solutions:

1. The watch must allow a user to preview and confirm any short auto-replies before sending, so accidental taps can be avoided.
2. The watch must provide a simple means for correcting mistakes that does not involve multiple steps or hidden menus, aiming to reduce frustration with typos.
3. The watch's text-entry interface must allow rapid one- or two-word messages to be composed without extensive scrolling or swiping, reflecting participants' focus on brevity.
4. The watch must offer a discreet input method for environments where speaking aloud is awkward, addressing participants' hesitance to rely on voice.
5. The watch must include improved feedback—such as haptic signals or slight zoom on letters—to help users detect and fix errors quickly on a small screen.
6. The watch must retain commonly typed phrases or words in its predictive dictionary, reflecting participants' desire for more relevant suggestions during short replies.
These requirements emerge directly from user comments about having no confirmation step on auto-replies, encountering excessive menu layers when fixing errors, or feeling uneasy with voice commands in professional settings.

Our aggregated findings deepen the perspective gained from our previous survey by illustrating the granular breakdowns people face when typing on a tiny watch interface. Participants across different ages and backgrounds echoed the view that the watch is best suited for quick glances or short messages, with complex text tasks delegated to a phone. This pattern matches our earlier hypothesis that small screens alone do not explain why text-entry is so marginal; rather, usability gaps—like a lack of quick edit options or a reliable predictive engine—exacerbate the difficulty.

We now see a narrower focus forming around features that support short, context-specific messages in a more controlled manner. The emphasis on confirmations, immediate error correction, and discreet input suggests an urgent need to refine the watch's interplay between auto-suggestions and manual editing. We plan to concentrate on prototyping a streamlined text-entry interface that meets these requirements, potentially reducing the friction that drives participants to switch devices for minor replies.

In conclusion, while users appreciate the convenience of viewing messages on a smartwatch, they seldom compose anything more than quick confirmations due to the watch's cramped interface, limited error correction, and uneasy voice controls in public. Building on the new Contextual Inquiry data, we will develop low-fidelity prototypes aimed at facilitating short text replies and minimal error rates. Our next steps involve testing these prototypes in scenarios similar to those described by our participants, measuring improvements in typing speed, error frequency, and user confidence. This direction should ultimately help smartwatch owners feel more at ease sending messages from their wrists instead of reaching for a phone whenever they need to reply.

= Initial Design and Low Fidelity Prototypes

== Personas

== Sketches

== Storyboards

== Paper Prototype

= Usability Evaluation

== Heuristic Evaluation

=== Method
// What did the method entail?

=== Tasks and Procedures
// What did the task entail?
// Were participants given any prior instructions?
// What were they?
// How long did the task take on average?
// How did you go about ensuring quality control of tasks?

=== Participants
// Please provide demographic information of participants: number of participants, by age, by gender, by disability if relevant for the study, by experience with task, location, any other criteria for recruitment, how they were recruited, were they given any incentives, mode of study conducted (virtual or in-person)
// How was consent for participation sought and administered?
// How did you decide on the number of participants for your study?

=== Results
// Report the results of heuristic evaluation here.

== Simplified User Testing

=== Method
// What did the method entail?

=== Tasks and Procedures
// What did the task entail?
// Were participants given any prior instructions?
// What were they?
// How long did the task take on average?
// How did you go about ensuring quality control of tasks?

=== Participants
// Please provide demographic information of participants: number of participants, by age, by gender, by disability if relevant for the study, by experience with task, location, any other criteria for recruitment, how they were recruited, were they given any incentives, mode of study conducted (virtual or in-person)
// How was consent for participation sought and administered?
// How did you decide on the number of participants for your study?

=== Results
// Report the results of simplified user testing here.

= Final Design and Functional High-Fidelity Prototype

= User Evaluation
// Use the knowledge from the lectures and previous evaluations to populate this section and its subsections.

== Method

== Apparatus

== Tasks and Procedures

== Participants

== Results

= Discussion
// You will keep updating this section after each assignment. After each assignment you will add discussion about what the results mean for your research.
The survey results show that text entry is not a priority for smartwatch users. The small screen size is the limiting factor in making text entry viable. Even though users may be comfortable typing on a smartphone, that skill cannot directly translate to a screen many times smaller.
The most frequent requests to improve text entry involved minimizing the number of keystrokes required to type a message. Predictive text and autocorrect could significantly speed up typing speeds by allowing less precise inputs to still be interpreted correctly.
Due to the small screen users, the survey also indicates that users might want to see a reduction in the number of interaction required to complete the same tasks on a smartwatch. This highlights an usability challenge: while smartwatches offer convenience and accessibility, their small screen size and limited input methods often lead to cumbersome navigation and excessive touch interactions. 


= Conclusion and Future Work
// What is the takeaway of this project? Were there any parts of the project that you did not include in the scope of this project? Here is where you will discuss how the current assignment will inform the rest of your project. For example, in Assignment 1, how will the results of your survey influence the future steps in understanding context of use? Feel free to use your creativity to suggest new research directions, designs---but these suggestions must be supported by the findings of your study
This study set out to clarify how people enter text on smartwatches and to identify factors that discourage more frequent or extensive usage. Through iterative survey design, we found that participants generally turn to smartwatches for quick interactions—such as reading notifications or monitoring fitness activity—while relying on smartphones for most typing. Although some participants appreciate the convenience of entering short messages on a watch, most remain dissatisfied with current text-input accuracy, speed, and clarity.  

We have demonstrated that more work needs to be done to make text-entry viable on a smartwatch. In particular, the interface we design needs to have sufficiently large interactive objects to reduce input error and have predictive features to speed up entry. Our next steps are to explore how predictive typing features can be better integrated into smartwatches. For example, a tap-based version of the related work by the WrisText \cite{wristext} team could allow users to type characters without needing pinpoint precision. For future work, we plan to develop and test interactive text-entry designs that may ease the barrier of entry for user-smartwatch interactions. Thus, encouraging more frequent use and increased reliance on smartwatches.

= Acknowledgements
#text(fill: red, [Here, you will acknowledge any individuals or organizations that are not part of your group, but that have contributed to your work.])


#bibliography("test.bib", style: "../acmcitation.csl")

#appendix[
  #show grid: set block(below: 0.25in)
  = Responsible Research: Human Subjects Research Protections
  To ensure our study conforms with safe human subjects research, all researchers earned the PEERRS Human Subjects Research Protections certificate.

  #{
    let certs = (
      "ea": "Efe Akinci",
      "rc": "Ryan Chua",
      "hc": "Hyungchan Cho",
      "ks": "Kevin Sun",
      "osj": "Oskar Shiomi Jensen",
      "ni": "Nivedhitha Purushotham"
    )

    set figure(placement: none)
    subpar.grid(
      columns: (1fr, 1fr),
      column-gutter: 0.25in,
      ..certs.pairs().map((p) => {
        let id = p.at(0)
        let name = p.at(1)
        
        figure(
          image("assets/peers/PEERRS_" + id + ".png", width: 100%),
          caption: [PEERRS Certificate of #name]
        )
      }),
      caption: "PEERRS Certifications of All Team Members"
    )
  }

  = Survey and Questionnaire Instruments
  == Initial Survey Design
  #include "assets/survey/survey.typ"

  == Final Survey Design

  #include "assets/survey/survey-revised.typ"

  == Anonymized and De-identified Questionnaire Data
    
  #grid(
      columns: (1fr, 1fr),
      column-gutter: 0.25in,
      row-gutter: 0.25in,
      ..range(0, 16).map(i => image("assets/charts/fig_" + str(i) + ".png"))
  )

  Additionally, anonymized individual responses are provided below.

  #let output = csv("assets/survey/survey_responses.csv")
  #for (i, row) in output.enumerate() {
    set par(first-line-indent: 0pt)
    block(above: 1em, breakable: false)[
      *User #(i+1)*
      
      #for (ii, answer) in row.enumerate() [
        (#(ii+1)) #answer
        
      ]
    ]
  }

  = Contextual Inquiry
  // Assignment 2 stuff goes here

  == Individual Interpretations
  - U01-01: Their parents were texting them questions about graduation plans.
  - U01-02: Since their phone was locked, they read the notification from their watch.
  - U01-03: They used the smartwatch's suggested replies to answer "yes" or "no" questions.
  - U01-04: Once they pressed the wrong suggested reply on their smartwatch during the conversation, so they would need to get their phone and correct their message, which added stress due to both the frustration of selecting the wrong reply and the need to quickly that mistake.
  - U01-05: They wished they could confirm their selected suggested reply, even if it would mean an extra tap.
  - U01-06: They would use their phone to type and send more complex responses but would put it down shortly and continue their work.
  - U01-07: It was easier to switch to reading longer messages on their phone than scrolling on their watch.
  - U01-08: Short multi-factor codes were easily typed with the watch's numeric keypad.
  - U02-01: She uses her smartwatch mostly for passive tasks like notifications, but occasionally for interactive tasks like setting timers.
  - U02-02: She likes to use the smartwatch to keep track of things, since she can't always look at her phone.
  - U02-03: She likes to use her watch interactively when exercising.
  - U02-04: She liked using her watch more when she first got it, but now feels that it is more of a novelty.
  - U02-05: She has tried to use her watch for text entry, but she doesn't find it particularly useful.
  - U02-06: Her watch screen is broken, which makes text entry more frustrating due to an occasionally unresponsive screen.
  - U02-07: She finds many functions on the watch unnecessary, such as the flashlight feature.
  - U02-08: She finds the small screen makes it difficult to read entire messages and proofread effectively.
  - U02-09: She prefers not to write anything important or serious on the watch.
  - U02-10: She finds handwriting recognition on the watch to be poor, and entering one letter at a time is too slow.
  - U02-11: She mainly uses handwriting for text entry but finds it inefficient.
  - U02-12: She would use text entry more if the watch were faster.
  - U03-01: The participant frequently uses their smartwatch for fitness tracking and receiving notifications, rather than entering text.
  - U03-02: The participant doesn't feel like text-entry is an important feature for the smartwatch. They see smartwatch as a tool for consuming information rather than interaction.
  - U03-03: The participant only sends messages for quick replies and waits to use their phone for more intensive replies.
  - U03-03: The participant avoids replying to messages on the smartwatch and waits to use their phone instead.
  - U03-04: The smartwatch text-entry experience is too slow or inconvenient, making them prefer a larger device.
  - U03-05: The participant says the screen is too small to type on.
  - U03-06: The participant thinks the smartwatch screen is a physical limitation for text entry, possibly due to difficulty in precision, visibility, and comfort.
  - U03-07: The participant sends messages using the voice-to-text method.
  - U03-08: The participant feels that clicking to type is too inaccurate or slow and would rather trust the voice-to-text method even though they don't have complete control over how to type.
  - U03-10: The participant does not trust any text-entry methods to accurately convey longer replies or they believe it is too inconvenient to read over longer responses to check if they are correct.
  - U04-01: The participant primarily uses her smartwatch for passive functions like checking the time and counting calories.
  - U04-02: Text-entry on the smartwatch is typically reserved for quick replies to received messages, with longer responses directed to her phone.
  - U04-03: The small screen of the smartwatch makes typing lengthy messages cumbersome and prone to errors.
  - U04-04: When alone or without her phone, the she prefers using voice typing for convenience.
  - U04-05: In social settings, she opts for the handwriting feature to avoid speaking aloud, though it still presents challenges.
  - U04-06: Reading messages on the smartwatch poses no length limitations, but composing replies feels inconvenient due to the interface.
  - U04-07: Frequent typos during text-entry are a significant frustration, leading to a slower messaging process.
  - U04-08: While she occasionally uses typing suggestions, they are infrequently relied upon and lack accuracy for her needs.
  - U04-09: She finds erasing mistakes on the smartwatch more cumbersome than on her phone.
  - U04-10: Long nails hinder her ability to type effectively on the small screen.
  - U04-11: She uses the “react” feature for quick responses but finds it less convenient overall.
  - U04-12: She believes that improvements in typo prediction and input efficiency would enhance the smartwatch text-entry experience.
  - U05-01: The participant uses the watch mostly for passive tasks like checking notifications, finding it convenient when their phone is stored away.
  - U05-02: The participant speaks Mandarin in daily life, but the watch only supports English input, so he avoids typing anything more than a few words.
  - U05-03: The participant feels self-conscious using voice input in public, especially on a noisy bus, so he rarely speaks commands aloud.
  - U05-04: The participant used to explore more of the watch's features when he first bought it, but now sees it mainly as a way to quickly view or dismiss messages.
  - U05-05: The participant does not rely on the watch for important conversations, since the screen is too small for detailed typing and the English-only interface does not fit their language needs.
  - U05-06: The participant has considered handwriting or gesture-based input on the watch, but finds it slow and imprecise.
  - U05-07: The participant finds typing short numeric codes or tapping "Yes" and "No" easier than writing out longer replies, which often leads to errors.
  - U05-08: The participant wishes the watch offered at least partial pinyin-based input, since switching to English feels unnatural for personal messages.
  - U05-09: The participant dismisses non-urgent notifications on the watch to avoid repeatedly taking out their phone, appreciating the discreet vibration alerts.
  - U05-10: The participant would use the watch for more text-based interactions if it allowed Mandarin entry or at least offered better predictive options for bilingual speakers.
  - U06-01: While preparing cake batter, she received a notification from a customer asking for the delivery time.
  - U06-02: With food stains on her hands, she found it nearly impossible to swipe or type on the smartwatch. This left her feeling frustrated, as she was unable to respond quickly and had to grab her phone.
  - U06-03 As she was frosting a cake, she received a call from a customer and answered it on the smartwatch.
  - U06-04: The convenience of the hands-free calling feature allowed her to continue frosting the cake without having to touch her phone. She seemed relieved, but there was a sense of unease about her smartwatch handling calls consistently.
  - U06-05: Getting ready for a family function, she attempted to reply to an urgent message, but her artificial nails made it difficult.
  - U06-06: The smartwatch's gesture controls were too sensitive and difficult to manage with long nails. After several failed attempts, she felt frustrated and chose to grab her phone to respond.
  - U06-07: While outdoors, she tried to check a message, but the bright sunlight made the screen unreadable.
  - U06-08: She squinted to read the text, but the low brightness of the screen made it nearly impossible to interact with. This led to irritation, as she had to wait until she was in the shade to check her messages.
  - U06-09: She received multiple notifications from family and friends while cooking, but she didn't want to engage.
  - U06-10: The constant interruptions from the smartwatch made her feel overwhelmed, and the lack of quick ways to dismiss or filter notifications left her frustrated. She wished the watch would allow easier management of personal vs. professional notifications.
  - U06-11: Her kids played with her smartwatch while charging, which resulted in a cracked screen.
  - U06-12: The cracked screen made it difficult to see and interact with the smartwatch. She was visibly annoyed, as it had impacted her daily use, and she struggled to find a repair option, which added stress to her routine.
  - U06-13: She was attempting to reply to her husband saying “yes” to indicate she can pick up the kids, but the cracked screen and sweat made it difficult.
  - U06-14: The cracked and unresponsive screen, combined with sweat on her hands, made it extremely difficult for her to tap the right reply. She felt frustration and a sense of helplessness as she couldn't use the smartwatch to quickly respond, forcing her to grab her phone.
  - U06-15: While outside running errands, she tried to use the smartwatch, but the screen was hard to read under the sun.The difficulty in viewing the smartwatch screen outside, coupled with the sweat on her hands, made her feel frustrated. The limited visibility forced her to check her phone instead, leading to a sense of disappointment about the smartwatch's outdoor usability.
  - U06-16: She set a reminder on the smartwatch for a customer delivery but missed the alert because the watch didn't vibrate strongly enough.
  - U06-17: The missed reminder caused some stress and last-minute scrambling, as she had to rely on her phone instead. She seemed annoyed that the haptic feedback wasn't strong enough to alert her in a busy environment.

  == Individual Sequence Diagrams
  == Individual Flow Diagrams
  == Consolidated Sequence Diagrams
  == Consolidated Flow Diagrams
  = Low Fidelity Prototypes
  == Individual Personas
  == Individual Sketches
  == Individual Storyboards
  == Final Personas
  == Final Sketches
  == Final Storyboards
  == Final Paper Prototype
  = Usability Evaluation
  == Individual Heuristic Evaluation Notes
  == Individual Simplified User Study Notes
  = User Evaluation
  == Apparatus Screenshots
  == Anonymized and De-identified Participants Data

]