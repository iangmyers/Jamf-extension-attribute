#!/bin/bash

#Current User
curUser=$(whoami)

#sanity check
#echo $curUser

#Get Password Date
passwordDate=$(date -r $(dscl . -read /Users/$curUser accountPolicyData |
    tail -n +2 |
    plutil -extract passwordLastSetTime xml1 -o - -- - |
    sed -n "s/<real>\([0-9]*\).*/\1/p"))

#Results
echo "<result>${passwordDate}</result>"
