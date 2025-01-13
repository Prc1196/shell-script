#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have the sudo access to execute this srcipt"
fi

dnf install mysql -y

