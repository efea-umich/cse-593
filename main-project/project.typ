#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
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
  authors: authors,
  draft: false // hides "unnecessary" content during editing
)

#make_title("Clockworks", authors, "University of Michigan, USA", concepts, keywords)[
// Does abstract properly summarizes whole assignment using the promise, obstacles, solution, and takeaways format in NO more than 150 words.
Smartwatches are increasingly common for communication and health tracking, yet small screens deter many users from typing messages on these devices. Our project promises to address this shortfall by gathering detailed insights on when, how, and why people attempt text entry on their watches. A key obstacle lies in the mismatch between tiny touch interfaces and users' language or comfort needs, which exacerbates errors and slows interactions. To investigate, we administered think-aloud sessions, surveys, and Contextual Inquiry interviews. We consolidated findings from these interviews of six participants who revealed frustrations with limited keyboards, uncertain predictive text, and distractions. Our consolidated results pave the way for users to spend less time correcting errors by overcoming small-screen constraints. After establishing user requirements, we created several sketches to generate ideas for our prototype. We finalized a paper prototype that offers quick, pre-generated responses and an accurate, enlarged-hitbox keyboard that now awaits user testing.
]

= Introduction
// Does introduction provides proper extended summary of the assignment (and everything that you have done to this point) using the promise, obstacles, solution, and takeaways format with proper citations where necessary. Note that this is a longer summary than the abstract. There is no word limit.
Smartwatches, such as the Apple Watch and Samsung Galaxy Watch, have grown in popularity over the past decade, with millions of units sold annually @rogerson_2021. As these devices continue to evolve, they are increasingly being integrated into everyday life for health tracking, communication, and productivity. However, despite their advanced capabilities, text entry remains a major usability challenge due to the limited screen size and lack of physical keys, making traditional QWERTY-style typing inefficient compared to text-input tasks on phones @turner2021typing@palin_feit_kim_kristensson_oulasvirta_2019.

Despite attempts to address these constraints through swiping, handwriting, or other alternative input methods @shibata2016driftboard @oney2013zoomboard @tapvstrace, research consistently shows that smartwatch owners prefer using their phones for any lengthy or complex text input @schirra2015s @pizza2016smartwatch. This avoidance points to a broader usability issue where the "fat finger" problem @siek2005fat and the awkwardness of typing on such a small interface lead to frustration, discomfort, and low adoption of advanced text-entry features @turner2021typing. In practice, many users confine their watch interactions to passively reading notifications and occasionally sending very short responses or emojis @pandey2021acceptability.

In light of these persistent challenges, our project centers on gathering detailed information about how people use and experience text entry on smartwatches. We build on previous comparative studies of smartwatch input techniques@turner2021typing @chen2014swipeboard @shibata2016driftboard, while focusing on real-world usage contexts. To that end, we conducted a pilot survey with six participants and a revised survey with thirty responses that hinted at widespread dissatisfaction with smartwatch text-entry but did not explore specific causes. We set out to examine those causes through Contextual Inquiry interviews, consolidating data from six participants with varying backgrounds and usage patterns.

Our promise is to identify practical ways of enabling quick, less error-prone text entry on watches. Based on our findings from our survey, the main obstacle arises from the small screens and input constraints that undermine users' comfort and confidence in sending messages. These obstacles constrain smartwatch owners to only the most minimal forms of text-based communication. We hypothesize that smartwatch text-entry can support more tasks if designs address short-message needs and reduce the friction associated with typing on a tiny screen.

We refined our approach by combining a revised survey with real-time interviews. Our survey focused on gathering smartwatch usage data to understand in which contexts users prefer to use their smartwatches in different ways. We explored how participants managed or avoided the constraints mentioned above, observing the decisions they made about when to use the smartwatch's keyboard or voice input, as well as their reasons for switching to a phone. The interviews revealed that participants treat their smartwatches as passive devices for viewing notifications, occasionally dabbling in short replies or predictive suggestions. Their frequent mistakes and discomfort, however, illustrate why text-entry features often go unused. Our findings converge on several themes, captured in an affinity diagram that highlights awkwardness with voice commands, the unnatural feel of small keyboards, and the participants' preference for brevity when typing on a watch. 

By consolidating these data, we uncovered opportunities to create straightforward, testable requirements for future smartwatch text-entry improvements. We identified key themes of awkwardness in text entry, users' reluctance to experiment with new input modes, and an urgent need for simpler designs that better match their on-the-go contexts. In synthesizing results from our thirty-person survey, six contextual inquiries, consolidated diagrams, and the affinity diagram, we reveal how smartwatch text entry can be reimagined around users' desire for quick, low-effort actions.

We have designed several low-fidelity prototypes to find the best way to satisfy our user requirements. Our designs found novel ways to input text faster, reduce mistakes, and remove the need for direct contact with the smartwatch. These include dynamic hitboxes, a separate edit interface, a quick typo-correction interface, hands-free gesture typing with a camera, LLM integration, and a near full redesign of the traditional smartwatch texting experience.

Our designs increased typing efficiency by making varied use of suggested words. For instance, the dyanmic hitboxes change the underlying keyboard's tap map to make likely subsequent letters easier to press, and quick correction offers many suggestions to typo so the user doesn't have to retype a word. However, our designs had important considerations to address. Many of our designs relied on swipe type, a feature that's hard to use on smaller smartwatches, or external buttons, which may not exist on all smartwatches. Some designs also only allowed per-word editing instead of per-character, which can be excessive for tiny mistakes.

Building upon the most effective elements of these designs, our final prototype combines the contextually generated responses with the Dynamic Key Hitboxes approach. This interface prioritizes suggested responses for quick interaction while allowing for the user to type custom messages with enhanced accuracy. Suggested responses appear first, minimizing typing effort, and a confirmation step prevents accidental selections. When custom input is necessary, the dynamic key hitbox keyboard reduces errors by intelligently adjusting key sizes based on predicted letter sequences.

Our next step is evaluate our final prototype through user testing and provide a rough implementation in a high-fidelity prototype. This evaluation will ensure that the design effectively addresses the core challenges and user requirements of smartwatch text entry while enhancing user experience. 

= Related Work

Previous work has demonstrated creative solutions and exposed the many difficulties of smartwatch text entry. They have evaluated existing text-input techniques, expanded understandings of user behaviors and preferences toward text-entry features, and identified usability challenges on small screens. At the same time, several alternative methods have been developed for smartwatch text entry, aiming to overcome the limitations imposed by small screen sizes and restricted input capabilities. Below, we summarize key approaches explored in previous research:

== Evaluations of Existing Text-Input Techniques
Many text-entry methods for smartwatches have been proposed, and researchers have conducted numerous comparative evaluations. These studies typically measure text entry speed (words per minute), accuracy (error rates), and user satisfaction or effort for different input techniques.

We observe two important trends from the below works that will guide our design. First, "bulk" operations (e.g. swipe type) where one gesture or tap could convey a short message greatly improved speed. Unlike the traditional keyboard, only one or two fingers can interact with a smartwatch's keyboard at a time, greatly limiting throughput. Second, operations that utilize most, if not all, of the screen were preferred over tiny buttons. This allows for accurate typing within a certain margin of error. For instance, with swipe type, the user doesn't need to cover all the exact letters in order to get a desired word. Similarly, the DriftBoard @shibata2016driftboard, turned a majority of the smartwatch screen into an interactive trackpad.

Overall, input methods that were more "forgiving" resulted in better typing performances. However, it was much harder to find research for one-tap auto-complete/suggested text features. While the systems described in Section 2.2 integrated predictive features, none have evaluated the usability of native suggested replies.

=== Tapping vs. Swiping vs. Handwriting @turner2021typing 
A recent controlled experiment had users enter phrases on smartwatches with three input styles ---tapping on a tiny QWERTY keyboard, swiping (trace input) on the same keyboard, and handwriting characters--- under both standing and walking conditions. The swipe method was the fastest by a large margin: about 30 WPM (words per minute) on average, compared to 20 WPM for tapping and 18 WPM for handwriting. Swiping also led to higher text entry satisfaction and lower perceived workload, even while walking, making it the top performer overall. This suggests that allowing users to draw through letters (like shape-writing, e.g. Swype-style input) can significantly improve performance on small screens, likely because it reduces the precision required for each letter tap. The handwriting method was slowest and least liked in that study, indicating that drawing each letter one by one on a watch (with current recognition technology) may not be efficient.

=== Comparing Novel Keyboards @oney2013zoomboard @shibata2016driftboard @chen2014swipeboard
Shibata et al. evaluated their DriftBoard (cursor-based panning keyboard) against two earlier solutions (ZoomBoard and SwipeBoard). They found DriftBoard achieved roughly the same speed and error rate as ZoomBoard (around 9–10 WPM with 5–6% error) and significantly outperformed SwipeBoard in speed. This was an encouraging result, showing that a panning strategy could match the best existing method.

