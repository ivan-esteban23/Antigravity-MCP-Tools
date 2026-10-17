#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_dir"
for dep in gh git; do
  command -v "$dep" >/dev/null 2>&1 || { printf 'Install git and github-cli first.\n' >&2; exit 1; }
done
[[ -d .git || -f .git ]] || { printf 'Run this script from a cloned Git repository.\n' >&2; exit 1; }
expected='ivan-esteban23/Antigravity-MCP-Tools'
actual="$(gh repo view --json nameWithOwner --jq .nameWithOwner)"
[[ "$actual" == "$expected" ]] || { printf 'Unexpected repository: %s\n' "$actual" >&2; exit 1; }
origin="$(git remote get-url origin)"
case "$origin" in
  https://github.com/ivan-esteban23/Antigravity-MCP-Tools|https://github.com/ivan-esteban23/Antigravity-MCP-Tools.git|git@github.com:ivan-esteban23/Antigravity-MCP-Tools.git) ;;
  *) printf 'Origin does not match the intended repository.\n' >&2; exit 1 ;;
esac
git add -- config.json mcp_config.json install.sh enable-image-only.sh publish.sh manage.py README.md IMAGE_GENERATION.md CATALOG.md catalog.json profile-notes.json google-cloud-endpoints.json .gitignore
if ! git diff --cached --quiet; then
  git commit -m 'Update Antigravity MCP catalog and configuration templates'
fi
git push origin HEAD
