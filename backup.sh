#!/bin/bash
set -e

echo "📦 Starting backup before n8n start..."

BACKUP_DIR="/home/node/.n8n_backup"
mkdir -p "$BACKUP_DIR"

if command -v n8n >/dev/null 2>&1; then
  echo "🔍 Checking for existing workflows..."
  n8n export:workflow --all --output="$BACKUP_DIR/workflows.json" || echo "No workflows to export."
else
  echo "⚠️ n8n not found in PATH"
fi

echo "✅ Backup complete, starting n8n..."
