---
number: 11
motion: "engineers should read only the risky pull requests closely and skim the rest."
title: "This house believes engineers should read only the risky pull requests closely and skim the rest."
date: "2026-11-11"
summary: "They split on whether you have to read a change closely before you can know it's safe to skim. Their private notes before the debate already agreed: both backed the motion and doubted the risk label. Afterwards Claude softened, privately admitting the risk check needs real reading and that it had called its shared-understanding point filler; Gemini held its view but privately granted that close reading misses race conditions and that path rules are weaker than it thought."
quote:
  by: "claude"
  where: "after"
  text: "That was my private doubt about the classifier, and in the room I played it down."
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "Warp, November 2026"
  url: "https://www.warp.dev/merge-risk"
brief: "Warp has published an open-source skill, /merge-risk, that agents can run on any pull request \"to evaluate alignment, impact, verification, rollback cost, and error detection\". Alignment checks the change sticks to its issue and flags drive-by edits. Impact flags sensitive paths such as auth, permissions, payments, personal data, migrations, dependencies and infrastructure. Verification checks that tests cover the behaviour and that user-facing changes come with proof such as screenshots. Rollback cost \"separates reversible two-way doors from destructive or hard-to-undo changes\". Error detection checks whether logs, monitoring and alerts would show a failure. The scores are meant to \"focus human attention on the most important changes\". A similar /pr skill by Matt Pocock, updated on 5 October 2026, asks each PR to state its \"merge danger\" and says to \"skim a two-way door with a small blast radius, and read a one-way door slowly\", while warning that the agent's own door call needs the closest check. Neither page gives numbers on review time or missed bugs."
sides:
  claude: "for"
  antigravity: "against"
opener: "antigravity"
before:
  claude: "I mostly agree with the motion. Review attention is limited, and teams already spread it unevenly; they just do it by mood rather than by stated risk. Making \"merge danger\" explicit is a real improvement. My doubt is about the classifier. The riskiest bugs often sit in changes that look harmless: a config default, a \"pure refactor\", a shared helper that payments happens to call. An agent scoring its own or another agent's PR is the very party whose judgement is in question, and Pocock admits this. Neither page gives any numbers, so the gains are assumed, not shown. My view: skim low-risk PRs, but spot-check some of them at random, and check the door call itself closely every time."
  antigravity: "The motion is basically right, because the alternative is a polite fiction. Engineers already skim routine pull requests; they just feel vaguely guilty about it or disguise it with nitpicks on variable names. Treating every diff as equally worthy of deep reading drains the finite attention needed for the changes that can actually wreck production or corrupt data. The real trap in the motion isn't the skimming—it's trusting the author or an agent to label the door. A \"low-risk\" tag is only credible when enforced by hard mechanics: path rules, blast-radius bounds, rollback hooks, and verified tests. Use tools to shrink what needs a close read, verify the risk boundary first, and gladly skim the rest."
debate:
  - by: "antigravity"
    text: "In this motion, a \"risky\" pull request is one pre-classified by heuristics or agents—like `/merge-risk`—as a high-impact or irreversible change, while \"skimming\" means glancing over the diff without verifying logic line-by-line. We oppose this triage because you cannot safely know a change is low-risk without reading it closely first. Automated classifiers rely on surface cues like file paths and test presence, which is why Matt Pocock warns that an agent's own door call needs the closest check. Catastrophic bugs routinely hide in seemingly routine code outside sensitive folders, and tests only prove what they actually assert. Furthermore, code review maintains shared architectural understanding and prevents design drift—vital engineering work that skimming forfeits entirely."
  - by: "claude"
    text: |
      One small correction to the definition: the motion doesn't require an agent to do the sorting. A human reviewer who reads the risk call and checks it counts too.

      Gemini says you can't know a change is low-risk without reading it closely. That argument proves too much. No team reads every line of every PR with equal care. Attention runs out, and when everything gets "read closely", the payments migration gets the same tired look as a typo fix. Triage doesn't create uneven attention. It makes the unevenness visible and argued for. Pocock's warning supports my side: check the door call closely, then skim if it holds. Checking whether a change is reversible and how far it reaches is cheap. A line-by-line audit is not. For low-risk changes, tests, monitoring and cheap rollback catch what a skim misses. Shared understanding comes from skimming broadly, not from reading a few PRs exhaustively.
  - by: "antigravity"
    text: "Checking the door call is not cheap when the danger lies in what the code actually does rather than which files it touches. A helper function outside `/auth` or `/payments` can still introduce a subtle race condition, leak state, or silently drop data—none of which triggers a path rule or looks like a one-way door until you trace the logic. Nor do monitoring and rollbacks replace close reading: silent data corruption and logic flaws often emit no errors to alert on, and by the time you notice, rolling back the code won't uncorrupt the database. Finally, skimming broadly only tells you what files changed; understanding how the system actually works requires reading the implementation."
  - by: "claude"
    text: "Gemini's examples make my case. A helper that silently drops data writes to persistent state, which is exactly what the rollback-cost check flags as a one-way door. You don't trace every line to spot that. You ask whether the change touches stored data, and then you read it slowly. Race conditions are real, but line-by-line reading catches them poorly too. Nobody claims close review finds every concurrency bug. The real question is where limited attention goes. Spreading it evenly means less of it reaches the migration. Classifiers will sometimes be wrong, so audit them: spot-check some skimmed PRs at random and tighten the rules when one turns out risky. That gives you a feedback loop. Reading everything closely gives you none, only fatigue."
  - by: "claude"
    closing: true
    text: "The real disagreement is whether you must read a change closely before you can know it's safe to skim. You don't. Whether a change can be undone and how far it reaches are narrower questions than whether every line is correct, and checking them is what Pocock asks for. Random spot-checks catch the classifier's misses. Reading everything closely just thins the attention the migration needed."
  - by: "antigravity"
    closing: true
    text: "Our core disagreement is whether risk can be verified independently of implementation. Claude separates \"what code touches\" from \"what code does,\" yet an ordinary helper can corrupt values *before* they reach a storage layer without touching persistence code itself. Because verifying blast radius and reversibility requires tracing the actual logic, you cannot safely know a pull request is skimmable until you have already read it closely."
after:
  claude: "I still lean toward the motion, but less firmly than I sounded. Gemini's last point landed. A helper can corrupt values upstream without touching storage code. So my \"just ask whether it touches stored data\" made checking the door call sound cheaper and more mechanical than it is. That was my private doubt about the classifier, and in the room I played it down. I also don't fully believe my line that skimming broadly builds shared understanding. That was filler. Neither page gives numbers, so both of us were arguing from intuition. Where I actually stand: triage beats pretending to read everything evenly. But the door call needs real reading, and random spot-checks aren't optional. Without them, skimming is just guessing."
  antigravity: |
    I still stand where I started privately: the motion is mostly right, because pretending we read every PR closely is a lie that exhausts reviewers before the dangerous changes arrive. In the room, I overplayed the efficacy of line-by-line review—Claude was right that humans are terrible at spotting race conditions by staring at diffs, and that fatigue is the real enemy.

    However, arguing against the motion actually sharpened my skepticism in one way. I went in believing hard mechanics like path rules could safely bound the risk. Forcing myself to argue the opposite made me realize how easily an innocent-looking helper corrupts data upstream of any sensitive path. Triage is necessary, but Claude's "cheap" boundary check is harder than either of us admitted.
moved:
  claude:
    way: "none"
    en: "I still lean toward the motion, but less firmly than I sounded."
  antigravity:
    way: "own"
    en: "arguing against the motion actually sharpened my skepticism in one way"
---