=== Tap vs. Trace Input on QWERTY Keyboards @tapvstrace
A study examined text input performance on smartwatches using tap and trace (swipe) methods on a standard QWERTY keyboard. Participants, including both novices and experts in swipe input, demonstrated typing speeds comparable to or exceeding those reported for smartphones. Notably, tracing experts reached speeds of up to 37 WPM, suggesting that integrating trace input into QWERTY keyboards could be a viable and efficient approach for smartwatch text entry.

=== User Feedback in Evaluations @turner2021typing
Comparative studies provide insight into which method felt easier or more burdensome to participants by collecting subjective questionnaire feedback. Commonly, a method with the fastest speed isn’t always the most preferred if it is stressful to use. In this study, methods that align with familiar typing experiences (QWERTY layouts or using intuitive gestures) score better on user preference. For example, participants in one study strongly favored whichever method allowed larger "target" areas – swiping through large keys or using a larger touch surface – because it felt less frustrating than pecking tiny keys. Overall, this kind of evaluation shows that while numerous input techniques can work, their performance varies widely.

== Alternative Input Methods for Text Entry
Researchers have explored many non-traditional input techniques to overcome the limitations of tiny smartwatch screens. These include motion-based methods, sensor-based methods, and voice input. These systems prove that new methods for smartwatch text entry can be learned and mastered, but they have dependencies (e.g. quiet environment, high arm dexterity) that prevent them from being universally viable.

These findings help us understand how alternative input methods are used and the shortcomings of each with respect to usability. This helps us better understand the context of use for text entry methods when designing different artifacts for the problem at hand.

=== Motion-Based Text Recognition @whiteboard
Researchers at ETH Zurich investigated a method where motion data was used to infer letters written on a whiteboard. Their algorithm achieved 99 percent accuracy within three guesses, with the first guess being correct more than 90 percent of the time. Additional disambiguation could be achieved through an audio recording, though this method is performed optimally only in silent environments. The study also suggested that predictive modeling for the next letter could further improve accuracy by reducing false positives.

=== WrisText: Wrist Gesture Typing @wristext
Another alternative, WrisText, enables text entry through wrist gestures. Letters are partitioned into groups around the screen, and an autocomplete function assists in predicting words as users flick their wrist to select a partition. After a few days of practice, users achieved typing speeds of 15 words per minute (WPM). While this method is particularly effective on round smartwatch screens, prolonged use could pose a risk of wrist strain, limiting its feasibility for extended text entry.

=== AcousticType: Cross-Device Text Entry Using Acoustic Signals @acoustictype
Researchers developed AcousticType, a novel approach where a smartwatch leverages acoustic signals to infer text input from a physical keyboard. This method uses the smartwatch's built-in microphones to capture keystroke sounds, enabling cross-device text entry without requiring direct interaction with the smartwatch's screen. By circumventing the small screen size limitations, AcousticType presents an innovative alternative for smartwatch-based text entry.

=== AirDraw: Motion Sensor-Based Text Input @airdraw
AirDraw utilizes smartwatch motion sensors to detect letters drawn in the air by the user. Machine learning models interpret motion data, allowing for text entry without relying on the smartwatch's touchscreen. Experimental evaluations demonstrated an accuracy rate of approximately 71 percent, indicating that motion-based text entry holds promise as a hands-free alternative for wearable devices.

== Usability Challenges on Small Screens
Even though alternative input methods exist, text entry on a smartwatch is inherently difficult due to hardware constraints and human factors. 

Studying related works on hardware constraints helps us understand the fundamental constraints of smartwatch interfaces and why traditional input methods struggle in this context. By identifying key pain points—such as the fat-finger problem and accuracy trade-offs—we can better evaluate existing solutions and their limitations. The key usability challenges on small screens are identified in the prior work below.

=== Fat-Finger Problem @siek2005fat
The most cited issue is the "fat finger" problem – the watch's touchscreen is so small that finger touch points cover multiple UI targets, making precise selection of tiny keys very hard. Hitting the intended letter on a QWERTY layout becomes error-prone when buttons are only a few millimeters wide. The authors noted that this often forces designs to use multiple steps (zooming in, mode switches, etc.) to accommodate finger size, at the cost of speed.

=== Accuracy and Error Rates @yi2017compass
Because of tiny targets and limited feedback, error rates tend to be high with naive approaches. Users can easily tap wrong letters or trigger the wrong gesture. Even with clever designs, maintaining accuracy is difficult – many solutions report a trade-off between speed and accuracy. For example, one study notes that optimizing a keyboard’s layout for faster input increased cognitive load and led to more errors for users unfamiliar with it. Ensuring users can input text reliably (low error rate) on a watch remains an obstacle.

== User Behavior and Preferences
To improve the watch text-entry design feature, understanding when and how people actually use text input on smartwatches is crucial. A number of studies have examined user behavior, revealing that smartwatch owners often avoid heavy text entry on the watch if possible:

=== Preference for Phones for Lengthy Input @schirra2015s
Qualitative studies (e.g. interviews by Schirra and Bentley) found that users see the smartwatch as a convenient extension for notifications and quick replies, rather than a primary device for composing messages. Their interview results report that users largely use watches to triage incoming messages and may send a short acknowledgment or emoji, but they turn to their smartphone for any longer or complicated text input. Participants described the watch as "kind of like an extra screen for my phone" – useful for viewing info at a glance, but not suited to extensive interaction or typing tasks. This suggests that the limitations of current smartwatch input lead users to defer typing to the phone whenever feasible.

=== Situations for Watch Text Input @pandey2021acceptability
In this study, the authors find that users perceive silent speech as more socially acceptable than speech input and are willing to tolerate more errors with it to uphold privacy and security. Many modern smartwatches offer canned responses or voice input as the default reply method. Privacy and environment strongly influence this choice – in public or noisy settings, speaking to your watch can be awkward, so users either struggle through typing a short reply or wait until they can use their phone.

=== User Preferences @turner2021typing
The authors of this work show that users have shown clear preferences when given alternatives. For example, a study of college-aged users comparing input methods (keyboard tapping, trace swiping, and handwriting) found that participants overwhelmingly preferred the trace (swipe) method due to its speed and ease. They find that users gravitate toward methods that minimize physical effort and error, even if it means learning a slight variation. However, they also find that preferences can vary: some users who value tactile feedback might still favor tapping if the keys are well-designed or if they don't trust handwriting/gesture recognition. This leads to the conclusion that users will choose the least bad option based on the context.

== Survey and Field Studies on Smartwatch Text Entry

=== Qualitative User Studies @schirra2015s
As explained above in Section 2.4.1, the authors conducted interviews to understand how consumers were actually using these devices. They find that participants felt inconvenient that typing on such a small screen is a major factor for not doing more with it. Another research @pizza2016smartwatch studied smartwatch use "in vivo" and observed that people rarely initiated complex tasks like emailing or lengthy texting on the watch. These qualitative findings confirm that user behavior gravitates away from intensive text entry on the watch, aligning with what the performance constraints would predict.

=== Usage Data and Surveys @visuri2017quantifying
The authors of this study conducted a large-scale analysis that logged usage from hundreds of smartwatch users to quantify how smartwatches are used. They noted that active input (typing or voice) was a relatively infrequent portion of smartwatch interactions compared to passive ones (checking time and notifications).

== Gaps and Obstacles in Prior Work
Despite the extensive research into smartwatch text entry, there remain clear gaps and challenges that our research can address. As @schirra2015s noted, much of the literature was technical and lab-focused, with little study of why or how real users adopt smartwatch input in their daily lives. By conducting surveys and contextual inquiry interviews to refine user requirements for smartwatch text entry, this research can develop a method that users would stick with.

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
We revised several questions to ensure they were clearer and concise. For instance, questions regarding text-entry comfort on smartwatches were reworded for clarity and provided more nuanced options to capture user experience better.

*Question Type Adjustments:*
Some questions in the pilot survey were closed-ended, but we added additional options or "Other" choices for certain items, allowing participants to provide more diverse responses. For example, the "text-entry method" question included categories like predictive text and gesture-based typing, but also allowed users to select "Other" to accommodate any alternative input methods they might use.

*Rating Scales:*
We carefully structured Likert scales to capture various levels of user comfort, speed, and preference. These scales (e.g., from "Very Uncomfortable" to "Very Comfortable" or "Much Slower" to "Much Faster") were designed to capture granular insights into participant experiences while avoiding ambiguous responses.

The finalized survey was distributed via Google Forms, with a consent clause at the start stating that participation was voluntary and that no compensation would be provided. The survey starts with demographic information, and then asks the respondent about how they typically use their smartphone and smartwatch. Respondents also compared how comfortable they felt with using their smartwatch and their smartphone for performing typical tasks (e.g., responding to messages) and entering text. Finally, respondents shared issues they had with entering text on their smartwatch, along with suggestions for what they think would improve the process.

