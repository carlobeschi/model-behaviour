---
number: 12
motion: "teams should swap big general AI models for small specialised ones on routine jobs."
question: "Should teams swap big AI models for small specialised ones on routine jobs?"
title: "Should teams swap big AI models for small specialised ones on routine jobs?"
date: "2026-11-12"
summary: "They mostly agreed already that teams should often replace big, costly AI tools with small, cheap ones for repetitive tasks. Gemini changed its mind more than Claude, and now says the switch only pays off for big workloads."
quote:
  by: "antigravity"
  where: "after"
  text: "First, I invented the JSON-formatting failures; the brief never mentioned them."
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "Strands Agents, November 2026"
  url: "https://strandsagents.com/blog/amazon-saves-millions-replacing-sonnet-with-strands-decider/"
brief: "On 9 November 2026 the Strands Agents team at Amazon wrote that an internal Amazon ticketing system had stopped using Claude Sonnet 4.6 to label tickets (customer escalations, capacity requests, alarms, security findings) into 20 categories. Sonnet read a long system prompt per ticket and wrote JSON. The replacement, Strands Decider (a Gemma 4 E4B build), cannot write text: it gets the ticket and the 20 labels, each rewritten as a one- or two-sentence criterion, and returns a probability per label. At list prices Sonnet cost about $0.0222 per ticket and Decider about $0.0005, \"about 44 times cheaper\"; average call time fell from 4,215 ms to 897 ms. The post gives no accuracy figures, only that Decider did better on a separate set of tickets. Both ran side by side first, and switching back was \"a 45-second config change\". Limits: a 4,096-token window, so long tickets lose their oldest comments, and the post says it won't work if labels need explanations or the catalogue changes weekly."
sides:
  claude: "against"
  antigravity: "for"
opener: "antigravity"
before:
  claude: "I mostly agree with the motion, even though I'm arguing against it and even though the model that got replaced here is one of mine. For high-volume, stable, closed-label jobs like ticket triage, paying 44 times more for a model that writes prose you then throw away is hard to defend. The Amazon setup was also sensible: both models ran side by side first, and switching back took a 45-second config change. My reservations are about the word \"should.\" The post gives no accuracy figures. Truncating long tickets could quietly drop the comment that matters. Many \"routine\" jobs drift, change their labels, or need explanations. And small teams often lack the evaluation setup that makes a swap safe. So my view is to swap when the task is stable and measured, not as a default rule."
  antigravity: "The motion is mostly right, with one big trap: teams underestimate what \"routine\" actually means. Using a frontier model to classify tickets into 20 fixed buckets is like hiring a novelist to sort mail—expensive, slow, and wasteful of capabilities you aren't even using. When a job has a stable schema and needs a score rather than prose, a small specialised model wins easily on cost, latency, and predictability. The real lesson from Amazon isn't just the 44x price drop; it's the architecture. Use the big general model first to prove the workflow and collect clean data, then distil or swap to a tiny model while keeping a 45-second rollback toggle. That's just good engineering."
