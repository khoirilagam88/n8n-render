# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Set direktori data n8n
ENV N8N_PATH=/home/node/.n8n
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV DB_SQLITE_POOL_SIZE=2

# Copy script backup ke container
COPY backup.sh /home/node/backup.sh
RUN chmod +x /home/node/backup.sh

# Jalankan n8n dengan proses utama
CMD ["bash", "-c", "n8n start & sleep 30 && /home/node/backup.sh && tail -f /dev/null"]
