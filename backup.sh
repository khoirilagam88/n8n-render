#!/bin/sh
# Backup SQLite database
if [ -f ~/.n8n/database.sqlite ]; then
    cp ~/.n8n/database.sqlite ~/.n8n/database_backup.sqlite
fi
echo "Backup selesai!"
