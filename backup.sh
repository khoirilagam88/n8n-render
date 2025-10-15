#!/bin/sh

# Lokasi backup
BACKUP_DIR="/home/node/.n8n_backup"

# Buat folder backup jika belum ada
mkdir -p "$BACKUP_DIR"

# Backup file konfigurasi & database n8n
cp -r /home/node/.n8n/* "$BACKUP_DIR/"

echo "Backup n8n selesai: $(date)"

# Optional: jalankan setiap 1 jam
while true; do
  sleep 3600
  cp -r /home/node/.n8n/* "$BACKUP_DIR/"
  echo "Backup n8n selesai: $(date)"
done
