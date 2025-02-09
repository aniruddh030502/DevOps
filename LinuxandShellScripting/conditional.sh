#!/bin/bash
#Author :Aniruddha Das
#Purpose: Conditional Statement
#Usage: ./conditional.sh

file=variable.sh
if [ -f $file ]; then
	echo "file exist"
fi