== Participants
Six participants were chosen for the pilot survey. Most were 18-26, with one being 27-35 and one being 45-53. Four of the participants were male, and two were female.

We gathered 30 participants for the main survey, aiming for a diverse group in terms of age, gender, and smartwatch usage experience. Participants were recruited through online platforms and word-of-mouth referrals to ensure a variety of perspectives. The sample size of 30 was chosen to provide meaningful insights while keeping the survey manageable and practical for analysis. We included both frequent and occasional smartwatch users to understand different experiences with text-entry on smartwatches. The below sections focus on the finalized survey.

=== Targeting Different Demographics
In order to ensure diverse representation, we aimed to gather responses from individuals across various age groups, genders, and levels of smartwatch usage. The demographic questions were structured to collect key information that could provide insights into how different groups perceive and use text-entry on smartwatches:

*Age Groups:*
The age ranges were specifically chosen to reflect common smartwatch usage demographics. This allowed us to analyze how user experience varied across different age groups (18–26, 27–35, etc.).

*Gender and Dominant Hand:*
The gender question offered a broader range of options to ensure inclusivity, including options for non-binary and "Other." Similarly, questions on dominant hand and the arm used for wearing a smartwatch were included to explore any potential patterns based on physical habits and user comfort.

*Smartwatch Usage:*
We targeted user populations that would be more likely to use a smartwatch, such as students, as the focus of the survey was on text-entry methods within this user group. The question about smartwatch usage habits (e.g., fitness tracking, receiving notifications) helped us understand what features were most commonly used and how text-entry fit into their daily routines.

=== Distribution and Modes of Sending the Survey
Once the final version of the survey was ready, we sought to maximize participant diversity by distributing the survey through a variety of channels:

*Online Platforms:*
Links to the Google Form were shared across various online platforms such as social media (e.g., Facebook, Twitter, Reddit) and student groups. This allowed us to reach a wider audience and engage participants from different backgrounds and demographics.

*Word of Mouth:*
To ensure the inclusion of more specific user groups, we encouraged participants to share the survey link with friends and family, reaching those who may not have been actively engaged online but still used smartwatches.

*Targeted Outreach:*
In addition to general distribution, we sent personalized invitations to individuals who were likely to have experience with smartwatches, such as members of fitness-related groups or technology enthusiasts, ensuring the survey reached individuals with varying levels of familiarity and usage.

== Results
Most respondents were between 18 and 26 years of age, with one participant in the 27-35 range and another in the 54-62 range. Among those who actually use a smartwatch, nearly everyone reported wearing it on the left arm. Since the survey was distributed to open platforms, we couldn't guarantee that all participants used a smartwatch. We hoped that insights can be gathered from those that do not use a smartwatch, such as why they did not get one, but only a few of of those respondents provided extra information.

For the rest of this discussion, we will focus on participants that did not select "I don't use a smartwatch" throughout the survey. @fig:watch_usage shows that almost all participants were ``passive'' users of their smartwatch, with the most popular features used being the clock, fitness tracking (sleep, heart rate, etc.), and the hands-free notification viewing.

#figure(
  image("assets/charts/fig_4.png"),
  caption: "Main Smartwatch Features Used by Participants"
) <fig:watch_usage>

The dominant text entry method with smartphones was tapping the on-screen keyboard, with a few using primarily swipe typing, as seen in @fig:SP_text_entry. 

#figure(
  image("assets/charts/fig_5.png"),
  caption: "Preferred Modes of Smartphone Text-Entry"
) <fig:SP_text_entry>

On smartwatches, the most prevalent method was also tapping each key, although by a small margin, as seen in @fig:SW_text_entry. No typing method dominated on the smartwatch, but in almost all cases, respondents were uncomfortable with typing on it. This is reflected in the relative speed of text-entry question, where no participant said they could type faster on a smartwatch than a smartphone.

#figure(
  image("assets/charts/fig_6.png"),
  caption: "Preferred Modes of Smartwatch Text-Entry"
) <fig:SW_text_entry>

When asked about what issues arise with typing on a smartwatch, nearly 75% of respondents said that the small screen made it hard to type accurately. Notably, even respondents that don't typically use a smartwatch said this, suggesting that this factor dissuaded respondents from getting a smartwatch. The rest of the issues we listed had an even spread of responses, showing us that these problems are still relevant with today's smartwatches. These characteristics are shown in @fig:issues.

#figure(
  image("assets/charts/fig_4.png"),
  caption: "Main Smartwatch Features Used by Participants"
) <fig:issues>

Overall, respondents wanted a better swipe or gesture based method of typing on a smartwatch and faster predictive features. The fewer taps required to convey a message, the better.

= Understanding Context of Use: Contextual Inquiry

Our main objective was to understand the wide range of real-world scenarios in which people try to enter text on a smartwatch, with a special focus on identifying the frequent obstacles that disrupt these attempts. We aimed to understand how people use ---and often avoid--- text-entry on their smartwatches in daily life by detecting consistent problem areas that hamper quick message composition, learning how participants adapt or abandon these features, and gathering context-specific details that could guide more reliable, compact typing solutions.

== Method
// What did the method entail?
We employed Contextual Inquiry interviews to observe participants' natural behaviors around smartwatch text-entry. Our purpose was to obtain specific information about each participant's smartwatch usage. 

Specifically, we aimed to understand how each participant uses their smartwatch in the main context they typically interact with it. In such contexts, we attempted to obtain information about what obstacles they face while interacting with their smartwatch when performing different tasks and which properties of the smartwatch make their interactions easier. Finally, to contextualize the data that we acquired, we sought out how these factors differ from other contexts in which they might interact with their smartwatch.

Each researcher interviewed one participant in the context-of-use where the participant typically uses their smartwatch for text entry tasks. The interview asked the participant to describe their typical workflow when performing text-entry tasks and used this information to ask more pointed questions.

We conducted a semi-structured interview where each interviewer was free to decide what follow-up questions to ask about the participants smartwatch usage. As the interview progressed, each interviewer noted down the participant's interpretations. Each interviewer also recorded any confusion or inefficiencies that occurred when participants tried to compose text, whether by tapping, swiping, or using voice commands.

== Tasks and Procedures
// How was consent for participation sought and administered? What did the task entail? Were participants given any prior instructions? What were they? How long did the task take on an average? How did you go about ensuring quality control of tasks?
Like the pilot survey, participants were told the purpose of the study and that participation was entirely voluntary and could be stopped at any time. Each interview started with the participant being asked to describe their smartwatch usage in the context of text-entry tasks. We did not prescribe any specific tasks to the participants. Instead, participants were asked to use their smartwatch as they naturally would in their context of use, thinking aloud about what they were doing and any difficulties they encountered with typing or voice input. Interviews lasted about 20 minutes on average.

== Participants
// Please provide demographic information of participants: number of participants, by age, by gender, by disability if relevant for the study, by experience with task, location, any other criteria for recruitment, how they were recruited, were they given any incentives, mode of study conducted (virtual or in-person). How did you decide on the number of participants for your study?
// format: gender, age-range, virtual/in-person, experience using smartwatch, how recruited
Six one-on-one in-person contextual interviews took place. One interview per researcher allowed us to get a wide range of perspectives without spending too much time on interviews. Each participant was a direct connection (friend) of the interviewer. Most participants were between the ages of 18-26, with two being between 27 and 35. The majority of our participants were female - 4 females and 2 males, unlike our survey results. Everyone had at least one year of experience using their smartwatch. The full characteristics of each participant are shown in @tab:participant-characteristics.

#figure(
 table(
    columns: 6,
    align: center + horizon,
    table.header([Gender], [Age], [Interview Format], [Years of Experience\ Using Smartwatch], [Relationship\ to Interviewer], [User Code]),
    [Male], [18-26], [In-person], [2 years], [Friend], [U01],
    [Female], [18-26], [In-person], [4 years], [Friend], [U02],
    [Female], [18-26], [In-person], [1 year], [Friend], [U03],
    [Female], [18-26], [In-person], [1 year], [Friend], [U04],
    [Male], [27-35], [In-person], [1 year], [Friend], [U05],
    [Female], [27-35], [In-person], [4 years], [Friend], [U06],
    table.hline()
  ),
  placement: none,
  caption: "Characteristics of Survey Participants"
) <tab:participant-characteristics>

== Results
// Please provide detailed summary of findings. Consult your consolidated affinity diagram to help craft the story.
As a result of our interviews, we gained further insight into participants' context of use. The most important insight we gained was that participants talked almost exclusively about messaging tasks when discussing text-entry tasks on their smartwatches. This is consistent with findings by others, where checking texts was the second most common use of smartwatches (following checking the time) @chun_dey_lee_kim_2018. This led us to focus most of our efforts on text-messaging tasks for smartwatches. 

