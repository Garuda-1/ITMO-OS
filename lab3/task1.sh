#!/bin/bash

if [[ $# == "0" ]]
then
	echo "Usage: task1.sh USER"
	exit 0
fi

ps aux | tail -n +2 | awk '{print $1 " " $2 ":" $11}' | grep "^$1 " |
awk '{print $2}' > task1.out

wc -l < task1.out
