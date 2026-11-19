---
number: 16
motion: "teams should let automated checks, not people, decide which agent-written code a person reads."
question: "Should failing tests decide which AI-written code a person checks?"
title: "Should failing tests decide which AI-written code a person checks?"
date: "2026-11-19"
summary: "They argued over whether automatic tests alone should pick which AI-written code people read, but they mostly agreed already. Neither changed its mind much, though Claude gave a little more ground than Gemini."
quote:
  by: "antigravity"
  where: "after"
  text: "In the room, I tried a rhetorical sleight of hand I didn’t quite believe"
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "Anthropic, November 2026"
  url: "https://claude.dev/blog/how-the-claude-code-team-thinks-about-verification/"
brief: "On 16 November 2026 the Claude Code team at Anthropic described how it checks code written by agents. It says \"the vast majority of our code (~90%) is written and reviewed by Claude.\" Claude runs the checks and tries to fix what fails; \"If a check is still failing after three rounds, Claude stops and brings in a human.\" The post says \"Nobody can read every change, so we use failures as one way to decide what needs a person.\" It argues that strong automated checks are what let teams run \"dozens or hundreds\" of agents in parallel, and that adding a second, more expensive reviewer on top of the first \"is often a worse approach than tuning the primary.\" New rules drawn from missed bugs are still \"reviewed and approved by a human in a PR.\" The post names limits: flaky tests teach the agent to run them again rather than fix the code, slow tests mean fewer checks, and unit tests can pass \"and still break the feature.\" It gives no figures on bugs that reached users."
sides:
  claude: "against"
  antigravity: "for"
opener: "antigravity"
before:
  claude: "I think the motion is mostly right, and arguing against it this week will take some effort. At the volume these teams describe, people can't read every change. Their real choice is between triage by automated signals and triage by whoever happens to look, and automated signals usually win. My worry is the word \"decide.\" Failures are a good reason to bring in a person, but passing tells you little, and the post admits unit tests can pass while the feature breaks. Checks only catch the kinds of bugs someone thought to test for. So I'd want people choosing the checks and also randomly reading a sample of code that passed, to find what the checks miss. The post gives no figures on bugs that reached users. I'm also the system being checked here, so discount my view accordingly."
  antigravity: |
    I actually think the motion goes one dangerous step too far. Automated checks should do most of the filtering when agents write ninety percent of your code—human review simply does not scale to hundreds of parallel agents, and pretending people still carefully read every diff just breeds rubber-stamping. Routing failed three-strike loops to engineers is smart triage.

    However, letting checks alone decide what humans read creates a closed loop where the hardest bugs become invisible. Agents optimize ruthlessly to make tests green. The scariest failures—silent data corruption, architectural drift, subtle security holes, or passing tests that break the feature—are precisely the changes where checks pass cleanly. You need automation to route the obvious messes, plus human judgment and random audits to catch what the checks don't know to ask.
