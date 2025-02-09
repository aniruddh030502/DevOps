#!/bin/bash
#Author: AD
#Purpose: Learning backup
#usage: ./funcbackup.shs

function backup {
    echo "enter the file name"
    read -r myfile
    # if [ -f $myfile ]; then
    #     echo "File exists !!"
    #     cp $myfile /tmp/bckup.txt
    # else
    #     echo "File not exists" 
    # fi
    cp $myfile /tmp/bckup.txt
    if [ $? -ne 0 ]; then
        echo "Backup failed $?"
    fi
}

backup