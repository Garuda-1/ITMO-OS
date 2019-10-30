#!/bin/bash

MSG="monka_omega"
MODE="RUN"

terminate()
{
	MODE="TERM"
}

echo $$ > .pid
trap 'terminate' SIGTERM
while true
do
	case $MODE in
		"RUN")
			echo -ne "\r                    \r$(date)"
			sleep 1
			;;
		"TERM")
			echo -ne "\nExecution interrupted. Exiting...\n"
			exit 0
			;;
	esac
done
