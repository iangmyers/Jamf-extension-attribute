#!/bin/zsh

#By Ian Myers
# verify location services are turned on globally
# then examines the clients.plsit for a specific bundle ID. 
# replace Application_ID with the Application in question bundle ID. For example com.tinyspeck.slackmacgap is Slack

# First check if location services are enabled globally
global_location=$( defaults read /var/db/locationd/Library/Preferences/ByHost/com.apple.locationd LocationServicesEnabled )

# If global location services are disabled, no need to check further
if [ "$global_location" != "1" ]; then
    echo "<result>Disabled for MacOS</result>"
    exit 0
fi

# Check for the app specifically
# Bundle identifier for application
Application_id="APPLICATION BUNDLE ID"

# Convert the clients.plist to readable format and search for Slack
if plutil -convert xml1 -o - /var/db/locationd/clients.plist | grep -q "$Application_id"; then
    # Now check if it's authorized
    auth_status=$(plutil -convert xml1 -o - /var/db/locationd/clients.plist | grep -A5 "$Application_id" | grep -A2 "Authorized" | grep -o "true\|false")
    
    if [[ "$auth_status" == "true" ]]; then
        echo "<result>Enabled</result>"
    else
        echo "<result>Disabled</result>"
    fi
else
    echo "<result>Not Configured</result>"
fi
