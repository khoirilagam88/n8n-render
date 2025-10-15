# Gunakan Node LTS resmi
FROM node:20-bullseye-slim

# Set working directory
WORKDIR /home/node/.n8n

# Install n8n global
RUN npm install -g n8n@1.115.3

# Copy backup script & konfigurasi
COPY backup.sh .
COPY .gitignore .

# Set permissions
RUN chmod 700 /home/node/.n8n && \
    chmod +x backup.sh

# Expose port n8n
EXPOSE 5678

# Environment variables default
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV DB_SQLITE_POOL_SIZE=5
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production

# Jalankan backup dulu, lalu start n8n
CMD ["sh", "-c", "./backup.sh && n8n start --tunnel"]
