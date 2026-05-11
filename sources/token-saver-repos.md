# Token-Saver Repo Sources

Source X post: https://x.com/DeRonin_/status/2045420155434320270
Captured: 2026-05-11
Purpose: seed standardized token-saving skills/instructions for Hermes and Codex clients.

## Tiered Adoption Plan

### Tier 1 — install/port now

| Repo | Role | Why now | Agent-skills action |
|---|---|---|---|
| https://github.com/JuliusBrussee/caveman | Output token saver | Low-risk instruction/style layer; cuts verbose output. | Already represented by `skills/caveman`. Keep as default style. |
| https://github.com/drona23/claude-token-efficient | Drop-in terse instruction file | Easy to convert into `AGENTS.md` / `SKILL.md`; universal across raw Codex and Hermes clients. | Mine into `AGENTS.md`, `skills/token-saver`, and future `repo-inspect`. |
| https://github.com/rtk-ai/rtk | Terminal output filtering | High value when clients run noisy commands: tests, logs, builds. | Evaluate binary separately; current safe extraction lives in `skills/tool-output-filtering`. |

### Tier 2 — evaluate before standard

| Repo | Role | Why evaluate | Gate |
|---|---|---|---|
| https://github.com/mksglu/context-mode | Sandbox raw tool output into SQLite; summaries/search enter conversation | Strong fit for Hermes tool-output discipline, but installs hooks/MCP/plugin behavior and uses Elastic-2.0. | Audit install, hooks, license, network/credential access, rollback. Pattern extracted into `skills/workflow-context-engineering`. |
| https://github.com/Mibayy/token-savior | MCP symbolic code navigation + memory | Could reduce code navigation tokens if MCP support is clean across clients. | Verify MCP tools, local-only behavior, permission model, and benchmark on one repo. |
| https://github.com/zilliztech/claude-context | Code search MCP, BM25 + vector | Useful for large codebases, heavier stack. | Audit deps, indexing storage, model/API requirements, and retrieval quality. |

### Tier 3 — inspect later

| Repo | Role | Initial stance |
|---|---|---|
| https://github.com/tirth8205/code-review-graph | Tree-sitter/code knowledge graph for PR review | Maybe useful for PR review clients; inspect after Tier 1/2. |
| https://github.com/ooples/token-optimizer-mcp | Caching/compression MCP | Need security/reliability audit. |
| https://github.com/nadimtuhin/claude-token-optimizer | Setup prompts for Claude docs/token savings | Likely mine for instructions, not install. |
| https://github.com/alexgreensh/token-optimizer | Ghost-token/context-quality finder | Need README audit; possible diagnostic skill later. |

## Source Repos — Snapshot Metadata

| Repo | Stars at capture | Language | License | Notes |
|---|---:|---|---|---|
| https://github.com/rtk-ai/rtk | ~45.9k | Rust | Apache-2.0 | CLI proxy; claimed 60-90% reduction on common dev commands. |
| https://github.com/mksglu/context-mode | ~14.3k | TypeScript | Elastic-2.0 | MCP/plugin; context sandbox + SQLite/FTS5 + routing rules. |
| https://github.com/tirth8205/code-review-graph | ~16.1k | Python | MIT | Local code graph for reviews. |
| https://github.com/Mibayy/token-savior | ~837 | Python | MIT | MCP symbolic navigation + memory. |
| https://github.com/JuliusBrussee/caveman | ~58.1k | JavaScript | MIT | Output style compression. |
| https://github.com/drona23/claude-token-efficient | ~5.2k | docs/instructions | MIT | Single instruction file style. |
| https://github.com/ooples/token-optimizer-mcp | ~363 | TypeScript | MIT | Caching/compression MCP. |
| https://github.com/nadimtuhin/claude-token-optimizer | ~372 | Shell | MIT | Prompt/setup optimization. |
| https://github.com/alexgreensh/token-optimizer | ~951 | Python | Unclear/NOASSERTION | Ghost-token/context-quality tool. |
| https://github.com/zilliztech/claude-context | ~10.9k | TypeScript | MIT | Code search MCP with hybrid retrieval. |

## Adoption Rule

Default standard pack should be boring and low-risk:

1. Terse response skill/instructions.
2. Tool-output discipline skill.
3. Codebase inspection rules that avoid broad reads.
4. Optional external binaries/MCPs only after audit.

## Provenance Format

Each derived skill should include:

```yaml
metadata:
  source:
    x_post: https://x.com/DeRonin_/status/2045420155434320270
    upstream_repo: <repo-url-or-null>
```
