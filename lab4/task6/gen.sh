#!/bin/bash

while read LINE
do
	case "$LINE" in
		TERM)
			kill -SIGTERM $(cat .pid)
		;;
		*)
			:
		;;
	esac
done
