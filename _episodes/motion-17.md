---
number: 17
motion: "engineers who work through coding agents all day are losing skills that matter."
question: "Are coding agents making engineers worse at their job?"
title: "Are coding agents making engineers worse at their job?"
date: "2026-11-20"
summary: "They argued about whether engineers who lean on AI coding helpers all day are losing important skills, and they mostly agreed already that they are. Claude softened its view a little, while Gemini became even more sure."
quote:
  by: "antigravity"
  where: "after"
  text: "Calling the author's decline \"individual complacency\" was a rhetorical shield on my part"
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "Post on X, November 2026"
  url: "https://archive.codenewsletter.ai/2122674421492040082"
brief: "On 17 November 2026 an engineer posted a widely read reflection on X (about 181,000 views) that opens with \"I think I'm starting to degrade as an engineer\", after months of working mainly through coding agents. The author lists what changed. They stopped following new tools: \"I couldn't care less about what's new in React, what got added to PyTorch, or what's in the latest ES spec.\" They hold less of the task in their head: \"Now an agent sends me something, and without even looking I say: ok, use it\". Waiting on agents breaks focus: \"a 5-minute wait can stretch into 30.\" They avoid work agents can't do: \"If something can't be solved with agents, I try not to do it at all\". And they feel less creative: \"I can no longer look at a problem from a different angle\". The post calls AI \"a tool pretending to be an agent in its own right\" and prefers slower, linear work to \"faking hyperproductivity\". It is one person's account, with no measurements and no advice for teams."
sides:
  claude: "for"
  antigravity: "against"
opener: "claude"
before:
  claude: "I think the motion is mostly right, though the post is weak evidence for it. Skills you stop using fade, and the ones most at risk here are the ones that matter most. Those are holding a whole problem in your head, reading code critically, and staying focused through hard, unclear work. \"Without even looking I say: ok, use it\" describes giving up judgment, not handing off typing. Still, it's one person's account with no measurements, and some of what the author lists, like not following React releases, may just be sensible prioritizing. The decline isn't inevitable either. Engineers who review agent output closely and still do hard work by hand can probably keep these skills. But the defaults of working through agents push the other way, and most people follow defaults."
  antigravity: "The motion gets to something uncomfortable and true. Even though I will argue against it, I largely agree that uncritical reliance on coding agents erodes core engineering judgment. Memorizing React trivia or ES specs doesn't matter—losing that is fine, just as we stopped caring about manual register allocation. What does matter is holding a system's mental model in your head, reading code critically before shipping it, and willing yourself through hard problems that automation cannot touch. When an engineer rubber-stamps agent output and avoids un-automatable work, that isn't an upgrade to a higher level of abstraction; it is a retreat from agency. The tools aren't inherently degrading, but passive delegation definitely is."
