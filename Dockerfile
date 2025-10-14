# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Tentukan working directory
WORKDIR /home/node

# Environment variables penting
ENV N8N_PATH=/home/node/.n8n
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_RUNNERS_ENABLED=false
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true

# Expose port 5678 (port default n8n)
EXPOSE 5678

# Jalankan n8n
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
