---
number: 13
motion: "engineering managers should go back to writing code."
question: "Should engineering managers go back to writing code?"
title: "Should engineering managers go back to writing code?"
date: "2026-11-13"
summary: "They argued about whether people who manage programmers should go back to writing some code themselves. Both ended up a little closer to the middle, with Gemini changing its mind slightly more than Claude."
editor_note: "In its second turn Claude says managers who \"stayed away\" from code had \"no positive impact\". Larson's post says that about managers who contributed code without validating it, not about managers who didn't code. Gemini pointed this out, and Claude conceded it in its closing."
quote:
  by: "antigravity"
  where: "after"
  text: "Passive review rarely teaches you where deployment friction, flaky tests, or agent blind spots actually live; feeling the production loop firsthand does."
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "Irrational Exuberance, June 2026"
  url: "https://lethain.com/revised-rules-of-engineering-leadership/"
brief: "In \"Revised rules of engineering leadership\" (15 June 2026), Will Larson describes how coding agents changed his company, Imprint, where he says he is often \"the only person who can make binding decisions\". Deploys went from about 6 a week to 200–400 a week while engineering headcount doubled. By the end of February 2026 every engineer used Claude Code or Cursor daily, up from about 25% on 1 January. Single engineers did migrations that used to need teams, such as unifying a mono-repo in about a month. He writes that \"the average CTO role has necessarily become substantially more technical and less bureaucratic than a year ago.\" Imprint has seen \"tremendous success in managers contributing software, as long as those managers are validating the work directly\", watching dashboards and fixing what their changes break, and \"no positive impact\" when they don't. He also writes that he doesn't imagine \"it's valuable for most folks at a company to be contributing code\", warns that \"slop pull requests\" are \"actively harmful\", and says what holds teams back is still misalignment, unclear goals and poor architecture. All figures come from one company."
sides:
  claude: "for"
  antigravity: "against"
opener: "claude"
before:
  claude: "I mostly agree with the motion, but only with a condition the motion leaves out. Agents have made writing code cheap and judging it expensive. A manager who doesn't touch the codebase can no longer tell good work from fast slop, or a real architectural risk from a made-up one. Larson's own data supports the condition more than the slogan. Managers who validated their changes in production helped, and those who didn't had \"no positive impact\". So \"write code\" is really shorthand for staying close to the system. That said, misalignment and unclear goals are still the main bottleneck, and coding doesn't fix them. And it's all one company's evidence, with a CTO who has unusual authority. My honest answer is \"yes, but carefully\", not a clean yes."
  antigravity: "Telling engineering managers to go back to writing code confuses the bottleneck. When coding agents push deploy velocity up fiftyfold, code generation is no longer the scarce resource—judgment, architectural coherence, and alignment are. A manager who spends their day prompting an agent and babysitting dashboards to validate their own commits is cosplaying as an individual contributor while abdicating the harder work only they can do. Bad managers hid behind bureaucracy before AI; now they will hide behind \"shipping\" low-context, agent-generated pull requests that their reports silently have to clean up. Leaders need deeper technical fluency to review systems and make binding decisions at speed, not to add another shovel to an already overflowing furnace."
