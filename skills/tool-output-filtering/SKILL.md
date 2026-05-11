---
name: tool-output-filtering
description: Use when keeping developer workflow summaries compact. Defines safe patterns for storing detailed command results separately and returning short actionable summaries.
version: 1.0.0
author: Luigi + Hermes Agent
license: MIT
metadata:
  source:
    x_post: https://x.com/DeRonin_/status/2045420155434320270
    upstream_repo: https://github.com/rtk-ai/rtk
  hermes:
    tags: [tokens, terminal, logs, filtering, rtk]
    related_skills: [token-saver]
---

# Tool Output Filtering

## Overview

Noisy tool output is biggest hidden token leak. Store raw output in a file. Bring only useful summary into context.

Inspired by RTK-style output filtering, but works with plain shell too.

## When to Use

- test suites
- build output
- package-manager output
- dev server output
- browser console output
- Playwright traces
- Docker/Kubernetes output
- large grep/search results

## Shell Patterns

### Tests

```bash
log="/tmp/test-$(date +%s).log"
npm test 2>&1 | tee "$log" | tail -80
printf '\nFULL_LOG=%s\n' "$log"
```

Then summarize:

```bash
grep -nE "FAIL|ERROR|Traceback|AssertionError|Expected|Received" "$log" | head -80
```

### Python tests

```bash
log="/tmp/pytest-$(date +%s).log"
python -m pytest -q 2>&1 | tee "$log" | tail -120
printf '\nFULL_LOG=%s\n' "$log"
```

### Package manager commands

```bash
log="/tmp/package-manager-$(date +%s).log"
<package-manager-command> 2>&1 | tee "$log" | tail -80
printf '\nFULL_LOG=%s\n' "$log"
```

### Git diffs

```bash
git status --short
git diff --stat
git diff --name-only
```

Read full diff only for files being edited/reviewed.

## Summary Format

Return:

```md
Command: <cmd>
Exit: <code>
Summary:
- <important result>
Failures:
- <file/test/error>
Full log: <path>
```

## RTK Evaluation Gate

Before standardizing RTK on all clients:

1. Install on one disposable client.
2. Compare same command with and without RTK.
3. Confirm it preserves exit codes.
4. Confirm it does not hide actionable errors.
5. Document install command + rollback.

## Common Pitfalls

1. `tail` hides first error. Use grep on saved full log.
2. Progress bars spam context. Disable with CI flags where possible.
3. Tool wrappers can hide exit codes. Always preserve/check `$?`.
4. Do not delete output files before final answer if user may need proof.

## Verification Checklist

- [ ] Raw command output saved to file.
- [ ] Exit code captured.
- [ ] Failures extracted compactly.
- [ ] Full output path included.
