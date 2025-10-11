# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Tentukan direktori kerja
WORKDIR /home/node

# Atur permission supaya aman
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Ekspos port default n8n
EXPOSE 5678

# Jalankan n8n
ENTRYPOINT ["tini", "--", "n8n"]
