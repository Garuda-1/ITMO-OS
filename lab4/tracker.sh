#!/bin/bash

TARGET=$PWD/report

if [ ! -f $TARGET ]
then
	echo "Track target N/A"
	exit 1
fi

echo "Tracking $TARGET..."

(tail -n 0 -f $TARGET) |
while true
do
	read LINE
	echo -ne "Appended line: \t$LINE\n"
done
