#!/bin/bash
#Author :Aniruddha Das
#Purpose:Learning for lop
#Usage: ./for.sh

echo "Please enter the number"
read -r no
echo "Multiplication table of $no"
counter=1
while [ $counter -le 10 ]
do
	mult=`expr $no \* $counter`
	echo "$no * $counter = $mult"
	counter=`expr $counter + 1`
done



