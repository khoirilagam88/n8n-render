#!/bin/sh
# Backup otomatis database & config sebelum n8n start

# Waktu backup
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Folder backup
BACKUP_DIR="/home/node/.n8n_backup"
mkdir -p $BACKUP_DIR

# Backup database jika ada
if [ -f "/home/node/.n8n/database.sqlite" ]; then
    cp /home/node/.n8n/database.sqlite $BACKUP_DIR/database_$TIMESTAMP.sqlite
fi

# Backup config jika ada
if [ -f "/home/node/.n8n/config" ]; then
    cp /home/node/.n8n/config $BACKUP_DIR/config_$TIMESTAMP
fi

echo "Backup selesai: $TIMESTAMP"
