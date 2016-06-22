#!/bin/zsh
function wifiCheck {
	ping -t 1 8.8.8.8
	pingReturn=$?
	if [ $pingReturn -eq 0 ]
	then
		sleep 5s
		wifiCheck
	else
		networksetup -setairportpower en0 off
		sleep 1s
		networksetup -setairportpower en0 on
		sleep 10s
		wifiCheck
	fi	
}

wifiCheck