# Agent Skills

Standard skill pack for company Hermes, Codex-backed Hermes, Claude Code, and raw Codex CLI clients.

Goal: give coworkers one transparent, shared set of skills derived from specific GitHub repos and X/Twitter research. This repo should improve efficiency without reducing anyone's ability to work deeply when needed.

## Design Principles

1. **One shared set** — same core skills for all teams/projects.
2. **Baseline, not cage** — skills reduce waste and improve handoffs; they do not override project-specific repo instructions or teammate requests.
3. **Caveman optional** — terse style is useful, but not everyone wants it and it should not affect customer-facing/docs/design work unless chosen.
4. **Source transparent** — coworkers can inspect exactly which upstream repos inspired each skill.
5. **External tools are evaluated first** — binaries/MCPs/hooks are not standard defaults until audited.

## Core Skills

Install these for most agents:

- `token-saver` — baseline cost/context discipline without skipping verification.
- `codex-client-bootstrap` — setup checklist for new Codex/Hermes clients.
- `tool-output-filtering` — compact summaries for noisy developer output.
- `repo-inspect` — narrow-first repository discovery with clear broadening rules.
- `workflow-context-engineering` — durable corrections, searchable project knowledge, compact handoffs, and safe plugin evaluation.
- `token-tool-evaluation` — audit/evaluate external token-saving binaries, MCPs, and prompt packs before standardizing.

Optional style skill:

- `caveman` — terse output style. Install only if a teammate/client wants that style.

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

Then append project-specific repo instructions below the shared baseline.

## Upstream Sources

Main source docs:

- `sources/token-saver-repos.md` — X thread token-saving repo list, tiered adoption plan, snapshot metadata.
- `sources/workflow-context-repos.md` — Pro Workflow and Context Mode consolidation notes.

Key upstream repos captured:

| Upstream repo | How it maps into this pack |
|---|---|
| https://github.com/JuliusBrussee/caveman | Optional `caveman` style skill. |
| https://github.com/drona23/claude-token-efficient | Mined into `AGENTS.md` and `token-saver`. |
| https://github.com/rtk-ai/rtk | Pattern mined into `tool-output-filtering`; binary not globally installed. |
| https://github.com/mksglu/context-mode | Pattern mined into `workflow-context-engineering`; plugin/MCP requires evaluation. |
| https://github.com/rohitg00/pro-workflow | Pattern mined into `workflow-context-engineering`. |
| https://github.com/Mibayy/token-savior | Evaluation backlog via `token-tool-evaluation`. |
| https://github.com/zilliztech/claude-context | Evaluation backlog via `token-tool-evaluation`. |
| https://github.com/tirth8205/code-review-graph | Evaluation backlog via `token-tool-evaluation`. |
| https://github.com/ooples/token-optimizer-mcp | Evaluation backlog via `token-tool-evaluation`. |
| https://github.com/nadimtuhin/claude-token-optimizer | Mined/evaluation backlog. |
| https://github.com/alexgreensh/token-optimizer | Evaluation backlog. |

## Helper Scripts

```bash
scripts/install-core.sh       # install core skills
scripts/verify-hub.sh         # verify skill hub search sees this repo
bootstrap.sh                  # show/search skills from tap
```

## Rollout Guidance

1. Start with core skills only.
2. Keep `caveman` opt-in.
3. Let each project repo add its own `AGENTS.md` details after the shared baseline.
4. Use `token-tool-evaluation` before installing RTK, Context Mode, Token Savior, or code-search MCPs globally.
5. If a skill slows a teammate down, patch the skill instead of telling people to work around it.
