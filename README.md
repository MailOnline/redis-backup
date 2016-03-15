# regular Redis backup

### Install, setup
```
# clone the repository to /opt/redis-backup with the following command
sudo mkdir -p /opt/redis-backup && sudo chown $USER:root /opt/redis-backup && git clone git@github.com:szilveszter9/redis-backup.git /opt/redis-backup

# example: install cron job for daily backup to your /mnt/ramdisk/ at 4am where you want to keep your backups for 7 days and your redis password is SeCrEtPw
/opt/redis-backup/install.sh 00 04 \* \* \* /mnt/ramdisk/ 7 SeCrEtPw
# notice: first five parameters are crontab parameters in order, the only thing that *s have to be escaped with backslash

# example: install cron job backup every 15 minutes
/opt/redis-backup/install.sh \*/15 \* \* \* \* /mnt/ramdisk/ 7 SeCrEtPw

```

### Check config
```
# the install.sh script will install two cron jobs, one for the backup one for the cleanup, check with
crontab -l
```

### Manual backup + cleanup
```
# manual backup example
/opt/redis-backup/backup.sh /mnt/ramdisk/ SeCrEtPw

# manual cleanup example (clean backups older than 7 days)
/opt/redis-backup/clean-backups.sh /mnt/ramdisk/ 7
```

### Uninstall
```
# to uninstall cron jobs
/opt/redis-backup/uninstall.sh
```
