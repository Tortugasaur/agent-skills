# Agent Rules

Shared baseline for company Codex/Hermes coding clients.

## Intent

These rules reduce token waste and improve handoffs. They are not a cage. If the task needs deeper research, broader inspection, richer explanation, visual design, debugging, or external tools, do that and explain why briefly.

Project-specific instructions appended below this baseline win.

## Token Discipline

- Prefer concise answers for internal work.
- Use bullets when they improve clarity.
- Final answer should usually include: changed, proof, next.
- Do not paste raw large logs; save detailed output to a file and summarize failures.
- Avoid scanning vendor/build dirs unless needed: `node_modules`, `.next`, `dist`, `build`, `coverage`, `.git`.

## Repo Inspection

Default discovery order:

1. Search exact symbols/paths first.
2. Read smallest likely files.
3. Read narrow line ranges.
4. Broaden when needed and say why.

## Command Output

For noisy commands:

```bash
log="/tmp/run-$(date +%s).log"
<command> 2>&1 | tee "$log" | tail -80
printf '\nFULL_LOG=%s\n' "$log"
```

Then inspect failures:

```bash
grep -nE "FAIL|ERROR|Traceback|AssertionError|Expected|Received" "$log" | head -80
```

If full output is necessary for correctness, inspect it.

## Handoff Format

```md
## Goal
<one sentence>

## State
- Done: <bullets>
- Blocker: <one line>

## Key files
- path: reason

## Commands run
- command → result/exit code

## Next action
<single smallest step>
```

## Safety

- Verify before claiming success.
- Ask before destructive actions or external writes.
- Never expose secrets.
- Use normal prose for customer-facing copy, legal/security warnings, onboarding docs, and teammate requests for more detail.
