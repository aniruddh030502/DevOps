#!/bin/bash
#Author: AD
#Purpose: Greetings based on time
#usage: ./timegreetings.shs

date=`date +%H`
echo "$date"
if [ $date -le 12 ]; then
    echo "Good morning"
else
    echo "Good afternoon"
fi