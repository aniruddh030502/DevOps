#!/bin/bash
#Author :Aniruddha Das
#Purpose:Learning for lop
#Usage: ./for.sh

fruits=("apple" "banana" "cherry" "mango")
for fruit in "${fruits[@]}"; do
	echo "I like to eat $fruit"
done


fruits=("apple" "banana" "cherry" "mango")
for i in "${!fruits[@]}"; do
        echo "FRUIT ATE $i is ${fruits[$i]}"
done


fruits=("apple" "banana" "cherry" "mango")
for i in "${!fruits[@]}"; do
	if (( $i%2 != 0 )); then
		echo "I like ${fruits[$i]}"
	else
		echo "I dont like ${fruits[$i]}"
	fi
	
done


