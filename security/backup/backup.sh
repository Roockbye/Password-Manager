#!/bin/bash
#04/05/2023 - Roockbye
#Script de backup serveur

DATE=$(date +%Y-%m-%d-%H-%M-%S)
BACKUP_DIR="/srv/backup/"

if [ ! -d "$BACKUP_DIR" ]
then
    mkdir -p "$BACKUP_DIR"
fi

tar -czf "$BACKUP_DIR/backup-$DATE.tar.gz" /opt/passbolt/database_volume /opt/evaluate_loki/.data
exit 0
