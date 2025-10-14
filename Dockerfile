# Gunakan image resmi dari n8n
FROM n8nio/n8n:latest

# (Opsional) Tentukan port default
ENV PORT=5678

# Jalankan n8n secara langsung
=======
FROM n8nio/n8n:latest

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV GENERIC_TIMEZONE=Asia/Jakarta

EXPOSE 5678
>>>>>>> cde14ca (fix: use official n8n image for Render)
CMD ["n8n", "start"]
