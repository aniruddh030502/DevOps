#!/bin/bash
#Author: Aniruddha Das
#Purpose: To display hardware information

echo "The CPU information is:"
lscpu
echo "The memory information is:"
free -m
echo "The disk information is:"
lsblk
echo "The network information is:"
ip a
echo "The USB information is:"
lsusb