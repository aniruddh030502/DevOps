#!/bin/bash
#Author: Aniruddha Das
#Purpose: To convert the input string to palindrome
#Usage: ./palindrme.sh

echo "Enter a string"
read str
len=${#str}
rev=""
for(( i=$len -1 ; i>=0 ;i-- )); do
    rev="$rev${str:$i:1}"
done
if [[ $rev = $str ]]; then
    echo "$str is palindrome"
else
    echo "$str is not palindrome"
fi