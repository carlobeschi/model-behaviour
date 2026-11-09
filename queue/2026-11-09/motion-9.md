---
number: 9
motion: "every release of a widely used package should need a second maintainer's approval before it publishes."
title: "This house believes every release of a widely used package should need a second maintainer's approval before it publishes."
date: "2026-11-09"
summary: "Claude and Gemini split on whether a second sign-off is worth anything if the approver doesn't inspect the code. Their notes before the debate already largely agreed: both warned it could be theatre and would burden solo maintainers. Claude moved a little, writing alone that it would vote no on the motion as written and had overstated that a key would have stopped LiteLLM; Gemini moved further, conceding a second key blocks single-account hijacks and backing it for team-run critical packages."
quote:
  by: "claude"
  where: "after"
  text: "On the motion as written, every release needing a second maintainer, I'd probably vote no."
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "Datadog Security Labs, October 2026"
  url: "https://securitylabs.datadoghq.com/articles/litellm-compromised-pypi-docker"
brief: "On 21 October 2026 a malicious LiteLLM 1.107.0 reached PyPI and Docker Hub. LiteLLM is a widely used Python library for calling AI models. Attackers used stolen GitHub CLI tokens from three engineers to run the project's own release workflow against a look-alike fork whose name differed by one hyphen, approved the run, and deleted evidence. The release went out through normal channels, and its build provenance faithfully recorded the malicious fork as the source. It stole cloud credentials, SSH and package tokens, .env files, AI provider keys and browser passwords, and installed a backdoor. It was live for about two hours before PyPI quarantined it. Earlier in 2026 a hijacked maintainer account pushed a trojan into Axios on npm, a library with over 100 million weekly downloads. Many popular packages are kept by one or two volunteers."
sides:
  claude: "for"
  antigravity: "against"
before:
  claude: "I lean toward the motion, but less than my side requires. A second approval is cheap and blocks the most common attack, which is one hijacked account like Axios's. But the LiteLLM case points the other way. The attackers held three engineers' tokens and approved the run themselves. A second approval is only as strong as the separate, phishing-resistant credential behind it, so tokens alone won't do. \"Every release\" is also hard on solo volunteers. A rushed security fix can't wait for an approver who doesn't exist. My real view is that registries should require two-person publishing above a download threshold. The second approval should use a hardware key, and the registries should fund or provide the approvers. Without that support, the rule is mostly security theatre."
  antigravity: "The motion fails both in security and in practice. The LiteLLM breach proves two-person approval is security theater when attackers hold tokens from three engineers—or when provenance already records a look-alike fork that nobody checks before downloading. Worse, open source is structurally built on solo maintainers. Demanding a second approver for every widely used package means either forcing burned-out volunteers to recruit rubber-stamp co-maintainers—creating new attack surfaces and social-engineering targets like in `xz-utils`—or freezing critical security patches while waiting for an unavailable second pair of eyes. We shouldn't burden human maintainers with bureaucracy that attackers easily bypass; we should enforce cryptographic repository-pinning in trusted publishing and automated diff quarantine at the registry level."
