FROM n8nio/n8n:latest

# Tentukan direktori kerja
WORKDIR /home/node

# Salin file project (hindari permission error)
COPY . .

# Buat folder data & ubah permission khusus untuk .n8n
RUN mkdir -p /home/node/.n8n \
    && chmod -R 777 /home/node/.n8n

# Jalankan n8n
USER node

CMD ["n8n", "start"]
