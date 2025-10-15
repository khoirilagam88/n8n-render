# Gunakan image n8n resmi
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node/

# Salin script backup
COPY backup.sh /home/node/backup.sh

# Ubah permission script backup (gunakan sh default)
RUN ["chmod", "+x", "/home/node/backup.sh"]

# Pastikan folder backup ada
RUN mkdir -p /home/node/.n8n_backup

# Set environment variables agar n8n bisa jalan di Render
ENV N8N_HOST="0.0.0.0"
ENV N8N_PORT=5678
ENV N8N_PROTOCOL="http"
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Salin .gitignore untuk mengabaikan file lokal
COPY .gitignore /home/node/.n8n/.gitignore

# Jalankan n8n dan task scheduler backup
CMD ["sh", "-c", "/home/node/backup.sh & n8n start"]
