#!/bin/sh
mkdir -p .n8n_backup
n8n export:workflow --all --output=.n8n_backup/workflows.json
git add .n8n_backup/workflows.json
git commit -m "backup workflows $(date)"
git push
