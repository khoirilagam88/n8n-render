# Gunakan image resmi n8n
FROM n8nio/n8n:latest

# Atur environment variable default (bisa override di Render)
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV GENERIC_TIMEZONE=Asia/Jakarta

# Expose port untuk Render
EXPOSE 5678

# Jalankan n8n
CMD ["n8n", "start"]
