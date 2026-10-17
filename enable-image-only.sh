#!/usr/bin/env bash
# Enable only Google's Nano Banana image-generation MCP.
set -euo pipefail

script_dir="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v python3 >/dev/null 2>&1; then
  printf 'Python 3 is required. Install with: sudo pacman -Syu --needed python\n' >&2
  exit 1
fi

if [[ ! -f "$script_dir/manage.py" ]]; then
  printf 'manage.py is missing. Run this script from the complete Antigravity-MCP-Tools checkout.\n' >&2
  exit 1
fi

exec python3 "$script_dir/manage.py" image-only
