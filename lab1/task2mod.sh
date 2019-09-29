#!/bin/bash

if (( $# == 0 ))
then
	echo "Usage: task2mod.sh ARG1 [AGRS...]"
fi

ANS="$1"
CUR=""

for CUR in ${*:2}
do
	if (( ANS < CUR ))
	then
		ANS=$CUR
	fi
done

echo "$ANS"
