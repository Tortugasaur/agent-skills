#!/usr/bin/env bash
set -euo pipefail

TAP="${1:-<github-user-or-org>/agent-skills}"

if [[ "$TAP" == "<github-user-or-org>/agent-skills" ]]; then
  echo "Usage: ./bootstrap.sh owner/agent-skills"
  exit 2
fi

hermes skills tap add "$TAP" || true
hermes skills update || true

for skill in token-saver caveman codex-client-bootstrap tool-output-filtering workflow-context-engineering; do
  echo "== $skill =="
  hermes skills search --source github "$skill" || true
  echo
 done

echo "Install desired IDs with: hermes skills install <id>"
