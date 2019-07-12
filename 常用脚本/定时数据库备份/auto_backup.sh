#!/bin/bash
datestr=$(date +%Y%m%d)
mysqldump -u web --password='mima' databasename >/home/backup/databackup/databasename_${datestr}_backup.sql
echo databasename_${datestr}_backup.sql OK
