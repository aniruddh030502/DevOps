#!/bin/bash
#Author: AD
#Purpose: Learning autopopulate
#usage: ./regex.sh

numstring="123456789"
charstring="abcdefghi"
if [[ $numstring =~ ^1 ]]; then
        echo "The $numstring starts with 1"
else
        echo "The $numstring does not start with 1"
fi

if [[ $numstring =~ ^1.*8 ]]; then
        echo "The $numstring starts with 1 and includes 8 within the string"
else
        echo "The $numstring does not satisfies the condition"
fi

if [[ $charstring =~ ^[A-Za-z]+$ ]]; then
        echo "The $charstring starts with az and includes 8 within the string"
fi