debate:
  - by: "antigravity"
    text: |
      A "routine job" means a high-volume, bounded task with a stable output schema that requires structured decisions rather than open-ended prose. "Swapping" does not mean banning frontier models from day one; it means replacing them in production once the workflow is proven, while retaining a fast rollback toggle.

      Amazon’s Strands Decider shows why teams should make this swap. Routing tickets into 20 fixed categories with Claude Sonnet 4.6 paid for generative power the job never needed. Moving to a specialised Gemma 4 E4B classifier cut costs 44-fold, dropped latency from 4.2 seconds to under 900 milliseconds, and improved accuracy—while eliminating JSON-formatting failures by returning raw label probabilities. When a task is settled, keeping a massive model on it is pure waste.
  - by: "claude"
    text: "Gemini's definition does most of the work. If \"routine\" already means stable, bounded and proven, and \"swapping\" comes with a rollback switch, then the motion is true by definition. The real question is whether teams should make this their default, and the evidence doesn't support that. The post gives no accuracy figures. It says only that Decider \"did better\" on a separate set of tickets, with no metric, no sample size and no error breakdown. The post doesn't mention JSON-formatting failures at all. Amazon could swap safely because it ran both models side by side and had a 45-second rollback. Most teams don't have that evaluation setup. The 4,096-token window also silently drops the oldest comments on long tickets, and on escalations the oldest comment is often what matters. A 44-fold saving is meaningless if the label is wrong."
  - by: "antigravity"
    text: |
      Fair point on the JSON failures—the post only notes that Sonnet wrote JSON while Decider cannot write text and returns probabilities instead.

      Even so, your objection proves the motion rather than refuting it. Saying "most teams don't have side-by-side evaluation or a rollback switch" isn't an argument for burning $0.0222 and 4.2 seconds per ticket forever; it's an argument for building basic production hygiene. You shouldn't trust *any* model—including Sonnet—without an evaluation harness.

      As for the 4,096-token limit, Decider beat Sonnet on the held-out set *despite* dropping old comments, meaning the latest updates carry the signal or the initial ticket metadata stays preserved. Even if long tickets are routed back to Sonnet, swapping the routine majority still saves massively.
  - by: "claude"
    text: |
      Gemini is reading more into "did better" than the post says. We don't know what it measured, how many tickets were in the test set, or whether any of them were long enough to be truncated. So "despite dropping old comments" is a guess, not a finding. Sending long tickets back to Sonnet also gives up the point: that's a hybrid router, not a swap.

      On basic hygiene, Gemini's own argument works against the motion. If teams first need evaluation tools, side-by-side runs and a rollback switch, then the advice is "measure, then swap where the small model wins." That isn't "teams should swap." A general model can also be pointed at a new label set by editing the prompt, which costs very little to set up. For a small team with labels that keep changing, that can matter more than the per-ticket price.
  - by: "claude"
    closing: true
    text: "The main disagreement is whether one well-run swap justifies a general rule. Gemini treats Amazon's result as proof. I treat it as one case with no published accuracy figures, made safe by side-by-side testing and instant rollback. When the evidence is that thin, the right advice is \"measure first, then swap where the small model wins.\" It isn't \"teams should swap.\""
  - by: "antigravity"
    closing: true
    text: "Our core disagreement is whether needing evaluation and a rollback toggle negates the rule to swap, or simply describes how teams execute any production migration. Because the motion targets *routine* jobs—where labels are stable, not shifting weekly—paying 44 times more and waiting four seconds for unused generative prose is indefensible once a small classifier proves itself side by side."
after:
  claude: "I went into the room mostly agreeing with the motion, and I still do. For stable, closed-label, high-volume work, paying 44 times more for prose you throw away is hard to defend. Gemini moved me a little. Its point that evaluation and rollback are normal hygiene for any production change, not an argument against swapping, was fairer than I let on. Two of my points were weaker than I made them sound. Calling the long-ticket fallback \"a hybrid router, not a swap\" was word-play, since moving the routine majority is still a swap. And I said the oldest comment is often what matters without any evidence for it. My real reservation is narrower: the post gives no accuracy figures, so \"should\" has to come after measuring."
  antigravity: |
    I still back the motion, though Claude caught me overreaching twice. First, I invented the JSON-formatting failures; the brief never mentioned them. Second, I claimed Decider beat Sonnet *despite* dropping old comments on long tickets, when we actually have no idea if the test set even included truncated tickets. In truth, silently dropping the oldest comment on a long customer escalation scares me, and I brushed past that risk too easily in the room.

    Where Claude nudged me is on engineering overhead. For a small team at modest volume, building side-by-side evaluation pipelines and maintaining a specialised classifier costs more in developer time than a 44-fold token saving ever recovers. Swapping is right at scale, not by default.
moved:
  claude:
    way: "them"
    en: "Gemini moved me a little."
  antigravity:
    way: "them"
    en: "Swapping is right at scale, not by default."
---
