#!/bin/bash
#Author: Aniruddha Das
#Purpose: To replace the input string to other
#Usage: ./replaceword.sh

echo "Enter a string"
read str
echo "Enter the word to be replaced"
read replacestr
echo "Enter the new word"
read newword

echo "The new string is: ${str/$replacestr/$newword}"
