#!/bin/bash
#04/05/2023 - Roockbye
#Script de backup serveur

DATE=$(date +%Y-%m-%d-%H-%M-%S)
BACKUP_DIR="/path/to/backup/folder"

if [ ! -d "$BACKUP_DIR" ]
then
    mkdir -p "$BACKUP_DIR"
fi

tar -czf "$BACKUP_DIR/backup-$DATE.tar.gz" /path/to/backup/source
exit 0
