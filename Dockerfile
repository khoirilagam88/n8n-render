# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Set direktori data n8n
ENV N8N_PATH=/home/node/.n8n
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Expose port default
EXPOSE 5678

# Jalankan n8n
CMD ["n8n", "start"]
