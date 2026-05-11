#!/usr/bin/env bash
set -euo pipefail

TAP="${1:-Tortugasaur/agent-skills}"

if ! command -v hermes >/dev/null 2>&1; then
  echo "ERROR: hermes CLI not found in PATH" >&2
  exit 1
fi

echo "== Agent Skills core install =="
echo "Tap: $TAP"

hermes skills tap add "$TAP" || true

core_skills=(
  token-saver
  codex-client-bootstrap
  tool-output-filtering
  repo-inspect
  workflow-context-engineering
  token-tool-evaluation
)

for skill in "${core_skills[@]}"; do
  echo
  echo "== Installing $skill =="
  hermes skills install --yes "$TAP/skills/$skill"
done

cat <<EOF

Core install complete.

Optional terse internal style:
  hermes skills install --yes $TAP/skills/caveman

Update later:
  hermes skills update
EOF
