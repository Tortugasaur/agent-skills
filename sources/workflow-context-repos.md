# Workflow + Context Repo Sources

Captured: 2026-05-11
Purpose: consolidate workflow/context-engineering repos into the shared agent skill pack.

## Source Repos

| Repo | Role | License | Signal | Adoption stance |
|---|---|---:|---:|---|
| https://github.com/rohitg00/pro-workflow | Claude Code workflow system: self-correction memory, FTS5 wikis, hooks, commands, agent teams, cost tracking | MIT per package/license badge | ~2.1k stars | Mine for patterns first; do not copy whole plugin stack yet. |
| https://github.com/mksglu/context-mode | MCP/plugin that routes noisy work through sandbox + SQLite/FTS5, returns summaries/search hits instead of raw tool output | Elastic-2.0 | ~14.3k stars | Evaluate carefully; strong fit for context discipline, but license/behavior needs review before standard install. |

## What To Extract Now

### From pro-workflow

- Correction capture: turn repeated user corrections into durable rules.
- Session wrap-up: end with compact summary, changed files, tests, blockers.
- Knowledge plane: project/topic notes indexed and retrievable across sessions.
- Quality gates: secret checks, git checks, cost awareness, anti-sycophancy.
- Parallel worktrees / agent teams: useful later for multi-client orchestration.

### From context-mode

- Think in code: transform/filter/count/compare data in a sandboxed script, print only answer.
- Sandbox noisy outputs: raw tool output goes to storage/index, not chat context.
- Search before asking on resumed work.
- Batch I/O: group independent lookups to avoid many tool calls.
- Fresh session should not inherit stale context unless explicitly continued.

## Adoption Rule

Add low-risk instructions to this repo now. Do not standardize external binaries/MCPs until:

1. install path reviewed
2. license accepted
3. permissions and hooks audited
4. tested on disposable repo
5. rollback documented

## Derived Skill

`skills/workflow-context-engineering/SKILL.md` captures the reusable pattern without requiring either upstream plugin.