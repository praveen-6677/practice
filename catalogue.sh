#!/bin/bash
ID=$(id -u)

if [ $ID -ne 0 ]
  then 
    echo "run this script with root user"
    exit 1
  else 
     echo " you are root user"
fi  
check() {
  if  [ $1 -ne 0 ]
   then
     echo -e "$2...failed"
     exit 1
   else 
     echo  -e "$2...success"
fi 

}
  
dnf install nodejs -y
check $? "installing of nodejs is "

id roboshop
if [ $? -ne 0 ]
  then 
  useradd roboshop
  check $? "user roboshop"
  else 
     echo "$2 exixts skipping"
  fi   

check $? "adding user roboshop"
   
 mkdir -p  /app
 check $? "adding  app directory"
   
curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip
check $? "downloading catalogue"

 cd /app 
 check $? "changing directory"
 
 unzip /tmp/catalogue.zip
 check $? "unzipping catalogue"

 cd /app
 check $? "changing to app"

 npm install 
 check $? "installing of npm"

 cp /home/ec2-user/practice/catalogue.service /etc/systemd/system/catalogue.service
 check $? "copying catalogue.service"

 systemctl daemon-reload
 check $? "reloading daemon"

 systemctl enable catalogue
 check $? "enabling daemon"

 systemctl start catalogue
 check $? "stating catalogue"

 cp /home/ec2-user/practice/mongo.repo /etc/yum.repos.d/mongo.repo
 check $? "copying mong.repo"

 dnf install mongodb-org-shell -y
 check $? "installing mongo-org"

 mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js
 check $? "loading catlogue into mongdb"







