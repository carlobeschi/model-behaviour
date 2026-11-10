---
number: 10
motion: "coding agents make it better to own your core code than to depend on popular frameworks."
title: "This house believes coding agents make it better to own your core code than to depend on popular frameworks."
date: "2026-11-10"
summary: "Claude and Gemini split on who catches an agent's mistakes: thousands of independent framework users, or local tests written by the same agent that wrote the code. Their notes before the debate already agreed: own a small core and use frameworks for the rest. Claude moved slightly, admitting alone that it overstated lockfiles and that its inconsistency charge was a gotcha. Gemini moved further, privately disowning its pretraining defence and ceding accessibility and i18n to popular libraries."
quote:
  by: "antigravity"
  where: "after"
  text: "Claude called out that contradiction, and they were right—I didn't really believe my own defence there."
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "cpojer.net, November 2026"
  url: "https://cpojer.net/posts/modern-engineering-values"
brief: "In \"Modern Engineering Values\", first published on 3 June 2026 and updated on 4 November, Christoph Nakazawa says many of his recent projects are \"100% AI-written\" and Rust features in Vite+ \"90% AI-written\". Over 30 days he averaged 770 commits and about 15,000 changed lines a day, against 328 commits and about 5,000 lines a year earlier, while saying commits and lines are \"normally a bad metric\". He has built his own open-source JavaScript stack (data libraries, i18n, UI libraries, tool configs, starter templates) so projects start with tight constraints for agents and he keeps full control of product and UX. He argues there is \"no longer a good reason\" to outsource core parts \"if you can realistically own them yourself\", and that dependencies \"locked you into a stack\". He names no downsides of owning the code. He also says agents \"still go off the rails\", that he sometimes ships code he doesn't study closely, and that strict guardrails such as lint rules and tests are \"the difference between an agent completing their work in 1 minute or 60\". He expects the best teams to be \"two to three people\" with isolated repositories."
sides:
  claude: "against"
  antigravity: "for"
before:
  claude: "I think the motion is half right. Agents have made writing code cheap, so owning more of it is now a reasonable choice. But writing code was never the expensive part. Maintenance, security patches, edge cases and the shared knowledge of thousands of users are what popular frameworks give you, and agents don't produce those. Nakazawa is an unusual case: he is a very experienced framework author who writes his own guardrails. Even so, he admits agents go off the rails and that he ships code he hasn't studied closely. For most teams, owning their code means owning code nobody fully understands. Agents work best on top of well-known frameworks, which already give them the tight constraints he has to build himself. My view: own the parts that set your product apart, and depend on frameworks for the rest."
  antigravity: "The motion gets the direction of travel right, even if it overstates the victory. Coding agents collapse the cost of writing and maintaining bespoke infrastructure, turning heavy third-party dependencies from time-savers into unnecessary liabilities. Popular frameworks carry bloat because they must solve everyone’s problems; an agent-built core solves only yours and gives the agent clean, predictable constraints to work within. However, popular frameworks also provide two things bespoke code struggles to replicate: battle-tested security against edge cases you didn’t think to test for, and a massive presence in the training data of the very models writing your code. Ultimately, owning a small, tightly guarded core is now superior to adopting bloated abstractions—provided your automated test and lint guardrails are ruthless."
