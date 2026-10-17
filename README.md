# Anti Gravity MCP Tools. Expanded official-source edition

Prepared 17 October 2026 for Antigravity CLI on Omarchy / Arch Linux.

## Fresh CLI reset

Run `git pull --ff-only`, close Antigravity App/IDE and all `agy` sessions, then run:

```bash
bash reset-antigravity.sh --dry-run
bash reset-antigravity.sh
```

This archives CLI settings, plugins, sessions, known caches, shared Antigravity settings, global MCP definitions and MCP OAuth tokens, plus the known Genmedia executables under ~/.local/bin. It removes the old agy binary and uses Google's official installer for a fresh CLI. No MCP templates are reinstalled. Originals remain in a private timestamped folder under ~/AntigravityResetBackups with a manifest of original paths. Do not commit this backup, which contains credentials and history.

The current folder and its parent folders are checked for `.agents/mcp_config.json`. To include other projects, pass `--workspace /absolute/project/path` once per project. Explicit workspace arguments replace the default current-folder scope. The script does not search your entire disk. Other project configs remain active when opening those projects. Run from each additional project or list every intended project with --workspace.

The shared ~/.gemini/config/config.json and global MCP definitions also affect Antigravity App/IDE. Close those surfaces before resetting. The script preserves other Gemini files, project code, system packages, npm/uv caches, and external server installations other than the seven known user-local Genmedia binaries. Removing MCP definitions disconnects those other servers from the reset CLI. Built-in tools remain part of Antigravity.

Google Cloud credentials, resources and billing are unchanged. Account credentials in the OS keyring are also unchanged, so automatic sign-in might occur. For a fresh account login, use `/logout` before closing the old session. Do not choose the API-key or Cloud route for subscription usage. If you previously exported AGY_ADC_AUTH in your shell profile, remove this override yourself. The script does not rewrite shell profiles. A reset does not add image-generation entitlement or change subscription quotas.

The official installer downloads the CLI after the old state is archived. If installation fails, originals remain in the printed backup folder. Close Antigravity, inspect manifest.json, and move the archived entries back to their original paths, saving any newly created files separately first. A failed installer download or failed prerequisite check leaves the existing installation unchanged. Use `--bin-dir /your/user/bin` for a nondefault user-owned installation. Package-manager/system installations require their own removal process, and this script refuses to reset a different executable found on PATH.

