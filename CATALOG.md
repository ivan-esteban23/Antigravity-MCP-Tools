# Official-source MCP catalog

Snapshot: 17 October 2026.

Every listing from the Antigravity Supported MCP servers section appears below. Additional explicit server links from google/mcp are included. A listing means Google links to the integration. It does not mean Google authors or operates the server.

Profiles are templates, not proof of a live connection. Manual entries need a vendor export or deployment-specific details. Individual tool inventories load after connecting and authenticating.

| Server | Config keys | Setup | Source |
| --- | --- | --- | --- |
| AlloyDB for PostgreSQL | alloydb-for-postgresql | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://cloud.google.com/alloydb/docs/ai/use-alloydb-mcp) |
| BigQuery | bigquery | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://cloud.google.com/bigquery/docs/use-bigquery-mcp) |
| Bigtable Admin remote MCP | bigtable-admin-remote-mcp | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/bigtable/docs/use-bigtable-mcp) |
| ClickHouse | clickhouse | Install uv. Configure the ClickHouse host, username and password. | [Google-linked source](https://clickhouse.com/docs/use-cases/AI/MCP) |
| Cloud SQL (MySQL, PostgreSQL, SQL Server, Managed) | cloud-sql-mysql-postgresql-sql-server-managed | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/sql/docs/mysql/use-cloudsql-mcp) |
| Dataplex | dataplex | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/dataplex/docs/use-remote-mcp) |
| MCP Toolbox for Databases | mcp-toolbox-for-databases | Create a Toolbox tools.yaml for your database. | [Google-linked source](https://mcp-toolbox.dev/documentation/introduction/) |
| MongoDB | mongodb | Provide the connection string. This template requests read-only mode. | [Google-linked source](https://github.com/mongodb-js/mongodb-mcp-server) |
| Neo4j | neo4j | Install the upstream Neo4j MCP server into a Python environment. Review its own required database settings before enabling. | [Google-linked source](https://neo4j.com/docs/mcp/current/), [connection guide](https://github.com/neo4j/mcp) |
| Neon | neon | OAuth or provider account setup | [Google-linked source](https://github.com/neondatabase-labs/mcp-server-neon) |
| Pinecone | pinecone | Pinecone account and API key. | [Google-linked source](https://github.com/pinecone-io/pinecone-mcp) |
| Prisma | prisma | OAuth or provider account setup | [Google-linked source](https://github.com/prisma/prisma?tab=readme-ov-file#mcp-server) |
| Redis | redis | Install uv and set REDIS_URL to your database URL. | [Google-linked source](https://github.com/redis/mcp-redis) |
| Spanner | spanner | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/spanner/docs/use-spanner-mcp) |
| Supabase | supabase | OAuth or provider account setup | [Google-linked source](https://github.com/supabase-community/supabase-mcp) |
| Apigee MCP | apigee-mcp | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/apigee/docs/reference/apis/apihub/mcp) |
| Atlassian | atlassian | OAuth or provider account setup | [Google-linked source](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/getting-started-with-the-atlassian-remote-mcp-server/) |
| Cloud CLI Execution | cloud-cli-execution | Install gcloud CLI and authenticate the intended account. | [Google-linked source](https://docs.cloud.google.com/sdk/use-gcloud-mcp) |
| Forge | Vendor import required | The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider. | [Google-linked source](https://app.softwareforge.ai/docs/introduction) |
| GitHub | github | Provide a GitHub PAT with the permissions needed for your repositories. | [Google-linked source](https://github.com/github/github-mcp-server) |
| GitLab Orbit | gitlab-orbit | OAuth or provider account setup | [Google-linked source](https://docs.gitlab.com/orbit/remote/access/mcp/) |
| GKE OneMCP | gke-onemcp | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/kubernetes-engine/docs/how-to/use-gke-mcp) |
| Harness | harness | OAuth or provider account setup | [Google-linked source](https://github.com/harness/mcp-server) |
| Heroku | heroku | Install the Heroku CLI and its MCP capability. Authenticate the intended Heroku account. | [Google-linked source](https://github.com/heroku/heroku-mcp-server) |
| Home Developer MCP | home-developer-mcp | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://developers.home.google.com/mcp/developer) |
| Linear | linear | OAuth or provider account setup | [Google-linked source](https://linear.app/changelog/2025-05-01-mcp) |
| mabl | mabl | Authenticate the mabl account and workspace. | [Google-linked source](https://help.mabl.com/hc/en-us/articles/47299375773844-mabl-MCP-overview), [connection guide](https://help.mabl.com/hc/en-us/articles/47299404357780-Set-up-the-cloud-MCP-server) |
| Netlify | netlify | Authenticate the Netlify CLI/MCP server. | [Google-linked source](https://github.com/netlify/netlify-mcp) |
| Opsera AI Agents | Vendor import required | The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider. | [Google-linked source](https://docs.agents.opsera.ai/) |
| Postman | postman | Postman API key. | [Google-linked source](https://github.com/postmanlabs/postman-mcp-server) |
| SonarQube | sonarqube | Install Docker and provide SonarQube Cloud token and organization. | [Google-linked source](https://github.com/SonarSource/sonarqube-mcp-server) |
| Vercel | vercel | OAuth or provider account setup | [Google-linked source](https://vercel.com/docs/agent-resources/vercel-mcp) |
| Canva | canva | Create a Canva Developer Portal client and complete its OAuth setup. Waitlist clients use the alternate endpoint in the guide. | [Google-linked source](https://www.canva.dev/docs/mcp/), [connection guide](https://www.canva.dev/docs/apps/quickstart/) |
| Chrome DevTools | chrome-devtools | Node.js and system Chromium. This is a separate browser from the Playwright profile. | [Google-linked source](https://github.com/ChromeDevTools/chrome-devtools-mcp) |
| Dart | dart | Install a Dart SDK version supporting mcp-server. | [Google-linked source](https://dart.dev/tools/mcp-server) |
| Figma Dev Mode MCP | figma-dev-mode-mcp | OAuth and Figma client eligibility, plan and rate limits apply. Endpoint verification does not prove every Figma tool works in this client. | [Google-linked source](https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Dev-Mode-MCP-Server) |
| Locofy | Vendor import required | The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider. | [Google-linked source](https://www.locofy.ai/docs/export-and-deployment/locofy-mcp/) |
| Lovable MCP | lovable-mcp | OAuth or provider account setup | [Google-linked source](https://docs.lovable.dev/integrations/lovable-mcp-server) |
| Miro | miro | OAuth or provider account setup | [Google-linked source](https://developers.miro.com/docs/miro-mcp) |
| Mobbin MCP | mobbin-mcp | Mobbin OAuth and an eligible plan. | [Google-linked source](https://mobbin.com/mcp), [connection guide](https://github.com/mobbin/mobbin-mcp-server) |
| CrowdStrike | crowdstrike | Install uv and create the credential env file described by CrowdStrike. | [Google-linked source](https://github.com/CrowdStrike/falcon-mcp) |
| Endor Labs | endor-labs | Authenticate Endor Labs and configure its namespace. | [Google-linked source](https://docs.endorlabs.com/setup-deployment/mcp/antigravity) |
| Splunk | splunk | Install/configure the official Splunk MCP app. Copy its endpoint and encrypted token. TLS verification remains enabled. | [Google-linked source](https://splunkbase.splunk.com/app/7931), [connection guide](https://help.splunk.com/en/splunk-enterprise/mcp-server-for-splunk-platform/1.0/connecting-to-the-mcp-server-and-settings) |
| Wiz | Vendor import required | The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider. | [Google-linked source](https://www.wiz.io/blog/introducing-wiz-mcp) |
| Airweave | airweave | Airweave OAuth and a synced collection. | [Google-linked source](https://github.com/airweave-ai/airweave), [connection guide](https://docs.airweave.ai/mcp-server) |
| Antimetal | antimetal | OAuth or provider account setup | [Google-linked source](https://docs.antimetal.com/connect) |
| Arize | arize | Install uv and follow upstream Arize tracing integration setup. | [Google-linked source](https://github.com/Arize-ai/arize-tracing-assistant) |
| Cloud Audit Manager | cloud-audit-manager | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/audit-manager/docs/reference/auditmanager/mcp) |
| Courtroom5 | courtroom5 | Public endpoint described in provider documentation. Client compatibility still requires verification. | [Google-linked source](https://courtroom5.com/), [connection guide](https://courtroom5.com/gemini/) |
| Daloopa | daloopa | Linked Daloopa page documents its documentation MCP, not guaranteed financial-data tools. A separate data-service endpoint requires vendor setup. | [Google-linked source](https://docs.daloopa.com/docs/mcp) |
| Docusign | docusign | Demo endpoint. Configure a Docusign integration key and OAuth client credentials before enabling. | [Google-linked source](https://developers.docusign.com/platform/mcp-server/), [connection guide](https://developers.docusign.com/platform/mcp-server/anthropic-claude/claude-code/) |
| Exa | exa | OAuth or provider account setup | [Google-linked source](https://docs.exa.ai/reference/exa-mcp) |
| FactSet AI-Ready Data | Vendor import required | The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider. | [Google-linked source](https://developer.factset.com/mcp/factset-ai-ready-data-mcp) |
| Finnhub | finnhub | Finnhub account, data subscription and authentication as documented by the provider. | [Google-linked source](https://finnhub.io/mcp), [connection guide](https://finnhub.io/static/finnhub-how-to-connect-mcp-server.html) |
| Firebase | firebase | Authenticate Firebase CLI and choose the intended project. | [Google-linked source](https://firebase.google.com/docs/ai-assistance/mcp-server) |
| Fiscal.ai | fiscal-ai | OAuth or provider account setup | [Google-linked source](https://docs.fiscal.ai/docs/guides/mcp-integration) |
| Google Cloud Quotas | google-cloud-quotas | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://cloud.google.com/docs/quotas/overview) |
| Grafana Cloud | grafana-cloud | OAuth or provider account setup | [Google-linked source](https://github.com/grafana/ai-marketplace/tree/main/plugins/grafana-cloud-mcp) |
| Guidepoint | Vendor import required | The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider. | [Google-linked source](https://github.com/guidepointglobal/mcp-skills-plugins) |
| Harvey | harvey | US endpoint. Use the EU or AU endpoint from the provider listing if your account resides there. Complete OAuth and client approval. | [Google-linked source](https://developers.harvey.ai/guides/harvey_mcp), [connection guide](https://claude.com/marketplace/connectors/harvey) |
| iManage | Vendor import required | The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider. | [Google-linked source](https://docs.imanage.com/ai/mcpserver-user-help/en-US/iManage_MCP_Server_Help.html) |
| LegalZoom | Vendor import required | The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider. | [Google-linked source](https://www.legalzoom.com/ai) |
| Looker | looker | Looker base URL and API client credentials. | [Google-linked source](https://mcp-toolbox.dev/documentation/connect-to/ides/looker_mcp/) |
| LSEG | lseg | LSEG licensed account, entitlements and OAuth. | [Google-linked source](https://developers.lseg.com/), [connection guide](https://github.com/LSEG-API-Samples/lseg-claude-plugin/blob/main/.mcp.json) |
| NetDocuments | Vendor import required | The catalog links to a Gemini Enterprise connector guide. A connector listing does not establish an Antigravity MCP endpoint. Obtain a supported MCP endpoint from the provider. | [Google-linked source](https://docs.cloud.google.com/gemini/enterprise/docs/connectors/netdocuments) |
| Notion | notion | OAuth or provider account setup | [Google-linked source](https://github.com/makenotion/notion-mcp-server) |
| Parallel Search | parallel-search | OAuth or provider account setup | [Google-linked source](https://docs.parallel.ai/search/search-mcp) |
| PayPal | paypal | OAuth or provider account setup | [Google-linked source](https://developer.paypal.com/tools/mcp-server/) |
| Perplexity Ask | perplexity-ask | Perplexity API key and API account limits. | [Google-linked source](https://github.com/ppl-ai/modelcontextprotocol) |
| PostHog | posthog | OAuth or provider account setup | [Google-linked source](https://posthog.com/mcp) |
| Relativity | Vendor import required | The catalog links to a Gemini Enterprise connector guide. A connector listing does not establish an Antigravity MCP endpoint. Obtain a supported MCP endpoint from the provider. | [Google-linked source](https://docs.cloud.google.com/gemini/enterprise/docs/connectors/relativity) |
| S&P Global | s-p-global | Install kensho-kfinance into your Python environment. Obtain S&P access and complete its authentication flow. | [Google-linked source](https://github.com/kensho-technologies/kfinance) |
| Salesforce | salesforce | Salesforce organization, supported client and OAuth setup. Review provider client registration requirements. | [Google-linked source](https://developer.salesforce.com/docs/platform/hosted-mcp-servers/guide/sobject-all.html) |
| Sequential Thinking | sequential-thinking | Node.js and npm. The original starter profile is enabled. | [Google-linked source](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking) |
| Stripe | stripe | OAuth or provider account setup | [Google-linked source](https://github.com/stripe/agent-toolkit/tree/main/modelcontextprotocol) |
| Windsor AI | windsor-ai | Windsor OAuth or API-key setup and connected data sources. | [Google-linked source](https://windsor.ai/documentation/windsor-mcp/), [connection guide](https://github.com/windsor-ai/windsor_mcp) |
| Cloud Resource Manager | google-cloud-resource-manager | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/resource-manager/reference/mcp) |
| Cloud SQL for PostgreSQL | google-cloud-sql-for-postgresql | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/sql/docs/postgres/use-cloudsql-mcp) |
| Cloud SQL for SQL Server | google-cloud-sql-for-sql-server | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/sql/docs/sqlserver/use-cloudsql-mcp) |
| Compute Engine (GCE) | google-compute-engine-gce | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/compute/docs/reference/mcp) |
| Developer Knowledge API (Google Developer Documentation) | google-developer-knowledge-api-google-developer-documentation | Enable the relevant Google API and supply its permitted API key. | [Google-linked source](https://developers.google.com/knowledge/mcp) |
| Firestore | google-firestore | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/firestore/native/docs/use-firestore-mcp) |
| Google Maps (Grounding Lite) | google-google-maps-grounding-lite | Enable the relevant Google API and supply its permitted API key. | [Google-linked source](https://developers.google.com/maps/ai/grounding-lite) |
| Google Security Operations (Chronicle) | google-google-security-operations-chronicle | Requires your SecOps region and instance configuration. Select a regional endpoint from the official SecOps documentation. | [Google-linked source](https://docs.cloud.google.com/chronicle/docs/reference/mcp), [connection guide](https://docs.cloud.google.com/mcp/supported-products) |
| Kubernetes Engine (GKE) | google-kubernetes-engine-gke | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/kubernetes-engine/docs/reference/mcp) |
| Cloud Run | google-cloud-run | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/run/docs/reference/mcp) |
| Cloud Storage | google-cloud-storage | Google credentials, API/MCP enablement, project and IAM permissions. Regional/account restrictions apply. | [Google-linked source](https://docs.cloud.google.com/storage/docs/reference/mcp) |
| Google Workspace | google-google-workspace | Install the official Workspace extension and authenticate it. Its extension-relative path is resolved locally. | [Google-linked source](https://github.com/gemini-cli-extensions/workspace) |
| Go | google-go | Install Go and a gopls version supporting MCP. | [Google-linked source](https://go.dev/gopls/features/mcp) |
| Google Analytics | google-google-analytics | Install pipx. Configure ADC with analytics.readonly scope and Analytics APIs. | [Google-linked source](https://github.com/googleanalytics/google-analytics-mcp) |
| Google Cloud Storage | google-google-cloud-storage | Google Cloud ADC and Cloud Storage permissions. | [Google-linked source](https://github.com/googleapis/gcloud-mcp/tree/main/packages/storage-mcp) |
| Genmedia | genmedia-nanobanana, genmedia-gemini, genmedia-imagen, genmedia-veo, genmedia-lyria, genmedia-avtool, genmedia-omni | Separate image, video, audio and compositing binaries. Install upstream binaries and configure Cloud credentials and output storage. | [Google-linked source](https://github.com/GoogleCloudPlatform/vertex-ai-creative-studio/tree/main/experiments/mcp-genmedia) |
| Google Cloud Security | google-security-secops, google-security-gti, google-security-scc, google-security-soar | Four separate security profiles. Follow each module credential setup. | [Google-linked source](https://github.com/google/mcp-security) |
| gcloud CLI | google-gcloud-cli | Same local gcloud server as Cloud CLI Execution. Enable one profile. | [Google-linked source](https://github.com/googleapis/gcloud-mcp/tree/main/packages/gcloud-mcp) |
| Google Cloud Observability | google-google-cloud-observability | Google Cloud ADC, quota project and enabled Observability APIs. | [Google-linked source](https://github.com/googleapis/gcloud-mcp/tree/main/packages/observability-mcp) |
| Flutter/Dart | google-flutter-dart | Same Dart server as the website entry. Enable one profile to avoid duplicate tool registrations. | [Google-linked source](https://github.com/dart-lang/ai/tree/main/pkgs/dart_mcp_server) |
| Angular | google-angular | Run in an Angular workspace and verify ng mcp support. | [Google-linked source](https://github.com/angular/angular-cli/tree/main/packages/angular/cli/src/commands/mcp) |
| Google Maps Platform Code Assist toolkit | google-google-maps-platform-code-assist-toolkit | Enable the relevant Google API and supply its permitted API key. | [Google-linked source](https://developers.google.com/maps/ai/mcp) |

## Remaining vendor setup

### Forge

The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider.

Source: https://app.softwareforge.ai/docs/introduction

After exporting its configuration locally, run `python3 manage.py import forge /path/to/vendor-export.json`, then `python3 manage.py setup forge`.

### Opsera AI Agents

The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider.

Source: https://docs.agents.opsera.ai/

After exporting its configuration locally, run `python3 manage.py import opsera-ai-agents /path/to/vendor-export.json`, then `python3 manage.py setup opsera-ai-agents`.

### Locofy

The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider.

Source: https://www.locofy.ai/docs/export-and-deployment/locofy-mcp/

After exporting its configuration locally, run `python3 manage.py import locofy /path/to/vendor-export.json`, then `python3 manage.py setup locofy`.

### Wiz

The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider.

Source: https://www.wiz.io/blog/introducing-wiz-mcp

After exporting its configuration locally, run `python3 manage.py import wiz /path/to/vendor-export.json`, then `python3 manage.py setup wiz`.

### FactSet AI-Ready Data

The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider.

Source: https://developer.factset.com/mcp/factset-ai-ready-data-mcp

After exporting its configuration locally, run `python3 manage.py import factset-ai-ready-data /path/to/vendor-export.json`, then `python3 manage.py setup factset-ai-ready-data`.

### Guidepoint

The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider.

Source: https://github.com/guidepointglobal/mcp-skills-plugins

After exporting its configuration locally, run `python3 manage.py import guidepoint /path/to/vendor-export.json`, then `python3 manage.py setup guidepoint`.

### iManage

The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider.

Source: https://docs.imanage.com/ai/mcpserver-user-help/en-US/iManage_MCP_Server_Help.html

After exporting its configuration locally, run `python3 manage.py import imanage /path/to/vendor-export.json`, then `python3 manage.py setup imanage`.

### LegalZoom

The linked source does not establish a portable connection for this package. Install through the official MCP Store or obtain the endpoint/command and authentication details from the provider.

Source: https://www.legalzoom.com/ai

After exporting its configuration locally, run `python3 manage.py import legalzoom /path/to/vendor-export.json`, then `python3 manage.py setup legalzoom`.

### NetDocuments

The catalog links to a Gemini Enterprise connector guide. A connector listing does not establish an Antigravity MCP endpoint. Obtain a supported MCP endpoint from the provider.

Source: https://docs.cloud.google.com/gemini/enterprise/docs/connectors/netdocuments

After exporting its configuration locally, run `python3 manage.py import netdocuments /path/to/vendor-export.json`, then `python3 manage.py setup netdocuments`.

### Relativity

The catalog links to a Gemini Enterprise connector guide. A connector listing does not establish an Antigravity MCP endpoint. Obtain a supported MCP endpoint from the provider.

Source: https://docs.cloud.google.com/gemini/enterprise/docs/connectors/relativity

After exporting its configuration locally, run `python3 manage.py import relativity /path/to/vendor-export.json`, then `python3 manage.py setup relativity`.

## Additional connection profiles

- context7: Original starter profile. See README.md.
- playwright: Original starter profile. See README.md.
- filesystem: Original starter profile. See README.md.
- google-managed-agentregistry-mcp: Original starter profile. See README.md.
- google-managed-aiplatform-mcp-endpoints: Original starter profile. See README.md.
- google-managed-aiplatform-mcp-evaluation: Original starter profile. See README.md.
- google-managed-aiplatform-mcp-generate: Original starter profile. See README.md.
- google-managed-aiplatform-mcp-models: Original starter profile. See README.md.
- google-managed-aiplatform-mcp-notebook: Original starter profile. See README.md.
- google-managed-aiplatform-mcp-predict: Original starter profile. See README.md.
- google-managed-aiplatform-mcp-prompts: Original starter profile. See README.md.
- google-managed-aiplatform-mcp-retrieval: Original starter profile. See README.md.
- google-managed-aiplatform-mcp-tuning: Original starter profile. See README.md.
- google-managed-androidmanagement-mcp: Original starter profile. See README.md.
- google-managed-apikeys-mcp: Original starter profile. See README.md.
- google-managed-appoptimize-mcp: Original starter profile. See README.md.
- google-managed-apptopology-mcp: Original starter profile. See README.md.
- google-managed-backupdr-mcp: Original starter profile. See README.md.
- google-managed-bigquerydatatransfer-mcp: Original starter profile. See README.md.
- google-managed-bigquerymigration-mcp: Original starter profile. See README.md.
- google-managed-calendarmcp-mcp-v1: Original starter profile. See README.md.
- google-managed-chatmcp-mcp-v1: Original starter profile. See README.md.
- google-managed-cloud-mcp: Original starter profile. See README.md.
- google-managed-cloudasset-mcp: Original starter profile. See README.md.
- google-managed-cloudbilling-mcp: Original starter profile. See README.md.
- google-managed-cloudcli-mcp: Original starter profile. See README.md.
- google-managed-clouderrorreporting-mcp: Original starter profile. See README.md.
- google-managed-cloudlocationfinder-mcp: Original starter profile. See README.md.
- google-managed-cloudproductregistry-mcp: Original starter profile. See README.md.
- google-managed-cloudsupport-mcp: Original starter profile. See README.md.
- google-managed-cloudtrace-mcp: Original starter profile. See README.md.
- google-managed-databasecenter-mcp: Original starter profile. See README.md.
- google-managed-databaseinsights-mcp: Original starter profile. See README.md.
- google-managed-dataform-mcp: Original starter profile. See README.md.
- google-managed-datalineage-mcp: Original starter profile. See README.md.
- google-managed-datamigration-mcp: Original starter profile. See README.md.
- google-managed-dataplex-mcp-data-products: Original starter profile. See README.md.
- google-managed-dataproc-mcp: Original starter profile. See README.md.
- google-managed-datastream-mcp: Original starter profile. See README.md.
- google-managed-design-mcp: Original starter profile. See README.md.
- google-managed-discoveryengine-mcp: Original starter profile. See README.md.
- google-managed-drivemcp-mcp-v1: Original starter profile. See README.md.
- google-managed-file-mcp: Original starter profile. See README.md.
- google-managed-firebasedataconnect-mcp: Original starter profile. See README.md.
- google-managed-geminicloudassist-mcp: Original starter profile. See README.md.
- google-managed-gmailmcp-mcp-v1: Original starter profile. See README.md.
- google-managed-home-mcp: Original starter profile. See README.md.
- google-managed-iam-mcp: Original starter profile. See README.md.
- google-managed-logging-mcp: Original starter profile. See README.md.
- google-managed-maintenance-mcp: Original starter profile. See README.md.
- google-managed-managedkafka-mcp: Original starter profile. See README.md.
- google-managed-memorystore-mcp: Original starter profile. See README.md.
- google-managed-monitoring-mcp: Original starter profile. See README.md.
- google-managed-netapp-mcp: Original starter profile. See README.md.
- google-managed-networkmanagement-mcp: Original starter profile. See README.md.
- google-managed-oracledatabase-mcp: Original starter profile. See README.md.
- google-managed-orgpolicy-mcp: Original starter profile. See README.md.
- google-managed-paydeveloper-mcp: Original starter profile. See README.md.
- google-managed-people-mcp-v1: Original starter profile. See README.md.
- google-managed-policyassist-mcp: Original starter profile. See README.md.
- google-managed-policytroubleshooter-mcp: Original starter profile. See README.md.
- google-managed-pubsub-mcp: Original starter profile. See README.md.
- google-managed-recommender-mcp: Original starter profile. See README.md.
- google-managed-redis-mcp: Original starter profile. See README.md.
- google-managed-saasservicemgmt-mcp: Original starter profile. See README.md.
- google-managed-securitycenter-mcp-investigate: Original starter profile. See README.md.
- google-managed-securitycentermanagement-mcp-manage-services: Original starter profile. See README.md.
- google-managed-servicehealth-mcp: Original starter profile. See README.md.
- google-managed-stitch-mcp: Original starter profile. See README.md.
- google-managed-vectorsearch-mcp: Original starter profile. See README.md.
