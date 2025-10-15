# Gunakan Node LTS resmi
FROM node:20-bullseye-slim

# Buat folder kerja
WORKDIR /home/node/.n8n

# Install n8n secara global
RUN npm install -g n8n@1.115.3

# Copy script backup & konfigurasi
COPY backup.sh .
COPY .gitignore .
COPY Dockerfile .

# Set permissions agar Render tidak error
RUN chmod 700 /home/node/.n8n && \
    chmod +x backup.sh

# Expose port
EXPOSE 5678

# Environment variable default (bisa override di Render)
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV DB_SQLITE_POOL_SIZE=5
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production

# Jalankan backup dulu, lalu start n8n
CMD ["sh", "-c", "./backup.sh && n8n start --tunnel"]
