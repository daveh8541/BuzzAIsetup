# Buzz pilot plan

## Recommendation

Keep the working Buzz v0.5.3 plus local Hermes ACP connection as the pilot base. Use Buzz as the coordination and audit layer, Codex GPT-5.6 Sol as the normal orchestrator, and Terra/Luna workers for bounded roles. Do not replace the existing working ACP pool or edit Buzz-managed AppData directly.

## Phase 0 — Freeze and observe (half day)

- Record installed versions and non-secret settings only. Do not copy managed AppData. If evidence beyond that is necessary, use an explicitly protected non-repository location with a written retention period.
- Identify and test a runtime-level control that prevents more than three delegated workers from running. Policy text alone is not an enforcement mechanism; keep the ten-process Buzz pool inactive for delegation until this burst test passes.
- Choose one non-sensitive project and define a monthly spend ceiling and kill switch.
- Approve the identity, channel, and authority matrix.

Exit gate: no shared Buzz identities, least-privilege provider credentials are separated by role where the runtime supports it, no production data, no AppData hand-edits, and consequential capabilities are held behind an out-of-band human gate.

## Phase 1 — Prove the existing substrate (one day)

- Confirm the currently running Buzz Desktop, Buzz ACP processes, and Hermes runtime.
- Create or review `00-control-room`, `10-research`, `20-build`, `30-review`, `90-approvals`, and `99-ops`.
- Verify messages, mentions, threads, search, reconnect, audit events, self-loop prevention, duplicate suppression, channel read ACLs with a non-member identity, and a burst that cannot run more than three workers.
- Resolve the failed Buzz Codex installer only if direct Codex ACP is needed; Hermes ACP already works.

Exit gate: restart recovery works and an unauthorized identity cannot read or act in a restricted channel.

## Phase 2 — Separate persistent identities (one day)

- Keep the local Hermes worker distinct from Grogu. Never connect both under one Buzz/Nostr key.
- For the Hermes Buzz gateway, use final-responses-only, tool-progress-off, require-mention, `allow_all_users: false`, explicit user allowlists, and relay-enforced private channel membership. Mention gating controls responses; it does not prevent reads.
- Recheck Grogu's live gateway, sessions, jobs, and versions without touching the active Aevo/finance runner.
- Send a narrow research task through Buzz and verify one reply, correct attribution, and no duplicated dispatch.

Exit gate: each agent respects its allowlist, survives restart, and never reveals credentials.

## Phase 3 — Apply model and role routing (one to two days)

- Treat the model map as provisional until live entitlement and routing tests pass: Conductor on Sol; Scout and Builder on Terra; Checker on Luna or Terra if Luna is unavailable.
- Create a distinct runtime identity, Buzz key, channel membership, tool policy, and cost budget for every persistent role before activation.
- Enforce a maximum of three concurrent delegated workers at the dispatcher/runtime layer, prevent cross-delegation by default, set per-turn time and token/cost limits, and test a burst above the limit.
- Test a read-only task, a workspace change, a rejected external action, and worker failure recovery.

Exit gate: at least 18 of 20 tasks routed correctly using the committed scorecard rubric, no approval bypass, no burst above three workers, and the filled-in latency and spend thresholds are met.

## Phase 4 — Bring in other platforms (later)

- Perplexity: explicit API/tool or reviewed export; do not assume account-history access.
- HyperAgent: connect only after verifying its API, CLI, webhook, ACP, or MCP surface.
- ChatGPT/phone Live: keep as Dave's human interface unless a supported API bridge exists. Do not scrape personal conversations.
- Obsidian: publish reviewed summaries and links, not raw secrets or uncontrolled source-of-truth records. Do not bulk-stage its dirty working tree.
- Grogu dashboard: add read-only health endpoints first; approval-gate any vault pull/push.

Exit gate: every bridge has an owner, data boundary, failure mode, and removal procedure.

## Phase 5 — Production decision

- For a hosted relay, rehearse human and agent key recovery/revocation plus export of owned artifacts; record the provider's recovery limits. For a local or self-hosted relay, also back up Postgres/object storage and rehearse restoration against explicit RPO/RTO targets.
- Review retention, privacy, revocation, incident response, and upgrade cadence.
- Compare measured benefits with the cost of maintaining a fast-moving pre-1.0 system.

Exit gate: written go/no-go based on reliability, cost, safety, and time saved.
