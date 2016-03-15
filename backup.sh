#!/bin/bash
if [ "$#" -ne 2 ]; then
  echo "usage: /opt/redis-backup/backup.sh TARGET_DIR PASSWORD"
fi
target_dir=$1
redis_password=$2
redis_data_dir=$(echo 'config get dir' | redis-cli -a $redis_password | tail -n1 | sed -e 's,"\(.*\)",\1,')
tar_file=./redis-dump-$(date +%Y-%m-%d-%H_%M.rdb).tar.gz
mkdir -p $target_dir && cd $_ && tar cvzf $tar_file -C $redis_data_dir dump.rdb
