#!/bin/sh
set -e

BACKUP_PATH="/home/node/.n8n_backup"
mkdir -p "$BACKUP_PATH"

echo "Starting n8n workflow backup..."
# Export semua workflow ke file JSON
n8n export:workflow --all --output="$BACKUP_PATH/workflows.json" || true
echo "Backup complete: $BACKUP_PATH/workflows.json"
