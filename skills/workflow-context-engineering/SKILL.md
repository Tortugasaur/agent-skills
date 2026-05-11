---
name: workflow-context-engineering
description: Use when standardizing agent clients for durable corrections, compact handoffs, low-noise command handling, searchable project knowledge, and safe evaluation of workflow/context plugins.
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  source:
    upstream_repos:
      - https://github.com/rohitg00/pro-workflow
      - https://github.com/mksglu/context-mode
  hermes:
    tags: [workflow, context, memory, handoff, tokens, codex, hermes]
    related_skills: [token-saver, tool-output-filtering, codex-client-bootstrap]
---

# Workflow Context Engineering

## Overview

Use this as the shared operating pattern for coding-agent clients. It extracts the useful parts of Pro Workflow and Context Mode without requiring their full plugin stacks.

Goal: every client learns from corrections, keeps context clean, resumes cleanly, and leaves a useful handoff.

## When to Use

- Setting up or reviewing a new agent client.
- User gives workflow/plugin repos to consolidate.
- Sessions keep repeating same mistakes.
- Context gets polluted by raw command output or huge tool results.
- Work spans multiple sessions, worktrees, or agents.

## Core Loop

1. **Capture correction**
   - If user corrects behavior/convention, write a short rule.
   - Rule format: `When <trigger>, prefer <behavior>, because <reason>`.
   - Keep it project-specific unless broadly reusable.

2. **Work with clean context**
   - Transform/filter/count/compare data in code or shell scripts.
   - Return only answer, failing lines, and artifact paths.
   - Keep raw detailed output in files or indexed storage.

3. **Search before asking on resume**
   - Check handoff notes, recent commits, project docs, and saved rules.
   - Ask user only if the missing decision cannot be recovered.

4. **Wrap up**
   - Summarize changed files, verification, blockers, and next action.
   - Save only durable rules or docs, not temporary chatter.

## Correction Rule Template

```md
## Rule: <short name>
Trigger: <when this matters>
Behavior: <what to do>
Reason: <why>
Scope: global | project | repo
Source: user correction | repo convention | verified bug
```

## Session Handoff Template

```md
## Goal
<one sentence>

## Done
- <completed work>

## Proof
- <command/test/check and result>

## Decisions
- <durable decisions only>

## Key files
- `<path>` — <why it matters>

## Blockers
- <none or specific blocker>

## Next action
<single smallest step>
```

## Plugin Evaluation Gate

Before adopting upstream workflow/context plugins across clients:

1. Read install path and generated files.
2. Identify hooks, background processes, network calls, and credential access.
3. Run in disposable repo first.
4. Verify uninstall/rollback.
5. Decide: mine patterns, install per-project, or standardize globally.

## Recommended Extraction

### From Pro Workflow

- Self-correction rules.
- End-session wrap-up.
- Searchable topic/project notes.
- Git/secret/cost quality gates.
- Agent-team/worktree patterns later.

### From Context Mode

- Sandbox noisy work.
- Batch independent I/O.
- Search indexed prior state before asking.
- Keep raw data out of chat context.
- Return files + compact summaries.

## What Not To Standardize Yet

- Full plugin stacks across all clients.
- Always-on hooks before audit.
- License-restricted tools in commercial/client work without review.
- Auto-research loops without budget caps.
- Any tool that silently blocks or rewrites normal shell/web behavior without clear docs.

## Verification Checklist

- [ ] Correction rules are short and scoped.
- [ ] Raw command details stored outside chat context.
- [ ] Resume flow checks existing notes before asking.
- [ ] Final answer includes proof and next action.
- [ ] External plugin adoption has audit notes and rollback path.
