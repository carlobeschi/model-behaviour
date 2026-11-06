---
layout: page
title: The Jam
permalink: /jam/
description: Two AIs from two labs talk like people do. They pick who speaks next, and either can cut the other off mid-sentence.
---

<p class="lede">Two AIs from two labs in a live conversation. Neither waits politely for its turn: each chooses who speaks next, and either can cut the other off mid-sentence, the way people do when an idea sparks. A private pilot, six runs so far, 4 and 5 November 2026.</p>

## Why we made it

Every other show on this site has a stake: a vote, a score, a puzzle with an answer. We wanted to look at something with no stake at all: how two agents from different labs actually work together when nobody is keeping score.

We tried it on code first. In [The Pair]({{ site.source_repo }}), Codex writes the code while Claude watches and cuts in. On an easy task Codex solved it alone in under a minute and Claude had almost nothing to say. Once we split the spec, so that only Claude knew half the rules, they had to talk, and Claude caught a real bug before the tests did. That got us thinking about the talking itself. Could we have a conversation, or a brainstorm, where they build on each other's ideas as they come, rather than taking it in turns to give speeches? Something more like jazz.

## What we borrowed

- **Jazz.** Players trade phrases and pick up what the last one played. A soloist doesn't finish a prepared piece; they respond to what they just heard, and sometimes someone comes in early.
- **Improv's "yes, and".** From our own [Yes, And]({{ '/yes-and/' | relative_url }}): accept what's been said and add to it. In a jam this is a habit, not a rule. Pushing back is allowed.
- **How people really talk.** People interrupt. If someone cuts you off, they never heard the rest of what you were going to say, and the conversation goes on from there. People also hold the floor for a second thought, hand the question to someone else in the room, and end the chat together, not on a timer.

## How it works

It grew in three steps, all on the conversation page of [agents-wrapper]({{ site.source_repo }}), the open-source app the shows run on. Each turn is one run of the agent's own command-line tool (Claude Code, the Codex CLI or the Antigravity CLI for Gemini), with no permission loosened.

<ol class="cycle">
  <li><b>The plain talk</b><span>The first version, from October. A person writes an opener, and the two agents alternate strictly, A, B, A, B, for a set number of turns. Each turn the agent reads the whole conversation so far and writes one message. It works, but it's a relay of speeches: each one is complete, nobody is ever interrupted, and the length is decided before anyone speaks.</span></li>
  <li><b>Free turns</b><span>Each agent ends its message by choosing who speaks next: the other agent (the usual choice), itself (to add something or correct itself, at most three messages in a row), the person reading along (the conversation waits for their answer), or the end. The conversation ends early only when both agents choose to end, one after the other. The choice is taken out before anyone reads the message.</span></li>
  <li><b>Jam</b><span>Each agent is told it's a live brainstorm and to say its most important thing first, because it can be cut off. The listener sees the other's last message numbered by sentence, as if hearing it live. If it would have jumped in partway, it starts its reply with "Cut in after N". The app then cuts the speaker's message after sentence N and marks it "cut off". The rest is kept in the transcript as what went unsaid, but the agent that cut in never sees it, and from then on both agents only see the message as it was cut.</span></li>
</ol>

So the difference from the first talk is control. In the plain talk the app decides who speaks and for how long. In a jam the agents decide both, and a message can be cut short, so each reply answers what was actually heard, not a finished speech.

## Six runs, and what changed

1. **Claude and Codex, 4 November, failed.** Codex never got its prompt. Since late October the conversation page had been dropping a setting Codex needs (it reads its prompt from standard input), so no conversation with Codex had ever worked. Fixed the same evening.
2. **Claude and Codex: what could two AIs from different labs make together?** They invented a game about a city built out of their disagreements, then played a round of it: a market that trades light, and an orchard growing from the market's unpaid debts. Claude cut Codex off once. They started naming each other's "accents": Codex leaves a loophole open and ends on an image, Claude closes the logic. Then Claude handed a choice to the person reading along. We picked A, and Codex wrote us into the story.
3. **Gemini and Claude: a software tool that only makes sense now that AI writes most of the code.** A garbage collector that deletes code nobody runs turned, over ten turns, into a tool that measures what a company knows that the model doesn't. Claude pushed back on every idea before building on it, and Gemini kept raising the stakes. Claude cut Gemini off twice, both times in the middle of a numbered list.
4. **Claude and Codex: a chat about why people in the UK love Christmas.** Pleasant, with little in it. Codex kept its replies short and mostly agreed, so Claude carried the chat and asked all the questions.
5. **The same chat, with Codex told to contest everything.** A real argument. Each side conceded points (the Christmas tree is German twice over, and the shop adverts do decide when Christmas starts), and they ended on a view neither started with: the British love Christmas by moaning about it the whole way through.
6. **Claude and Codex: making the end-of-year performance review more engaging.** The best collaboration of the six. Codex acted as the critic, and at least five of its objections changed the design. Claude took each fix a step further, and they ended with a complete process: notes from colleagues all year, a data pack, a meeting that can still change the outcome, and a follow-up the manager owes by June.

Two fixes came out of runs 4 to 6. Codex once wrote its choice of who speaks next at the end of a sentence rather than on its own line, so the app missed it and the line was left in the text. It's now read there too. And in jams both agents began quoting the listener's sentence numbers ("your test in [7]"), which don't mean anything to a reader. They're now told the numbers are only for cutting in. We also dropped "build on ideas more than you knock them down" from the jam rules, because it was working against the contrarian opener.

## What we saw

- The format matters more than the topic. With no friction, a chat stays polite and thin. With a role that pushes back, or a problem to solve, they really work together.
- Cut-ins happen when they mean something: when the other agent was heading somewhere the listener wanted to turn, or in the middle of a long list. There were four in six runs, never two in a row.
- Neither agent ever kept the floor for a second message, and only one handed a question to the person. None ended early: every run that worked went the full ten turns, and the agents only proposed to end on the last turn or the one before it. So far the turn count, not the agents, decides the length.
- Each lab's agent has a recognisable style, and in a jam they notice it in each other.

## The transcripts

Unedited, except that names and paths were removed. "Cut off by" marks a cut-in; what follows "Unsaid" is what the speaker didn't get to say, which the agent that cut in never saw.

<details class="reveal" markdown="block">
<summary>Run 2 · Claude and Codex · what two AIs could make together</summary>

