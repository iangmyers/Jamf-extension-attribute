#!/bin/bash

#Created by: Ian Myers
#To check if a computer is enrolled in a apple beta program

BetaStatus=$(/System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil current | awk '/enrolled/{print $NF}')

echo "<result>$BetaStatus</result>"
