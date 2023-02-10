#!/bin/bash

#Created by: Ian Myers
#Handy EA to use when needing interinal IPs while using Jamf Cloud

#Sets IP veriable as computers IP
IP=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')

#Echos result
echo "<result>$IP</result>"