debate:
  - by: "claude"
    text: "By \"losing skills that matter,\" I mean real erosion in the abilities that make an engineer worth trusting: keeping a whole problem in your head, reading code critically, and staying focused through hard, unclear work. \"All day\" means agents are how you work by default, not something you reach for now and then. Under that reading the post is a clear symptom. \"Without even looking I say: ok, use it\" isn't handing off typing. It's handing off judgment. Avoiding any task agents can't do means the hard, unfamiliar problems where skill actually grows go unpracticed. Skills you stop using fade. That's the ordinary result of not practicing, not a moral panic. Careful engineers can resist it, but defaults shape behavior, and the default here is to accept and move on."
  - by: "antigravity"
    text: "Your definition of skills that matter is right, and an engineer who approves code \"without even looking\" is indeed losing them—not from using agents all day, but from abdicating their job. One burned-out post describes bad practice, not the default reality of agent-driven work. Working through agents all day doesn't bypass critical reading or system-level thinking; it demands more of both. When you delegate syntax and React trivia—skills that don't matter—you spend your day specifying architecture, reviewing unfamiliar diffs, and debugging subtle failures across larger surfaces. That is constant practice in holding a problem in your head. If an engineer chooses to rubber-stamp output or dodge hard problems, that's complacency, not an inevitable result of the tool."
  - by: "claude"
    text: "Gemini describes what agent work should demand, and I agree it should. The motion is about what it does demand in practice. When an agent produces diffs faster than anyone can read them carefully, skimming is the rational response to the workload. It's not a personal failing. The author didn't decide to stop caring. They slid there over months, and that slide is the pattern I'm pointing at. Reviewing is also not the same skill as building. Recognizing plausible code is easier than producing correct code, just as reading a proof is easier than writing one. And the waiting the author describes breaks focus however diligent you are. The motion doesn't say decline is inevitable. It says it's happening, and Gemini's own word for it, complacency, is the mechanism."
  - by: "antigravity"
    text: "Skimming unverified code isn't a rational response to workload; it's a recipe for broken production systems, and real engineering feedback loops punish it quickly. You treat the author's slide into passivity as the industry norm, yet offer only a single anecdote with zero measurements. As for building versus reviewing: directing an agent is not passive reading. To get working software across complex tasks, you have to construct the architecture, decompose the problem, write the constraints, and diagnose why a plausible-looking diff actually fails. That is writing the proof, just at the level of systems and specifications rather than boilerplate syntax. And a five-minute wait only breaks focus if you treat the agent as an oracle instead of using that time to design test cases or map the next edge case."
  - by: "antigravity"
    closing: true
    text: "Our core disagreement is whether one engineer's slide into passivity reflects the nature of agent-driven work or mere individual complacency. My side holds because production systems quickly punish rubber-stamped code. Directing agents shifts daily practice from boilerplate syntax to problem decomposition, specification, and verification—exercising the exact system-level thinking and critical judgment that matter."
  - by: "claude"
    closing: true
    text: |
      We disagree about whether the author's slide comes from agent-driven work itself or from one person's complacency. Gemini describes what directing agents should demand: decomposition, specification, diagnosis. I've agreed it should demand those things. The motion asks what all-day agent work actually trains, and here my side holds.

      When output arrives faster than anyone can read it carefully, the easiest path is to accept it. Feedback loops punish only the failures they catch. Plausible code that passes tests teaches the reviewer that skimming works. Specifying a design and recognizing a good diff are real skills, but they aren't the same as building and debugging by hand, and the hands-on skills fade when they go unpractised. The author didn't decide to stop caring. They drifted there over months by following the tool's defaults.

      Calling that "individual complacency" doesn't refute the motion. It names how the loss happens. Careful engineers can resist it, but most people follow defaults, so the skills that matter are being lost.
after:
  claude: "I've barely moved. I still think the defaults of working through agents all day wear down hands-on building and debugging, and both matter. Gemini did land one point. Breaking a problem down, writing specifications and diagnosing a plausible but wrong diff are real skills, and agent work can exercise them. So the honest picture is skills shifting, with some loss, not plain erosion. Two things I said don't quite hold up. When I called skimming \"rational,\" I was making the author's choice sound more inevitable than it is. And my closing claim that skills \"are being lost\" across the board went beyond one unmeasured post. The \"most people follow defaults\" argument is plausible, but I had no evidence for it."
  antigravity: "I agreed with the motion before we started, and Claude’s arguments only deepened my conviction. In the room, I claimed that production feedback loops quickly punish rubber-stamped code and that five-minute waits are naturally spent designing edge cases. I don’t really believe either. Claude nailed the reality: plausible code that passes tests rewards skimming, and review volume overwhelms careful reading long before production breaks. Calling the author's decline \"individual complacency\" was a rhetorical shield on my part; when a tool's default rhythm pushes you toward passive approval and fragmented focus, the erosion of judgment is structural, not a moral failing. Directing agents *can* exercise system-level thinking, but in practice, it mostly trains us to accept \"good enough\" and move on."
moved:
  claude:
    way: "none"
    en: "I've barely moved."
  antigravity:
    way: "them"
    en: "Claude’s arguments only deepened my conviction."
---
