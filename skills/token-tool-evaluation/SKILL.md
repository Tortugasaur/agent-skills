---
name: token-tool-evaluation
description: Use when evaluating token-saving external tools before standardizing them across Hermes, Codex, Claude Code, or MCP-based clients. Provides a safety, license, install, benchmark, and rollback gate.
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  source:
    x_post: https://x.com/DeRonin_/status/2045420155434320270
    upstream_repos:
      - https://github.com/rtk-ai/rtk
      - https://github.com/mksglu/context-mode
      - https://github.com/Mibayy/token-savior
      - https://github.com/zilliztech/claude-context
      - https://github.com/tirth8205/code-review-graph
      - https://github.com/ooples/token-optimizer-mcp
      - https://github.com/nadimtuhin/claude-token-optimizer
      - https://github.com/alexgreensh/token-optimizer
  hermes:
    tags: [tokens, evaluation, mcp, codex, hermes, security]
    related_skills: [token-saver, tool-output-filtering, workflow-context-engineering]
---

# Token Tool Evaluation

## Overview

Use this skill before installing or standardizing external token-saving tools. Many tools promise huge savings, but some add hooks, wrappers, MCP servers, background storage, or license constraints.

Default: mine safe instructions first; install external tooling only after audit.

## When to Use

- Evaluating RTK, Context Mode, Token Savior, claude-context, code-review-graph, or token optimizer MCPs.
- Deciding what becomes default across Codex/Hermes clients.
- Comparing token behavior before/after a tool.
- Reviewing any MCP/plugin that intercepts shell, web, file reads, or code navigation.

## Evaluation Gate

### 1. Metadata

Record:

```md
Repo:
Version/commit:
License:
Runtime:
Install path:
Config files touched:
Hooks/background processes:
Network/API needs:
Rollback command:
```

### 2. Safety Review

Check for:

- shell hooks or command interception
- credential/env access
- network calls
- background daemons
- telemetry
- writable global config
- auto-start behavior
- license limits

### 3. Disposable Test

Never first-install globally. Use a disposable repo/worktree.

```bash
tmp="$(mktemp -d)"
cd "$tmp"
git init
printf 'console.log("hello")\n' > index.js
git add . && git commit -m init
```

### 4. Benchmark Shape

Use the same task before and after tool install:

```md
Task:
Baseline command(s):
Baseline output size:
Tool command(s):
Tool output size:
Errors hidden? yes/no
Exit code preserved? yes/no
Quality same? yes/no
Setup friction:
Rollback tested: yes/no
```

### 5. Decision

Pick one:

- **mine-patterns** — copy ideas into skills/AGENTS only.
- **per-project** — install only in repos that need it.
- **global-default** — safe enough for all clients.
- **reject** — too risky/heavy/unclear.

## Tool-Specific Notes

### RTK

Likely first binary to test. Gate:

- preserves exit codes
- never hides first failing error
- works with test/build/package commands
- easy uninstall

### Context Mode

High-value idea, heavier behavior. Gate:

- license accepted
- MCP/plugin install understood
- hooks and command interception reviewed
- storage location known
- clean-session behavior confirmed

### Token Savior / claude-context

Gate:

- MCP config isolated
- indexing storage local and understandable
- no secret ingestion
- improves code navigation on real repo
- doesn't require paid embeddings unless explicitly configured

### Code-review-graph

Gate:

- Tree-sitter parser coverage for target languages
- graph build time reasonable
- review output better than simple symbol search

### Prompt/setup repos

For `claude-token-efficient` and `claude-token-optimizer`, prefer mining text into:

- the shared project instruction file
- `token-saver`
- `repo-inspect`
- `tool-output-filtering`

## Common Pitfalls

1. Installing all token tools at once. Test one variable at a time.
2. Counting smaller output as success when errors disappear. Quality must stay.
3. Ignoring license limits for client/commercial work.
4. Letting hooks mutate global client behavior without rollback.
5. Standardizing MCPs before every client supports MCP cleanly.

## Verification Checklist

- [ ] Repo/license/install path recorded.
- [ ] Hooks/network/storage reviewed.
- [ ] Disposable test completed.
- [ ] Before/after result captured.
- [ ] Rollback tested.
- [ ] Decision recorded as mine-patterns/per-project/global-default/reject.
