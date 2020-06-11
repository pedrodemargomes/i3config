#!/bin/bash                                               
i3status | while :                                        
do                                                        
	read line                                             
	user=`whoami`                                         
	memusage=$(awk '/MemTotal/ {memtotal=$2}; /MemAvailable/ {memavail=$2}; END { printf("%.0f", (100- (memavail/memtotal * 100))) }' /proc/meminfo)                        
	echo "USER: $user | Memory usage: ${memusage}% | $line" || exit 1                                               
done     
