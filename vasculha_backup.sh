#!/bin/bash
find $(cat backup.txt ) -mtime +90 -print -exec cp --parents -Rap {} /mnt/tecnologia_informacao/backup_antigos \;
