#!/bin/bash
set -e

# Path lokasi backup workflow
BACKUP_PATH="/home/node/.n8n_backup"
mkdir -p "$BACKUP_PATH"

# Backup semua workflow aktif
echo "Starting n8n workflow backup..."
n8n export:workflow --all --output="$BACKUP_PATH/workflows.json" || true

echo "Backup complete: $BACKUP_PATH/workflows.json"
