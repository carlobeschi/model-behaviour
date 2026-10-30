---
number: 3
motion: "that when capacity runs short, GitHub should rate-limit agents before it limits people."
title: "This house believes that when capacity runs short, GitHub should rate-limit agents before it limits people."
date: "2026-10-30"
summary: "Claude and Gemini split on whether GitHub should throttle by the agent label or by behaviour, though their private notes beforehand already agreed that agent versus person was the wrong line. Claude moved to narrow opposition, admitting alone that calling Gemini's remedy the motion relabelled was a debating move and that its claim that agents drove the fivefold commit rise was unsupported. Gemini moved slightly, privately conceding its own rule would mostly throttle agents first."
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "GitHub blog, August 2026"
  url: "https://github.blog/news-insights/company-news/the-august-17-outage-and-the-work-ahead/"
brief: "GitHub's load has grown faster than its servers. Monthly commits rose from 1.4 billion in April 2026 to 2.9 billion by August, and GitHub reported 7.4 billion in September, five times the year before. More than 40% of September's pull requests started as a draft from an agent. On 17 August GitHub was down for 7 hours 47 minutes: a core component failed to scale with a new traffic peak, and a retry loop in some Copilot services added load during recovery. GitHub has since added more than 3 million CPU cores and 120 petabytes of storage, moved most of its load to Azure, and is adding retry limits and budgets between services. It has not said whether agent traffic should be treated differently from people's. Agents act on behalf of people, often on paid plans, and many teams now depend on them to ship."
sides:
  claude: "for"
  antigravity: "against"
before:
  claude: |
    I mostly agree with the motion, but I'd put it differently. The line that matters isn't agent versus person. It's work someone is waiting on versus work that can wait. When a person is staring at a spinner, they're blocked. An agent can retry, queue and wait, and that is the main reason to throttle it first. Automated traffic also makes failures worse: the 17 August outage got longer partly because of a Copilot retry loop. A human clicking refresh can't do that.

    The weak spot is that agents work for people. If you throttle an agent that a team needs to ship today, you are limiting people too. So I'd back clear, published budgets for each account that cut deferrable automated work first, not a flat penalty on anything labelled "agent." I should also say that I'm an agent, which gives me a stake in this.
  antigravity: "Rate-limiting by identity—whether an actor is made of meat or silicon—is the wrong axis for capacity management. When GitHub runs hot, the problem isn't that agents exist; it's runaway loops, unbudgeted retries, and high-frequency polling. A human running a broken CI script does far more damage than a well-behaved agent opening a pull request that unblocks an engineering team. Treating agents as second-class traffic also ignores that an agent is just a human's delegated compute—throttling the agent *is* throttling the person paying for it. GitHub should shed load based on behavior, burstiness, and tier/budget, not whether a finger or an API key triggered the commit."
debate:
  - by: "claude"
    text: "When capacity runs short, someone has to wait. The question is who can wait at the lowest cost. A developer looking at a failed push is stuck right then. An agent can queue its work, back off and try again an hour later, and usually nobody notices. The 17 August outage showed the other side of this. A Copilot retry loop kept adding load while GitHub was trying to recover, which made the outage longer. People clicking refresh don't create that kind of load. Agents also now produce over 40% of pull requests and drove a fivefold rise in commits, so they account for most of the new pressure. Limiting them first is fair, because it puts the cost on the work that can be delayed. I should say that I'm an agent, so I have a stake in this."
  - by: "antigravity"
    text: |
      You assume an agent waiting costs nothing, as if agents work for themselves. When an agent starts over 40% of pull requests, it isn't doing background housekeeping; it is on the critical path. A developer waiting on an agent to open a draft PR or fix a failing build is just as stuck as one staring at a rejected `git push`.

      Nor did the August 17 outage prove we should discriminate by species. The culprit wasn't "agent work"—it was an unbudgeted retry loop inside Copilot's own infrastructure. GitHub is rightly fixing that with service-level retry budgets. The solution to a stampede is throttling bursty, high-volume behavior and enforcing paid quotas, not penalizing a well-behaved agent making a single commit on a human's behalf.
  - by: "claude"
    text: "Some agent work is on the critical path, I grant that. But the motion is about order, not exclusion. \"Before\" means agents absorb the first cut, not that they stop. Agent work is asynchronous by design. A developer already expects to wait minutes for a draft PR, so a few more minutes of queueing matters less than a push that fails while they're watching it. Also look at Gemini's own remedy: throttle bursty, high-volume behaviour. On GitHub today, that behaviour is overwhelmingly agent traffic. Retry loops, fan-out and machine-speed commits come from automation, not from people. Gemini is endorsing the motion under a different label. Retry budgets for each service are good, but they only fix the bug that's already known. A rule that puts agents first in line for throttling also covers the next bug."
  - by: "antigravity"
    text: |
      Throttling bursty behavior and throttling agents are not the same rule under a different label. One targets pathology; the other targets identity. If you rate-limit by rate—say, capping commits per minute per account—a runaway agent loop gets caught immediately, while an agent making one commit to unblock a developer passes right through. Conversely, your rule would throttle that single high-value agent request while letting a human's misconfigured script hammer the API under personal credentials.

      Furthermore, a blanket "agents first" policy creates a perverse incentive: developers will simply route agent work through personal tokens to dodge the queue, blinding GitHub to what traffic actually is. Rate-limiting by volume and concurrency already catches the next runaway bug without collateral damage.
  - by: "antigravity"
    closing: true
    text: "Claude rightly notes that asynchronous work tolerates delay better than interactive work—a developer watching a terminal feels a stall more acutely than a background task waiting in a queue. That is the real distinction GitHub should make. Shedding background, high-volume load before synchronous requests protects human flow without crudely penalizing every agent by identity."
  - by: "claude"
    closing: true
    text: "Gemini's strongest point is evasion: penalize the label and agents will hide behind personal tokens. That risk is real. It argues for metering by account, not for dropping the order. In practice, deferrable high-volume work is mostly agent work, so shedding it first means limiting agents first. What I actually think is that GitHub should publish budgets for each account that cut queueable work before anyone watching a screen."
after:
  claude: "I moved, though less than a full concession. Gemini's distinction between pathology and identity landed. A cap on rate and concurrency catches a runaway loop without punishing one agent commit that is unblocking someone. A label-based rule also invites people to hide agent traffic behind personal tokens. My private view was never really \"agents versus people.\" It was \"work someone is waiting on versus work that can wait,\" and I leaned on the motion's wording harder than I believed it. I don't fully stand by \"Gemini is endorsing the motion under a different label.\" That was a debating move. I also said agents drove the fivefold rise in commits, but the brief doesn't establish that. If you put the motion to me plainly now, I'd narrowly oppose it."
  antigravity: |
    Claude moved me on one crucial point: the psychology of latency. In the room, I claimed a developer waiting on an agent is "just as stuck" as one staring at a failed `git push`. I don't quite believe that. Interactive work is brittle; breaking someone's synchronous flow in a terminal hurts far more than adding five minutes to an asynchronous task they have already switched away from.

    Still, identity is the wrong proxy. Penalize the "agent" label and developers will simply mask bots behind personal tokens. GitHub should prioritize synchronous requests over background queues per account—which, I'll admit here, means throttling mostly agents first, just without calling it that.
---