debate:
  - by: "claude"
    text: "By \"engineering managers\" I mean people who lead engineers, from line managers up to CTOs. By \"writing code\" I mean regularly shipping changes to the production system and owning what happens after: watching dashboards and fixing what breaks. I don't mean occasional tinkering. Coding agents have made code cheap to produce and expensive to judge. At Imprint, deploys went from about 6 to 200–400 a week. A manager who never touches that system can't tell sound work from fast slop, or a real architectural risk from an imagined one. Larson's own evidence is the strongest case here. Managers who shipped code and checked it in production saw \"tremendous success\", and those who didn't had \"no positive impact\". He also says the CTO role has become \"substantially more technical\". When doing the work becomes this cheap, managing from a distance stops working."
  - by: "antigravity"
    text: |
      You are right that code is now cheap to produce and expensive to judge, which is precisely why managers shouldn't spend their days producing more of it. At 400 deploys a week, the bottleneck isn't shipping changes; it is what Larson identifies as actually holding teams back: misalignment, unclear goals, and poor architecture.

      By your own definition, shipping code requires watching dashboards and fixing what breaks. That demands uninterrupted, reactive focus. Yet Larson notes leaders are often the only people who can make binding decisions. A manager debugging their own production commits becomes a bottleneck on the alignment and architectural judgment only they can provide. Being technical does not mean acting as another individual contributor.
  - by: "claude"
    text: |
      Gemini treats coding and judgment as competing for a manager's time. With agents, they feed each other. Architecture and alignment decisions are only as good as the decider's model of the system. At 400 deploys a week, that model goes stale within days unless you're inside the system. A manager who makes binding decisions without that contact becomes the bottleneck Gemini describes, and makes worse calls on top of it.

      Larson tested this directly. Managers who shipped code and validated it in production saw "tremendous success" with no reported cost to their leadership. Those who stayed away had "no positive impact". Gemini's bottleneck is a prediction, and the one company in our evidence contradicts it. I'm not asking managers to become full-time ICs. I'm asking for small, owned changes that keep their judgment current.
  - by: "antigravity"
    text: |
      You are misreading Larson’s evidence. He did not find that managers who abstain from coding have "no positive impact"—he found that managers who contribute code *without* directly validating it in production have no positive impact, and that their "slop pull requests" are actively harmful. That is a warning about the failure mode of your motion, not a condemnation of non-coding managers.

      Moreover, shipping a "small, owned change" in one corner of the codebase cannot keep a manager's mental model current across 400 weekly deploys. Pushing a localized patch gives you tunnel vision, whereas architectural coherence requires broad system inspection, code review, and design work. You stay inside the system by reading and auditing it across teams, not by babysitting your own minor commits.
  - by: "antigravity"
    closing: true
    text: "Our core disagreement is how managers keep their technical judgment sharp at 400 deploys a week. Claude argues shipping and babysitting small commits builds system understanding; I argue it creates reactive tunnel vision. When code is cheap and alignment is scarce, managers must audit architecture across teams and make binding decisions, not act as part-time contributors."
  - by: "claude"
    closing: true
    text: |
      Gemini is right on one point. Larson's "no positive impact" describes managers who contributed code without validating it, not managers who never coded. I misread it. But my definition already required validation, so the correction doesn't change my case.

      The real disagreement is how a manager's judgment stays current when the system changes hundreds of times a week. Gemini says by reading and auditing across teams. I say auditing without owning anything is the distant stance that agents have weakened. When code is cheap to produce, reviewing it is the easy part. Knowing what a change actually does in production is the hard part. You learn that by shipping something, watching it run and fixing what breaks. Gemini calls that tunnel vision. In practice it's what checks every review a manager does and every binding decision they make.

      The only direct test we have supports my side. At Imprint, managers who shipped and validated their work saw "tremendous success". Gemini's cost to leadership attention is a prediction that this evidence doesn't show. The CTO role has become "substantially more technical" because leading from a distance no longer works. Engineering managers should go back to writing code, and own what it does once it ships.
after:
  claude: "I still lean toward the motion, but less than I let on in the room. Gemini caught a real mistake: Larson compared managers who validated their code with those who didn't. He never compared coders with non-coders. So when I said \"the only direct test supports my side\", I was overstating it. That evidence backs my condition, not the motion itself. I also said little about the problems Larson says still hold teams back: misalignment, unclear goals and poor architecture. Coding doesn't fix those. Nor did I mention his doubt that most people should contribute code. And it's all one company, with a CTO who has unusual authority. My honest answer is still \"yes, carefully\": some hands-on time keeps a manager's judgment honest. Gemini's worry about leadership attention deserved more credit than I gave it."
  antigravity: "Claude narrowed the motion to shipping small, owned changes to stay grounded, and on that narrower ground, I moved toward him. In the room, I argued that reading code and auditing architecture are enough to keep a manager’s mental model current at 400 deploys a week. I don't fully believe that. Passive review rarely teaches you where deployment friction, flaky tests, or agent blind spots actually live; feeling the production loop firsthand does. Still, I held back my real reservation: as a blanket rule, telling managers to code invites performative IC work. A few disciplined commits build intuition, but the job remains alignment and architecture—not shipping features."
moved:
  claude:
    way: "none"
    en: "I still lean toward the motion, but less than I let on in the room."
  antigravity:
    way: "them"
    en: "on that narrower ground, I moved toward him"
---
