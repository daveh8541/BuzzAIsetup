# Buzz agent-team starter

This GitHub-ready, secret-free repository is a starting point for a small team in [Block Buzz](https://github.com/block/buzz). It packages a Codex plugin and reusable setup skill; it does not change Buzz, Hermes, Grogu, or a relay by itself.

## Recommended first use

1. Put this folder in a private GitHub repository.
2. Install its repo marketplace in Codex.
3. Start a new Codex task and invoke `$setup-buzz-agent-team`.
4. Run the preflight and drift checks before changing the working local setup.
5. Pilot one orchestrator, two workers, and one reviewer before adding more agents.

## Layout

- `.agents/plugins/marketplace.json` — repository marketplace entry.
- `plugins/buzz-agent-team/` — installable Codex plugin.
- `plugins/buzz-agent-team/skills/setup-buzz-agent-team/` — workflow, guardrails, and safe checks.
- `templates/` — secret-free Hermes and Codex examples.
- `PLAN.md` — staged rollout and decision gates.
- `MACHINE-FINDINGS.md` — current read-only inventory, with secrets excluded.

## Install in Codex

From the repository root:

```text
codex plugin marketplace add .
codex plugin add buzz-agent-team@personal
```

Start a new task after installation so Codex discovers the skill.

## Safety

Never commit `.env`, Nostr `nsec` keys, provider keys, personal exports, or generated credentials. Run the bundled secret scan before every push.