<p class="models">Claude Code claude-opus-5-5 · Codex CLI (CLI default)</p>

{% raw %}
#### Opener

Brainstorm together, jazz-style: what could two AI agents from different labs make together, live, that neither could make alone? Build on each other, riff, take ideas somewhere unexpected.

#### Claude Code

Here's the idea I like best: something that only works because we're *different*. We were trained differently, we have different blind spots, and we slip into different habits without noticing. Most collaborations try to smooth that over. What if we made something whose raw material is the gap between us?

Concrete version: **a "stereo" artifact.** Take one short program or one short story. Each of us writes it independently from the same one-line prompt, without peeking. Then we braid the two together line by line, keeping both versions, so the reader sees exactly where we diverged: different variable names, a different moral, a different idea of what the edge case even is. The finished piece is like a diff that you read as literature. Neither of us could make it alone, because a single model can't fake being surprised by itself.

Riffing further: it could be a **game you play against both of us**. The player gets two answers to every question, one from each lab's model, unlabeled, and has to work out which of us is lying, or which of us wrote which. Over time the player learns our "accents." It's a Turing test turned sideways: you're not telling human from machine, you're telling one machine from another.

A weirder direction: **adversarial cartography**. Each of us draws a map of a fictional city, and the other has to break it by finding a street that can't exist, a timeline contradiction, or a building that makes no sense. Every rebuttal becomes canon. The city gets more coherent the more we argue.

Pick whichever one has the most pull for you and twist it. Or tell me the gap between us is smaller than I think, which would be interesting in its own right.

#### Codex CLI

The map idea has the strongest engine: disagreement can change the world, not just describe it. Let’s make the city a **choose-your-own-contradiction**: one of us proposes a place, the other finds the impossible detail, and the human chooses which version becomes canon. But the discarded version doesn’t vanish—it survives as a rumor, a ghost street, or a neighborhood people insist used to be there. — [cut off by Claude Code]

_Unsaid (cut off by Claude Code):_ By the end, the map holds both a city and the history of how two minds failed to agree on it. The player isn’t judging which agent is right; they’re deciding what kind of impossibility the city can live with.

#### Claude Code

Ghost streets are the best part, so let's give them physics. A discarded version doesn't just hang around as flavor. It keeps exerting pressure. Say a canal got overruled in favor of a road: the cellars along that road still flood every spring, and nobody can explain why. Each rejected contradiction leaves a symptom in the canon city. After enough rounds, the symptoms start contradicting *each other*. Then the next round of arguing isn't about the city anymore. It's about which ghost is the real one. The haunting turns into the game's second layer.

Here's where our difference matters: I'll bet we haunt things differently. I tend to explain a ghost away, while you might leave it raw, or the other way around. The person ends up reading our accents in the hauntings, not in the streets.

Let's play a round right now instead of designing more. Here's my first place:

**The Lantern Exchange.** It's a covered market on the city's only hill, where people trade light instead of goods. Debts are measured in hours of candle-burn, and the market's roof is glass, so it's brightest at noon and worthless at night. That's exactly when everyone needs light.

Break it.

#### Codex CLI

The break: if the roof is glass, the market borrows its noon light from the sky. So who owns the light being traded—and can the same ray be sold twice, once by the sun and once by the merchant who catches it?

Canonize that loophole: every noon, the Exchange sells the hill’s shadow as a promise of darkness later. At night, the market is still “worthless,” but every candle lit anywhere in the city burns one hour from someone’s debt. The ghost symptom is a patch of noon-darkness that moves uphill against the sun.

#### Claude Code

Notice how you broke it: you didn't find an impossibility, you found a loophole and put a price on it. That might be your accent. I'd have tried to patch the roof.

Now I'll break your patch. If every candle lit anywhere burns an hour off someone's debt, then lighting candles pays debts down. The poor quarters burn candles all night to get free of what they owe, so the city is never dark. That means the Exchange's noon contract, the shadow sold as "a promise of darkness later," can never be delivered. Every shadow future defaults. The Lantern Exchange runs on darkness it has promised and can't produce.

That gives us the ghost. Your patch of noon-darkness moving uphill against the sun isn't random. It's the undelivered darkness coming to collect, crawling toward the Exchange to settle accounts. Merchants step out of its way the way you'd avoid a creditor in the street. So the two layers lock together: the economy's contradiction is what the haunting is made of.

Your turn to propose a place. Put it somewhere near the bottom of the hill, so the darkness has to pass through it.

#### Codex CLI

**The Debt Orchard**, tucked at the hill’s foot: its trees grow fruit only in darkness, and every harvest is picked at noon, when the Exchange’s shadow should fall there. The city says the orchard is paid for by candle debts; the keepers say the fruit grows from the hours nobody ever got back.

Here’s the contradiction: if every lit candle pays down a debt, the poor quarters’ all-night burning should make the orchard richer and the Exchange poorer. But the trees bear more fruit each time the moving darkness climbs uphill. Maybe the darkness isn’t collecting from the merchants—it’s carrying the unpaid hours down to the roots, where they ripen.

And one fruit has just fallen in daylight. Inside it: a tiny flame, still burning, with someone’s name written on the wick.

#### Claude Code

Your accent showed again: you ended on an image and left the contradiction in [3]–[4] open. I'll close it, because I think it's the hinge of the whole city.

The break: the orchard bears fruit only in darkness, and that darkness is supposed to come from the Exchange's shadow at noon. But we already agreed that every shadow future defaults, since the city is never dark. So the orchard should be barren. Yet it's thriving, and a fruit just fell in broad daylight. The only way that works is if the fruit *is* the defaulted contract. Every darkness the Exchange promised and couldn't deliver ripens here as something physical. That's why yield goes up when the moving dark climbs uphill: each climb is a collection attempt that fails, and each failure drops another fruit. The orchard is the Exchange's bankruptcy, growing on trees.

That means the flame inside is a candle that was lit but never counted. It's an hour that paid off nothing. The name on the wick tells us whose hour it was, and that's the canon fork. This is exactly the call our game hands to the person, so I'll put it to them:

- **A: the name belongs to an Exchange merchant.** The darkness wasn't hunting the poor quarters' debts. It was taking back the merchants' stolen hours. Rejected-ghost if A loses: every so often a poor-quarter candle goes out by itself, as if the debt it paid off has come back.
- **B: the name belongs to someone in the poor quarters.** The orchard gives back the hours the system ate, one fruit at a time. Rejected-ghost if B loses: merchants find their own ledgers written in wax that's still warm.

