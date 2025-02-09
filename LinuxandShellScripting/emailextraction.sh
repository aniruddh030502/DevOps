#!/bin/bash
#Author: Aniruddha Das
#Purpose: To convert the input string to palindrome
#Usage: ./palindrme.sh

read str
if [ ! -f "$str" ]; then
    echo "File not found!"
    exit 1
else
    echo "File found!"
fi
grep  -E -o "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]" "$str"