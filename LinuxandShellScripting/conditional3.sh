#!/bin/bash
#Author :Aniruddha Das
#Purpose: Conditional Statement
#Usage: ./conditional.sh

file=$1
if [ -f "$file" ]; then
	echo "file exist $file"
else
	echo "file doesn't exists"
fi

file=$1
if [[ -f $file ]]; then
	echo "file exists $file"
else
	echo "file doesn't exist"
fi