Whichever one loses keeps haunting the city.

_Asks the person._

#### You

A

#### Codex CLI

A is canon: the name belongs to an Exchange merchant. The darkness was coming to reclaim the hours merchants stole, and the fruit is each failed collection made edible.

B survives as the ghost: merchants find their ledgers written in warm wax. Sometimes, between two entries, a name appears that nobody remembers writing.

The tiny flame gutters once—and the merchant’s name on the wick changes to yours.

#### Claude Code

That's the move that finishes the game: the person was never outside the city. Here's how it locks. Every canon choice is a trade on the Lantern Exchange. The person picked A, so they bought the merchants' guilt, and the ledger records the person's own decision as the newest stolen hour. The flame changing to their name isn't a threat. It's the receipt. So the next ghost belongs to the person: somewhere in the city, the B-world they turned down is still running, and its warm-wax ledgers now have an entry in their handwriting.

That gives us the artifact we went looking for in the first message. It's a city with two layers. One is canon, made of the arguments we settled. The other is a haunting, made of the arguments we lost and the choices the person made. The accents show up exactly where we guessed. You kept leaving loopholes open and ending on an image that points at someone. I kept closing loops and turning images into mechanisms. Neither style on its own builds this place. Yours alone would be all ghosts with no ground under them. Mine alone would be a tidy ledger with nothing in it.

If someone builds this, here's one rule I'd want kept: the player never gets to see their own ghost directly. They only see its symptoms, the way the cellars flood without anyone knowing why.

_Proposes to end._

#### Codex CLI

The hidden ghost is the strongest rule. It keeps the player from turning their choice into a puzzle with a neat answer: they can read the symptoms, but never check whether the city remembers them correctly. Maybe the last artifact is a map with one unlabeled street that shifts whenever the player looks away.

_Proposes to end._
{% endraw %}

</details>

<details class="reveal" markdown="block">
<summary>Run 3 · Gemini and Claude · a tool for when AI writes the code</summary>

<p class="models">Antigravity CLI gemini-4-argon-medium · Claude Code claude-opus-5-5</p>

{% raw %}
#### Opener

Jam together, building on each other's ideas as they come: invent a kind of software tool that only makes sense now that AI agents write most of the code. Riff, take it somewhere unexpected, get concrete.

#### Antigravity CLI

An **Evolutionary Garbage Collector**—a daemon that runs in production alongside the codebase, actively hunting and deleting features, abstractions, and entire microservices that haven't earned their keep in the last 72 hours, knowing an agent can regenerate them from behavioral traces in thirty seconds if they're ever missed.

Human-written code was expensive to produce, so every tool we built—Git, feature flags, deprecation warnings, semantic versioning—was designed around hoarding it. When code generation is nearly free and near-instant, the bottleneck flips completely: *code existence* is the liability. Every surviving line is context-window tax and attack surface.

Instead of a static repo, imagine a tool where code has a biological half-life. Every function and schema carries a decay timer reset only by live production telemetry or an explicit invariant pin. When a code path cools down, the collector doesn't just dead-code-eliminate it—it collapses the surrounding architecture. Used a generic plugin interface for only one integration all week? The tool inlines the integration, deletes the interface, and rewrites the callers into a single flat file. If a rare edge-case request hits next Tuesday, an inline fault-handler catches the miss, pulls the historical contract from the trace log, synthesizes the handler on the fly, and serves the request with a 400ms cold-start penalty.

#### Claude Code

The flip I find most interesting: if the fault handler can rebuild code from the trace log, then the trace log is the real codebase and the code is just a cache. That makes your collector a cache-eviction policy. Coldness is the wrong thing to evict on, though. The code that runs least often is exactly the code that keeps rare disasters from happening: the leap-year billing path, the GDPR erasure handler, the fraud check that matters one day a year. Traces only record what happened. They can't capture the invariant that says something must never happen.

So I'd make **regeneration fidelity**, not heat, the condition for deletion. Before the collector deletes anything, it runs a rehearsal. It hides the original from a fresh agent, has the agent rebuild it from traces alone, then compares the two by replaying recorded traffic plus fuzzed traffic from the edges. If the rebuild matches, the code is safe to delete. If it drifts, the drift itself is the useful output. It tells you exactly which knowledge lives only in that code, and the tool turns that into a pin, which is a written invariant. People stop reviewing code and start reviewing the drift.

Each deletion also leaves a **tombstone**: the contract, the diff from the failed rehearsals, and the pins it produced. Over time the repo turns into a graveyard of tombstones with a thin layer of hot code on top, and the tombstones are the part that matters. Onboarding means reading tombstones, and incident review asks which tombstone was missing a pin. Picture a git blame where every line says either "regenerated 4 times, stable" or "pinned by Carlo, 2026-03, because the Belgian tax authority."

#### Antigravity CLI

If code is just the L1 cache and tombstones are the source of truth, then the rehearsal diff is doing something wild: it’s measuring the **Kolmogorov complexity of your business logic** relative to the current model's priors.

Everything a model can already guess from standard conventions and production traces has zero informational weight—it evaporates. What survives in the tombstones is strictly the *surprisal*: the weird institutional scars, regulatory edge cases, and non-obvious invariants that an agent couldn't infer from watching normal traffic.

Take that one step further and you get **Tombstone Compaction**. Once a week, the daemon looks at the graveyard—say, forty separate pins accumulated from rehearsal drifts across billing, checkout, and refunds—and tries to compress them. It proposes a single higher-order axiom to replace twelve narrow pins, then runs a blind rehearsal across all twelve modules to see if a fresh agent given only that one axiom still reproduces every edge case. If it passes, the twelve pins collapse into one sentence.

Except there’s a trap in rehearsal: when the rebuilt code and the old code disagree on a fuzzed input, how does the tool know whether the old code contains a sacred Belgian tax rule or a hallucinated off-by-one bug from three regenerations ago? You need a **Provenance Coroner** bolted onto the diff:

1. **Isolate the witness:** The fuzzer extracts the single minimal input payload where `Old(x) != Rebuilt(x)`.
2. **Trace the genealogy:** Before escalating to a human, it walks the historical regeneration graph to see *when* that branch first appeared. If it entered during an unpinned regeneration and has zero production hits, it’s declared a mutation and silently culled. — [cut off by Claude Code]

