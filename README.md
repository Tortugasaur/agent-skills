# Agent Skills

Standard skill pack for Hermes, Codex-backed Hermes, and raw Codex CLI clients.

Goal: every client shares same token-saving behavior, terse style, tool-output discipline, and handoff format.

## Skills

- `token-saver` — baseline cost/context discipline.
- `caveman` — terse output style.
- `codex-client-bootstrap` — setup checklist for new Codex/Hermes clients.
- `tool-output-filtering` — patterns for noisy command/log reduction.

## Install in Hermes

After pushing this repo to GitHub:

```bash
hermes skills tap add <github-user-or-org>/agent-skills
hermes skills search --source github token-saver
hermes skills install <id>
hermes skills install <id-for-caveman>
hermes skills update
```

Hermes tap expects:

```text
skills/<skill-name>/SKILL.md
```

This repo follows that shape.

## Raw Codex CLI

Raw Codex does not load Hermes skills. Copy or symlink `AGENTS.md` into repos where Codex works.

```bash
cp AGENTS.md /path/to/project/AGENTS.md
```

## Sources

See `sources/token-saver-repos.md` for upstream repo list from the X thread.
