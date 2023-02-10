#!/bin/bash

# Created By: Ian Myers
# Stores the last restart in Jamf

# Store boot time in variable
boottime=$(sysctl kern.boottime | awk '{print $5}' | tr -d ,)

echo $boottime

# Format in a way Jamf Pro can understand
bootTimeFormatted=$(date -jf %s $boottime +%F\ %T)

#Output formatted boot time as an EA value
echo "<result>$bootTimeFormatted</result>"
