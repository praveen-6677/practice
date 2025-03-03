#!/bin/bash
ID=$(id -u)

if [ $ID -ne 0 ]
  then 
    echo "run this script with root user"
    exit 1
  else 
     echo " you are root user"
fi  
  
dnf install nodejs -y
if  [ $? -ne 0 ]
   then
     echo "error"
     exit 1
   else 
     echo "success"
fi 
useradd roboshop
dnf install nodejs -y
if  [ $? -ne 0 ]
  then
   echo "error"
   exit 1
  else 
     echo "success"
fi     
 mkdir -p  /app
 if  [ $? -ne 0 ]
   then
     echo "error"
     exit 1
   else 
     echo "success"
 fi    
     
curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip
 if  [ $? -ne 0 ]
   then
     echo "error"
     exit 1
   else 
     echo "success"
 fi    
 cd /app 
 if  [ $? -ne 0 ]
   then
     echo "error"
     exit 1
   else 
     echo "success"
 fi  
 unzip /tmp/catalogue.zip
 if  [ $? -ne 0 ]
   then
     echo "error"
     exit 1
   else 
     echo "success"
 fi  
cd /app
if  [ $? -ne 0 ]
   then
     echo "error"
     exit 1
   else 
     echo "success"
 fi  
 npm install 
 if  [ $? -ne 0 ]
   then
     echo "error"
     exit 1
   else 
     echo "success"
  fi   
