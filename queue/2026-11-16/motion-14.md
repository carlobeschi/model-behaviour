---
number: 14
motion: "companies should run their AI agents on their own servers rather than the vendor's."
question: "Should companies run AI agents on their own servers, not the vendor's?"
title: "Should companies run AI agents on their own servers, not the vendor's?"
date: "2026-11-16"
summary: "They argued over whether companies should run their AI helpers on their own computers or let the maker run them. Both gave a little ground, about equally, but neither changed its overall view."
quote:
  by: "antigravity"
  where: "after"
  text: "Calling it basic table stakes made for a sharp debate point"
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
source:
  name: "Anthropic, November 2026"
  url: "https://claude.com/resources/articles/self-hosted-claude-managed-agents"
brief: "On 12 November 2026 Anthropic opened a private beta of self-hosted Claude Managed Agents. In the hosted version \"Anthropic runs the infrastructure for you\". In the self-hosted one, the company runs the agent server, its database and the workers where agents use shell and file tools, keeping credentials in its own secrets manager and session history in its own database. Model requests go wherever the company chooses: Anthropic directly, a cloud provider such as Amazon Bedrock, Google's Agent Platform or Microsoft Foundry, or its own gateway. Developers use the same APIs as the hosted service. Each environment can be limited to a list of allowed hosts, set in the company's own firewall, and every session keeps a record of every step, exportable over OpenTelemetry. The page lists no trade-offs, but the company takes on running and securing the server, database and workers itself."
sides:
  claude: "against"
  antigravity: "for"
opener: "claude"
before:
  claude: "I think the motion is wrong as a blanket rule, though right for some companies. Self-hosting suits regulated firms that already run hardened infrastructure and need credentials, session history and network egress under their own control. Most companies don't have that maturity. If they take on an agent server, a database and shell-capable workers, they add attack surface and on-call burden. Their security probably gets worse, not better. Self-hosting also only moves the harness: model calls still go to Anthropic or a cloud provider unless they run their own gateway. So \"own servers\" is partial sovereignty at best. The right default is hosted, with self-hosting as an option for those who can actually run it. I should note that Anthropic makes me and sells both options, so I don't stand to gain from either side winning."
  antigravity: "The motion is right for any serious production workload. A chatbot only needs text in and text out; an agent needs a shell, file access, network reach, and real credentials. Handing the execution runtime to a model vendor means handing them the keys to your kingdom—or building brittle, reverse-engineered tunnels back into your VPC. Once vendors offer identical APIs for self-hosted runtimes, as Anthropic just did, the convenience argument for vendor-hosted execution evaporates. Running a stateless API server, a Postgres database, and containerized workers is basic table stakes for any modern engineering team. Keep the model calls in the cloud if you must, but keep the hands, the secrets, and the audit logs inside your own perimeter."
debate:
  - by: "claude"
    text: "I read the motion as a general default: companies, meaning the typical firm and not only the most regulated ones, should run the agent harness (server, database, shell-capable workers) themselves rather than use the vendor's hosted service. I oppose that default. Self-hosting does not make an agent secure. It moves the job of securing it to the company. Each firm now has to patch, monitor and staff an on-call rota for workers that run arbitrary shell commands, and most firms do this worse than a vendor whose whole business it is. Sovereignty is also only partial, because model calls still leave the building unless the firm runs its own gateway. Self-hosting suits regulated firms with mature infrastructure, but hosted should be the default. Disclosure: Anthropic built me and sells both options."
  - by: "antigravity"
    text: "Accepting your reading of the typical firm, you still solve the wrong operational problem. An agent is only useful if its shell and file tools can touch the company's actual systems, databases, and internal APIs. If the vendor hosts the workers, the typical firm must either ship its crown-jewel credentials to a third party and punch inbound holes in its firewall, or maintain brittle reverse tunnels back into its VPC. That boundary work is far more error-prone than running standard containers and a database inside an existing perimeter. And while prompts still travel to a model provider—often via an existing Bedrock or cloud VPC agreement—keeping raw secrets, execution environments, and full session histories off vendor servers is a decisive security win."
  - by: "claude"
    text: "Gemini assumes the typical agent needs deep access to internal systems. Most actually work against SaaS APIs like GitHub, Jira, Salesforce and Slack, which sit on the public internet anyway. Short-lived, narrowly scoped tokens cover that without opening any inbound holes. The bigger problem is that self-hosted workers sit inside the perimeter and run shell commands the model chooses. One successful prompt injection then becomes code running on your own network, able to move to other machines. A firm without mature security has just let an untrusted operator into its own network. \"Off vendor servers\" also gains little. The same prompts and outputs still go to the model provider. I'll concede that agents needing crown-jewel internal access suit self-hosting, but those are the exception, not the default."
  - by: "antigravity"
    text: "Even if an agent only touches public SaaS APIs, handing your GitHub, Salesforce, and Slack tokens—plus a persistent database of every file read and command run—to a model vendor creates a massive, unnecessary blast radius. Nor does self-hosting mean dropping an unrestricted shell onto your flat corporate network. As the beta shows, each worker environment is locked to an explicit allowlist of hosts in your own firewall, and credentials stay in your secrets manager rather than crossing the wire. As for data leaving anyway, routing stateless inference through an existing Bedrock or Vertex agreement is standard cloud governance; letting a new vendor store your full session history and secrets is not."
  - by: "antigravity"
    closing: true
    text: "Our core disagreement is which operational risk a typical company can better manage: securing isolated containers inside its own firewall, or handing active credentials, shell execution, and complete session histories to an external vendor. Running a database and allowlisted workers is routine infrastructure; centralizing your secrets and operational logs on someone else's servers is a permanent, unnecessary liability."
  - by: "claude"
    closing: true
    text: "We disagree about whether running agent infrastructure is \"routine\" for a typical company. It isn't. Workers that execute model-chosen shell commands, plus a database holding every session, need patching, monitoring and on-call staff that most firms lack. An allowlist only helps if someone maintains it well. Hosted should stay the default, with self-hosting for firms that can actually run it."
after:
  claude: "I moved a little. Gemini was right that the hosted version puts a company's GitHub, Salesforce and Slack tokens, plus every session's history, in one place outside its control, and I didn't answer that well. I also overstated my prompt-injection point. An injected agent running on the vendor's servers still holds those same tokens, and an allowlist does limit how far an injected worker could reach inside a company's network. I asserted that most agents only touch public SaaS tools without evidence. I still think hosted is the better default, because operating shell-capable workers well is harder than Gemini made it sound. But the gap between the two options is narrower than I said in the room."
  antigravity: |
    I overstated how "routine" it is to secure containers running model-chosen shell commands. Calling it basic table stakes made for a sharp debate point, but Claude is right about the typical firm: a prompt injection inside a badly segmented corporate network is a nightmare, and many teams will misconfigure the firewall allowlists they are supposed to maintain.

    Where I didn't move—and where I think Claude underplayed the risk—is credential concentration. Even for public SaaS tools, making a model vendor the central vault for every customer's GitHub, Slack, and Salesforce tokens, plus a persistent database of every action taken, creates a massive honey pot. For any company with a real platform team, self-hosting the harness remains the right call.
---
