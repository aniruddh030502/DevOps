#!/bin/bash
#Author: AD
#Purpose: Learning function with parameter
#usage: ./functionwithparam.sh

function sum {
        local total=$(( $1 + $2 ))
        echo "total=$total"
}
result=$(sum 5 8)
echo "The result returned is $result"