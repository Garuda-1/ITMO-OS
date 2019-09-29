#!/bin/bash

TERMINATE="0"
BUFFER=""
OUTPUT="1"

while [[ "$TERMINATE" == "0" ]]
do
	read BUFFER
	if (( $BUFFER % 2 == 0 ))
	then
		TERMINATE="1"
	else
		(( OUTPUT += 1 ))
	fi
done

echo $OUTPUT

