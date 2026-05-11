---
name: codex-client-bootstrap
description: Use when setting up a new Codex-backed Hermes client or raw Codex CLI workspace so every client shares the same token-saving defaults, skill sources, project instruction behavior, auth checks, and verification flow.
version: 1.0.0
author: Luigi + Hermes Agent
license: MIT
metadata:
  source:
    x_post: https://x.com/DeRonin_/status/2045420155434320270
    upstream_repo: null
  hermes:
    tags: [codex, bootstrap, hermes, skills, tokens]
    related_skills: [token-saver, caveman, tool-output-filtering]
---

# Codex Client Bootstrap

## Overview

Standardize every Codex/Hermes client so behavior is predictable:

- same skill tap
- same token-saving instructions
- same terse style
- same repo inspection rules
- same handoff format

## When to Use

- New machine/client.
- New Hermes profile.
- Raw Codex CLI workspace.
- Rebuilding auth/model setup.
- Making sure all clients behave same way.

## Hermes Client Setup

```bash
hermes doctor
hermes auth list openai-codex || true
hermes config set model.provider openai-codex
hermes config set model.default gpt-5.5
hermes config set model.base_url https://chatgpt.com/backend-api/codex
```

Add canonical skill tap once repo is on GitHub:

```bash
hermes skills tap add <github-user-or-org>/agent-skills
hermes skills search --source github token-saver
hermes skills install <id>
hermes skills update
```

Verify:

```bash
hermes skills list | grep -E 'token-saver|caveman'
hermes config | sed -n '1,20p'
```

## Raw Codex CLI Setup

Raw Codex does not load Hermes skills. Mirror essential rules into the repo-level instruction file used by that client.

Minimum instruction contents:

```md
# Agent Rules

- Use terse responses.
- Avoid broad repo scans.
- Store noisy logs in files; summarize failures only.
- Ignore node_modules, .next, dist, build, coverage, .git unless needed.
- Verify changes before final answer.
- Final answer: changed, proof, next.
```

## Per-Repo Bootstrap

In each active project, copy the shared instruction file into the client-specific instruction path:

Place the shared baseline text in the client-specific instruction path used by that project.

Or append project-specific notes below shared baseline.

## Verification Checklist

- [ ] Hermes model/provider set.
- [ ] Skill tap added.
- [ ] `token-saver` installed or loadable.
- [ ] Raw Codex repos have the shared project instruction file.
- [ ] Test command proves client follows terse/token rules.