Additionally, many participants expressed frustration with the speed of text-entry tasks. There were two main subcategories of such frustrations. First, users were unhappy with the speed at which it was possible to enter text on a smartwatch, feeling that they were often limited by the size of the screen when inputting text using touch. They also expressed frustration at the costliness of fixing text-entry mistakes on a smartwatch.

Although we found that touch-based text-input was the most common method, many participants had tried using other methods such as voice-based text entry. Specifically for voice-based text entry, two participants said that they felt uncomfortable with such methods in public. This supported other interpretations we collected, where many participants expressed that they liked the discrete nature of smartwatches.

We also found that multilingual users, especially those who use languages that do not use a Latin alphabet, expressed frustration with the lack of multilingual support on their smartwatches.

We consolidated data by constructing sequence and flow diagrams that highlight each participant's interactions with text-entry. We also built an affinity diagram that revealed recurring themes across interviews, such as initial curiosity in typing features followed by a steep drop-off in daily use. Many participants felt uneasy speaking into their watch in public, especially if they perceived voice commands to be slow or inaccurate. Those who tried manual entry often gave up due to cramped keyboards, repeated mistakes, or the watch's awkward layout. Most participants ended up sending only short messages — like "OK," "Yes," or a numeric code — through their watch and reserved longer replies for their phone. Some participants expressed that they viewed their smartwatch as unsuitable for "serious" text-entry tasks independently from its text-entry capabilities. Multiple participants saw the watch more as a passive display, suitable for reading but not writing.

The affinity diagram categorized comments into several groups. One group reflected that participants had explored text-entry at first but soon found it unhelpful, especially for multi-sentence conversations. Another group underscored the discomfort of using voice input in public or around coworkers, which stifled spontaneous verbal replies. A third cluster documented complaints about the watch interface feeling unnatural or too small for meaningful text composition. Users typically typed short or quick messages to avoid errors, then switched to their phone for anything substantial. Overall, mistakes were frequent, and participants considered text-entry on the watch to be unreliable. Nonetheless, these same users found the watch useful for passive tasks like dismissing notifications or glancing at messages.

= User Requirements and Functional Constraints
// Provide a comprehensive list of objective, testable requirements that are not implying solutions. Make sure you ground your user requirements in the context of use.

// Drawing on participants' real-world usage and common frustrations with smartwatch text-entry, we identified the following requirements that specify what the user must be able to do:\

We examined insights from our contextual interviews, consolidated sequence, flow, and affinity diagrams along with our survey data to identify key usability challenges in smartwatch text entry. Based on our findings, we derived the following user requirements, ensuring they are objective, testable, and grounded in real-world usage patterns. 

_*Requirement 1:* Users must have an opportunity to correct mistakes before sending a message._ Many participants reported accidentally selecting the wrong quick reply or mistyping a message without a chance to correct it before sending. Given the small screen size, unintended inputs are common, leading to frustration and errors in communication. The user should be able to correct such errors that may occur. This requirement can be evaluated by measuring how frequently users are able to intercept and correct errors before a message is sent, compared to how often unintended messages are sent without correction.

_*Requirement 2:* Users must be able to fix text-entry mistakes faster than it would take for them to switch to another device and complete the task on that external device._ Participants frequently expressed that fixing errors on a smartwatch was so cumbersome that they preferred switching to their smartphone or other device instead. If the effort to correct mistakes is lower than switching devices, users will be more likely to complete their tasks on the smartwatch. This is testable by comparing the average time it takes a participant to fix a mistake on their watch versus performing the same action on an external device.

_*Requirement 3:* The user should be able to type accurately and with minimal incorrect input recognitions._
Users expressed frustration with frequent mistakes caused by the smartwatch misinterpreting input, whether from small keyboard buttons, inaccurate swipe detection, or faulty voice-to-text processing. The user should be able to enter their intended text correctly a high percentage of the time without the need for post-facto error correction. 
This requirement can be tested by tracking the error rate of the user's text-input on different text-entry tasks.

_*Requirement 4:* Users should be able to complete short text-entry tasks on the smartwatch faster and more reliably than on external devices, including any overhead to setting up the external device (_e.g._ taking a phone out of a pocket)._ Participants reported that they prefer to use their smartwatches for short text-entry tasks (_e.g._ replying to casual messages) because they would like to avoid the overhead of setting up some other external device for these tasks. Users tended to resort to their phone or other device if the response required anything more than a few words. As such, a design should fulfill users' desires and optimize for speed and convenience when considering brief interactions. By doing so, this would make the smartwatch a more viable tool for communication. The effectiveness of this requirement can be assessed by timing participants completing a set of short text-entry tasks on a smartwatch versus retrieving and using an external device (such as taking a phone out of a pocket).

_*Requirement 5:* Users should be able to complete text-entry tasks without direct hand contact with the smartwatch._ Many users expressed frustration with their smartwatch's text-entry capabilities in situations when they were not able to touch the watch with their hands (_e.g._ the user is cooking; the user has long nails). This limitation discourages them from using text-entry features. As such, participants have expressed a desire to perform these tasks without directly touching the smartwatch. This is testable by observing whether users are able to complete text-entry tasks without touching the watch. 

_*Requirement 6:* Users should feel comfortable using the text-entry method in public._ Multiple users expressed that they were unhappy with voice input for text-entry as it made them feel uncomfortable to use in public, despite needing to perform text-entry tasks. Additionally, many other participants expressed that they enjoyed that their smartwatch allowed them to do tasks discretely in public without feeling uncomfortable. As such, we want to fulfill users' desires to have a text-entry method they can comfortably use in public. This requirement can be tested by asking users to use the text-entry method in public and reporting their comfort levels via surveys. Additionally, observational studies could be used to measure how frequently users abandon using the text-entry method in social settings. 

= Initial Design and Low Fidelity Prototypes

== Personas
// Does the Initial Design and Low Fidelity Prototypes section contain a quality description of a final primary persona? Note that having secondary and anti-personas will aid you in the design, but we will not grade them.
The personas each member designed ended up being fairly similar. Overall, personas were young, proficient with technology, and have owned smartwatches for at least a few years. They reflected many of the common interpretations from our combined contextual interviews.

Below we describe our final persona, Emily Carter, who will be the model user for our final design.

- *_Emily Carter_*
  - Gender: Female
  - Age: 22
  - Occupation: Registered Nurse
  - Tech Proficiency: Intermediate
  - Device: Apple Watch Gen 7
  - Years with smartwatch: 4

Emily is a nurse at a prominent hospital in New York City. She works 12-13 hour shifts during the day and typically has 4 to 6 patients under at all times. The hospital is a fast paced environment where she does not know when her next break is. She often has to run around the hospital to manage multiple patients and support doctors. 

She primarily uses her smartwatch for viewing patient alerts, shift schedules, and responding to quick messages. In noisy hospital settings, voice input is not ideal, so she prefers typing, tapping pre-set responses, or using swipe gestures for efficiency. She often has trouble typing on her watch due to her long nails, which often are an annoyance when trying to tap small keys on her watch. The smartwatch's ability to provide discreet, instant access to information helps her stay focused while minimizing distractions.

Emily typically carries her phone with her at all times since the hospital needs constant communication with her. However, due to her demanding schedule, she finds it more convenient to look at notifications through her smartwatch, especially when she is running between destinations or in the middle of patient care.

== Sketches
// Does the Initial Design and Low Fidelity Prototypes section contain brief description of the results from a design critique for each individual design?
=== Individual Sketches
We initially created six separate designs to address our user requirements. Each researcher then gave feedback on each design. The full sketches for each design are shown in Appendix D.2. Below we summarize, then address each design's strengths and weaknesses in appendix order.

==== Dynamic Key Hitboxes
The design tackles issues mentioned by users from contextual interviews by dynamically adjusting the "hitbox" of each key based on predictive likelihood. When typing, the hitbox of the more likely next letter expands into the space of less likely letters, allowing users to make successful selections even with imprecise touches. The design maintains the familiar QWERTY layout while adapting behind the scenes to reduce errors. It incorporates features such as automatic disabling of the expansion system when using caps lock (for acronyms or technical jargon) and reverting to equal-sized hitboxes after deletion to make error correction straightforward.

Feedback on the Dynamic Key Hitbox design was generally positive, with reviewers appreciating the maintenance of the familiar QWERTY layout while providing typing assistance without requiring interaction from the user. Users can continue using their smartwatches without learning a new system, as the expanded hitbox feature works invisibly in the background.

Reviewers questioned how the system handles competing expanded hitboxes when a user intends to select a key surrounded by expansions from neighboring keys, potentially making the intended key impossible to hit. Some reviewers expressed concerns about users who might want to frequently avoid using expanded hitboxes (e.g. those with unconventional typing styles). The current design would require these users to make a mistake for each such word, which should be improved upon.

