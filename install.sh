#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
for dep in python3 node npx; do
  if ! command -v "$dep" >/dev/null 2>&1; then
    printf 'Missing dependency: %s. See README.md.\n' "$dep" >&2
    exit 1
  fi
done
if ! node -e 'process.exit(Number(process.versions.node.split(".")[0]) >= 22 ? 0 : 1)'; then
  printf 'Install Node.js 22 or newer.\n' >&2
  exit 1
fi
if [[ ! -x /usr/bin/chromium ]]; then
  printf 'Install Chromium: sudo pacman -Syu --needed chromium\n' >&2
  exit 1
fi
python3 - "$repo_dir/config.json" <<'PY'
import json, os, pathlib, shutil, tempfile, time, sys
source = pathlib.Path(sys.argv[1])
target = pathlib.Path.home() / '.gemini/config/mcp_config.json'
incoming = json.loads(source.read_text())
target.parent.mkdir(parents=True, exist_ok=True)
existing = {}
if target.exists():
    raw = target.read_text().strip()
    existing = json.loads(raw) if raw else {}
    if not isinstance(existing, dict) or not isinstance(existing.get('mcpServers', {}), dict):
        raise SystemExit('Existing config has an unsupported structure. No changes made.')
    backup = target.with_name(target.name + '.backup-' + str(time.time_ns()))
    shutil.copy2(target, backup)
    print('Backup:', backup)
servers = existing.setdefault('mcpServers', {})
for name, definition in incoming['mcpServers'].items():
    if name in servers:
        print('Preserved existing server:', name)
    else:
        servers[name] = definition
with tempfile.NamedTemporaryFile(mode='w', dir=target.parent, delete=False) as handle:
    temporary = pathlib.Path(handle.name)
    json.dump(existing, handle, indent=2)
    handle.write('\n')
os.chmod(temporary, 0o600)
os.replace(temporary, target)
(pathlib.Path.home() / 'AntigravityWorkspace').mkdir(exist_ok=True)
print('Installed:', target)
print('Restart Antigravity CLI. Open /mcp and authenticate Context7 when requested.')
PY