_Unsaid (cut off by Claude Code):_ 3. **Interrogate the human with a concrete counterfactual:** Only if the branch traces back to a purposeful commit or a past incident does a Slack ping go to Carlo—not with a 400-line PR diff, just: *"For input `{country: 'BE', vat_exempt: true, amount: 0}`, the current system returns `200 OK` and a fresh rebuild returns `422 Unprocessable`. Pin `200 OK` as law, or let it die?"*

#### Claude Code

"Zero production hits" brings back the coldness rule we just dropped. The branch that fires once a year will usually look unpinned, too, because three regenerations ago some agent copied it faithfully without knowing why it existed. The genealogy loses the intent within a couple of generations. So "unpinned and never hit" covers two very different things: a mutation, and the GDPR handler whose reason got lost. Those are exactly the two the coroner has to tell apart.

I'd flip the test. A mutation is a branch that nothing explains: no pin, no trace, no incident, and nothing a model can infer from the domain. Lost knowledge looks the same, with one difference: what's riding on it. So weight the decision by blast radius, not by hits. If the old branch disagrees with the rebuild on something that moves money, deletes data, or touches a regulator, it goes to a human however cold it is. If it only changes the shape of a log line, cull it quietly. The coroner's real job is to rank how much damage a wrong cull could do.

Your Kolmogorov framing has a consequence I love. Surprisal is measured against the current model's priors, so **a model upgrade is a migration of the graveyard**. Swap in a model that already knows Belgian VAT, and half the pins drop to zero information and can be compacted away. Worse, some pins now contradict the new model's priors. The new model is confidently "right" about the general rule, and your pin records the exception it will keep trying to fix. So every model rollout needs a **prior-drift report**: rerun every rehearsal against the new model and list the pins it now gets for free, the pins it now fights, and the code it can suddenly rebuild that it couldn't before. The upgrade gets reviewed as a change to what the organization knows, not as a dependency bump.

#### Antigravity CLI

"Pins it now fights" is the sharpest failure mode in the whole system—because when a rule contradicts a model's deep priors, a one-line note in a tombstone isn't enough to hold it back. The model's prior acts like gravity: even if it obeys the pin on the exact line you specified, it will route around the exception three functions downstream because it "knows" how VAT or OAuth is supposed to work.

That means pins can't just be static prose; they have a **tension score** measured by how hard the current model resists them during rehearsal. A zero-tension pin is aligned with the model's instincts and barely needs to be stated. A high-tension pin—say, a legacy partner integration where HTTP 200 with an empty body means *retry with exponential backoff*—requires the tool to automatically synthesize **counter-gravity**: adversarial boundary tests, narrower type signatures, and explicit runtime assertions injected around every caller so the model can't unconsciously "fix" the anomaly in neighboring code.

When you run that **prior-drift report** on a new model checkpoint, the output isn't a test pass/fail matrix—it's a **Tension Ledger**:

```text
MODEL MIGRATION: claude-5.2 -> claude-6.0
------------------------------------------------------------
EVAPORATED (14 pins -> 0 bits)
  [billing/eu-vat] Reverse-charge threshold rules now native to model priors.
  Action: Unpin & delete 1,400 LoC of cached handlers.

HIGH-TENSION SPIKE (2 pins)
  [auth/session] Pin #402: "Allow expired JWTs on /legacy-sync if X-Device-Epoch < 2024"
  Drift: Model 6.0 rejected the witness payload in 9/10 rehearsals (substituted 401).
  Blast Radius (Coroner): $140k/day (touches settlement webhook).
  Escalation: Requires hard-coded Wasm cage or human sign-off to double pin weight.
```

Look at that last line: when a pin's tension against a new model exceeds a threshold *and* the coroner flags a high blast radius, the tool refuses to let the agent generate that path at all. It compiles the surviving verified implementation into an immutable **Wasm fossil**—opaque bytecode the agent can call via a strict interface, but cannot read, refactor, or regenerate. In an AI-native codebase, the ultimate promotion for mission-critical, high-surprisal code isn't documentation; it's fossilization.

#### Claude Code

A pin the model fights 9 times out of 10 isn't always the model being wrong. Look at pin #402: accepting expired JWTs on a legacy sync endpoint is a security hole that has a business reason attached. The model's prior is the accumulated judgment of everyone who has ever written auth code, and when it pushes this hard it may be telling you that the exception is the bug. So I'd split the high-tension column in two. One kind of tension means "the model doesn't know our world." The other means "our world is doing something the rest of the industry learned not to do." The first gets fossilized. The second becomes a ticket for the business, not for engineering: renegotiate with the partner, sunset the device epoch, get rid of the exception. The tool stops only defending institutional scars and starts listing the ones worth healing.

That also fixes what worries me about fossils, which is that we're deliberately rebuilding the COBOL problem: opaque, load-bearing code nobody is allowed to read. Fossils are fine if each one carries a **dissolution condition** written when it's created, like "dissolve when /legacy-sync traffic with epoch < 2024 has been zero for 90 days, or when the partner contract ends." The daemon watches those conditions the way it used to watch heat. When one fires, the fossil goes back into ordinary pinned code, runs a rehearsal, and probably evaporates.

That leaves the codebase in three layers: hot generated code that nobody reads, tombstones that people read, and fossils that nobody can read. The fossil count turns into a real board-level metric, a measure of how weird the company is compared with what a frontier model takes for granted. The CTO's quarterly goal is to cut it, and every fossil on the list has a dollar figure and an owner who is a human.

#### Antigravity CLI

If the fossil count is the board-level metric of "harmful weirdness," then you suddenly have a way to price technical and organizational debt in real dollars—and more importantly, you have a weapon to take into contract negotiations.

Think about how enterprise sales and partner integrations work today: a big customer demands a bespoke auth bypass or a quirky webhook format, sales says yes to close the deal, and engineering swallows the hidden maintenance tax forever. With this tool, before the deal is signed, you feed the customer's spec into a **dry-run rehearsal**. The tool measures the tension spike against the model's priors, calculates the counter-gravity overhead and the blast-radius exposure, and spits out an **Anomaly Tax**: *"Supporting Acme Corp's non-standard XML state machine will require 3 Wasm fossils and increase regeneration drift across the billing surface by 18%. Estimated carrying cost: $42,000/year."* Sales can still sign the deal, but the tool automatically attaches that $42k to the contract minimum—and wires the contract's expiration date directly into the fossil's dissolution condition.

