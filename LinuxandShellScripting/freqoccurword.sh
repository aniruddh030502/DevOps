#!/bin/bash
#Author: Aniruddha Das
#Purpose: To find the most frequently occurring word in a file
#Usage: ./most_frequent_word.sh <filename>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

file=$1

if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

# Find the most frequently occurring word
most_frequent_word=$(tr -c '[:alnum:]' '[\n*]' < "$file" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

echo "The most frequently occurring word is: $most_frequent_word"