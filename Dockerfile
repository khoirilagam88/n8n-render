# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Set direktori kerja
WORKDIR /home/node/

# Environment variables n8n
ENV N8N_PATH=/home/node/.n8n
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV DB_SQLITE_POOL_SIZE=2
ENV N8N_LOG_LEVEL=info

# Salin script backup dan beri permission
COPY backup.sh /home/node/backup.sh
RUN chmod +x /home/node/backup.sh

# Pastikan folder backup ada
RUN mkdir -p /home/node/.n8n_backup

# Jalankan backup saat container start, lalu jalankan n8n
CMD ["bash", "-c", "/home/node/backup.sh && n8n start"]
