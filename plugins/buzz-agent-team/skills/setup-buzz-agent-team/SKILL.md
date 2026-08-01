---
name: setup-buzz-agent-team
description: Safely assess, plan, configure, and verify a Block Buzz workspace that connects Codex and Hermes agents. Use when setting up or reviewing a Buzz relay, Buzz Desktop, buzz-cli, the Hermes Buzz gateway, agent identities and channel permissions, a Sol-orchestrated Codex worker team, GitHub-hosted Buzz setup assets, or a staged Buzz pilot. Never copy or print private keys or provider credentials.
---

# Set up a Buzz agent team

Set up a small, inspectable pilot. Treat Buzz as the collaboration and audit substrate; keep model routing, memories, credentials, and system authority in their owning runtimes.

## Workflow

1. Identify the product as Block's `block/buzz`. Stop if the target is another product named Buzz.
2. Read `references/architecture-and-guardrails.md` before proposing identities, channels, hosting, or permissions.
3. Run `scripts/preflight.ps1` on Windows. If local policy blocks scripts, use a process-only invocation: `powershell.exe -NoProfile -ExecutionPolicy Bypass -File scripts/preflight.ps1`; do not change the machine-wide execution policy. Report presence and version only; never dump environment variables, `.env` contents, private keys, tokens, or provider configuration. Treat unset process environment variables only as environment findings—Buzz Desktop or Hermes may store equivalent configuration elsewhere.
4. Inventory existing Hermes profiles and gateway status using supported Hermes commands. Do not modify Grogu, its jobs, its finance runner, or any remote host during discovery.
5. Choose one pilot topology: hosted Buzz plus one Hermes; local Buzz plus local Hermes; or VPS only after backup, TLS, stable identities, and restore testing are designed.
6. Create one Buzz identity per agent. Default to private mode, explicit allowed users, mention-required channel replies, final messages only, and no tool-progress spam.
7. Start with the role and channel matrix in the reference. Find and verify a runtime-level cap of three concurrent workers; prompt policy alone is insufficient. Add agents only after routing accuracy, completion rate, latency, and cost are measured.
8. Generate configuration by copying repository templates. Put real secrets only in the runtime's ignored secret store. Never substitute secret values into tracked files.
9. Put external messages, purchases, deletes, deploys, merges, permission changes, and authoritative-system promotion behind a capability the worker does not hold. Require the human to release that capability out of band; a channel approval message alone is not enforcement.
10. Run the local secret scan and smoke test. Report passed, failed, blocked, and unverified checks separately.

## Model routing

- After live model-entitlement and routing tests pass, use `gpt-5.6-sol` for the orchestrator, difficult synthesis, ambiguous planning, and final approval packets.
- Use `gpt-5.6-terra` for research, code exploration, drafting, and ordinary implementation workers.
- Use `gpt-5.6-luna` for narrow classification, extraction, monitoring, and deterministic high-volume checks; fall back to Terra when Luna is unavailable.
- Preserve endpoint, reasoning, latency, cost, and tool contracts. Do not replace every model with Sol.
- Use the Responses API for reasoning plus tools. Do not assume Chat Completions function tools support non-none reasoning.

## Integration boundaries

- Connect Hermes through its official Buzz adapter. Verify the installed version's WebSocket versus polling behavior from live status and logs because current documentation is internally inconsistent.
- Connect Codex through Buzz ACP or use Buzz rooms as the coordination surface. Keep project-scoped Codex agent definitions under `.codex/agents/`.
- Treat Perplexity as a research source or API-backed worker until an official Buzz connector is verified.
- Treat HyperAgent as unknown until its API, CLI, webhook, ACP, or MCP surface is verified.
- Do not claim that personal ChatGPT history or phone Live sessions can be imported or controlled. Use explicit exports or supported APIs only.

## Completion gate

Do not call setup complete until one human-to-orchestrator message, one delegated worker task, one evidence-bearing final response, one denied unauthorized action at the capability layer, gateway restart recovery, a three-worker burst-limit test, and topology-appropriate recovery rehearsal have passed. For hosted relays test key recovery/revocation and artifact export; for owned relays also test data restore. Keep the pilot isolated from production and sensitive records until those checks succeed.
