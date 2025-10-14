# Gunakan image resmi dari n8n
FROM n8nio/n8n:latest

# Tentukan port default
ENV PORT=5678

# Jalankan n8n secara langsung
CMD ["n8n", "start"]
