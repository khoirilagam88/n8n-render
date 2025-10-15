#!/bin/bash
set -e

# Path lokasi backup workflow
BACKUP_PATH="/home/node/.n8n_backup"
mkdir -p "$BACKUP_PATH"

echo "Backing up all workflows..."

# Export all workflows, ignore errors if none exist
n8n export:workflow --all --output="$BACKUP_PATH/workflows.json" || true

echo "Backup complete: $BACKUP_PATH/workflows.json"
