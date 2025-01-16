#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects will be moniter for 70
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    #echo "partition: $PARTITION , usage: $USAGE"
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then 
        MSG+="High disk usage on partition: $PARTITION usage is: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "message: $MSG"

echo "$MSG" | mutt -s "High Disk Usage" pradeepreddychavva96@gmail.com