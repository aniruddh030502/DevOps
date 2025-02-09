#!/bin/bash
#Author: AD
#Purpose: Learning getops
#usage: ./getops.shs

while getopts :a:b: flag; do
    case $flag in 
    a) ab=$OPTARG;;
    b) bc=$OPTARG;;
    ?) echo "i dont understand these values"
    esac
done
    echo "first value $ab, second value $bc"