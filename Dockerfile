FROM n8nio/n8n:latest

WORKDIR /home/node/

# Salin backup script
COPY backup.sh /home/node/backup.sh

# Pastikan script bisa dijalankan tanpa chmod
RUN ["chmod", "+x", "/home/node/backup.sh"]

# Jalankan n8n & backup
CMD ["sh", "-c", "/home/node/backup.sh && n8n start --tunnel"]
