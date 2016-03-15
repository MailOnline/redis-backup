#!/bin/bash
(crontab -l | grep -v /opt/redis-backup/backup.sh) | crontab -
(crontab -l | grep -v /opt/redis-backup/clean-backups.sh) | crontab -
