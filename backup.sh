#!/bin/bash
# ===========================================
# 🔄 n8n Auto Backup to GitHub (Render Ready)
# ===========================================

echo "🌀 Starting n8n backup process..."

# Pastikan semua env sudah ada
if [ -z "$GITHUB_TOKEN" ] || [ -z "$GITHUB_REPO" ]; then
  echo "❌ Missing GITHUB_TOKEN or GITHUB_REPO environment variables."
  echo "Backup skipped."
  exit 0
fi

# Buat folder backup
mkdir -p /home/node/.n8n_backup

# Ekspor semua workflow (pakai perintah baru)
echo "📦 Exporting workflows..."
n8n export:workflow --all --output=/home/node/.n8n_backup/workflows.json || {
  echo "⚠️ No workflows found or export failed."
  exit 0
}

# Encode file ke Base64 untuk GitHub API
echo "📤 Uploading to GitHub..."
ENCODED_CONTENT=$(base64 -w 0 /home/node/.n8n_backup/workflows.json)

# Upload ke GitHub via REST API
curl -s -X PUT \
  -H "Authorization: Bearer ${GITHUB_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{
    \"message\": \"Auto backup workflows $(date '+%Y-%m-%d %H:%M:%S')\",
    \"content\": \"${ENCODED_CONTENT}\",
    \"branch\": \"${GITHUB_BRANCH:-main}\"
  }" \
  "https://api.github.com/repos/${GITHUB_REPO}/contents/workflows-backup.json"

if [ $? -eq 0 ]; then
  echo "✅ Backup uploaded successfully!"
else
  echo "❌ GitHub upload failed."
fi

echo "🎉 Backup complete."
