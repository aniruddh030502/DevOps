#!/bin/bash
#Author: AD
#Purpose: Learning autopopulate
#usage: ./autopopulate.sh

echo "all args $*"
echo "no. of args $#"
echo "first $1"
echo "expands all cmdline args as separate words $@"
echo "process id of current process $$"

sleep 400 &
echo "process id of recent bg process $!"
echo " file name of current program $0"
