#!/bin/bash
ID=$(id -u)

if (id -ne 0)
  then 
    echo "run this script with root user"
    exit1
  else 
     echo " you are root user"
fi  