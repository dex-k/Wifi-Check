#!/bin/zsh
function wifiCheck {
	ping -t 1 google.com
	pingReturn=$?
	if [ $pingReturn -eq 0 ]
	then
		sleep 5s
		wifiCheck
	else
		networksetup -setairportpower en0 off
		sleep 1s
		networksetup -setairportpower en0 on
		sleep 5s
		wifiCheck
	fi	
}

wifiCheck