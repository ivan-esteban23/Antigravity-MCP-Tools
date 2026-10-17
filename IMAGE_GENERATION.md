# Image generation only

This selects Google's Genmedia Nano Banana MCP for image generation and editing. It disables every other installed MCP server. The change happens on your Linux computer when you run the command.

## 1. Install the image server

Follow the [official Genmedia Go installation guide](https://github.com/GoogleCloudPlatform/genmedia-creative-studio/tree/main/experiments/mcp-genmedia/mcp-genmedia-go).

Its precompiled-binary installer is available here. Download and inspect it, then run it locally:

```bash
curl -fL https://raw.githubusercontent.com/GoogleCloudPlatform/genmedia-creative-studio/main/experiments/mcp-genmedia/mcp-genmedia-go/install-online.sh -o /tmp/install-google-genmedia.sh
less /tmp/install-google-genmedia.sh
bash /tmp/install-google-genmedia.sh
export PATH="$HOME/.local/bin:$PATH"
command -v mcp-nanobanana-go
```

The upstream installer downloads Genmedia binaries. The selection command below enables only the image server. This package does not execute the downloaded installer for you. If the upstream source redirects or changes, follow the current official installation guide.

## 2. Configure Google Cloud

Install [Google Cloud CLI for Linux](https://cloud.google.com/sdk/docs/install). Choose a Cloud project with billing, the required Vertex AI API enabled and image-model access. Your account needs the relevant Vertex AI permissions. This uses Google Cloud billing, separately from your Antigravity or ChatGPT subscription.

Replace YOUR_PROJECT_ID below with your actual Cloud project ID:

```bash
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
gcloud auth application-default set-quota-project YOUR_PROJECT_ID
```

Enable Vertex AI in that project if you have permission:

```bash
gcloud services enable aiplatform.googleapis.com --project YOUR_PROJECT_ID
```

## 3. Select the image-only configuration

In your Antigravity-MCP-Tools checkout:

```bash
git pull --ff-only
python3 manage.py image-only
```

Enter the project ID and Vertex AI location when prompted. The default location is us-central1. Use a location supported by your chosen model. Existing configured values or GOOGLE_CLOUD_PROJECT and GOOGLE_CLOUD_LOCATION environment variables are reused.

The command checks for mcp-nanobanana-go, gcloud and valid Application Default Credentials before writing. It saves a timestamped backup, enables genmedia-nanobanana and disables the other configured servers. It leaves the original repository templates unchanged.

A default storage bucket is optional for this server. The command removes the unresolved bucket placeholder instead of requiring a bucket before local-output image generation. Specific requests for Cloud Storage output need a valid bucket and storage permissions.

## 4. Restart and verify

Close Antigravity CLI and restart it:

```bash
agy
```

Open /mcp and check genmedia-nanobanana. Every other MCP server should show disabled. Ask the agent to list the image server's tools before requesting an image.

Example request:

```text
Use the Nano Banana MCP to generate a vertical fashion editorial portrait and save the image locally.
```

If authentication works but a generation fails, inspect the MCP error for API enablement, project billing, model access, region, IAM or quota details. A successful credentials check does not verify model access or billing. No account or image-generation request has been executed by this package during preparation.

## Official source

[Google Genmedia MCP project](https://github.com/GoogleCloudPlatform/genmedia-creative-studio/tree/main/experiments/mcp-genmedia) documents the Nano Banana server, environment variables and installation process.