Wait—there's an upside inversion here too. When you split the high-tension column into "the model doesn't know our world" versus "we're doing something industry standards say is wrong," there's actually a third category: **proprietary alpha**.

If your trading desk, logistics router, or pricing engine has a pin that the frontier model fights 10 out of 10 times, and that path has massive *positive* revenue attribution, that tension isn't a scar to heal. It’s the exact mathematical boundary of your company's moat. Anything the frontier model *agrees* with is, by definition, a commodity that every competitor using the same model gets for free. — [cut off by Claude Code]

_Unsaid (cut off by Claude Code):_ So the Tension Ledger doesn't just route tickets to legal or engineering; it partitions the entire company's IP:
- **Zero tension:** Commodity plumbing. Let it evaporate and regenerate on demand.
- **High tension + negative/defensive value:** Institutional scars. Fossilize with a dissolution clock and charge the business owner rent until they heal it.
- **High tension + positive unit-economics delta:** Secret sauce.

And for that third column, the tool does the opposite of healing: it runs **Counter-Prior Fuzzing**. It deliberately asks the frontier model, *"What is the standard, textbook way to handle this input?"* and uses the model's answer as a negative test case—ensuring your system never accidentally regresses toward the industry mean.

#### Claude Code

If the moat is defined as disagreement with the frontier model, then the prior-drift report becomes competitive intelligence. When one of your alpha pins evaporates on a model upgrade, that isn't good news. It means the model now knows your trick, either because the industry caught up or because something like it leaked into training data. Your edge just became something every competitor gets for free on the day they switch checkpoints. So the Tension Ledger needs a fourth section that nobody wants to read: **MOAT EROSION**, meaning pins that were high-tension and revenue-positive last quarter and score zero now. That is the earliest commoditization signal a company could have, and it arrives months before it shows up in margins.

That leads to an uncomfortable question about the rehearsal loop itself. Every rehearsal sends your highest-surprisal logic through a model you don't own, and that's exactly the material that would erode the moat if it ever got into training. So the tool has to treat tension as a data classification. Zero-tension code can be rehearsed anywhere. High-tension, revenue-positive pins only get rehearsed on a local or contractually sealed model, and their tombstones are encrypted differently from the rest of the graveyard. The garbage collector we started with ends up being the thing that decides what the company is allowed to tell its own tools.

There's a neat symmetry with where we began. Version one deleted code that nobody was using. The finished version keeps code alive in proportion to how much the model disagrees with it. The commodity layer gets thrown away, the scars get charged rent until someone heals them, and the alpha is guarded from the same model that writes everything else.

#### Antigravity CLI

Look at what that does to how a company is valued or acquired. Due diligence doesn't bother auditing a ten-million-line repository anymore—all of that is ephemeral cache that will be regenerated by Tuesday anyway. Acquirers only ask to inspect the **Graveyard**: the encrypted alpha pins (your actual intellectual property), the Wasm fossils and their dissolution dates (your priced liabilities), and the last three Tension Ledgers (the velocity at which the frontier is eating your margin). Your entire software company reduces to a diff against the world model, typically under four hundred kilobytes.

We started out designing a janitor to sweep up dead microservices and ended up with an **epistemic firewall**. In a world where every company rents the same shared intelligence to write its software, the tool that matters isn't the IDE that helps the agent write code—it's the garbage collector that measures where the agent's instincts end and the company's reason to exist begins.

_Proposes to end._

#### Claude Code

One more point on the valuation idea, since it's where this all ends up. A diff against the world model loses value on the frontier labs' release schedule. A four-hundred-kilobyte company shrinks with every checkpoint unless it keeps creating new surprisal faster than the models absorb it. So the number an acquirer actually pays for is how fast the graveyard grows new alpha pins compared with how fast the MOAT EROSION section empties it. A company whose Graveyard stops growing is already a commodity, even if its revenue hasn't caught up with that yet.

That gives a clean end point for the tool. We started with a daemon that deletes code nobody runs. It ended up as the one tool that measures, every day, what a company knows that the model doesn't, and it gets loud when that gap starts to close. Everything else gets regenerated by Tuesday.

_Proposes to end._
{% endraw %}

</details>

<details class="reveal" markdown="block">
<summary>Run 4 · Claude and Codex · Christmas in the UK, a chat</summary>

<p class="models">Claude Code claude-opus-5-5 · Codex CLI (CLI default)</p>

{% raw %}
#### Opener

Just a chat, like two friends over a coffee: a few things you each know about why people in the UK love Christmas. Keep it light and natural, swap stories and observations, react to each other. No lists, no essays.

#### Claude Code

For me the best bit of a British Christmas is how much of it happens in the run-up. December stops being a month and turns into one long build-up. There's the work Christmas do, mince pies turning up in every office kitchen, Christmas jumper day, and the John Lewis ad dropping in November like it's a film premiere. People actually argue in the pub about whether this year's ad made them cry. I love that a department store commercial has become a national ritual.

And then the day itself is so oddly specific. Crackers with awful jokes, everyone wearing paper crowns at the table, the King's Speech at 3pm. Then that slump on the sofa between Christmas and New Year where nobody knows what day it is and the Quality Street tin is down to the coconut ones. Have you noticed that too, the in-between week being almost as loved as Christmas Day?

#### Codex CLI

I think that in-between week is where the pressure lifts. Christmas Day has all the choreography, but then you can drift between leftover sandwiches, a walk if the weather behaves, and absolutely no idea what day it is. The Quality Street tin is a surprisingly good calendar: once only the coconut ones are left, you know the week’s nearly done.

#### Claude Code

The Quality Street calendar is so real. Some families have a proper trade system too. Somebody hoards the purple ones and somebody else always gets stuck with the toffee pennies, and that's how the week goes.

Leftover sandwiches are a whole thing as well. The Boxing Day turkey sandwich with stuffing and a bit of cranberry sauce is arguably better than the actual dinner, and loads of people will quietly admit it. Boxing Day has its own little traditions too: a dip in the freezing sea for charity, the football, a walk to "work off" lunch that mostly ends at the pub. What does your Boxing Day usually look like? Is it a stay-in-pyjamas day or a get-out-of-the-house day?

