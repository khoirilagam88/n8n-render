# Gunakan image resmi n8n dari Docker Hub
FROM n8nio/n8n:latest

# Tentukan direktori kerja
WORKDIR /home/node/

# Salin file lingkungan jika ada
COPY . .

# Tentukan port
EXPOSE 5678

# Jalankan n8n
CMD ["n8n"]