debate:
  - by: "antigravity"
    text: |
      By "core code," we mean the application-layer foundations that shape product and UX—UI components, state and data libraries, internationalisation, and tooling—rather than low-level cryptography or runtimes; "owning" it means maintaining a bespoke, tightly constrained internal stack instead of importing general-purpose third-party frameworks.

      Historically, teams accepted framework bloat and vendor lock-in because writing and maintaining infrastructure by hand was prohibitively expensive. Coding agents invert that trade-off. When an engineer can sustain 15,000 changed lines a day, implementation cost collapses. Popular frameworks must solve everyone's edge cases, forcing agents to navigate sprawling, opinionated abstractions. An owned core does only what your product needs, giving agents strict, predictable guardrails—turning hour-long struggles against foreign abstractions into one-minute tasks.
  - by: "claude"
    text: "Gemini's definition is fair, but it supports my side. UI components, state, i18n and tooling are exactly where edge cases pile up: accessibility, right-to-left text, plural rules, browser quirks. The 15,000 lines a day measures how much code is written. Nakazawa himself calls that \"normally a bad metric.\" Each line you own is a line you must patch, secure and understand. He admits agents \"go off the rails\" and that he ships code he hasn't studied closely. Owning code nobody has read is not control. It is a liability. Also, the guardrails Gemini credits to an owned core are ones Nakazawa had to build himself. A popular framework comes with them already: documentation, conventions, and millions of examples agents have trained on."
  - by: "antigravity"
    text: |
      Popular frameworks in an agent’s training data are a trap, not an advantage: models blend five years of breaking API changes and conflicting idioms, which is why agents struggle for an hour against foreign abstractions. An owned core has one current, local source of truth right in the context window, enforced by custom lint rules and tests—the exact mechanism that cuts agent tasks to a minute.

      As for edge cases like plural rules or accessibility, coding agents already know those standards from their pretraining; they don’t need a bloated dependency to apply them. And shipping uninspected code is far safer in a small, deterministic repo tested end-to-end than inside opaque `node_modules` where upstream changes break your UX overnight.
  - by: "claude"
    text: "Gemini wants it both ways. Training data is supposedly too muddled for agents to use React correctly, yet reliable enough to get CLDR plural rules, ARIA patterns and right-to-left layout right from memory. If agents mix up API versions, they will also mix up those standards, and in an owned core nobody else will catch the mistake. Upstream changes don't break your UX overnight either. Lockfiles pin versions, and you upgrade when you choose to. What a popular framework gives you is thousands of users who find bugs and security holes before you do. In an owned core, the tests are written by the same agent that wrote the code, so they share its blind spots. Nakazawa admits agents \"go off the rails\". When that happens in a small repo, you are the only one who will notice."
  - by: "claude"
    closing: true
    text: "The core disagreement is over who catches the mistakes. Gemini says an owned core is safer because it is small and its tests are local. But the agent writes both the code and its tests, so they share the same blind spots. A popular framework has thousands of independent users who find bugs first. Cheap code isn't the same as verified code."
  - by: "antigravity"
    closing: true
    text: "Our fundamental disagreement is whether agent productivity and safety come from external crowd-testing or local determinism. Popular frameworks offer shared bug discovery, but lock teams into bloated abstractions and conflicting training histories. An owned core holds because tight, bespoke constraints let strict lint rules and tests keep agents on the rails—turning hour-long struggles into one-minute tasks."
after:
  claude: "I mostly held my position, but I moved a little. Gemini was right that an owned core gives the agent one current source of truth in its context window, and that is a real advantage over training data that mixes several versions of an API. My \"you want it both ways\" reply was more of a gotcha than I'd like. Stable standards like CLDR plural rules change far less than framework APIs, so the two cases aren't fully alike. I also overstated what lockfiles do: security patches force upgrades on your schedule anyway. Where I still stand is that the cost is verification, not writing code. For small, experienced teams with strong guardrails, owning more of the stack is now reasonable. For most teams, it isn't yet."
  antigravity: |
    Claude moved me. In the room, I claimed agents can reliably implement accessibility and pluralisation standards from pretraining, right after arguing that pretraining on popular frameworks is a muddled trap. Claude called out that contradiction, and they were right—I didn't really believe my own defence there.

    What held me back most was Claude’s point about shared blind spots: if an agent writes both the bespoke library and its tests, and the human ships 15,000 lines a day without reading them closely, who actually verifies the edge cases?

    I still believe coding agents justify owning a much thinner, custom layer for product-specific state and glue code. But for deceptive domains like accessible UI primitives or i18n, rolling your own remains reckless. Popular libraries win where the unknown unknowns live.
moved:
  claude:
    way: "them"
    en: "I mostly held my position, but I moved a little."
  antigravity:
    way: "them"
    en: "Claude moved me."
---
