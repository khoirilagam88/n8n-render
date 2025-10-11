FROM n8nio/n8n:latest

# Aktifkan login n8n
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=khoirilagam88@gmail.com
ENV N8N_BASIC_AUTH_PASSWORD=khoiril201188
# Port default n8n
EXPOSE 5678

# Jalankan n8n
CMD ["n8n", "start"]
