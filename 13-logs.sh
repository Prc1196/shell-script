#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ... $R FAILURE"
        exit 1
    else 
        echo -e "$2 ... $G SUCCESS"
    fi
}

 echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have the sudo access to execute this srcipt"
    exit 1 #other than 0
fi

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ] 
then #not installed
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "Installing MySQL"
else
    echo -e "MySQL is already ... $Y INSTALLED"
fi 


dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already ... $Y INSTALLED"
fi 



