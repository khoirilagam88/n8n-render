# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Tentukan direktori kerja
WORKDIR /home/node

# Pastikan semua environment file (jika ada) tersalin

# Ekspos port default n8n
EXPOSE 5678

# Jalankan n8n
ENTRYPOINT ["tini", "--", "n8n"]
