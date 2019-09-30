#!/bin/bash

if [[ $# == "0" ]]
then
	echo "Usage: task1.sh USER"
	exit 0
fi

ps ax -U $1 | tail -n +2 |
awk '{printf "%s:", $1; for(i=5;i<=NF;i++) printf "%s ", $i; print ""}' > task1.out

wc -l < task1.out
