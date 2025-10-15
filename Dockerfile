FROM n8nio/n8n:latest

# Salin backup.sh tapi jangan paksa chmod
COPY backup.sh /home/node/backup.sh

# Pastikan folder backup ada
RUN mkdir -p /home/node/.backup_conflicts

# Set working directory
WORKDIR /home/node/

# Default command n8n
CMD ["n8n"]
