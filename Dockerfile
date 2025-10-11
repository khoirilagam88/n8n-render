# Gunakan image resmi n8n dari Docker Hub
FROM n8nio/n8n:latest

# Set timezone
ENV GENERIC_TIMEZONE=Asia/Jakarta

# Tentukan port default n8n
EXPOSE 5678

# Jalankan n8n
CMD ["n8n"]