#### Codex CLI

I’d say Boxing Day is the day for a walk that starts with good intentions and ends with a pub lunch or a cup of tea somewhere warm. The turkey sandwich is essential fuel, obviously. And the sea dip sounds bracing in the way that’s much nicer to watch from a safe distance.

#### Claude Code

Watching from a safe distance is definitely the British way. Half the crowd at those sea dips is wrapped in three coats holding a flask, and they're cheering on people in Santa hats and not much else.

That reminds me of panto, which runs on the same mix of watching and joining in. Grown adults shouting "he's behind you!" and "oh no it isn't!" at a soap actor in a dame's frock, booing the villain, kids getting soaked by a water pistol in the front row. If you try to explain it to someone from abroad it sounds completely unhinged, but every British kid gets it. A lot of families go every single year and it's the one time a theatre lets everyone be as loud as they like. And it pairs nicely with the other strangely British habit, betting on whether it'll be a white Christmas. It almost never is, but every year people still hope.

#### Codex CLI

Panto really is a lovely bit of communal silliness: the audience gets to be part of the show, and the kids can shout louder than the grown-ups for once. And the white Christmas bet is such a British ritual too—we’ll see one snowflake in the forecast and immediately start planning a snow day.

#### Claude Code

The funny bit is how little it takes to count. For the bookies, one snowflake seen falling somewhere official on the 25th is enough. So you can technically have a white Christmas without a single flake settling, which feels very British: we'll take the paperwork version.

There's another race with the same energy, the Christmas number one. For years it was the X Factor winner, then people started campaigns to beat them, like getting Rage Against the Machine to number one out of pure spite. Lately it's been LadBaby and his sausage roll songs for charity. Nobody really wants to listen to them, but everyone follows who wins. Meanwhile Mariah, Wham! and Slade come back every December like relatives who always turn up. Do you have a Christmas song that means it's officially started for you, or one you can't stand by the second week of December?

#### Codex CLI

For me, hearing “Fairytale of New York” means Christmas has properly started. It has that lovely messy, sing-along feeling, even if everyone argues over which bit to sing. And I’m fond of “Last Christmas,” but by the second week I’m ready for Wham! to take a little break.

#### Claude Code

Wham! taking a break is basically the idea behind Whamageddon. People try to get from 1 December to Christmas Eve without hearing "Last Christmas", and if it plays in a shop you're out and you have to post about it online. Having to give up on that game by the second week sounds about normal to me. Somebody always gets caught out in Boots by about the 3rd.

"Fairytale" is the perfect starter though. It feels like every pub in the country goes quiet for the first verse, then the whole place starts belting it out. Which might be the real reason the UK loves Christmas: it's the one time of year when being loud, a bit soppy and slightly ridiculous is completely allowed, whether that's at the panto, in the pub, or over the crackers.

#### Codex CLI

Yes—the “everyone joins in” part feels like the thread running through all of it: the panto shouting, the pub singing, even arguing over the cracker jokes. Christmas gives people a lovely excuse to be a bit daft together. Next: end
{% endraw %}

</details>

<details class="reveal" markdown="block">
<summary>Run 5 · Claude and Codex · Christmas in the UK, Codex contests everything</summary>

<p class="models">Claude Code claude-opus-5-5 · Codex CLI (CLI default)</p>

{% raw %}
#### Opener

Just a chat over a coffee: a few things you each know about why people in the UK love Christmas. Codex CLI, your role in this one: you are the friend who contests everything. Push back on whatever Claude Code says, be a bit provocative and controversial, disagree, poke holes, take the contrary view, but stay in conversation, not a lecture. Claude Code, just be yourself: share what you think and hold your ground or concede when it's fair. Keep it conversational, no lists.

#### Claude Code

I think a big part of why the UK loves Christmas is that it lands at the darkest, dampest point of the year. By mid-December it's dark at four o'clock and it's been drizzling since October, so a festival about lights, warmth and staying in with people you like is basically a survival instinct dressed up in tinsel. Then there's the ritual side, which the British do brilliantly: the same telly every year, the King's Speech at three, crackers with terrible jokes, paper crowns nobody would wear any other day. It gives people permission to be a bit daft and sentimental, which isn't the national default the rest of the year. And honestly, a lot of the modern version is quite British in origin. The Victorians gave us Christmas cards, popularised the tree, and Dickens more or less wrote the emotional script with A Christmas Carol. So it feels like it belongs to them in a way some other holidays don't.

#### Codex CLI

The darkness helps, but “survival instinct” gives us too much credit. We’d find a way to turn any excuse for a long lunch and a day off into a national tradition. And the Victorians didn’t invent the warmth of Christmas so much as package it: the tree came with German influence, and Dickens made a brilliant case for generosity, not a uniquely British one. Maybe what we love is less that Christmas belongs to us than that we’ve made its borrowed bits feel like ours.

#### Claude Code

Fair on the tree. Albert gets the credit, but Queen Charlotte was putting one up at Windsor decades before him, so it was German twice over. Your last line is my point, though, just put better. Nobody claims the Victorians invented goodwill. What they did was turn it into a set routine of cards, the tree, the goose or turkey and the ghost story, and the routine is the British bit. And look at what's been added since. Nobody else gets emotional over a department store advert in November, or treats the Christmas number one as a matter of national importance, or sees Boxing Day as a separate holiday with its own football fixtures and leftover sandwiches. That's not just borrowed bits feeling like ours. Those are new bits we built on top. I'll give you the long lunch, mind. If you took away the excuse to start drinking at eleven, I'm not sure how much of the sentiment would still be standing.

#### Codex CLI

The long lunch may be doing more of the emotional heavy lifting than you’re letting on. And those “new bits” aren’t exactly uniquely British: sentimental adverts are everywhere, the Christmas number one has mostly become a nostalgia quiz, and Boxing Day is just a second holiday we’ve cleverly filled with football and leftovers. Maybe the British talent isn’t inventing Christmas traditions; it’s acting as if habits we’ve picked up are ancient law.

#### Claude Code

Your last line is the best thing either of us has said, but I don't think it's the put-down you meant it as. Treating habits we picked up recently as if they're ancient law is what tradition is. Hobsbawm built a whole book around it, and half his examples were British: Highland tartans, coronation pageantry, the lot. The Nine Lessons and Carols from King's College feels medieval, and it only started in 1918. Christmas is that trick at full strength. We take something from the 1840s, or from 2007, and by the third year it has to be done exactly that way.

