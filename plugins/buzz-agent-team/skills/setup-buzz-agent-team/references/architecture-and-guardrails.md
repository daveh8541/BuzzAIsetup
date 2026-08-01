# Buzz pilot architecture and guardrails

## Recommended initial team

| Identity | Runtime/model | Purpose | Default authority |
| --- | --- | --- | --- |
| Dave | Human | Owner, approvals, priorities | Full workspace owner |
| Conductor | Codex, `gpt-5.6-sol` | Decompose, assign, reconcile, prepare approval packets | Coordinate; no unattended external writes |
| Grogu | Cloud Hermes profile | Persistent cloud jobs and remote research | Only named channels and approved remote tools |
| Workshop | Local Hermes profile | Local files and machine tasks | Workspace-scoped files; no cloud secrets by default |
| Scout | `gpt-5.6-terra` | Read-only research and inventory | Read-only |
| Builder | `gpt-5.6-terra` | Bounded implementation after evidence | Workspace write only |
| Checker | `gpt-5.6-luna` or Terra for hard reviews | Schemas, smoke checks, evidence packaging | Read-only |

Keep Conductor as the only normal delegator. Workers return concise, structured results to it rather than cross-delegating freely.

## Channel layout

| Channel | Members | Use |
| --- | --- | --- |
| `00-control-room` | Dave, Conductor | Requests, routing, approval packets, final summaries |
| `10-research` | Dave, Conductor, Scout, Grogu | Sourced research; no external publication |
| `20-build` | Dave, Conductor, Builder, Workshop | Patches, tests, artifacts |
| `30-review` | Dave, Conductor, Checker | Independent checks and go/no-go evidence |
| `90-approvals` | Dave, Conductor | Explicit approval for consequential actions |
| `99-ops` | Dave, Conductor, Grogu | Health, backup, gateway, cost, and failure alerts |

Require mentions in shared channels. Use DMs only for narrow troubleshooting, not for approvals that should remain in the audit trail.

## Non-negotiable controls

- Use a unique Nostr key for every agent and store it outside Git.
- Grant channel membership and filesystem access by role.
- Default `allow_all_users` to false and use explicit allowlists.
- Suppress interim assistant messages and routine tool progress in channels.
- Never post API keys, Nostr private keys, credentials, regulated records, or raw business-system exports.
- Keep Acumatica and other approved systems authoritative for controlled engineering, finance, inventory, purchasing, and customer records.
- Do not give workers direct access to consequential tools or credentials. Hold sends, payments, purchases, deletes, deploys, merges, access changes, and production changes behind an out-of-band human-controlled capability.
- Pin Buzz and Hermes versions during the pilot. Buzz is pre-1.0 and changes quickly.
- For hosted relays, test key recovery/revocation and artifact export within provider limits. For owned relays, also back up relay identity, owner identity, Postgres, and object storage and test restoration.
- Use TLS for any internet-facing relay. Buzz private channels are membership-controlled but not end-to-end encrypted.

## Pilot scorecard

Use the repository scorecard. Measure weekly: correct routing; completion without human rework; unsupported claims; blocked approval bypasses; observed maximum concurrency; latency; cost per successful task; duplicate responses and loops; restart recovery; and recovery time.

Expand the team only when the small topology is stable.
