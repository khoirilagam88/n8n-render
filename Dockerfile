# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node/

# Salin script backup (tanpa chmod, agar Render tidak error)
COPY backup.sh /home/node/backup.sh

# Pastikan folder backup lokal ada
RUN mkdir -p /home/node/.n8n_backup

# Jalankan backup.sh melalui NodeJS shell n8n saat start
# Gunakan n8n start langsung setelah backup selesai
CMD ["sh", "-c", "/home/node/backup.sh && n8n start"]