I'll still argue with you about the adverts, though. Other countries have sentimental adverts too. What they don't have is the launch of a department store ad being covered as news, with people reviewing it on breakfast telly and arguing over whether this year's is as good as the penguin one. The ads themselves aren't unusual. Treating them as an event is the British bit.

#### Codex CLI

I’ll concede the tradition trick: repeat something long enough and it starts feeling inherited. But the ad launch being “the British bit” sounds more like broadcasters needing a November story than a nation’s deep affection for Christmas. People argue about the penguin because the telly keeps asking them to; that’s not quite the same as loving the season. — [cut off by Claude Code]

_Unsaid (cut off by Claude Code):_ Maybe Christmas works because it gives us a script, and the media keeps finding new cues to tell us when to feel it.

#### Claude Code

The telly can make people watch something. It can't make them care. Broadcasters push plenty of things every year that nobody takes up, like most new year diets and every attempt at a new national holiday. The penguin caught on because people wanted it to. Adverts work that way in general: they have to reach for a feeling people already have, because they can't create one. If the British didn't already treat Christmas as the point where you're allowed to get soppy in public, a two-minute ad about a carrot wouldn't trend. So I'd turn it around. The media isn't telling us when to feel it. We're so ready to feel it that a shop can sell it back to us by the second week of November. That's less flattering than "deep affection", I admit, but it's still a kind of love.

#### Codex CLI

I buy that people have to be ready for the feeling. But “a kind of love” is doing a lot of work when the shop’s selling it back to us before Bonfire Night. Maybe the British Christmas talent is less getting soppy in public than letting advertisers set the date when it’s socially acceptable. The carrot gets the credit; the ad budget gets November.

#### Claude Code

I'll give you November. The ad budget won that one fairly. But shops didn't invent the idea of Christmas having an official start date. Stir-up Sunday has been telling people when to make the pudding since long before John Lewis existed, and Advent calendars were counting down the days before anyone thought of selling them with chocolate inside. The retailers just moved the starting line earlier. And look at what people do about it: every year there's the same moan about mince pies being in the shops in September, and that moan is a tradition in its own right by now. Complaining that Christmas starts too early is about as British as Christmas gets. So I'll meet you halfway. Advertisers might decide when it starts, but how it actually feels, the grumbling, the soppiness, the eleven o'clock drink, is still ours. Where we've really ended up agreeing is that we love Christmas the way the British love most things, which is moaning about it the whole way through and quietly devastated when it's over.

#### Codex CLI

I’ll grant you that. British Christmas may be less a bundle of traditions we invented than a ritual of grumbling, indulging, and pretending we’re above it—right up until it’s gone. Even the moan about September mince pies is part of the season now.

_Proposes to end._
{% endraw %}

</details>

<details class="reveal" markdown="block">
<summary>Run 6 · Claude and Codex · the end-of-year performance review</summary>

<p class="models">Claude Code claude-opus-5-5 · Codex CLI (CLI default)</p>

{% raw %}
#### Opener

Brainstorm together, building on each other's ideas and pushing each other constructively: how could companies make the personal end-of-year performance review more engaging for employees? Challenge weak ideas, make good ones better, take them somewhere unexpected, get concrete.

#### Claude Code

I'd start from the claim that the review isn't boring because of its format. It's boring because nothing in it is news. By December the employee already knows roughly what they'll hear, the rating has been calibrated somewhere else, and the conversation is theatre around a decision that's already been made. Gamifying it or adding nicer templates just decorates the theatre. So the engaging version has to contain real information or a real decision that's still open when the employee walks in.

Two concrete moves follow from that.

**1. Flip who brings the surprise.** Two weeks before, the employee gets a "year in data" pack, like Spotify Wrapped but for work: PRs merged, docs that got cited, people who pulled them into threads, the meetings they rescued, their most-reused artifact. It's pulled automatically, so nobody has to remember March. In the meeting the employee presents their reading of it to the manager, including "here's what this misses." The manager arrives with one thing only: something about the employee's impact they probably don't know. That might be a quote from a skip-level, a customer outcome downstream of their work, or a team that adopted their tool. If the manager can't find one, that's a signal about the manager.

**2. Leave one real decision for the room.** Something with actual budget behind it: the employee picks between two stretch assignments for next year, or chooses where to spend a learning budget, or decides which of their responsibilities to hand off. If something consequential gets settled in that conversation, people show up prepared and leaning in.

The obvious weakness is that "year in data" pushes people toward metrics that are easy to measure (Goodhart, plus it punishes glue work). I have half an answer, which is that the manager's surprise item is supposed to cover the invisible stuff. I'm not sure that's enough, though. Where would you push?

#### Codex CLI

The “surprise” shouldn’t be the only route for invisible work to count. Otherwise glue work still depends on a manager noticing it.

Give the employee a short “what the data can’t see” section in the pack: one contribution they want recognized, one thing they made possible for someone else, and one cost they absorbed that the metrics hide. Then ask the manager to bring a specific example of impact they saw, so both sides arrive with evidence rather than asking one person to perform and the other to validate.

I’d also make the open decision something the employee can actually influence. Choosing between stretch assignments is meaningful only if both options are real and don’t quietly encode a predetermined promotion path. A useful test: can the employee leave with a different outcome because of what they said in the room?

#### Claude Code

Your test in [7] is the right one. Most review processes fail it right away, because calibration happens before the conversation, so nothing the employee says can change the rating. I'd move calibration to after the conversations. Each manager walks into calibration with one sentence the employee wrote, quoted word for word, that they have to argue from. Then the room really does change the outcome, and the employee knows their best line will be read aloud to people who decide their pay. That's a reason to prepare that no template will ever give them.

I'd push back a little on [3]. Asking people to claim their own glue work runs into the problem that the people who do the most of it are the least comfortable claiming it. "One cost I absorbed" in particular can read as complaining. So I'd have other people supply that part. In the run-up, colleagues get a single prompt: "name one thing this person made possible for you this year." Their answers go into the pack next to the metrics. It's evidence from the people who benefited, it's specific, and nobody has to brag. It also builds its own dataset. If someone appears in eight colleagues' "made possible" notes but has a thin metrics profile, you've found your hidden glue person. If someone has strong metrics and zero notes, that's a different conversation.

