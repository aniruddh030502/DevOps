#!/bin/bash
#Author: Aniruddha Das
#Purpose: To backup a given directory
#Usage: ./replaceword.sh

echo "Enter the directory to be backed up"
read dir
if [ -d "home/user/$dir" ]; then
    echo "Enter the backup directory"
    read backupdir
    if [ -d $backupdir ]; then
        cp  $dir $backupdir
        echo "Backup successful"
    else
        echo "Backup directory does not exist"
    fi
fi