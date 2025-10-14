# Gunakan image resmi dari n8n
FROM n8nio/n8n:latest

# (Opsional) Tentukan port default
ENV PORT=5678

# Jalankan n8n secara langsung
CMD ["n8n", "start"]
