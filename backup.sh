#!/bin/bash
set -e

# Backup path
BACKUP_PATH="/home/node/.n8n_backup"

# Create backup folder if not exists
mkdir -p "$BACKUP_PATH"

# Export workflows, ignore errors if none exist
echo "Backing up all workflows..."
n8n export:workflow --all --output="$BACKUP_PATH/workflows.json" || true

echo "Backup complete: $BACKUP_PATH/workflows.json"
