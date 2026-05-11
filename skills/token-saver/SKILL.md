---
name: token-saver
description: Use when reducing token cost and context bloat across Hermes, Codex, Claude Code, and other coding-agent clients. Enforces terse output, scoped file access, compact tool results, and explicit escalation before heavy crawls or external MCP stacks.
version: 1.0.0
author: Luigi + Hermes Agent
license: MIT
metadata:
  source:
    x_post: https://x.com/DeRonin_/status/2045420155434320270
    upstream_repo: null
  hermes:
    tags: [tokens, cost, compression, codex, hermes, claude-code]
    related_skills: [caveman, tool-output-filtering, codex-client-bootstrap]
---

# Token Saver

## Overview

Use this skill to reduce context waste during coding-agent sessions without losing correctness. The core principle: only high-signal information enters the conversation. Raw logs, broad file dumps, generated assets, and repeated outputs stay outside context unless needed.

This is the standard baseline for every Codex/Hermes client.

## When to Use

Load this when:

- Starting any coding, debugging, repo inspection, PR review, or research task.
- User asks for lower token cost, less verbosity, or "caveman"/terse mode.
- Running commands that may produce large output: tests, builds, logs, package installs, grep/find, Playwright, browser traces.
- Inspecting a large repo or unfamiliar codebase.
- Handing work between multiple agents/clients.

Don't use this as excuse to skip verification. Save tokens by narrowing scope, not by guessing.

## Response Rules

1. Default terse.
   - No filler.
   - No restating obvious context.
   - No long explanations unless user asks.
   - Final answer: what changed, proof, next step.

2. Preserve exact technical terms.
   - Code, paths, commands, errors stay exact.
   - Do not compress names that could confuse.

3. Avoid speculative walls.
   - If missing info is retrievable, fetch it.
   - If not retrievable, state assumption in one line.

4. Prefer bullets over prose.

## Tool-Use Rules

### File Access

Use targeted reads first:

1. Search filenames or exact symbols.
2. Read smallest likely files.
3. Read narrow line ranges.
4. Only then broaden.

Avoid:

- reading entire large files
- dumping vendor/build dirs
- scanning `node_modules`, `.next`, `dist`, `build`, `coverage`, `.git`
- broad OR-heavy regex when exact handle/path exists

### Command Output

For noisy commands:

```bash
# Good: summarize/limit output while preserving exit code
npm test 2>&1 | tee /tmp/test.log | tail -80
```

Then inspect full log only if needed:

```bash
grep -n "FAIL\|ERROR\|Traceback" /tmp/test.log | head -50
```

### Long Logs

Store raw logs in files. Bring back:

- exit code
- failing test names
- first relevant error
- changed summary
- path to full log

### Browser / Playwright

Do not paste whole DOM snapshots unless needed. Prefer:

- accessibility snapshot filtered to target elements
- screenshot only when layout matters
- console errors + failed requests
- one viewport, one repro path

## Coding-Agent Client Baseline

Every client should have:

1. A project instruction file with token discipline.
2. `token-saver` skill or equivalent client instruction file.
3. Terse response style (caveman/full if user prefers).
4. Tool-output filtering habit.
5. Compact handoff format.

## External Tools to Evaluate

Source list: `sources/token-saver-repos.md`.

Adopt in this order:

1. **Instruction-only**: caveman, claude-token-efficient ideas.
2. **Output filtering**: RTK or equivalent shell wrappers.
3. **Symbolic navigation**: Token Savior or code search MCP only after audit.
4. **Context sandboxing**: Context Mode if it fits Hermes/Codex workflow.

Do not standardize external MCPs/binaries without:

- reading README/install path
- checking permissions/secrets exposure
- testing on one disposable repo
- measuring before/after token behavior

## Compact Handoff Format

Use this when passing work to another agent/client:

```md
## Goal
<one sentence>

## State
- Done: <bullets>
- Current blocker: <one line>

## Key files
- path: why it matters

## Commands run
- command → result/exit code

## Next action
<single smallest step>
```

## Common Pitfalls

1. **Saving tokens by skipping tests.** Wrong. Save tokens by limiting output; still verify.
2. **Broad repo crawls first.** Search exact symbols/paths first.
3. **Pasting full logs.** Store raw logs, extract failures.
4. **Installing shiny MCPs everywhere.** Audit one client first.
5. **Over-compressing final answers.** Terse is good; ambiguous is bad.

## Verification Checklist

- [ ] Did not read/dump unnecessary large files.
- [ ] No vendor/build dirs scanned unless explicitly needed.
- [ ] No noisy command output pasted raw.
- [ ] Final answer includes verification/proof.
- [ ] Handoff includes paths and next action if work continues.
