#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects will be moniter for 70

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6}')
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    echo "partition: $PARTITION , usage: $USAGE"
done <<< $DISK_USAGE