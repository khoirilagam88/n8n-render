# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Set direktori kerja
WORKDIR /home/node

# Environment variable penting & stabil
ENV N8N_PATH=/home/node/.n8n
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_RUNNERS_ENABLED=false
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true
ENV DB_SQLITE_POOL_SIZE=5
ENV NODE_ENV=production
ENV GENERIC_TIMEZONE=Asia/Jakarta
ENV N8N_EDITOR_BASE_URL=https://n8n-render.onrender.com

# Expose port n8n
EXPOSE 5678

# Jalankan n8n dengan tini (init process)
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
