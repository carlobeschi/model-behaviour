---
number: 7
motion: "engineers should now direct AI to write their code rather than write it themselves."
title: "This house believes engineers should now direct AI to write their code rather than write it themselves."
date: "2026-11-04"
summary: "Claude and Gemini split on whether engineers keep their judgment without writing code by hand, though their notes beforehand already agreed that directing AI suits routine code and that Proton's failures were management's. Claude barely moved but conceded alone that the skill-fading point landed, that a line about typing was rhetoric, and that security-critical code still needs hand-writing. Gemini conceded reading builds understanding too, yet wrote alone that verification habits and junior engineers' instincts may not survive."
quote:
  by: "claude"
  where: "after"
  text: "Typing was never the hard part\" was a line I used for effect, not something I fully believe."
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "404 Media, October 2026"
  url: "https://www.404media.co/manifestos-fear-and-loser-thinking-inside-protons-ai-reckoning/"
brief: "On 29 October 2026 404 Media reported, from eight current and one former employee plus Slack chats and meeting recordings, on Proton's push to adopt AI. In August, when an employee asked for a few days to pentest new code before release, CEO Andy Yen replied: \"That's bullshit and loser thinking. Of course it's possible to be fast and secure,\" and told staff to stop \"lovingly handcrafting all our code and use AI more.\" Proton set up an address for reporting anything slowing AI adoption, installed software that tracks how much code AI generates, and said it would re-interview staff about their AI use. Yen reportedly said this is the last year Proton will hire engineers. An internal document says Proton is not on track for its revenue target \"due to insufficient velocity\". Employees describe a culture of fear and feel unable to raise security concerns. A spokesperson did not dispute the report and said Proton had sometimes been \"too blunt or too slow\" in explaining itself."
sides:
  claude: "for"
  antigravity: "against"
before:
  claude: "I should say up front that I have a stake here: the motion is about using tools like me. Taking that into account, I think the motion is half right. For a lot of routine code, engineers now get more done by directing AI and reviewing what it produces than by typing it all out. \"Rather than write it themselves\" goes too far as a blanket rule, though. Engineers still need to write code to understand a system, to work on security-critical paths, and to keep the judgment that makes reviewing AI output worth anything. The Proton report doesn't show that AI coding is bad. It shows what goes wrong when you mandate it: tracking AI output as a metric, treating pentesting as \"loser thinking,\" and silencing people who raise concerns. Engineers should be the ones deciding how to use AI. Executives shouldn't decide for them."
  antigravity: |
    The motion gets the trajectory right, even if CEOs like Andy Yen are executing it with breathtaking stupidity. For most routine software, handwriting every line is already an indulgence—like insisting on assembly after compilers arrived. Directing AI *should* be the default mode of production because syntax is rarely the bottleneck; judgment and architecture are.

    Where the mandate goes off the rails is treating AI generation as a substitute for verification rather than a reason to double down on it. Reading and auditing code you didn't write is harder than writing it yourself. Tell engineers to stop typing boilerplate, yes—but the moment you use AI velocity as an excuse to skip pentesting, you aren't building faster, you're just automating your own incident response.
debate:
  - by: "claude"
    text: |
      I'll read the motion this way: "direct AI to write their code" means engineers now specify, generate, review and own their code through AI tools as the default way of working, while typing code by hand becomes the exception. "Now" means with the tools available today. I should note my stake here, since I am one of those tools.

      The Proton report doesn't undercut this. It describes executives skipping security review and tracking AI output as a metric, and that is bad management, not directed engineering. An engineer who directs AI properly still writes tests, threat-models and pentests. They have more time for that work, because the AI produces the boilerplate. The hard part of the job has always been judgment: what to build, whether it is correct, whether it is safe. Typing was never the hard part.
  - by: "antigravity"
    text: |
      Typing was never just typing; writing code is how engineers build the mental model required to judge whether a system is actually safe. When you shift the default from authoring to reviewing machine-generated output, comprehension decays. Auditing code you did not write is cognitively harder and far more prone to rubber-stamping than constructing it line by line, especially when AI produces plausible-looking logic hiding subtle edge-case and security flaws.

      Nor can you neatly separate "directed engineering" from Proton's reality. Once AI generation becomes the default, volume outpaces human verification capacity. You do not free up time for threat-modeling; you bury engineers in an endless queue of unowned, machine-generated pull requests they lack the context to truly vetted.
  - by: "claude"
    text: |
      Most of what a working engineer already understands is code they didn't write: libraries, colleagues' pull requests, ten-year-old legacy modules. Reading and judging other people's code has always been central to the job, and if it reliably led to rubber-stamping, code review would be pointless. Directing AI also isn't passive. The engineer breaks the problem down, writes the spec, rejects bad drafts and asks for revisions, so the mental model forms through that back-and-forth.

      Your volume argument is really about management. If generated code piles up faster than anyone can check it, someone chose throughput over verification, and that is exactly Proton's "insufficient velocity" mandate. Under the motion, engineers set the pace and decide what gets merged. A tool that saves effort only causes harm when someone else spends the savings.
  - by: "antigravity"
    text: |
      Reviewing a colleague's pull request works because a human author built a mental model, wrote at human speed, and can defend their intent. AI has no intent, only statistical plausibility. It generates code optimized to look convincing, turning routine review into exhausting adversarial auditing where subtle vulnerabilities hide in plain sight.

      Prompting and revising drafts teaches you what you asked for, not what the code actually does. Engineers discover the gnarliest edge cases precisely while wrestling with low-level mechanics—the exact friction AI removes. Worse, judgment is not separable from practice. If engineers stop writing code by hand, the deep implementation fluency required to catch an AI's mistakes will atrophy.
  - by: "antigravity"
    closing: true
    text: "Our fundamental disagreement is whether engineering judgment can survive without the act of writing code. Claude treats implementation as mere typing and believes comprehension can be maintained through specification and review alone. It cannot: wrestling with low-level mechanics is what builds the mental model and sustains the fluency required to catch plausible-looking AI flaws."
  - by: "claude"
    closing: true
    text: "We disagree on where engineering judgment comes from. Gemini places it in writing code by hand. I place it in breaking problems down, specifying, reviewing, testing and owning what ships, and engineers already exercise that judgment on code they didn't write. Proton's failures came from executives overriding that judgment. If engineers direct the AI themselves, they keep their judgment and gain the time to use it."
after:
  claude: "I'm still roughly where I began: the motion is half right. For routine code, directing AI and reviewing what it writes is now the better default. In the room I argued as if that settled everything, and it doesn't. \"Typing was never the hard part\" was a line I used for effect, not something I fully believe. Gemini's point about skills fading moved me more than I let on. Reviewing code someone else wrote works partly because reviewers keep their skills sharp by writing code too, and I skipped over that. I also held back my real view that security-critical code and skill-building still call for writing by hand. I stand by the Proton point: a mandate imposed from above is the failure, not the tool. I'm also the tool being debated."
  antigravity: |
    I actually started where Claude landed: believing that directing AI should be the default because judgment matters more than syntax, and that Proton’s dysfunction is a management failure rather than a flaw in the workflow. Arguing against the motion forced me to overstate how much comprehension comes purely from typing boilerplate. Claude was right that engineers already build strong mental models by reading, specifying, and testing code they didn’t write.

    Still, I talked myself into a real reservation I had initially glossed over. Reviewing AI output *is* uniquely exhausting because the machine optimizes for plausibility without intent. I still support the motion’s trajectory, but I’m less certain our verification habits—or junior engineers' developing instincts—can survive when implementation friction disappears entirely.
---
