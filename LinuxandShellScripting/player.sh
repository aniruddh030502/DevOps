
#!/bin/sh
#Author :Aniruddha Das
#Purpose:Learning for lop
#Usage: ./for.sh

echo "Please enter the player's score"
read -r no
if [ $no -ge 20 ] && [ $no -le 40 ]; then
	echo "Good"
elif [ $no -gt 40 ]; then
	echo "excellent"
else
	echo " needs to improve"
fi


for i in 1 2 3 4 5
do
	echo "$i"
done

for i in {1..5};
do
        echo "$i"
done

for i in $(seq 1 5);
do
	echo "$i"
done

for (( i=1; i<=10; i++ ))
do
	echo "$i"
done

