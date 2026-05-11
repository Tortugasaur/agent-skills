# Agent Rules

Shared baseline for Codex/Hermes coding clients.

## Token Discipline

- Be terse. No filler, no long preambles.
- Use bullets.
- Final answer: changed, proof, next.
- Do not paste raw large logs; save logs to file and summarize failures.
- Do not scan vendor/build dirs unless needed: `node_modules`, `.next`, `dist`, `build`, `coverage`, `.git`.

## Repo Inspection

1. Search exact symbols/paths first.
2. Read smallest likely files.
3. Read narrow line ranges.
4. Broaden only if needed.

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