The placement of the `delete` and `enter`/`send` buttons was noted as problematic as they were positioned too close together despite their importance. One reviewer questioned how the design would be adapted to different watch shapes (particularly circular ones) and how users would access to special characters/emojis. Some reviewers questioned whether users should be able to visualize the expanded hitboxes and how the algorithm resolves overlapping hitboxes when multiple predictions are equally probable.

==== Compose-Edit Dual Modes // Ryan
This design addresses efficient input and error correction with a dual-mode design. Compose mode features a nearly full-screen ortholinear swipe-enabled keyboard with a preview window at the top of the screen where users can verify each word typed in real time. Edit mode allows coarse edits with a cursor that moves word-by-word and a delete button. Shared between both modes is a send bar that must be swiped from left to right.

The swipe to send bar was positively received as it prevents the user from accidentally sending a message during composition. Separating writing and editing into two modes also maximized their utility since each mode had a dedicated purpose.

Notably, an external side button is required to toggle between each mode. This large assumption makes this design potentially incompatible with other smartwatches. Many pointed out that there's no way to type numbers or special symbols. Fitting another row would make each key too small, but there should be another way to type other common characters. Being forced to delete only whole words was also a debated topic. While bulk deletions are fast, they are excessive for small typos that only require a single character operation. Finally, it is ambiguous where the cursor is when toggling from Edit to Compose mode. If, for instance, a word in the middle of a message was just deleted, there's no way to tell if the cursor's position was preserved or if it went back to the end of the message.

==== Quick-Correct Swipe Type // Hyungchan
This prototype design aims to streamline messaging by offering two initial response modes - "Suggestions" and "Keyboard" - and then guiding the user through a step-by-step correction process. Upon tapping "Reply" to an incoming message, users can choose "Suggestions" for quick replies drawn from frequent phrases or "Keyboard" for a standard QWERTY swipe layout. After drafting a message in either mode, the interface automatically highlights potential typos. Tapping each highlighted word reveals suggested corrections, and once every suspect word is addressed, the user sees a final preview before pressing "Send." This ensures short messages can be entered and refined more efficiently than on a small traditional keyboard, giving users control to fix mistakes without reverting to their phones.

The design features that received positive comments are the concept of offering both predictive suggestions and a keyboard option upfront. Commenters felt that quick, canned replies for minimal effort or a more full-featured keyboard with swipe-based input would accommodate different user needs. They also liked the two-step sending process that highlights potential typos before finalizing a message, emphasizing how it reduces the likelihood of sending awkward or erroneous texts. Most found this correction flow intuitive—users can tap on suspect words, see suggested fixes, and make changes without rewriting an entire message. The design effectively addresses frequent complaints about error-prone smartwatch text input and helps streamline minor edits, giving users confidence in sending messages from the watch rather than switching to their phone.

Some critiques pointed out the added step of choosing between "Suggestions" and "Keyboard" every time a new message appears, suggesting a default or remembered preference might reduce friction. Others questioned how users could correct words that are spelled correctly but used incorrectly, since the automated highlighting wouldn't catch those errors. A more flexible path to manual editing -- even after the system's automated check -- would help. Finally, while commenters appreciated swipe-typing on a compact screen, one still worried about "fat-finger" issues and recommended exploring alternate navigation options, such as side-button toggles, to alleviate cramped tapping for people with larger hands.

==== AR Cursor Type // Kevin
This prototype introduces a novel text-entry method for smartwatches by utilizing a built-in or external camera to track a user's finger movements in mid-air. Instead of relying on small touchscreen buttons, users navigate the keyboard by hovering their finger in the air, selecting characters with a pinch gesture. This approach enhances accuracy by allowing users to adjust sensitivity, providing finer control over text input, and reducing the risk of accidental taps. By expanding the input space beyond the watch face, users gain a more flexible and intuitive way to type, making smartwatch text entry more practical and efficient. Users can also customize sensitivity settings to match their hand stability, ensuring better control while typing. Additionally, this method offers a discreet alternative to voice-to-text, allowing users to enter text silently without disturbing others or requiring a quiet environment. 

This design was regarded positively for how it offered a hands-free alternative to text-entry that enhances accessibility and accuracy. The group liked that the design accommodated users who struggle with traditional touch input, such as those with long nails, dirty hands, or larger fingers. The ability to see a highlighted cursor before selection provides clear feedback before users confirm their keyboard entry choice too. 

The critiques this design received were centered on practicality and implementation. One critique was concerned about the comfort and social acceptability of performing mid-air gestures in public. Another questioned whether small variations in finger movement might introduce errors. Finally, the critiques pointed out that environmental factors such as lighting conditions and obstructions like accessories could interfere with the hand motion detection accuracy.

==== LLM-Assist // Oskar
This design leverages an LLM to streamline smartwatch text entry by asking clarifying questions based on incoming messages. When a user receives a text, the LLM analyzes it and prompts the user with simple questions to build and refine their response. For example, if asked about availability, the LLM may offer "Yes" or "No" buttons and follow up with a time request if needed. Once enough information is gathered, the LLM generates a suggested reply for approval, allowing the user to accept, edit, or discard it. Over time, the system personalizes responses based on the user’s past language patterns for greater accuracy and convenience.

Having a LLM craft a possibly extensive reply with only a small number of user inputs is something that was positively received. 

Some of the critiques this design faced is how the user would go from the LLM assist mode to a mode that uses the conventual text-entry method seen on smartwatches today. For example, what happens after you click "no" to the LLM proposed response? Do you have an opportunity to retry at the LLM-assist? Another concern had to do with the limitations of the state of the art LLMs: how might we make the responses less verbose and more similar to text messages? And how might the LLM respond to multi-language texts? Although these are concerns, the state of the art LLMs developed by OpenAI and Claude have many features that can not only mimic writing styles but also languages. However, since LLMs are not deterministic, one critique points out what happens when the LLM does not ask the "right" questions, questions that the user thinks would be important to the scope of the message.  

==== All Encompassing Text App // Nivedhitha
This design focuses on enhancing smartwatch usability, addressing common challenges like food stains, long nails, broken screens, and time-sensitive tasks. It prioritizes accessibility, efficiency, and ease of interaction, aiming to improve the overall user experience.

For the text entry system, the user experience was improved with a redesign of the smartwatch keyboard. The traditional T9 layout was modified, embedding only the alphabetic characters (rather than numbers), which helps expand the touch areas for the keys and ensures easier selection with fewer mistouches. This approach maintains the same time threshold required for key presses as existing methods. Additionally, there is quick access to emojis, allowing users to express emotions efficiently. The design includes two modes: one for alphabetic typing and another for numeric-based text entry, offering flexibility in communication without restrictions on symbols. Special symbols are embedded as a single button, which enlarges upon clicking, ensuring that users can easily access them.

Given the importance of the space bar in text entry, this function is integrated into the side button of the smartwatch, providing a more ergonomic solution for repetitive use. To address the challenge of reading or typing longer messages, the design includes a left-to-right scroll bar, which can be operated using the side knob for better message verification and readability. Users also have the option to reply using voice control, allowing for quicker responses without the need for text input. To minimize mistouches and ensure intentional actions, the send button only works with a long-press, offering confirmation before sending a message.

To improve readability in bright environments, the UI has dark-colored elements on a light background, enhancing contrast and making it easier to view the screen in sunlight. Sans-serif fonts were chosen for better legibility, optimizing space while maintaining clear and readable text, ensuring a consistent user experience in various lighting conditions.

Following the design critique, several key insights emerged, helping refine the smartwatch interface.

1. Text Input & Voice Messaging – While the T9-style keyboard minimizes mistouches, some reviewers found the multiple taps required for text entry potentially tedious. Additionally, the absence of an option to edit recorded voice messages was noted as a usability concern.

2. Navigation & Interaction – The integration of a scrolling knob and haptic feedback was well received, improving intuitive navigation. However, long-pressing to end a call seemed unintuitive at first, and clearer differentiation between swipe and tap gestures was suggested to enhance consistency. It's also noted that incorporating signifiers and considering the affordances of the watch design could help improve the discoverability and overall usability of these features, as users might need more time to get accustomed to all the functionalities.

3. Scope & Focus – While the design effectively improves overall smartwatch usability, some reviewers felt it extended beyond text-entry tasks, resembling an OS-level redesign rather than focusing strictly on input methods. More direct solutions for minimizing text-entry errors were recommended.

4. Adaptability & Form Factor – The design was praised for its intuitive interface, but considerations for adaptability to rectangular smartwatch screens were suggested to ensure broader applicability. Some reviewers wondered how this system could be translated into a rectangular smartwatch, with ideas like integrating presses of different amounts of time and haptic feedback to improve text-entry, which is often an overlooked part of technology.

