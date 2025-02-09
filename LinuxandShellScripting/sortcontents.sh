#!/bin/bash
#Author: Aniruddha Das
#Purpose: To backup a given directory
#Usage: ./replaceword.sh

echo "Enter the file"
read file

sort "$file" -o "$file"
echo "Contents of $file sorted alphabetically."