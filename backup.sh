
#!/bin/sh
mkdir -p .n8n_backup
n8n export:workflow --all --output=.n8n_backup/workflows.json
git add .n8n_backup/workflows.json
git commit -m "backup workflows $(date)"
git push
=======
#!/bin/bash
set -e

# Path lokasi backup workflow
BACKUP_PATH="/home/node/.n8n_backup"
mkdir -p "$BACKUP_PATH"

# Backup semua workflow aktif
echo "Backing up all workflows..."
n8n export:workflow --all --output="$BACKUP_PATH/workflows.json" || true

echo "Backup complete: $BACKUP_PATH/workflows.json"
e21f2e9 (fix: clean backup.sh and correct Dockerfile for Render)
