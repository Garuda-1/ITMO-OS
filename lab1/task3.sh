#!/bin/bash

TERMINATE="0"
BUFFER=""
OUTPUT=""

while [[ "$TERMINATE" == "0" ]]
do
	read BUFFER
	if [[ "$BUFFER" == "q" ]]
	then
		TERMINATE="1"
	else
		OUTPUT+="$BUFFER "
	fi
done

echo $OUTPUT

