FROM n8nio/n8n:latest

WORKDIR /home/node/

ENV N8N_PATH=/home/node/.n8n
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV DB_SQLITE_POOL_SIZE=2

# Copy backup script
COPY backup.sh /home/node/backup.sh
RUN chmod +x /home/node/backup.sh
RUN mkdir -p /home/node/.n8n_backup

# Only run backup at container startup, not during build
CMD ["bash", "-c", "/home/node/backup.sh && n8n start"]
