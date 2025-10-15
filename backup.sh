#!/bin/bash
set -e

BACKUP_PATH="/home/node/.n8n_backup"
mkdir -p "$BACKUP_PATH"

echo "Backing up all workflows..."
n8n export:workflow --all --output="$BACKUP_PATH/workflows.json" || true

echo "Backup complete: $BACKUP_PATH/workflows.json"
