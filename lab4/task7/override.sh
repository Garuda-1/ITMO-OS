#!/bin/bash

MODE="NONE"
VAR=1

terminate()
{
	MODE="TERM"
}

add()
{
	MODE="ADD"
}

mul()
{
	MODE="MUL"
}

display()
{
	echo -ne "\r                 \rCurrent value = $VAR"
}

echo $$ > .pid

trap 'terminate' SIGTERM
trap 'add' USR1
trap 'mul' USR2

while true
do
	case "$MODE" in
		"ADD")
			(( VAR+=2 ))
			;;
		"MUL")
			(( VAR*=2 ))
			;;
		"TERM")
			echo -ne "\nExecution interrupted. Exiting...\n"
			exit 0
			;;
	esac
	MODE="NONE"
	display
	sleep 0.1
done
