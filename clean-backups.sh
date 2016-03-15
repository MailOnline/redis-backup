#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "usage: /opt/redis-backup/clean-backups.sh TARGET_DIR OLDER_THAN_X_DAYS"
  echo "expample: /opt/redis-backup/clean-backups.sh /mnt/ramdisk/ 7"
  exit 1
fi
target_dir=$1
days_to_keep=$2
find $target_dir -maxdepth 1 -type f -ctime +$days_to_keep -name redis-dump-*.rdb.tar.gz | xargs rm -f