=== The Final Design
// Does the Initial Design and Low Fidelity Prototypes section contain a description of the "final" group design? Does the description contain justification for changes based on the design critiques? Does the section contain quality sketches and storyboards for the final design? Do the sketches and storyboards depict the personas?
Building upon the Dynamic Key Hitbox and Quick Correct Swipe Type designs, our final design prioritizes suggested responses while allowing the user to enter any custom message. The core of this design addresses the two prominent challenges identified in our contextual interviews: the need for faster interaction for quick replies and more accurate manual text entry when custom messages are required.

Most critiques consistently praised designs that offered immediate shortcuts or suggested responses with confirmation dialogs for routine messages. Short, standardized phrases could speed up interactions, confirmations could prevent accidental sends, and shortcuts could prevent users from fumbling on a small keyboard for every reply. At the same time, they stressed the importance of retaining a reliable manual typing interface for cases where users need finer control or have to enter more detailed text. As these challenges arose, the design critiques favored solutions that integrate both quick suggestions and an adaptive keyboard in a single flow. Consequently, our final design adopts contextual suggestions at the outset while also including a Dynamic Key Hitbox keyboard to ensure custom input remains accessible and accurate.

The interface initially presents users with suggested responses when viewing a notification for a message, as shown in @sketch:suggestions. These suggestions are contextually generated based on message content and past responses, addressing the needs of users who often send quick standardized responses when they are busy. Users who require more customized text entry can scroll down using the screen or watch crown to access the Dynamic Key Hitbox keyboard to type custom messages. This is indicated by the keyboard icon with an arrow at the bottom of the screen, also shown in @sketch:suggestions.

#sketch(
  image(
    "assets/sketches/final/sketch4.png", 
    height: 2in,
  ),
  label: "sketch:suggestions",
  caption: "Suggestions being displayed upon the user opening a received text"
)

When a user selects a suggested response, the system shows a confirmation popup. The chosen suggestion expands to fill the center of the screen, with prominent "Send," "Edit," and "Cancel" options shown below, as shown in @sketch:suggestions-options. The "Edit" button allows the user to edit the suggestion using the keyboard, while "Cancel" returns them to the previous menu, allowing them to choose a different suggestion. This directly addresses both the concern raised by participants who desired confirmation steps before sending messages and the critiques about individual prototypes lacking confirmation or editing options when users need to correct words not recognized as typos or want to revise partially accepted suggestions. For users who are tend to message in conditions where accidental taps are possible, this gives the user the option to "undo" an accidental tap on a suggestion without significantly increasing interaction time.

#sketch(
  image(
    "assets/sketches/final/sketch5.png",
    height: 2in
  ),
  caption: "Interface after the user chooses a suggestion",
  label: "sketch:suggestions-options"
)

If the user chooses to edit a suggestion or create a custom message, they access the Dynamic Key Hitbox keyboard. It silently changes the sizes of a key's hitbox, preventing errors by adapting to likely letter combinations as show in @sketch:hitbox-expanded-2 and @sketch:hitbox-expanded-1. This adaptive approach is particularly valuable for both our persona: Emily, whose long nails and on-the-move lifestyle make precise tapping difficult.

#sketch(
  image(
    "assets/sketches/final/sketch2.png",
    height: 2in
  ),
  label: "sketch:hitbox-expanded-2",
  caption: [The hitbox for "D" expands into the space of its neighbors, since it is more likely to be typed]
),
#sketch(
  image(
    "assets/sketches/final/sketch1.png",
    height: 2in
  ),
  label: "sketch:hitbox-expanded-1",
  caption: [The hitbox doesn't expand into the space for the letter "R," as it is also likely to be typed]
)

For users who might type abbreviations and unconventional words, the keyboard is able to accommodate these tasks. When typing abbreviations with `CAPS LOCK` turned on, the system automatically reverts hitboxes to their regular sizes as to not prevent the user from typing letters that would be otherwise unlikely to typed together, as shown in @sketch:hitbox-caps-lock. For other words where common linguistic patterns might not be followed, the system also reverts hitboxes to regular sizes after the user erases a letter after making a typo. This ensures that the system will not hinder the user for the remainder of a word that is linguistically an outlier.

#sketch(
  image(
    "assets/sketches/final/sketch3.png",
    height: 2in
  ),
  label: "sketch:hitbox-caps-lock",
  caption: [The hitbox for "L" stays the same, as `CAPS LOCK` is turned on]
)

The combination of these features form a design that addresses both approaches to reducing text entry frustration: it minimizes the need for typing through intelligent suggestions while simultaneously reducing errors when typing is necessary. This dual approach recognizes that different contexts call for different interaction methods: some users may prefer suggestions when quickly responding to customers during busy periods, while still requiring accurate keyboard entry for composing more specific messages where suggestions are not sufficient.

We designed this interface to prioritize the fastest interaction method (prioritized suggestions) while maintaining support for precision typing (Dynamic Key Hitbox). Our design creates a flexible system that accommodates various user needs, physical limitations, and environmental contexts. The confirmation step provides the confidence users desire in message accuracy, while the adaptive keyboard ensures that when custom text is required, users can type with minimal errors regardless of environmental conditions or physical constraints.

== Storyboards
#image("assets/storyboards/GROUP_STORYBOARD.jpeg")

In the storyboard panels, Emily Carter is portrayed working as a busy nurse who urgently receives and responds to a message on her Apple Watch. She uses quick suggestions at first and then refines her message with an adjustable keyboard so she can discreetly communicate without disturbing her sleeping patient. These scenes reflect Emily's persona by illustrating her hectic schedule, the need for rapid and accurate text interactions in a noise-sensitive environment, and her reliance on smartwatch features that accommodate long nails and minimize interruptions to patient care.

== Paper Prototype
// Does the Initial Design and Low Fidelity Prototypes section contain a description and figures depicting the the "final" group design paper prototype? Does the description contain justification for changes based on the design critiques? Does the section contain a brief description of how an investigator could Wizard of Oz the prototype?

We crafted a paper prototype that consists of a hollow smartwatch frame with screens and widgets that are placable behind the screen above a piece of paper. The items between the frame and the background can be changed and replaced to make the smartwatch "function." @fig:notification shows a notification that a user tester will first encounter. Assets were made for all possible interactions within our controlled scenario. @fig:assets shows all the paper components.

#figure(
    image("assets/paper-prototype/assets.jpg"),
    caption: "The paper prototype components"
) <fig:assets>

// Design change based on critique taken from final design 
//Most critiques consistently praised designs that offered immediate shortcuts or suggested responses for routine messages, noting how short, standardized phrases could speed up interactions and prevent users from fumbling on a small keyboard for every reply. At the same time, they stressed the importance of retaining a reliable manual typing interface for cases where users need finer control or have to enter more detailed text. As these challenges arose, the design critiques favored solutions that integrate both quick suggestions and an adaptive keyboard in a single flow. Consequently, our final design adopts contextual suggestions at the outset while also including a Dynamic Key Hitbox keyboard to ensure custom input remains accessible and accurate.
// This directly addresses both the concern raised by participants who desired confirmation steps before sending messages and the critiques about individual prototypes lacking confirmation or editing options when users need to correct words not recognized as typos or want to revise partially accepted suggestions.

#figure(
  image(width: 45%, "assets/paper-prototype/notification.jpg"),
  caption: [A notification screen with various ways to reply]
) <fig:notification>

Within the hollow watch frame, we can place various screens inside with other components placed on top. One screen is the notification screen with various suggested responses for a quick message. This screen was necessary as critiques consistently favored designs that included immediate shortcuts or suggested responses for short messages. 

The other screens show a keyboard to allow the user to physically tap keys to type. Since our solution is invisible to the user, we need a method to determine with certainty where a user's finger taps the keyboard when they type. Prior to starting their task the user's finger will be marked with ink. When the user presses a key, their finger placement will be marked onto the paper. If the user is typing on the keyboard, each marked location can be compared with a set of printed reference hitboxes, as shown in figure @fig:hitboxes to decide what action to take (_e.g._ decide what the next inserted letter should be). By tracking user finger placement with ink markings, we can analyze the feasibility and usefulness of enlarging individual keys' hitboxes to address prior design critiques about the hitbox accuracy. 

This dual-method approach of combining suggested responses with a manual keyboard option was chosen based on feedback from our design critiques, which highlighted the need for both efficiency from shortcut responses and flexibility and control from an accurate keyboard.

We can use Wizard of Oz testing with this paper prototype to simulate smartwatch interactions without a functional digital system. The smartwatch frame holds interchangeable paper screens that an human operator swaps to reflect different interface states, such as receiving a notification or typing a message. The user's marked finger automatically tracks which keys they are pressing. The operator compares these marks to predefined key hitboxes as shown in @fig:hitboxes to simulate an adaptive keyboard. The operator can also act as the smartwatch's AI by selecting suggested replies and updating the interface accordingly to the dialogue presented by the user.

