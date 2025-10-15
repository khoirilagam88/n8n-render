# Gunakan Node LTS resmi
FROM node:20-bullseye-slim

# Set working directory
WORKDIR /home/node/.n8n

# Install n8n global versi stabil
RUN npm install -g n8n@1.115.3

# Pasang utilitas
USER root
RUN apt-get update && apt-get install -y curl git && rm -rf /var/lib/apt/lists/*

# Copy file backup (kalau ada)
COPY backup.sh . || true
COPY .gitignore . || true

# Set permission folder
RUN chmod 700 /home/node/.n8n && \
    chmod +x backup.sh || true

# Environment default
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true
ENV N8N_RUNNERS_ENABLED=true

# Gunakan Postgres Render (pastikan variable DB_* sudah di Render)
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false

# Jalankan auto-backup (fix command) + start n8n
CMD sh -c 'echo "📦 Running backup (if any)..."; \
    n8n export:workflow --all --output=/home/node/.n8n_backup/workflows.json || echo "No workflows found"; \
    echo "🚀 Starting n8n..."; \
    n8n start'
