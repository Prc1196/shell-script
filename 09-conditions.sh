#!/bin/bash

NUMBER=$1

# -gt, -lt, -ge, -le, -eq

if [ $NUMBER -gt 100 ]
then
    echo "given number is greater than 100"
else
    echo "given number is lessthan or equal to 100"    
fi     