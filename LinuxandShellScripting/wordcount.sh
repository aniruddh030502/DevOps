#!/bin/bash
#Author: Aniruddha Das
#Purpose: To count the number of words in the input string
#Usage: ./count_words.sh

echo "Enter a string"
read str
word_count=$(echo $str | wc -w)
echo "The number of words in the string is: $word_count"