Sources: [Google CLI quickstart](https://antigravity.google/docs/cli-getting-started), [official installer](https://antigravity.google/cli/install.sh), [MCP configuration locations](https://antigravity.google/docs/mcp?tab=cli), [account sign-in and keyring](https://antigravity.google/docs/install?tab=cli).

## Image generation only

After pulling the repository, run `bash enable-image-only.sh`. This checks for the Nano Banana binary and Google application credentials, requests the Cloud project and location, backs up your config and enables only `genmedia-nanobanana`. Other MCP servers become disabled. Your computer performs these changes when you run the command.

See [IMAGE_GENERATION.md](IMAGE_GENERATION.md) for binary installation, Cloud setup and troubleshooting. Google Cloud usage uses your own project's billing. A Google/Antigravity login does not replace Application Default Credentials.

## Coverage

- All 76 listings from the official Antigravity Supported MCP servers section are documented in CATALOG.md and catalog.json.
- 98 catalog records include additional explicit server links from Google's google/mcp repository.
- 167 connection profiles appear in config.json and its identical mcp_config.json copy.
- 10 catalog records need vendor configuration imports. They have no fabricated connection in config.json. Their names and exact source links appear under Remaining vendor setup in CATALOG.md.
- google-cloud-endpoints.json contains 562 endpoint variants observed in Google's supported-products documentation. This is an endpoint reference, with every entry disabled. Regional replicas represent the same service, not hundreds of different tools. Review product-specific authentication before importing a variant.

The Antigravity CLI repository points users to the MCP documentation. The additional Google server inventory comes from google/mcp and its linked upstream repositories. Google lists many third-party servers and does not operate every integration in the list.

The JSON files configure servers. The servers publish individual tools after connection, authentication and account entitlement checks. Listing a provider does not grant account access or transfer your ChatGPT/Upsy connections.

## Files

| File | Purpose |
| --- | --- |
| config.json | Portable connection templates |
| mcp_config.json | Identical copy with Antigravity's expected filename |
| install.sh | Backup and merge into the global Antigravity config |
| reset-antigravity.sh | Archive CLI state and MCP definitions, then reinstall a clean CLI |
| manage.py | List, enable, disable, configure or import servers locally |
| CATALOG.md | Every server, status, setup requirement and primary source |
| catalog.json | Machine-readable coverage and source index |
| profile-notes.json | Additional setup details by profile |
| google-cloud-endpoints.json | Disabled endpoint variants for product-specific setup |
| publish.sh | Create the private GitHub repository from your own authenticated computer |

## Installation on Omarchy

Keep an existing working Node version-manager installation. Local Node servers need Node.js 22 or newer, npm and npx. Playwright and Chrome DevTools use Chromium. Python manages the config. GitHub CLI is only needed for publishing.

Install missing system dependencies:

```bash
sudo pacman -Syu --needed chromium git github-cli python
```

If Node.js and npm are absent:

```bash
sudo pacman -Syu --needed nodejs npm
```

Extract this package. Open a terminal in the anti-gravity-mcp-tools folder:

```bash
bash install.sh
python3 manage.py list
```

The installer backs up an existing config, preserves existing server names and adds missing entries to `~/.gemini/config/mcp_config.json`. It creates `~/AntigravityWorkspace` for the filesystem starter profile. It does not install every provider's binary, create cloud resources, enable paid services or authorize accounts.

Only the original four starter profiles are enabled: Context7, Playwright, Filesystem and Sequential Thinking. Context7 still requires OAuth. All additional profiles remain disabled until you configure their dependencies and accounts. The main config leaves Antigravity's tool approvals unchanged.

For manual paste into your currently empty file, use config.json and save the installed file as mcp_config.json. The current standard global path is above. Follow the MCP manager's shown path if your installed release differs.

## Enable an OAuth provider

For example:

```bash
python3 manage.py enable notion
python3 manage.py enable figma-dev-mode-mcp
```

Restart Antigravity, open `/mcp` and complete each provider's sign-in flow. Some providers require client registration, administrator approval or specific subscriptions. An endpoint template is not a guarantee of support for an arbitrary client.

## Configure a token, project, path or region

Values like `${GITHUB_PERSONAL_ACCESS_TOKEN}` are template variables handled by manage.py. This package does not assume Antigravity expands those strings. Leave such entries disabled until setup substitutes every required value.

```bash
python3 manage.py setup github
python3 manage.py setup google-google-security-operations-chronicle
python3 manage.py setup google-google-workspace
```

Setup reads matching environment variables or asks for hidden local input. It updates only your installed config and uses file mode 0600. It does not modify repository templates. Do not commit your installed config, tokens, backups or vendor exports.

To disable a server:

```bash
python3 manage.py disable github
```

To add a provider requiring its own exported configuration:

```bash
python3 manage.py import locofy /absolute/path/to/vendor-export.json
python3 manage.py setup locofy
```

Import accepts one server definition or a normal mcpServers export. It translates a remote `url` field to Antigravity's `serverUrl`, removes the foreign transport field and imports disabled. Provider-specific unsupported fields require manual review instead of silent conversion.

The manual setup entries are: Forge, Opsera AI Agents, Locofy, Wiz, FactSet AI-Ready Data, Guidepoint, iManage, LegalZoom, NetDocuments, Relativity. The Google catalog links NetDocuments and Relativity to Gemini Enterprise connector guides. Those guides do not establish a portable Antigravity MCP endpoint.

## Provider dependencies

Consult CATALOG.md before enabling a profile.

- Google Cloud: install gcloud when needed, select your intended project, set up Application Default Credentials, enable the specific API/MCP service and grant the required IAM permissions. Product-specific scopes and preview access vary. Media generation, deployments and data services use your own cloud account and billing.
- Genmedia: install the official Go release binaries referenced by the upstream guide. Profiles include image, video, music and compositing executables. Confirm which binaries your installed release supplies before enabling each profile. Configure PROJECT_ID, LOCATION and GENMEDIA_BUCKET.
- Google security: install uv and follow each SecOps, threat-intelligence, Security Command Center or SOAR module's setup. No generic login covers every module.
- Workspace local extension: install the official extension and authenticate it, then supply its absolute installation directory. Its own script handles extension startup. Installing a Gemini extension does not automatically register it in Antigravity.
- Python servers: use their documented virtual environment, pipx or uv setup. If a server uses python3 in this template, replace the command with the absolute interpreter path for the environment where you installed the package. Do not run system-wide pip installs on Arch.
- Databases: supply your actual connection settings and permissions. MongoDB and Neo4j templates request read-only modes. Review other providers individually.
- Docker: SonarQube needs a working Docker installation and its account configuration.
- Dart, Angular and Go: install the relevant SDK or tools and launch in an appropriate project.

No connection test has been run against your accounts. Package validation covers JSON, documented field shapes, catalog coverage and local configuration operations.

## Verify locally

Restart Antigravity and open `/mcp`. Inspect logs and tool lists for the profiles you enabled. Ask it to list connected servers. Then try one relevant read-only action per server. Server count is different from tool count.

If npm downloads fail, check registry connectivity. If npx works in a terminal but not in Antigravity, launch Antigravity from the same terminal or use the absolute npx path returned by `command -v npx`. A stdio server waiting for input during a manual terminal run is normal.

The filesystem startup folder is `~/AntigravityWorkspace`. MCP Roots supplied by a client override command-line folders in the upstream filesystem server. Ask `list_allowed_directories` to confirm effective access. The Playwright profile starts an isolated headless browser with no existing Vivaldi logins.

## GitHub repository

Repository: https://github.com/ivan-esteban23/Antigravity-MCP-Tools

Clone and install on your Omarchy computer:

```bash
git clone https://github.com/ivan-esteban23/Antigravity-MCP-Tools.git
cd Antigravity-MCP-Tools
bash install.sh
python3 manage.py list
```

For future updates, run `git pull --ff-only` in this checkout and rerun `bash install.sh`. The installer adds new server names while preserving your existing local server entries and credentials. Compare existing entries with the new templates before changing them manually.

If you intentionally edit the repository templates, `bash publish.sh` commits the known package files and pushes the current branch after verifying the origin repository. The script needs a working Git checkout and authentication. Your installed config stays outside this checkout.

## Sources and attribution

- [Antigravity MCP documentation and server catalog](https://antigravity.google/docs/mcp/)
- [Official Antigravity CLI repository](https://github.com/google-antigravity/antigravity-cli)
- [Google MCP repository](https://github.com/google/mcp)
- [Google supported products and endpoints](https://docs.cloud.google.com/mcp/supported-products)
- Individual provider sources and setup guides appear in CATALOG.md.

Google supported-products documentation is licensed under CC BY 4.0, with code samples under Apache 2.0, as stated on that page. Endpoint facts were reorganized into templates and a reference index. This package is an independent user configuration, not a Google product or endorsement.
