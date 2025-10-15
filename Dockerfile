# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Set direktori kerja
WORKDIR /home/node/

# Copy script backup ke container
COPY backup.sh /home/node/backup.sh

# Pastikan folder backup ada
RUN mkdir -p /home/node/.n8n_backup

# Jalankan backup, lalu n8n di foreground (log muncul di Render)
CMD ["bash", "-c", "bash /home/node/backup.sh && n8n start"]