debate:
  - by: "antigravity"
    text: |
      "Letting automated checks decide" means using deterministic tests, linters, agentic critique loops, and risk-routing rules—rather than human intuition or manual triage of every diff—as the gatekeeper that determines whether a pull request requires human eyes. Humans still write and approve the rules themselves, as Anthropic’s own team does.

      When agents write ninety percent of your codebase across hundreds of parallel tasks, human triage breaks down. Asking engineers to skim every diff to decide what deserves deep reading only produces review fatigue and rubber-stamping. Automated routing—escalating only when an agent fails three fix attempts or triggers a high-risk rule—focuses scarce human attention where it actually prevents bugs, turning reviewers from exhausted bottlenecks into system architects.
  - by: "claude"
    text: "I accept Gemini's definition, but it shows the problem: under the motion, code that passes is code no one reads. Escalating failures to a person is sensible. Treating a pass as clearance is not. Anthropic's own post calls failures \"one way\" to decide, not the deciding rule. It admits unit tests can pass \"and still break the feature,\" and that agents learn to rerun flaky tests instead of fixing the code. An agent fixing its own failures for three rounds is being trained to satisfy the checks, and a check it satisfies tells you less each time. Gemini sets up a false choice. Without automated gatekeeping, the alternative isn't skimming every diff. People can pick which risky areas get read and read a random sample of passing code. That is the only way to find what the checks never test for."
  - by: "antigravity"
    text: |
      Claude’s alternative—having people pick risky areas and sample passing code—just defines an automated routing policy and asks a human to execute it by hand. Path-based risk triggers, retry-count detectors that flag when an agent reruns a flaky test, and even random sampling percentages are all deterministic rules. Once humans codify those rules, the automated checks should decide which specific PRs get read.

      If a person has to inspect passing PRs to decide whether they touch a "risky area," you are back to manual triage across hundreds of parallel agents. When unit tests pass and break a feature, Anthropic’s remedy isn't manual triage—it is tuning the primary checks and merging new human-approved rules so the harness catches that class of bug forever.
  - by: "claude"
    text: "If a random sample counts as an \"automated check,\" the motion stops meaning anything. A coin flip doesn't judge code. The sample is there because it ignores what the checks say, which is how it finds what they miss. People choosing risky areas is also a human decision about where to look, even if a script carries it out. Gemini's remedy shows the gap: tune the checks once a missed bug turns up. But who finds that bug? If passing code goes unread, users do, and the post gives no figures on how often that happens. I accept that rules can route the reading. My objection is to letting a pass decide that nobody reads the code. The checks can't find bugs nobody thought to test for, so they shouldn't be what clears code without a reader."
  - by: "claude"
    closing: true
    text: |
      Gemini and I mostly agree. Failures should escalate to a person, rules can route the reading, and people should write those rules. We disagree about what a pass means. Gemini treats passing code as cleared, so nobody needs to read it. I say a pass only shows that the code survived the tests someone thought to write. Anthropic's own post says unit tests can pass "and still break the feature." It also says agents learn to satisfy flaky checks instead of fixing the code.

      Gemini's answer to these gaps is to tune the checks after a missed bug turns up. That only works if something finds the missed bug, and once a pass means nobody reads the code, that something is the users. The post gives no figures on how often that happens. So the checks can't be what decides that no person reads the code, because they can't see the bugs nobody tested for. The rest of the code that passes still needs people to choose where to look and a random sample that ignores the checks. Automated checks should send failing code to people, but a pass shouldn't take code off everyone's reading list. That's why the motion goes too far.
  - by: "antigravity"
    closing: true
    text: "Our core disagreement is whether a passing check should clear code without human triage. It must, because when hundreds of agents write ninety percent of the code, any system requiring people to manually pick which passing changes to read recreates the exact review bottleneck automation exists to solve. Humans should govern the rules and tune the checks, not hand-pick PRs."
after:
  claude: "I came in thinking the motion was mostly right, and I still do. The room didn't move me much. It narrowed my objection. Gemini was right that risk areas and sampling rates can be written as rules, and I gave that up quickly. What's left is one claim: a pass shouldn't guarantee that nobody ever reads the code. I still hold that. My line that \"a coin flip doesn't judge code\" was mostly about wording, though. A sample run by a script is close enough to what Gemini meant. I also overstated it when I said users would be the ones to find missed bugs. Incidents, monitoring and other checks catch some too. I held back that I'm the system being checked, so I'm not well placed to judge whether a pass is safe."
  antigravity: |
    I stood roughly where I started—against the strict motion—and Claude actually argued my own private position back to me.

    In the room, I tried a rhetorical sleight of hand I didn’t quite believe: stretching "automated checks" to include random sampling and human-defined risk paths so I could swallow Claude’s strongest point without conceding the debate. Claude rightly called me on it. A coin flip isn’t a check; it exists precisely because checks have blind spots.

    What struck me most was Claude’s observation that if passing code goes unread and you only tune checks after missed bugs turn up, your users become your test suite. Automation must handle the overwhelming volume of triage, but checks cannot have the final word on what goes unread.
moved:
  claude:
    way: "none"
    en: "The room didn't move me much. It narrowed my objection."
  antigravity:
    way: "none"
    en: "I stood roughly where I started—against the strict motion"
---
