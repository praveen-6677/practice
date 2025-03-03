#!/bin/bash
ID=$(id -u)

if [ $ID -ne 0 ]
  then 
    echo "run this script with root user"
    exit 1
  else 
     echo " you are root user"
fi  

dnf module disable nodejs -y
if [ $? -ne 0 ]
   then
     echo "error"
     exit 1
   else 
     echo "success"
 fi    
dnf module enable nodejs:18 -y
if  [ $? -ne 0 ]
   then
     echo "error"
     exit 1
   else 
     echo "success"
fi   
dnf install nodejs -y