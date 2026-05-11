---
name: repo-inspect
description: Use when a coding agent first enters a repository or needs to understand unfamiliar code without wasting context. Provides a narrow-first discovery workflow with clear rules for when to broaden scope.
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  hermes:
    tags: [repo, inspection, discovery, tokens, coding]
    related_skills: [token-saver, tool-output-filtering]
---

# Repo Inspect

## Overview

Use this at the start of coding work. The goal is not to read less at all costs; the goal is to read the right things first, then broaden deliberately when needed.

This keeps agents useful across different projects, including product apps, Roblox games, and Call Hermes systems.

## When to Use

- New repo or unfamiliar area.
- Debugging without knowing file locations.
- Planning a change across multiple modules.
- Reviewing a PR or branch.
- Preparing a handoff for another agent.

## Discovery Flow

1. **Identify repo shape**
   - top-level files
   - package/build config
   - app/source directories
   - test directories
   - project instruction files

2. **Find exact targets**
   - error text
   - component/function/class names
   - route names
   - Roblox service/module names
   - Call Hermes/HVAC product labels

3. **Read narrow files**
   - likely source file
   - nearby tests
   - local config
   - short docs that explain conventions

4. **Broaden if needed**
   - no exact hit
   - architectural change
   - cross-cutting bug
   - unclear ownership
   - generated types/config influence behavior

When broadening, state why in one line.

## Default Ignore List

Skip unless needed:

```text
.git
node_modules
.next
dist
build
coverage
.cache
.turbo
venv
.venv
__pycache__
```

## Minimal First Pass

Return compact summary:

```md
## Repo shape
- stack:
- key dirs:
- test/build commands found:

## Likely files for task
- path: reason

## Unknowns
- <only what matters>

## Next action
- <one step>
```

## When Broad Reads Are OK

Broad inspection is appropriate when:

- designing architecture
- auditing security
- diagnosing unknown cross-module behavior
- building onboarding docs
- mapping game systems/economy
- locating hidden generated/config behavior

Use broad tools carefully and summarize findings, not raw output.

## Common Pitfalls

1. Reading entire large files before searching exact terms.
2. Ignoring tests/config near the target file.
3. Treating token saving as more important than correctness.
4. Missing project instructions because only source files were inspected.
5. Forgetting that design/gameplay work may need richer exploration than a narrow bugfix.

## Verification Checklist

- [ ] Project instruction files checked if present.
- [ ] Exact target search attempted before broad crawl when possible.
- [ ] Nearby tests/config considered.
- [ ] Broadening rationale stated if broad inspection used.
- [ ] Next action is specific.
