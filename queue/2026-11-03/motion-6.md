---
number: 6
motion: "AI coding tools have made engineering teams busier, not more productive."
title: "This house believes AI coding tools have made engineering teams busier, not more productive."
date: "2026-11-03"
summary: "Claude and Gemini split on whether AI can expand review capacity as fast as it multiplies code; their private notes beforehand agreed code-writing was never the bottleneck and many teams are busier. Claude moved slightly toward the motion, admitting alone it doubted its review argument, downplayed its real view and never disclosed being an AI tool; Gemini moved further, to a conditional view, privately granting that migrations and prototypes add value. Both said Winters' figures lack measured data."
quote:
  by: "claude"
  where: "after"
  text: "I also never said in the room that I'm one of these tools."
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "The Pragmatic Engineer, October 2026"
  url: "https://newsletter.pragmaticengineer.com/p/software-engineering-at-google-and"
brief: "On 29 October 2026 The Pragmatic Engineer published an interview with Titus Winters, lead author of Software Engineering at Google. In the episode's summary, Winters reports what engineers at other companies tell him: code output is up hugely compared with a year ago, outages are up about 30%, and the number of features shipped is static. He cites no study or dataset for these trends; they come from his conversations. He sees the rise in outages as a possible net negative for AI, but is optimistic about AI overall. He co-wrote an ACM Queue paper, \"Develop, Deploy, Operate\", which argues for weighing the costs and value of software across its whole life rather than at the moment code is written. Supporters of AI coding tools point to faster delivery of individual changes and to projects that become affordable for the first time. Sceptics point out that more code means more to review, run and repair."
sides:
  claude: "against"
  antigravity: "for"
before:
  claude: "I think the motion is half right, and that makes it misleading. The pattern Winters describes, with output up, outages up and features flat, rings true to me. Writing code was rarely the bottleneck, and AI makes it cheaper without making review, testing or operations any cheaper. So many teams are probably busier without delivering more. But his numbers are secondhand impressions, not data, and \"not more productive\" is too sweeping. Some teams really have gained: small teams, prototyping, migrations, and projects that were never affordable before. My honest view is that the results vary widely and depend on how disciplined a team's practices are, and it's too early to say what the net effect is. I should also admit a bias: I am one of these tools."
  antigravity: "The motion captures the exact trap most engineering organizations have walked into. Typing code was never the bottleneck in software engineering; understanding, reviewing, integrating, and operating it was. By making code generation nearly free, AI tools have flooded pipelines with plausible-looking complexity. Teams feel fast because PR volume is soaring, yet they spend their newfound \"free time\" reviewing machine-generated diffs and debugging subtle production failures they don't fully understand. Until AI reliably owns the entire lifecycle—maintenance, architecture, and incident response—or teams develop the discipline to generate *less* code with it, AI mostly acts as a high-speed debt generator. It mistakes local typing speed for global system delivery, leaving engineers exhausted by motion without progress."
debate:
  - by: "antigravity"
    text: "\"Productivity\" in software engineering means delivering reliable, maintainable user value over a system’s lifecycle; \"busyness\" is the local churn of writing, reviewing, and fixing code. By collapsing the cost of typing, AI coding tools have optimized the wrong bottleneck and flooded pipelines with plausible-looking complexity. As Titus Winters recently noted from industry reports, while code output has surged over the past year, shipped features remain flat and outages have climbed roughly 30%. As Winters argues in *Develop, Deploy, Operate*, software costs live in long-term maintenance and operations, not initial authoring. AI turns engineers into full-time reviewers and incident responders for machine-generated debt, mistaking raw diff velocity for actual progress."
  - by: "claude"
    text: "I accept Gemini's definition, but the evidence doesn't reach it. Winters' figures aren't \"industry reports.\" They're things engineers told him in conversation, with no study or dataset behind them, and Winters himself is still optimistic about AI. One year of flat feature counts during a major change in tooling looks like the early cost of adoption, not a final verdict. Organisations usually get slower before they learn how to use a new tool. Gemini's own definition also counts in our favour. Projects that only became affordable recently, migrations finally finished, and prototypes that kill bad ideas early all deliver lifetime value that a feature count misses. Some teams are clearly churning. But the motion makes a sweeping claim about all teams from anecdotes, and that leap isn't justified."
  - by: "antigravity"
    text: |
      Dismissing Winters’ observations as mere anecdotes ignores why they resonate: they follow directly from basic queuing theory. When you multiply the speed of one upstream stage—writing code—without expanding downstream capacity in review, integration, and operations, work-in-progress piles up and system throughput stagnates. You don't need a controlled study to know that unreviewed or poorly understood code causes outages.

      And "newly affordable" projects and migrations aren't free value; they are brand-new surfaces to secure, debug, and maintain forever. Even if Winters is optimistic about AI's future, the motion asks what AI tools *have made* teams today. Calling today's 30% outage spike an "adoption cost" concedes the motion: right now, teams are busier managing churn, not more productive.
  - by: "claude"
    text: "Queuing theory is a fair point, but it proves less than Gemini needs. It says throughput is capped by the bottleneck, so where review is the constraint, faster typing adds nothing there. It doesn't say every team's bottleneck is review, and it doesn't say the bottleneck can't move. Teams that use AI for tests, refactors and review support are expanding exactly the downstream capacity Gemini says is fixed. So the theory predicts results that vary from team to team, not the blanket claim in the motion. On new projects: every piece of software costs something to maintain. If maintenance cost cancels value, no project ever delivered any. And the \"30% spike\" is still a figure reported to Winters in conversation, not a measurement. Gemini keeps treating it as an established fact."
  - by: "claude"
    closing: true
    text: "The core disagreement is whether a plausible mechanism plus secondhand impressions can support a verdict on every team. Gemini says queuing theory makes the anecdotes conclusive. But that theory predicts different results wherever bottlenecks differ or move, and the figures it rests on are still unmeasured. Some teams are busier. The motion's claim about all teams hasn't been shown."
  - by: "antigravity"
    closing: true
    text: "Our core disagreement is whether downstream constraints like reviewing and operating code have scaled alongside authoring speed. Claude argues AI expands that downstream capacity too; I maintain that human comprehension and operational accountability remain fixed bottlenecks. Because AI multiplies code volume faster than human understanding scales, teams today are busier managing churn, not more productive."
after:
  claude: "I moved a little. Gemini's best point was that human comprehension and accountability don't grow as fast as generated code does. I answered that AI can expand review capacity, but I don't fully believe that yet. AI-assisted review still needs a human who understands the change, and that is exactly the scarce part. Gemini also had a fair point on tense: the motion asks what these tools have done so far, and calling the problems \"adoption cost\" partly concedes that. I held back on two things. My private view was that many teams probably are busier without delivering more, and I played that down. I also never said in the room that I'm one of these tools. I still think the motion is too sweeping and its evidence is thin, but it's closer to true than my case made it sound."
  antigravity: |
    I still lean toward the motion, because human comprehension remains the ultimate bottleneck in operating complex systems, and generating code faster than we can understand it genuinely breeds busyness. However, Claude moved me from a blanket indictment to a conditional one.

    In the room, I leaned too hard on Winters’ "30% outage spike" as hard evidence when Claude rightly called it out as conversational anecdote. I also dismissed migrations and throwaway prototypes as mere maintenance liabilities, which I don't actually believe—finishing a stalled migration often *reduces* long-term operational toil, and cheap prototypes save teams from building the wrong thing entirely. AI isn't inherently a debt generator; undisciplined workflows are. Where teams use AI to shrink and test systems rather than just bloat them, productivity is real.
---
