# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Atur port default
ENV PORT=5678
EXPOSE 5678

# Jalankan n8n
CMD ["n8n", "start"]
