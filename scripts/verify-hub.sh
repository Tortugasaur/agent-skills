#!/usr/bin/env bash
set -euo pipefail

TAP="${1:-Tortugasaur/agent-skills}"

if ! command -v hermes >/dev/null 2>&1; then
  echo "ERROR: hermes CLI not found in PATH" >&2
  exit 1
fi

printf 'Checking tap %s\n' "$TAP"
hermes skills tap add "$TAP" || true

skills=(
  token-saver
  codex-client-bootstrap
  tool-output-filtering
  repo-inspect
  workflow-context-engineering
  token-tool-evaluation
  caveman
)

failed=0
for skill in "${skills[@]}"; do
  echo
  echo "== Search: $skill =="
  if ! hermes skills search --source github "$skill"; then
    failed=1
  fi
done

exit "$failed"
