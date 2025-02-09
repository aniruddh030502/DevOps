#!/bin/bash
#Author :Aniruddha Das
#Purpose:Learning ip ping
#Usage: ./ipping.sh

echo -e "please enter the ip address to ping: \c"
read -r ip
until ping $ip
do
	echo "Host in $ip is down"
	sleep 1
done
echo "host in $ip is up"

