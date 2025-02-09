#!/bin/bash
#Author: Aniruddha Das
#Purpose: To display the last modified file in a directory
#Usage: ./lastmod.sh <directory_path>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

directory=$1

if [ ! -d "$directory" ]; then
    echo "Directory not found!"
    exit 1
fi

# Find the last modified file
last_modified_file=$(ls -t "$directory" | head -n 1)

echo "The last modified file in $directory is: $last_modified_file"