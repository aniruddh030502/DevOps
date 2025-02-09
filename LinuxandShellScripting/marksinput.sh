#!/bin/bash
#Author: Aniruddha Das
#Purpose: Project marksinput
#usage: ./marksinput.sh

echo "Enter the Physics marks of the student"
read -r phy
echo "Enter the Chemistry marks of the student"
read -r chem
echo "Enter the Maths marks of the student"
read -r math

if [[ $phy -lt 35 || $chem -lt 35 || $math -lt 35 ]]; then
    echo "Failed"
else
    avg=$((($phy + $chem + $math) / 3))
    if [ $avg -ge 80 ]; then
        echo "Distinction"
    else
        echo "Good"
    fi
fi