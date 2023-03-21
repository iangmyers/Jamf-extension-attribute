#!/bin/bash

###########
# Created by Ian Myers
# 3/21/23 
# Finds and list all admin accounts on a device. This can be used in conjusttion with a Smart Group and policy to clean up admin accounts
###########

# get a list of all users who are members of the "admin" group
adminUsers=$(dscl . -read /Groups/admin GroupMembership | cut -c18- | tr ' ' '\n')

# output the list of admin users as a comma-separated string
echo "<result>$adminUsers</result>"
