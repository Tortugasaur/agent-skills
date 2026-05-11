# Team Quickstart

Use this for onboarding teammates quickly.

## 1. Install Core Hermes Skills

```bash
git clone https://github.com/Tortugasaur/agent-skills.git
cd agent-skills
scripts/install-core.sh
```

Equivalent one-liner from any machine with Hermes:

```bash
hermes skills tap add Tortugasaur/agent-skills
hermes skills install --yes Tortugasaur/agent-skills/skills/token-saver
hermes skills install --yes Tortugasaur/agent-skills/skills/codex-client-bootstrap
hermes skills install --yes Tortugasaur/agent-skills/skills/tool-output-filtering
hermes skills install --yes Tortugasaur/agent-skills/skills/repo-inspect
hermes skills install --yes Tortugasaur/agent-skills/skills/workflow-context-engineering
hermes skills install --yes Tortugasaur/agent-skills/skills/token-tool-evaluation
```

Optional terse internal style:

```bash
hermes skills install --yes Tortugasaur/agent-skills/skills/caveman
```

## 2. Add Project Instructions

### Call Hermes repo

```bash
cd agent-skills
scripts/apply-overlay.sh call-hermes /path/to/call-hermes-repo
```

### Roblox repo

```bash
cd agent-skills
scripts/apply-overlay.sh roblox-game /path/to/roblox-repo
```

This creates or updates `AGENTS.md` in the target repo.

## 3. Verify Skill Hub Access

```bash
scripts/verify-hub.sh
```

## 4. Teammate Defaults

Recommended default:

- core skills installed
- project overlay applied in each repo
- `caveman` only if teammate wants terse internal style
- no external token MCPs/binaries globally until `token-tool-evaluation` passes

## 5. If Agent Feels Too Restrictive

Patch the skill pack. Do not make every teammate invent workarounds.

Common fix locations:

- too terse → `AGENTS.md`, `skills/token-saver`, optional `caveman`
- not enough repo context → `skills/repo-inspect`
- noisy outputs still flooding context → `skills/tool-output-filtering`
- handoffs weak → `skills/workflow-context-engineering`
- external tool risk unclear → `skills/token-tool-evaluation`
