FROM n8nio/n8n:latest

WORKDIR /home/node/

COPY backup.sh /home/node/backup.sh

RUN mkdir -p /home/node/.n8n_backup

# Jalankan backup dengan sh, lalu n8n start
CMD ["sh", "-c", "sh /home/node/backup.sh && n8n start"]
