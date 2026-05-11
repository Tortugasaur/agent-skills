# Token-Saver Repo Sources

Source X post: https://x.com/DeRonin_/status/2045420155434320270
Captured: 2026-05-11
Purpose: seed standardized token-saving skills/instructions for Hermes and Codex clients.

## Source Repos

| Priority | Repo | Role | Notes |
|---|---|---|---|
| 1 | https://github.com/JuliusBrussee/caveman | Output compression | 65-75% fewer output tokens by terse caveman style. Hermes already has local equivalent. |
| 1 | https://github.com/drona23/claude-token-efficient | Drop-in instruction file | Convert concepts into AGENTS.md + SKILL.md. Best low-friction baseline. |
| 1 | https://github.com/rtk-ai/rtk | Terminal output filtering | CLI proxy filters noisy command output before context. Evaluate for tests/logs/builds. |
| 2 | https://github.com/mksglu/context-mode | Tool-output sandbox | Stores raw tool output outside conversation, injects summaries only. Similar to Hermes execute_code pattern. |
| 2 | https://github.com/Mibayy/token-savior | Symbolic code navigation MCP | Potential MCP for code symbol navigation + persistent memory. Audit before standardizing. |
| 2 | https://github.com/zilliztech/claude-context | Code search MCP | BM25 + vector retrieval over codebase. Heavy but useful for large repos. |
| 3 | https://github.com/tirth8205/code-review-graph | Code review graph | Knowledge graph for review. Evaluate for monorepos/PR review clients. |
| 3 | https://github.com/ooples/token-optimizer-mcp | Caching/compression MCP | Claims large savings. Need security/reliability audit. |
| 3 | https://github.com/nadimtuhin/claude-token-optimizer | Setup prompts | Mine for prompt patterns, likely not install. |
| 3 | https://github.com/alexgreensh/token-optimizer | Ghost token finder | Inspect later for useful checks. |

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
