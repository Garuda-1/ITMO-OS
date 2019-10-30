#!/bin/bash

while read LINE
do
	case "$LINE" in
		'+')
			kill -USR1 $(cat .pid)
		  	;;
		'*')
			kill -USR2 $(cat .pid)
			;;
		"TERM")
			kill -SIGTERM $(cat .pid)
			;;
		*)
			:
			;;
	esac
done
