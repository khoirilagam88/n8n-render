# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node/

# Copy file .env jika ada
COPY . .

# Expose port n8n
EXPOSE 5678

# Jalankan n8n
CMD ["n8n"]
