# Gunakan image Node.js resmi
FROM node:20-bullseye

# Set working directory
WORKDIR /home/node/.n8n

# Install n8n global sesuai versi kamu
RUN npm install -g n8n@1.114.3

# Copy semua file project ke dalam container
COPY . .

# Buat folder untuk backup otomatis
RUN mkdir -p /home/node/.n8n_backup

# Set environment default agar Render tetap stabil
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=passkuat
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_ENCRYPTION_KEY=isi_kuncimu_yang_rahasia
ENV DB_SQLITE_POOL_SIZE=1
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV EXECUTIONS_PROCESS=main
ENV GENERIC_TIMEZONE=Asia/Jakarta
ENV WEBHOOK_URL=https://srv-d3l3cqr3fgac73a8n7e0/

# Expose port n8n
EXPOSE 5678

# Jalankan n8n agar tetap hidup (Render tidak auto-shutdown)
CMD ["sh", "-c", "n8n start --tunnel"]
