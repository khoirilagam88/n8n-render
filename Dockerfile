# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Tentukan direktori kerja
WORKDIR /home/node

# Salin semua file
COPY . .

# Pastikan folder konfigurasi ada
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

# Jalankan n8n dengan user default
USER node

# Ekspos port default
EXPOSE 5678

# Jalankan n8n
CMD ["n8n", "start"]
