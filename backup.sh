#!/bin/sh

# Backup workflows
mkdir -p /home/node/.n8n_backup
n8n export:all --output /home/node/.n8n_backup/workflows.json || echo "No workflows to backup"

echo "Backup complete: /home/node/.n8n_backup/workflows.json"
