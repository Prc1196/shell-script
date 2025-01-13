#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have the sudo access to execute this srcipt"
else
    echo "SHOW:: root user access command to access to exicute this script"
fi
