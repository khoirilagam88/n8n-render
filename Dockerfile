# Salin script backup ke container
COPY backup.sh /home/node/backup.sh

# Jalankan script dengan bash
CMD ["bash", "/home/node/backup.sh"]
