#!/usr/bin/env bash
# Reset Antigravity CLI and disconnect external MCP servers on Linux.
set -euo pipefail
if [[ $(uname -s) != Linux ]]; then
  echo 'This script supports Linux only.' >&2
  exit 1
fi
if [[ ${EUID} == 0 ]]; then
  echo 'Run as your normal Linux user, without sudo.' >&2
  exit 1
fi
command -v python3 >/dev/null || { echo 'Install python first.' >&2; exit 1; }
exec python3 - "$@" <<'PY'
import argparse
import datetime
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

parser = argparse.ArgumentParser(description='Archive Antigravity CLI state and MCP configs, then reinstall from Google. No MCP templates are installed.')
parser.add_argument('--dry-run', action='store_true', help='Print paths without downloads or changes')
parser.add_argument('--workspace', action='append', type=Path, help='Also reset MCP configs in this project and its parent folders. Repeat for other projects. Default: current folder.')
parser.add_argument('--bin-dir', type=Path, help='Existing user-owned agy installation directory. Default: ~/.local/bin')
args = parser.parse_args()
home = Path.home().resolve()
bin_dir = (args.bin_dir or home / '.local/bin').expanduser().absolute()
target = bin_dir / 'agy'
paths = []

def add(path):
    path = path.absolute()
    # Do not traverse config-directory symlinks into unrelated locations.
    for parent in path.parents:
        if parent.is_symlink():
            raise ValueError(f'Symlinked parent directory requires manual review: {parent}')
    if (path.exists() or path.is_symlink()) and path not in paths:
        paths.append(path)

try:
    active = shutil.which('agy')
    if active and Path(active).absolute() != target:
        raise ValueError(f'agy resolves to {active}. Rerun with --bin-dir {Path(active).parent} after reviewing this installation. No changes made.')
    add(home / '.gemini/antigravity-cli')
    add(home / '.gemini/config/mcp_config.json')
    add(home / '.gemini/config/config.json')
    add(home / '.gemini/antigravity/mcp_oauth_tokens.json')
    add(home / '.cache/antigravity')
    add(home / '.cache/antigravity-cli')
    add(target)
    # Standalone Genmedia executables installed by the earlier image guide.
    for name in ('nanobanana', 'gemini', 'imagen', 'veo', 'lyria', 'avtool', 'omni'):
        add(home / '.local/bin' / f'mcp-{name}-go')
    for workspace in args.workspace or [Path.cwd()]:
        workspace = workspace.expanduser().resolve(strict=True)
        if not workspace.is_dir():
            raise ValueError(f'Workspace is not a directory: {workspace}')
        for folder in (workspace, *workspace.parents):
            add(folder / '.agents/mcp_config.json')
    for path in paths:
        if not os.access(path.parent, os.W_OK):
            raise ValueError(f'No write access to {path.parent}. No changes made.')
    if not os.access(bin_dir if bin_dir.exists() else home, os.W_OK):
        raise ValueError(f'Installation directory is not writable: {bin_dir}')
    print('Archive and remove from active use:', flush=True)
    for path in paths:
        print(f'  {path}', flush=True)
    print(f'Reinstall: {target}', flush=True)
    print('Shared Antigravity config and MCP connections also affect the App/IDE.', flush=True)
    print('Keyring sign-in, Google Cloud credentials, projects, and billing are unchanged.', flush=True)
    if args.dry_run:
        sys.exit(0)
    if not shutil.which('curl'):
        raise ValueError('Install curl first. No changes made.')
    # Never stop another session or race its state writes.
    if not shutil.which('pgrep'):
        raise ValueError('Install procps-ng first. No changes made.')
    running = subprocess.run(['pgrep', '-u', str(os.getuid()), '-x', 'agy'], stdout=subprocess.DEVNULL)
    if running.returncode == 0:
        raise ValueError('Close every running agy session, then rerun. No changes made.')
    if running.returncode != 1:
        raise ValueError('Unable to check running agy sessions. No changes made.')
    # Retrieve and check the official bootstrapper before moving any active files.
    with tempfile.TemporaryDirectory(prefix='antigravity-reset-') as staging:
        installer = Path(staging) / 'install.sh'
        subprocess.run(['curl', '--fail', '--silent', '--show-error', '--location',
                        '--proto', '=https', '--proto-redir', '=https',
                        '--connect-timeout', '20', '--max-time', '180',
                        'https://antigravity.google/cli/install.sh', '-o', str(installer)], check=True)
        subprocess.run(['bash', '-n', str(installer)], check=True)
        if not installer.stat().st_size:
            raise ValueError('Empty installer download. No changes made.')
        backup_root = home / 'AntigravityResetBackups'
        if backup_root.is_symlink():
            raise ValueError('Backup folder must not be a symlink. No changes made.')
        backup_root.mkdir(mode=0o700, exist_ok=True)
        backup = Path(tempfile.mkdtemp(prefix=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%SZ-'), dir=backup_root))
        os.chmod(backup, 0o700)
        manifest = []
        print(f'Backup: {backup}', flush=True)
        try:
            for index, path in enumerate(paths):
                saved = backup / f'{index:03d}-{path.name}'
                # Persist the intended destination before the move for recovery.
                manifest.append({'original': str(path), 'archived': str(saved)})
                (backup / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
                shutil.move(str(path), str(saved))
            env = os.environ.copy()
            # Use ordinary account sign-in rather than inherited API/ADC overrides.
            for key in ('AGY_ADC_AUTH', 'GEMINI_API_KEY', 'GOOGLE_API_KEY', 'GOOGLE_GEMINI_BASE_URL', 'GOOGLE_APPLICATION_CREDENTIALS'):
                env.pop(key, None)
            subprocess.run(['bash', str(installer), '--dir', str(bin_dir)], env=env, check=True)
            if not target.is_file() or not os.access(target, os.X_OK):
                raise ValueError('Installer did not produce an executable agy.')
        except BaseException:
            print(f'Reset interrupted. Originals are archived at {backup}. See manifest.json for their original paths. Restore only while Antigravity is closed.', file=sys.stderr)
            raise
    print('Fresh CLI installed. No external MCP configurations were restored.')
    print(f'Start with: {target}')
    print('Choose your personal Google account. Saved OS keyring sign-in might be reused.')
    print('Shell profile API/ADC overrides are unchanged. Remove AGY_ADC_AUTH there if previously set.')
except (OSError, ValueError, subprocess.CalledProcessError) as error:
    print(str(error), file=sys.stderr)
    sys.exit(1)
PY
