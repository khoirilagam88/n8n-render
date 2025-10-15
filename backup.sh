#!/bin/bash
set -e

BACKUP_PATH="/home/node/.n8n_backup"
mkdir -p "$BACKUP_PATH"

echo "[DEBUG] Backup script starting at $(date)..."

# Backup semua workflow aktif, jangan exit kalau gagal
if n8n export:workflow --all --output="$BACKUP_PATH/workflows.json"; then
    echo "[DEBUG] Backup completed successfully: $BACKUP_PATH/workflows.json"
else
    echo "[WARN] No workflows to backup or export failed, continuing..."
fi

echo "[DEBUG] Backup script finished at $(date)."
