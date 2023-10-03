#!/bin/bash

###########
# Created by Ian Myers
# 3/21/23 updated 10/3/23
# Finds and list all admin accounts on a device. This can be used in conjusttion with a Smart Group and policy to clean up admin accounts
###########

#!/bin/bash

# Get a list of admin users (excluding root)
admin_users=$(dscl . -read /Groups/admin GroupMembership | tr " " "\n" | grep -v -e '^root$')

# Convert the list to a comma-separated string without the prefix
admin_user_list=$(echo "$admin_users" | paste -s -d, - | sed 's/GroupMembership:,//')

# Output the admin user list
echo "<result>$admin_user_list</result>"