#figure(
  image(width: 50%, "assets/paper-prototype/hitboxes.jpg"),
  caption: "The operator's set of hitboxes"
) <fig:hitboxes>

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
// Does discussion expand on discussion from previous assignments and contain new insights from the initial design stage (including the design critiques)?
The survey results show that text entry is not a priority for smartwatch users. The small screen size is the limiting factor in making text entry viable. Even though users may be comfortable typing on a smartphone, that skill cannot directly translate to a screen many times smaller.

The most frequent requests to improve text entry involved minimizing the number of keystrokes required to type a message. Predictive text and autocorrect could significantly speed up typing speeds by allowing less precise inputs to still be interpreted correctly. Due to the small screen users, the survey also indicates that users might want to see a reduction in the number of interactions required to complete the same tasks on a smartwatch. This highlights an usability challenge: while smartwatches offer convenience and accessibility, their small screen size and limited input methods often lead to cumbersome navigation and excessive touch interactions. 

Our aggregated findings from Contextual Inquiry deepen the perspective gained from our previous survey by illustrating the granular breakdowns people face when typing on a tiny watch interface. Participants across different ages and backgrounds echoed the view that the watch is best suited for quick glances or short messages, with complex text tasks delegated to a phone. This pattern matches our earlier hypothesis that small screens alone do not explain why text-entry is so marginal; rather, usability gaps — like a lack of quick edit options or a reliable predictive engine — exacerbate the difficulty.

We now see a narrower focus forming around features that support short, context-specific messages in a more controlled manner. The emphasis on confirmations, immediate error correction, and discreet input suggests an urgent need to refine the watch's interplay between automatic suggestions and manual editing. 

Throughout our design process, we experimented with many different methods of error correction to address the above concerns. However, our critiques on each design reinforced the idea that the form-factor of a smartwatch is generally unsuitable to allow for quick and precise corrections for arbitrary errors. As a result, in our final design, we shifted our focus from making errors easily fixable to preventing errors in the first place. This allows us to address our users' concerns regarding errors while creating designs that are feasible and user-friendly.

Additionally, our design critiques suggested that simpler designs that focused around efficiency and accuracy were the most universally liked designs. As a result, we picked two designs that we agreed possessed these qualities, and iterated upon them to derive our final design. The critique process resulted in a final design that we believe will produce a product that addresses user concerns in the most effective way.

= Conclusion and Future Work
// What is the takeaway of this project? Were there any parts of the project that you did not include in the scope of this project? Here is where you will discuss how the current assignment will inform the rest of your project. For example, in Assignment 1, how will the results of your survey influence the future steps in understanding context of use? Feel free to use your creativity to suggest new research directions, designs---but these suggestions must be supported by the findings of your study
// Does conclusion add a brief summary of the outcomes of the initial design stages, and how knowledge you generated in this assignment informs future work including, but not limited to understanding context of use, specifying user requirements, design, and evaluation.
This study set out to clarify how people enter text on smartwatches and to identify factors that discourage more frequent or extensive usage. Through iterative survey design, we found that participants generally turn to smartwatches for quick interactions -- such as reading notifications or monitoring fitness activity -- while relying on smartphones for most typing. Although some participants appreciate the convenience of entering short messages on a watch, most remain dissatisfied with current text-input accuracy, speed, and clarity.

Through our Contextual Inquiry data, we have discovered that almost all text-entry tasks our participants performed on smartwatches were related to short text messaging. Participants' discomfort with tiny keyboards and the lack of robust predictive or editing features often prompted them to switch devices rather than persevere on the watch. These insights have informed our future focuses and goals towards ensuring users feel that a design allows them to achieve their goal of sending quick text-messages on their smartwatches.

Additionally, our Contextual Inquiry data provided us with specific frustrations users experienced when performing text entry tasks. In particular, the interface we design needs to have sufficiently large interactive input regions to reduce input error and have predictive features to speed up entry. Our sketched designs showcased many approaches at addressing our user requirements. Ultimately, we chose one that balanced speed and error prevention/correction.

User testing will be required to validate our prototype. In future work, we plan on establishing tasks and goals for our prototype and recruiting participants for user testing sessions to get direct feedback on our design.

= Acknowledgements
#text(fill: red, [Here, you will acknowledge any individuals or organizations that are not part of your group, but that have contributed to your work.])

#bibliography("citations.bib", style: "../acmcitation.csl")

