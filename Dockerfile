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
# Set direktori kerja
WORKDIR /home/node/

# Salin script backup ke image
COPY backup.sh /home/node/backup.sh
RUN chmod +x /home/node/backup.sh

# Pastikan folder backup ada
RUN mkdir -p /home/node/.n8n_backup

# Jalankan n8n dan backup setiap start
CMD ["bash", "-c", "bash /home/node/backup.sh && n8n start"]
e21f2e9 (fix: clean backup.sh and correct Dockerfile for Render)
