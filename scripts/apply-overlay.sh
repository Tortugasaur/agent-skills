#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: scripts/apply-overlay.sh <call-hermes|roblox-game> [repo-dir]

Appends the selected overlay to AGENTS.md in repo-dir (default: current dir).
Creates AGENTS.md from the shared baseline if missing.
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" || $# -lt 1 ]]; then
  usage
  exit 0
fi

name="$1"
repo_dir="${2:-.}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root="$(cd "$script_dir/.." && pwd)"
overlay="$root/overlays/$name.md"
target="$repo_dir/AGENTS.md"

if [[ ! -f "$overlay" ]]; then
  echo "ERROR: unknown overlay '$name'" >&2
  echo "Available overlays:" >&2
  find "$root/overlays" -maxdepth 1 -name '*.md' -exec basename {} .md \; | sort >&2
  exit 1
fi

mkdir -p "$repo_dir"

if [[ ! -f "$target" ]]; then
  cp "$root/AGENTS.md" "$target"
  echo "Created $target from shared baseline"
fi

marker="<!-- agent-skills overlay: $name -->"
if grep -qF "$marker" "$target"; then
  echo "Overlay '$name' already present in $target"
  exit 0
fi

{
  printf '\n\n%s\n\n' "$marker"
  cat "$overlay"
} >> "$target"

echo "Applied overlay '$name' to $target"