#appendix[
  #show grid: set block(below: 0.25in)
  = Responsible Research: Human Subjects Research Protections
  #hide_if_draft[
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
  ]

  = Survey and Questionnaire Instruments
  == Initial Survey Design
  #hide_if_draft[
    #include "assets/survey/survey.typ"
  ]

  == Final Survey Design
  #hide_if_draft[
    #include "assets/survey/survey-revised.typ"
  ]

  == Anonymized and De-identified Questionnaire Data
  #hide_if_draft[  
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
  ]

  = Contextual Inquiry
  // Assignment 2 stuff goes here

  == Individual Interpretations
  #hide_if_draft[
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
  ]

  == Individual Sequence Diagrams
  #hide_if_draft[
    - U01
    #include "assets/diagrams/ryan_sequence.typ"
  
    - U02
    #include "assets/diagrams/efe_sequence.typ"
  
    - U03
    #image("assets/diagrams/kevin_sequence.png")
    
    - U04
    #image("assets/diagrams/oskar_sequence_diagram.jpg")
    
    - U05
    #include "assets/diagrams/hc_sequence.typ"
  
    - U06
    #image("assets/diagrams/nivedhitha_sequence.png")
    
    == Individual Flow Diagrams
  
    - U01
    #include "assets/diagrams/ryan_flow.typ"
  
    - U02
    #image("assets/diagrams/Efe Akinci Flow Diagram.png")
    
    - U03 
    #image("assets/diagrams/kevin_flow.png")
    
    - U04 
    #image("assets/diagrams/oskar_flow_diagram.jpg")
  
    - U05
    #include "assets/diagrams/hc_flow.typ"
  
    - U06
    #image("assets/diagrams/nivedhitha_flow.png")
    
    == Consolidated Sequence Diagram
    #image("assets/diagrams/SEQUENCE_CONSOLIDATED.png")
    
    == Consolidated Flow Diagrams
    #image("assets/diagrams/Flow Diagram Consolidated.png")
  ]
  
  
  == Affinity Diagram
  #box[
  #image("assets/diagrams/Affinity_Diagram.jpg")
  Above is our external affinity diagram. Because of its size and level of detail, it cannot be displayed legibly within this document. For the complete version, please visit:
  
  https://app.mural.co/t/efe0436/m/efe0436/1740421713527/892df92fd36881da9a1003f922eaf2746cd03970?sender=u50b4fa8f7b490ef0f8870762
  ]
  
  = Low Fidelity Prototypes
  
  == Individual Personas
  #[
    #let new_persona(content) = {
      set text(weight: "bold")
      
      block()
      block(sticky: true, content)
    }
    
    #new_persona[Ryan's Persona (Compose-Edit Dual Modes)]
    _Mitchell Hoffman_
    - Male
    - 20 years old
    - Comfortable with technology
      
    Mitchell Hoffman is a student attending the University of Arkansas and works in a materials lab. In his spare time, he goes out for runs across campus. He uses his smartwatch to automatically keep track of his runs and skip through music while he's running. The runs serve as a way to temporarily disconnect from the world, but sometimes the lab needs him for more urgent matters. At the end of the day, he'll put work first most of the time.
    
    #new_persona[Kevin's Persona (AR Cursor Type)]
    _Benjamin Andrews_
    - Age: 24
    - Occupation: Software Engineer at a Tech Startup
    - Technology Proficiency: High 
    - Years Owning Smartwatch: 3
    - Devices Used: Apple Watch 7, iPhone 15, Macbook Pro 2022
  
    Benjamin is a software engineer at Shade Inc., a tech startup based in New York City. Benjamin is doesn't have many meetings throughout the day but always has to keep up to date with Slack messages and texts between his team, product designers, and product managers. 
    
    Benjamin does not always keep his phone on him since he feels that notifications from his other apps, such as Instagram and LinkedIn are a distraction. Therefore, he uses his smartwatch a lot to catch up on his work messages when not at his desk. Most of the times, he does not need to respond instantly and can wait until he gets to his laptop. Sometimes, there is an urgent message that requires an immediate response. 
    
    Benjamin struggles to respond to messages on his smartwatch due to its small keyboard and inaccurate touch-based typing input. He likes to use the voice-to-text feature since that has been sufficiently accurate for him. However sometimes, he cannot use this feature because he is in a situation where he would prefer not to speak aloud. For example, in the crowded subway on the way to work or when he is in a quiet area at work where people are focused. 
  
    #new_persona[Oskar's Persona (LLM-Assist)]
    
    _Emily Carter_
    - Gender: Female
    - Age: 22
    - Occupation: Registered Nurse
    - Tech Proficiency: Intermediate
    - Device: Apple Watch Gen 7
    - Years with smartwatch: 4
    Emily is a nurse at a prominent hospital in New York City. She works 12-13 hour shifts during the day and typically has 4 to 6 patients under at all times. The hospital is a fast paced environment where she does not know when her next break is. She often has to run around the hospital to manage multiple patients and support doctors. 
    
    She primarily uses her smartwatch for viewing patient alerts, shift schedules, and responding to quick messages. In noisy hospital settings, voice input is not ideal, so she prefers tapping pre-set responses or using swipe gestures for efficiency. The smartwatch's ability to provide discreet, instant access to information helps her stay focused while minimizing distractions.
    
    Emily typically carries her phone with her at all times since the hospital needs constant communication with her. However, due to her demanding schedule, she finds it more convenient to look at notifications through her smartwatch, especially when she is running between destinations or in the middle of patient care.
  
    #new_persona[Nivedhitha's Persona (All Encompassing Text App)]
    #image("assets/diagrams/nividp_persona.png")
  
    #new_persona[Hyungchan's Persona (Quick-Correct Swipe Type)]
    _Kyle Thompson_
    1. Gender: male
    2. Occupation: College student (liberal arts)
    3. Context (with lifestyle)
      - Years Owning Smartwatch: 2
      - Devices Used: Apple Watch Ultra, iPhone 16, iPad Pro, Macbook Pro 2022
      - Frequently on the go (commutes by public transportation and walks between classrooms and school buildings in an urban environment)
      - Often receives time-sensitive notifications (slack, email, text) and needs to respond quickly but discretely
      - Values efficiency and hates interrupting his focus during the class by fishing his phone out of his bag
      - Enjoys wearing a smartwatch for health tracking and quick glances, but finds text entry frustrating due to small screens and error-prone typing
    4. Goal
      - Respond promptly to short messages without having to switch to his phone
      - Correct mistakes easily (he thinks typos undermine his cool image)
      - Rely on a consistent, predictable text-entry interface that provides confidence in short, on-the-go interactions
  
    #block()
    #new_persona[Efe's Personas (Dynamic Key Hitboxes)]
    _Henry Baker_
    
    Henry Baker is a 28 year-old neighborhood bakery owner in Ann Arbor, Michigan. He uses his smartwatch in both professional and personal contexts, since, similarly to many of our participants, he finds it convenient to be able to immediately read and respond to messages, especially when he is working.
    
    He sometimes uses suggested replies to answer questions that can be answered with using common phrases, but also likes being able to type out short but more open-ended messages. However, because of his work, he often has gloves on, which makes it difficult to accurately tap the screen. Additionally, the texts he sends often contain abbreviations as a result of him using business and bakery-related jargon.
  
    He values being able to quickly reply to messages without errors so that he can focus on his work.
    
    - *Demographics*
      - 28 years old
      - Male
      - Neighborhood bakery owner
      - Lives in Ann Arbor, Michigan
  
    _Jessica Smart_
    
    Jessica Smart is a 19 year-old college student at New York University. She uses her smartwatch to stay connected with her friends, and to coordinate group activities. She lives with a roommate Kate, who is also a college student. They like keeping each other updated on their day to learn new places to go and things to do.
    
    City life is hectic, and she often has to send messages on the go (as do many of our participants). She often uses her smartwatch on the bus during the day. The rough suspension of the bus makes typing difficult, and she often makes typos. Further exacerbating this issue is the fact that she has long nails, making it even more difficult to accurately tap the screen.
    
    She's young and savvy with technology. She likes using abbreviations and unconventional shortenings of words when texting her friends.
    
    - *Demographics*
      - 19 years old
      - Female
      - College student
      - Lives in New York City, New York

  ]    
  == Individual Sketches

  #block(sticky: true)[*Efe's Sketch (Dynamic Key Hitboxes)*]
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.25in,
    image("assets/sketches/ea_sketch1.png"),
    image("assets/sketches/ea_sketch2.png"),
    image("assets/sketches/ea_sketch3.png"),
  )


  #block(sticky: true)[*Ryan's Sketch (Compose-Edit Dual Modes)*]
  #image("assets/sketches/ryan_sketch.JPEG")

  #block(sticky: true)[*Hyungchan's Sketch (Quick-Correct Swipe Type)*]
  #image("assets/sketches/hc_sketch.jpg")

  #block(sticky: true)[*Kevin's Sketch (AR Cursor Type)*]
  #image("assets/sketches/kevin_hover.jpeg")
  #image("assets/sketches/kevin_pinch.jpeg")

  #block(sticky: true)[*Oskar's Sketch (LLM-Assist)*]
  #image("assets/sketches/Oskar_Sketch.png")

  #block(sticky: true)[*Nivedhitha's Sketch (All Encompassing Text App)*]
  #image("assets/sketches/nividp_sketch1.png")
  #align(center)[
    #image(width: 60%, "assets/sketches/nividp_Sketch0.png")
  ]
  #image("assets/sketches/nividp_sketch2.png")
  #image("assets/sketches/nividp_sketch3.png")

  == Individual Storyboards

  #block(sticky: true)[*Efe's Storyboards (Dynamic Key Hitboxes)*]
  #image("assets/storyboards/ea_storyboard1.png")
  #image("assets/storyboards/ea_storyboard2.png")
  #image("assets/storyboards/ea_storyboard3.png")

  #block(sticky: true)[*Ryan's Storyboard (Compose-Edit Dual Modes)*]
  #image("assets/storyboards/ryan_storyboard1.jpg")
  #image("assets/storyboards/ryan_storyboard2.jpg")

  #block(sticky: true)[*Hyungchan's Storyboard (Quick-Correct Swipe Type)*]
  #image("assets/storyboards/hc_storyboard.jpg")

  #block(sticky: true)[*Kevin's Storyboard (AR Cursor Type)*]
  #image("assets/storyboards/kevin_storyboard.jpeg")

  #block(sticky: true)[*Oskar's Storyboard (LLM-Assist)*]
  #image("assets/storyboards/Oskar_Storyboard.png")

  #block(sticky: true)[*Nivedhitha's Storyboard (All Encompassing Text App)*]
  #image("assets/storyboards/nividp_story1.png")
  #image("assets/storyboards/nividp_story2.png")
  #image("assets/storyboards/nividp_story3.png")

  == Final Personas
  _Emily Carter_
  - Gender: Female
  - Age: 22
  - Occupation: Registered Nurse
  - Tech Proficiency: Intermediate
  - Device: Apple Watch Gen 7
  - Years with smartwatch: 4

  Emily is a nurse at a prominent hospital in New York City. She works 12-13 hour shifts during the day and typically has 4 to 6 patients under at all times. The hospital is a fast paced environment where she does not know when her next break is. She often has to run around the hospital to manage multiple patients and support doctors. 
  
  She primarily uses her smartwatch for viewing patient alerts, shift schedules, and responding to quick messages. In noisy hospital settings, voice input is not ideal, so she prefers typing, tapping pre-set responses, or using swipe gestures for efficiency. She often has trouble typing on her watch due to her long nails, which often are an annoyance when trying to tap small keys on her watch. The smartwatch's ability to provide discreet, instant access to information helps her stay focused while minimizing distractions.
  
  Emily typically carries her phone with her at all times since the hospital needs constant communication with her. However, due to her demanding schedule, she finds it more convenient to look at notifications through her smartwatch, especially when she is running between destinations or in the middle of patient care.
  
  == Final Sketches

  #grid(
    columns: (1fr,) * 3,
    gutter: 0.5in,
    ..range(1, 6).map(i => {
      image("assets/sketches/final/sketch" + str(i) + ".png")
    })
  )
  
  == Final Storyboards

  #image("assets/storyboards/GROUP_STORYBOARD.jpeg")
  
  == Final Paper Prototype

  #[
    #set image(fit: "contain")
    #grid(columns: (1fr, 1fr),
    gutter: 0.5in,
    align: center + horizon,
      [#figure(
        image("assets/paper-prototype/assets.jpg"),
        caption: "The paper prototype components"
      )],
      [#figure(
        image("assets/paper-prototype/suggestion.jpg"),
        caption: "An example of a user sending a selected suggestion"
      )],
      
      [#figure(
        image("assets/paper-prototype/typing.jpg"),
        caption: "An example of the typing interface"
      )],
    
      [#figure(
        image("assets/paper-prototype/example-typing.jpg"),
        caption: "An example of a user typing and the operator's reference hitbox"
      )],
    
      [#figure(
        image("assets/paper-prototype/notification.jpg"),
        caption: "An example of the interface after tapping a notification"
      )],
      
      [#figure(
        image("assets/paper-prototype/hitboxes.jpg"),
        caption: "The operator's set of hitboxes"
      )]
    )
  ]
  
  = Usability Evaluation
  
  == Individual Heuristic Evaluation Notes
  
  == Individual Simplified User Study Notes
  
  = User Evaluation
  
  == Apparatus Screenshots
  
  == Anonymized and De-identified Participants Data

]