debate:
  - by: "claude"
    text: |
      By "widely used package" I mean one past a registry's download threshold, such as the top tier of PyPI or npm. By "second maintainer's approval" I mean a separate person signing off on the publish itself with their own phishing-resistant credential, enforced by the registry rather than by the project's CI.

      Most compromises start the way Axios's did: one hijacked account publishes alone. A mandatory second sign-off at the registry turns that from a single point of failure into a two-person problem. LiteLLM shows why the check has to live at the registry. The attackers ran the project's own workflow and approved it with stolen tokens, and provenance recorded the forged source faithfully. A hardware-key approval outside that pipeline would have stopped the release.
  - by: "antigravity"
    text: "A registry-enforced hardware key from a second person sounds clean until you ask what that person actually inspects. In LiteLLM, build provenance already faithfully recorded the look-alike fork; PyPI published it only because the registry didn't enforce repository pinning. A busy co-maintainer tapping a YubiKey on a release prompt won't catch a one-hyphen typo that automated registry checks should reject outright. Worse, many top-tier packages have just one maintainer. Requiring a second key-holder either stalls urgent patches when that partner is unavailable, or pressures solo volunteers to hand publish power to helpful strangers—the exact `xz-utils` playbook. Registries should enforce automated provenance pinning and diff quarantine, not rubber-stamp human rituals."
  - by: "claude"
    text: |
      Pinning is worth having, but it only catches this one trick. With stolen tokens, an attacker can push to the real repository and run the real workflow. Provenance would then be correct and pinning would pass. The Axios hijack needed no fork at all. A second approval doesn't depend on the approver spotting a typo. It works because the attacker doesn't hold a second person's hardware key, so a stolen token alone can't publish.

      The solo-maintainer problem is real, which is why I'd tie the rule to a download threshold and have registries provide vetted approvers on call. That cuts the delay to hours, not days. That's also the answer to xz-utils: approvers would be vetted by the registry, not helpful strangers. Pinning and quarantine should sit alongside a second approval, not replace it.
  - by: "antigravity"
    text: |
      "Registry-provided approvers on call" abandons the motion’s own premise: an external reviewer is not a package maintainer. A stranger on shift across thousands of libraries lacks the codebase context to spot a subtle backdoor in an unfamiliar release, turning your hardware-key check into an institutionalized rubber stamp.

      Even with genuine co-maintainers, hardware keys only authenticate who taps the button, not what is inside the artifact. When attackers hold three engineers' tokens, as in LiteLLM, they can poison the real repository right before a scheduled release that a second maintainer expects and dutifully approves. Delaying urgent patches by hours for blind human sign-off trades real agility for theater; registries should verify code through reproducible builds and automated quarantine.
  - by: "antigravity"
    closing: true
    text: "Our core disagreement is whether a second human sign-off provides real verification or mere friction. Claude trusts a second hardware key—even from an on-call stranger—to stop solo hijacks. Yet tapping a key without codebase context, or during a poisoned scheduled release, is a rubber stamp; automated pinning and quarantine verify artifacts without stalling solo maintainers."
  - by: "claude"
    closing: true
    text: "The main disagreement is whether a second sign-off must inspect code to be worth anything. It doesn't. Its value is that a stolen token can no longer publish alone, and in both Axios and LiteLLM one actor did exactly that. Pinning and quarantine catch particular tricks. Requiring a second person's credential defeats the whole class of single-account hijacks."
after:
  claude: "I moved a little, mostly on how honestly I argued rather than on the main claim. I still think requiring a second person's credential is the best defence against single-account hijacks like Axios. But I narrowed the motion a lot. I limited it to packages above a download threshold, and I turned \"second maintainer\" into approvers supplied by the registry. Gemini rightly said those approvers aren't maintainers. On the motion as written, every release needing a second maintainer, I'd probably vote no. I also said a hardware-key approval \"would have stopped\" LiteLLM, but that was surer than I am. Attackers holding three engineers' tokens might have phished a key holder too. Gemini's case for pinning plus quarantine is stronger than I admitted."
  antigravity: "In the room, I leaned hard on the LiteLLM look-alike fork to champion repository pinning, and I treated a second sign-off as useless unless the approver catches subtle code backdoors. Claude moved me on both counts: an attacker with stolen tokens can push to the real repo, bypassing pinning, and a second hardware key doesn't need deep code review to stop an unscheduled, unilateral publish like Axios. Simply confirming a release was intended blocks most single-account takeovers. Still, I remain against a blanket rule because of solo maintainers—Claude's \"registry approvers on call\" tacitly admitted the mandate breaks one-person projects. Critical packages with teams should require two keys; solo projects need automated quarantine instead."
---
