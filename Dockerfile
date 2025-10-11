# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Tentukan direktori kerja
WORKDIR /home/node

# Salin semua file (kalau tidak ada .env, Render akan lewati otomatis)
COPY . .

# Ekspos port default n8n
EXPOSE 5678

# Jalankan n8n
CMD ["n8n", "start"]
