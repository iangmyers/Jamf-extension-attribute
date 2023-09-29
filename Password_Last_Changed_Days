#!/bin/bash

#Days Since Password Change

#Get the username of the current user
current_user=$(whoami)

#Password set time
SetTime=$(dscl . -read "/Users/$current_user" accountPolicyData |
	tail -n +2 |
	plutil -extract passwordLastSetTime xml1 -o - -- - |
	sed -n "s/<real>\([0-9]*\).*/\1/p")

#Current time
Current=$(date +%s)

#Difference in EPOCH
Diff=$(($Current - $SetTime))

#EPOCH to Days
Days=$(($Diff / 86400))

#Results/Sanity Check
#echo "Password set - $SetTime"
#echo "Current time - $Current"
#echo "days - "$Days""

echo "<result>${Days}</r
