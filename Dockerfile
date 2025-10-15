# Gunakan Node image dengan bash/sh
FROM node:20-bullseye-slim

# Install n8n global
RUN npm install -g n8n

# Set working directory
WORKDIR /home/node/

# Copy backup script
COPY backup.sh /home/node/backup.sh
RUN chmod +x /home/node/backup.sh

# Buat folder backup
RUN mkdir -p /home/node/.n8n_backup

# Set environment variable agar n8n enforce permission
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Jalankan backup dan n8n
CMD sh -c "/home/node/backup.sh && n8n start"
