#!/bin/bash

DISC_USAGE=$(df -hT | grep xfs)

while read -r line
do
    echo $line
done <<< $DISK_USAGE