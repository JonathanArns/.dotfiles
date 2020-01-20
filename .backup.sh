#!/bin/bash

RCLONE_CONFIG_PASS=$DSCHUNGELCAMP rclone sync ~/Desktop/backup_test gdrive:Backup/latest_snapshot --backup-dir=gdrive:Backup/archive/ --suffix=" $(date +%F\ %T)" --log-file=./backup.log

exit_code=$?

if [ $exit_code = 0 ]
then
  notify-send "Backup done :)"
else
  notify-send "Backup failed." "rclone exit code $exit_code" -u critical
  exit $exit_code
fi

exit 0
#rclone sync $source $dest/$new $backup_dir $log_option $options
