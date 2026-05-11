# Agent Skills

Standard skill pack for company Hermes, Codex-backed Hermes, Claude Code, and raw Codex CLI clients.

Goal: give every agent the same safe baseline without reducing anyone's ability to work on different products such as Call Hermes or Roblox game projects.

## Design Principles

1. **Baseline, not cage** — these skills reduce waste and improve handoffs. They do not override project-specific instructions, user requests, or safety requirements.
2. **Preserve capability** — agents can still research, design, debug, write long explanations, inspect broad code areas, or use external tools when the task requires it.
3. **Escalate deliberately** — start narrow and cheap; broaden only when needed; document why.
4. **Separate core from experimental** — install instruction-level skills by default; audit external binaries/MCPs before team-wide rollout.
5. **Project overlays win** — Call Hermes and Roblox work can add their own repos, commands, terminology, and QA gates on top of this shared base.

## Core Skills

Install these for most agents:

- `token-saver` — baseline cost/context discipline without skipping verification.
- `codex-client-bootstrap` — setup checklist for new Codex/Hermes clients.
- `tool-output-filtering` — compact summaries for noisy developer output.
- `repo-inspect` — narrow-first repository discovery with clear broadening rules.
- `workflow-context-engineering` — durable corrections, searchable project knowledge, compact handoffs, and safe plugin evaluation.

Optional style skill:

- `caveman` — terse output style. Use only for internal/dev chats where terse style helps. Do not use for customer-facing copy, docs, legal/security warnings, or when a teammate asks for normal prose.

Evaluation-only skill:

- `token-tool-evaluation` — audit/evaluate external token-saving binaries, MCPs, and prompt packs before standardizing.

## Install in Hermes

```bash
hermes skills tap add Tortugasaur/agent-skills
hermes skills install --yes Tortugasaur/agent-skills/skills/token-saver
hermes skills install --yes Tortugasaur/agent-skills/skills/codex-client-bootstrap
hermes skills install --yes Tortugasaur/agent-skills/skills/tool-output-filtering
hermes skills install --yes Tortugasaur/agent-skills/skills/repo-inspect
hermes skills install --yes Tortugasaur/agent-skills/skills/workflow-context-engineering
hermes skills install --yes Tortugasaur/agent-skills/skills/token-tool-evaluation
```

Optional:

```bash
hermes skills install --yes Tortugasaur/agent-skills/skills/caveman
```

Hermes tap expects:

```text
skills/<skill-name>/SKILL.md
```

This repo follows that shape.

## Raw Codex CLI

Raw Codex does not load Hermes skills. Copy or symlink `AGENTS.md` into repos where Codex works.

```bash
cp AGENTS.md /path/to/project/AGENTS.md
```

Then append project-specific notes below the shared baseline.

## Project Overlays

Use the shared baseline plus project-specific instructions:

- `overlays/call-hermes.md` — Call Hermes / HVAC phone-agent work.
- `overlays/roblox-game.md` — Roblox/Luau game-development work.

These overlays are intentionally small. They should add project context and QA gates, not duplicate the whole skill pack.

## Sources

See `sources/token-saver-repos.md` for upstream repo list from the X thread.
See `sources/workflow-context-repos.md` for Pro Workflow and Context Mode consolidation notes.

## Rollout Guidance

1. Start with core skills only.
2. Add project overlays per repo.
3. Keep `caveman` opt-in per teammate/client.
4. Use `token-tool-evaluation` before installing RTK, Context Mode, Token Savior, or code-search MCPs globally.
5. If a skill slows a teammate down, patch the skill instead of telling people to work around it.

Quickstart docs:

```text
TEAM_QUICKSTART.md
COMPANY_ROLLOUT.md
```

Helper scripts:

```bash
scripts/install-core.sh
scripts/apply-overlay.sh call-hermes /path/to/repo
scripts/apply-overlay.sh roblox-game /path/to/repo
scripts/verify-hub.sh
```
