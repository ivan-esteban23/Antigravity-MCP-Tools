#!/usr/bin/env bash
# GitHub.com OAuth setup for Omarchy. Requests full documented resource scopes.
set +x
set -euo pipefail
umask 077

account='ivan-esteban23'
scopes=(repo workflow admin:org admin:public_key admin:repo_hook admin:org_hook
        gist notifications user project delete_repo write:packages read:packages
        delete:packages admin:gpg_key admin:ssh_signing_key codespace
        admin:enterprise read:audit_log)
scope_csv=$(IFS=,; printf '%s' "${scopes[*]}")
while (($#)); do
  case "$1" in
    --account)
      [[ -n ${2:-} && $2 != -* ]] || { echo '--account needs a GitHub username.' >&2; exit 1; }
      account=$2
      shift 2
      ;;
    --scopes) printf '%s\n' "$scope_csv"; exit 0 ;;
    -h|--help)
      echo 'Usage: bash setup-github.sh [--account USERNAME] [--scopes]'
      echo 'Default account: ivan-esteban23. Browser authorization is required.'
      echo 'Requests repository deletion, organization/enterprise administration, keys, packages, and other resource scopes.'
      echo 'GitHub roles and organization policies still apply. No MCP is installed.'
      exit 0
      ;;
    *) printf 'Unknown argument: %s\n' "$1" >&2; exit 1 ;;
  esac
done
[[ ${EUID} != 0 ]] || { echo 'Run as your normal user, without sudo.' >&2; exit 1; }
[[ -t 0 ]] || { echo 'Run this script from an interactive terminal.' >&2; exit 1; }

if ! command -v git >/dev/null || ! command -v gh >/dev/null; then
  command -v pacman >/dev/null || { echo 'Install git and GitHub CLI first.' >&2; exit 1; }
  echo 'Installing missing Git/GitHub CLI packages with pacman.'
  sudo pacman -Syu --needed git github-cli
fi

# Authenticate this local CLI, independently of inherited automation tokens/hosts.
unset GH_TOKEN GITHUB_TOKEN GH_ENTERPRISE_TOKEN GITHUB_ENTERPRISE_TOKEN GH_HOST GH_DEBUG
echo "Authorize GitHub CLI in your browser as $account."
echo 'Requested permissions include deleting repositories and managing organization/enterprise settings.'
gh auth login --hostname github.com --git-protocol https --web --scopes "$scope_csv"
login=$(gh api --hostname github.com /user --jq '.login')
if [[ ${login,,} != ${account,,} ]]; then
  printf 'Signed in as %s instead of %s. Git settings were not changed. Rerun and choose the intended browser account.\n' "$login" "$account" >&2
  exit 1
fi

# Check returned scopes rather than assuming browser authorization granted all.
granted=$(gh api --hostname github.com --include --method GET /user |
  awk 'tolower($0) ~ /^x-oauth-scopes:/ {sub(/^[^:]*:[[:space:]]*/, ""); gsub(/[\r[:space:]]/, ""); print}')
[[ -n $granted ]] || { echo 'No OAuth scope header returned. Unable to verify full permissions.' >&2; exit 1; }
has_scope() { [[ ,$granted, == *,"$1",* ]]; }
missing=()
for scope in "${scopes[@]}"; do
  has_scope "$scope" && continue
  # GitHub normalizes away scopes already included in broader grants.
  case "$scope" in
    admin:repo_hook) has_scope repo && continue ;;
    read:packages) has_scope write:packages && continue ;;
  esac
  missing+=("$scope")
done
printf 'Granted OAuth scopes: %s\n' "$granted"
if ((${#missing[@]})); then
  printf 'Missing requested scope: %s\n' "${missing[@]}" >&2
  echo 'GitHub did not grant the complete requested permission set. Git settings were not changed.' >&2
  exit 1
fi

# Preserve global Git settings before registering the HTTPS credential helper.
git_config_backup=''
if [[ -e $HOME/.gitconfig || -L $HOME/.gitconfig ]]; then
  git_config_backup=$(mktemp "$HOME/.gitconfig.before-github-setup.XXXXXXXX")
  cat "$HOME/.gitconfig" > "$git_config_backup"
  chmod 600 "$git_config_backup"
fi
gh auth setup-git --hostname github.com
gh config set git_protocol https --host github.com

# Keep existing commit identity. Fill missing values using public account info.
if ! git config --global --get user.name >/dev/null; then
  display_name=$(gh api --hostname github.com /user --jq '.name // .login')
  git config --global user.name "$display_name"
fi
if ! git config --global --get user.email >/dev/null; then
  account_id=$(gh api --hostname github.com /user --jq '.id')
  git config --global user.email "${account_id}+${login}@users.noreply.github.com"
fi
printf 'GitHub CLI and HTTPS Git authentication configured for %s.\n' "$login"
[[ -z $git_config_backup ]] || printf 'Previous global Git settings: %s\n' "$git_config_backup"
echo 'Account roles, organization SSO, app restrictions, and repository protections still apply.'
echo 'Existing SSH repository remotes keep using SSH authentication.'
echo 'Inherited token variables were ignored inside this script. Parent-shell token variables are unchanged.'
