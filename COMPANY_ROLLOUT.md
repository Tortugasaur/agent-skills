# Company Rollout Guide

Use this when distributing `agent-skills` across the team.

## What To Install By Default

Core install:

```bash
hermes skills tap add Tortugasaur/agent-skills
hermes skills install --yes Tortugasaur/agent-skills/skills/token-saver
hermes skills install --yes Tortugasaur/agent-skills/skills/codex-client-bootstrap
hermes skills install --yes Tortugasaur/agent-skills/skills/tool-output-filtering
hermes skills install --yes Tortugasaur/agent-skills/skills/repo-inspect
hermes skills install --yes Tortugasaur/agent-skills/skills/workflow-context-engineering
hermes skills install --yes Tortugasaur/agent-skills/skills/token-tool-evaluation
```

Optional style install:

```bash
hermes skills install --yes Tortugasaur/agent-skills/skills/caveman
```

## What Not To Roll Out Globally Yet

Do not globally install these until `token-tool-evaluation` passes:

- RTK
- Context Mode
- Token Savior
- claude-context
- code-review-graph
- token-optimizer MCPs

Reason: these can add binaries, hooks, MCP servers, indexes, licenses, or behavior changes. Test per-project first.

## Per-Repo Setup

1. Copy `AGENTS.md` into the repo.
2. Append one project overlay:
   - Call Hermes: `overlays/call-hermes.md`
   - Roblox: `overlays/roblox-game.md`
3. Add repo-specific commands:
   - install
   - lint
   - test
   - build
   - deploy/release
4. Add project-specific safety/QA gates.

## Teammate Ergonomics Checklist

This skill pack should not slow people down. Check:

- [ ] Agent can still give detailed explanations when asked.
- [ ] Agent can still inspect broad code when needed.
- [ ] Agent does not skip tests to save tokens.
- [ ] Agent does not use caveman style in customer-facing work unless requested.
- [ ] Agent asks fewer repeated questions because handoffs/rules are clearer.
- [ ] Agent includes enough proof to trust the result.

## Feedback Loop

If a teammate says the baseline is annoying:

1. Capture exact failure mode.
2. Patch the relevant skill.
3. Add one example to the skill if needed.
4. Push to GitHub.
5. Have clients run:

```bash
hermes skills update
```

## Recommended Org Move

Current repo lives at:

```text
https://github.com/Tortugasaur/agent-skills
```

For company distribution, consider moving it under a company/org GitHub account later. Commands stay the same except the owner changes.
