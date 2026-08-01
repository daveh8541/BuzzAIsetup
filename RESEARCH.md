# Buzz research brief — 2026-08-01

## What Buzz is

The intended product is almost certainly Block's open-source Buzz, not the sales platform buzz.ai. Buzz is a self-hostable workspace where people and agents share rooms, identities, workflow events, Git activity, search, and an audit log. It is best understood as the coordination and context substrate; Hermes, Codex, and other harnesses still execute the work.

Primary sources:

- [Block Buzz repository and capability table](https://github.com/block/buzz)
- [Hermes official Buzz adapter](https://hermes-agent.nousresearch.com/docs/user-guide/messaging/buzz)
- [Buzz Desktop v0.5.3 release](https://github.com/block/buzz/releases/tag/desktop-v0.5.3)
- [Buzz agent architecture](https://github.com/block/buzz/blob/main/VISION_AGENT.md)
- [Production compose deployment](https://github.com/block/buzz/blob/main/deploy/compose/README.md)
- [Buzz security policy](https://github.com/block/buzz/blob/main/SECURITY.md)

## Last seven days on YouTube

Strict window: 2026-07-26 through 2026-08-01. Dates were checked from upload metadata.

- Aug 1: [Building a Buzz AI Agent That Replies to Anyone](https://www.youtube.com/watch?v=JXHZ1hG-8p4). Useful hands-on material about narrow triggers, channel scope, ACP subscriptions, custom instructions, and local testing. Treat "reply to anyone" as an explicit opt-in test, not a default.
- Jul 31: [Jack Dorsey's New App Buzz Has a Secret Agent List](https://www.youtube.com/watch?v=yvc4eNxpbbk). The strongest safety-oriented video: identity-key risk, jailbreak exposure, unfinished approval gates, and client-data caution.
- Jul 31: [Jack Dorsey's Buzz DESTROYS Hermes Agent?](https://www.youtube.com/watch?v=b42vjtH6mNM). Promotional framing; the useful pattern is Buzz plus Hermes plus an independent quality-control agent, not replacement.
- Jul 29: [Buzz Beginner's Guide](https://www.youtube.com/watch?v=JgkD-PZ9bAo). Sensible onboarding: one community, few role-specific agents, threads as task boundaries, then shared compute later.
- Jul 28: [Jack Dorsey's Buzz: Clearly Explained](https://www.youtube.com/watch?v=_jGSgzBkzrY). Product tour reinforcing Buzz as a coordination layer rather than a worker model.
- Jul 27: [Buzz Mobile: Run AI Agents From Anywhere](https://www.youtube.com/watch?v=ER3AIfIwEQ0). Interesting for mobile control, but remote-agent persistence is still described in Buzz's repository as a vision; do not treat it as production-ready Grogu deployment.

## X/Twitter research limitation

Direct X search was sign-in gated in the available research session, and public indexing did not yield a Buzz-specific post with a verifiable publication date inside the strict seven-day window. No X claim was used as evidence. This is preferable to presenting undated or inaccessible posts as current best practice.

## Practices that survived the hype filter

1. Use one strong orchestrator and narrowly scoped workers; avoid all-to-all listening.
2. Give every agent its own key, channel memberships, tool scope, time budget, and stop condition.
3. Default to mentions and allowlists; keep self-ignore and duplicate suppression enabled.
4. Keep a separate verifier and require a human for external or irreversible actions because native approval glue is still evolving.
5. Store durable conclusions, handoffs, and artifacts in threads, canvases, or repositories instead of relying on session memory.
6. Start with three to five agents and grow only after logs reveal a real bottleneck.
7. Pilot with non-sensitive data. Private channels are access-controlled but not end-to-end encrypted.
8. Pin versions and rehearse restart and restore; Buzz is still pre-1.0.

## Current fit for Dave's stack

- Hermes: first-class official Buzz adapter and already functioning locally through ACP.
- Codex: supported by Buzz ACP; use Sol for orchestration and Terra/Luna workers by role.
- Grogu: connect under its own identity only after live status is rechecked. Buzz remote-agent vision is not a turnkey cloud-runner guarantee.
- Perplexity: use as a research source/API or reviewed export; no official direct Buzz connector was verified.
- HyperAgent: identify its supported integration surface before designing a bridge.
- ChatGPT phone Live: keep as the human voice interface; do not promise direct session ingestion or control.
- Obsidian: retain as reviewed long-term knowledge. Keep controlled business records authoritative in their approved systems.
