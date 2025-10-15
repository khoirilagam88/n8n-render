FROM node:20-bullseye-slim

WORKDIR /home/node/.n8n

RUN npm install -g n8n@1.114.3

COPY backup.sh .

RUN chmod +x backup.sh

EXPOSE 5678

ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production

CMD ["sh", "-c", "./backup.sh && n8n start"]
