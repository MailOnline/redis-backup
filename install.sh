#!/bin/bash
## mins   hours  days     months dayofweek user         program
##(0-59) (0-23) (1-30/31) (1-12) (0-6)
if [ "$#" -ne 8 ]; then
  echo "$1 $2 $3 $4 $5 /opt/redis-backup/backup.sh $6 $7"
  echo "usage: /opt/redis-backup/install.sh MINS HOURS DAYS MONTHS DAYOFWEEK TARGET_DIR DAYS_TO_KEEP REDIS_PASSWORD"
  echo "example: /opt/redis-backup/install.sh \* \* \* \* 0-6 /mnt/ramdisk/ 7 SeCrEtPw"
  echo "notice: you have to escape * with backslash, see the example"
  exit 1
fi
target_dir=$6
days_to_keep=$7
redis_password=$8
(crontab -l ; echo "$1 $2 $3 $4 $5 /opt/redis-backup/backup.sh $target_dir $redis_password") | crontab -
(crontab -l ; echo "00 00 * * * /opt/redis-backup/clean-backups.sh $target_dir $days_to_keep") | crontab -
