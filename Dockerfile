# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Tambah git dan jq untuk restore otomatis
RUN apt-get update && apt-get install -y git jq && apt-get clean

# Direktori data
ENV N8N_PATH=/home/node/.n8n
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123

# Copy workflow backup dari repo (kalau ada)
COPY .n8n_backup/workflows.json /home/node/.n8n/workflows.json

# Jalankan n8n
CMD ["sh", "-c", "if [ -f /home/node/.n8n/workflows.json ]; then \
  n8n import:workflow --input=/home/node/.n8n/workflows.json; fi && n8n start"]
