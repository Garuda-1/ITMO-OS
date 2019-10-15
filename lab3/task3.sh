#!/bin/bash

for PID in $( ls -1 /proc | grep "^[[:digit:]]*$" )
do
	if [ -d "/proc/$PID" ] && [ -r "/proc/$PID/exe" ]
	then
		awk -v pid=$PID '{if (substr($0, 0, 7) == "/sbin/") {print pid}}' \
			<<< $(readlink /proc/$PID/exe)
	fi
done > task3.out
