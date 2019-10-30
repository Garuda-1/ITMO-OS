#!/bin/bash

CLEAR="\r                                    \r"

terminate() {
	echo -ne "\nDo you want to exit? (Y/n)\n"
	read LINE
	case "$LINE" in
		"Y")
			exit 0
			;;
		"n")
			:
			;;
		*)
			terminate
	esac
}

display() {
	echo -ne "$CLEAR$(date)"
}

trap 'terminate' INT

while true
do
	display
	sleep 0.01
done
