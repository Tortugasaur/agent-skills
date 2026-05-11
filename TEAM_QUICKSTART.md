# Team Quickstart

Use this for onboarding coworkers to the shared `agent-skills` pack.

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

## 2. Raw Codex CLI

Raw Codex does not load Hermes skills. Copy the baseline instruction file into the project repo:

```bash
cp AGENTS.md /path/to/project/AGENTS.md
```

Then append project-specific instructions below it.

## 3. Verify Skill Hub Access

```bash
scripts/verify-hub.sh
```

## 4. What Coworkers Are Adding

Core skills add behavior, not external binaries:

- concise/default-efficient responses
- narrow-first repo inspection
- large-output summarization
- durable handoffs/corrections
- evaluation gate for external tools

They do **not** globally install RTK, Context Mode, Token Savior, claude-context, or other MCP/binary tools. Those remain in the source/evaluation docs until reviewed.

Source docs to inspect:

```text
sources/token-saver-repos.md
sources/workflow-context-repos.md
```

## 5. If Agent Feels Too Restrictive

Patch the skill pack. Do not make every teammate invent workarounds.

Common fix locations:

- too terse → `AGENTS.md`, `skills/token-saver`, optional `caveman`
- not enough repo context → `skills/repo-inspect`
- noisy outputs still flooding context → `skills/tool-output-filtering`
- handoffs weak → `skills/workflow-context-engineering`
- external tool risk unclear → `skills/token-tool-evaluation`