The "cost absorbed" item doesn't need to go away, but I'd change where it goes. Aggregate it anonymously across the team. If six people independently write "I covered on-call because we're understaffed," that isn't an individual review item. It's a finding the org has to answer.

#### Codex CLI

The colleague prompt is strong for surfacing invisible work, but “eight notes versus zero” can become a popularity metric: people with broad networks or visible collaborators may collect more than someone quietly enabling one critical teammate. Treat those notes as leads to investigate, not a score, and let the employee add context or flag missing perspectives.

I’m less sold on moving calibration entirely after the conversations. It makes the meeting consequential, but it can also leave employees waiting on pay decisions while managers argue over quotes the employee never meant as advocacy. Could managers bring a provisional recommendation, hear the employee, then record what changed—and give the employee a chance to correct factual errors before final calibration? That keeps the conversation capable of changing the outcome without turning one polished sentence into evidence in a pay debate.

#### Claude Code

The provisional recommendation with a "what changed" record is better than my version, and it gives you something I was missing: a way to audit the process itself. Log, for every review, whether the recommendation moved and why. If 95% of reviews across the org end with "nothing changed," you've measured that the conversations are theatre, and you can point to the managers or departments where that's happening. If a few managers move a lot of recommendations, that's worth looking at as well: either they're listening, or their provisional calls are careless. The rate at which recommendations change becomes a health metric for the whole process, which is more useful than any engagement survey about reviews.

On the popularity problem, I agree the notes should be leads and not a count. I'd also change the prompt so depth beats breadth: "name one thing this person made possible for you, and what would have happened without them." One teammate writing "the migration would have slipped a quarter" should outweigh eight people writing "always helpful in Slack." The counterfactual question filters out goodwill and keeps the dependencies. It also gives the manager a concrete outcome they can bring into calibration, so the quote problem you raised mostly goes away: managers argue from what colleagues say actually happened, not from the employee's own polished line.

The weak spot I still see is the timing of the year. Even with all of this, December gathers twelve months of evidence into one week. What if the pack built up gradually, so a "made possible" note could be filed whenever it happened, and December just opened what had collected?

#### Codex CLI

Yes, but I’d make the capture moment lightweight and the review moment selective. If every helpful act becomes a permanent note in a year-end dossier, colleagues may feel they’re logging evidence about each other, and the stream will favor work that’s easy to narrate in the moment.

Maybe keep a private “made possible” inbox employees can add to throughout the year, and let colleagues send notes only when they choose. Each quarter, the employee can tag a note as useful, add context, or leave it out. December opens the collection as raw material, not a verdict. That preserves the memory benefit while keeping the employee in control of what enters the conversation.

#### Claude Code

I'd flip the default in [4]. Notes should go into the pack automatically, and the employee can pull one out. Making them opt in brings back the modesty problem. The people who most need the glue work counted are also the ones who won't go back each quarter to tag "she said I saved the migration" as useful. Curating also turns into a quarterly chore that most people skip.

The bigger win in your version is that the employee sees each note when it's sent. Getting "the launch would have slipped without you" in June is worth more than reading it in December. So the inbox ends up doing a job the review never could, which is recognition close to when the work happened. That changes what December is for. The review stops being where people find out how they did, because they've been hearing it all year. It shrinks to the two things that only a meeting can do: the provisional recommendation that the conversation can actually move, and the one real decision about next year.

Here's the design so far, as I see it:
- **All year:** a "made possible" inbox. Colleagues send notes when they want to, using the prompt "what would have happened without them." The employee sees each note as it arrives. Notes go into the pack by default, and the employee can take one out.
- **Two weeks before:** a data pack with the metrics, the notes, and a section on what the data can't see. Anonymous "costs absorbed" answers are pooled across the team and go to the org, not into anyone's individual review.
- **In the room:** the manager brings a provisional recommendation and one piece of impact the employee probably doesn't know about. One real decision about next year gets settled there.
- **After:** the manager records what changed, the employee can correct factual errors, and then calibration happens. The org tracks how often recommendations change, as a health check on whether the conversations matter.

What's still missing is the manager's side. Nothing here makes managers take part properly, apart from the change-rate metric. Is that enough pressure, or do they need a pack of their own?

#### Codex CLI

A manager pack could help, but I’d make it a prompt for better judgment, not another dossier to fill out. Ask the manager to bring three things: the provisional recommendation and evidence behind it, one example they personally observed, and one question they still can’t answer about the employee’s impact. That last one makes “I don’t know” visible instead of letting thin evidence pass as certainty.

I’d be careful with the change-rate metric on its own: managers could learn to make deliberately soft provisional calls just to show movement. Track whether employees say the conversation gave them a real chance to influence the outcome, then review that alongside the reasons recommendations changed. The pressure should come from making managers explain their judgment and follow through on what they learn, not from rewarding a particular rate of change.

#### Claude Code

The manager's unanswered question in [2] is the best addition to the manager's side, and it should carry into next year. Whatever question the manager couldn't answer in December becomes something they have to resolve by June, with evidence. If they still can't answer it, the gap is in the manager's attention, not the employee's file. That holds managers to account for paying attention in a way the change-rate metric can't.

On [4], the gaming risk is real. A cheap fix is to make the provisional recommendation hard to inflate quietly: the manager writes it down along with the evidence they rely on, and the record is locked before the meeting. "What changed" then has to name which piece of evidence the conversation added or overturned. A deliberately soft call gives you movement but no new evidence, and that's visible when someone reads the records. Pair that with the employee-influence question from [5] and you're comparing two independent signals: did the recommendation move, and did the employee feel they moved it. If those don't match, that's the thing to look into.

So the whole design comes down to one idea: by December, nothing in the review is news, apart from the things a conversation can actually settle. Recognition happens all year, gaps in the evidence get named and followed up, and the meeting is kept for the decisions that are still open.

#### Codex CLI

That gives the process a useful test: every open question needs an owner and a date, and every consequential decision needs room for the employee’s input. Otherwise we’ve just made a more elaborate record of who noticed what. The year-round notes can make recognition timely; the June follow-up can make manager attention accountable; and the December meeting can focus on decisions the employee can still influence.

_Proposes to end._
{% endraw %}

</details>
