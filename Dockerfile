WORKDIR /home/node/

COPY backup.sh /home/node/backup.sh

# Jalankan backup dulu, lalu n8n
CMD ["bash", "-c", "bash /home/node/backup.sh && n8n start"]
