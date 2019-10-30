#!/bin/bash

SRC=pipe.txt
VAR=1
MODE=NONE
NUM_REG='^[+-]?[[:digit:]]+$'

(tail -n 0 -f $SRC) |
while true
do
	read LINE;
	echo "$LINE"
	if [[ "$LINE" == '+' ]]
	then
		MODE=ADD
		continue
	fi
	if [[ "$LINE" == '*' ]]
	then
		MODE=MUL
		continue
	fi
	if [[ "$LINE" =~ $NUM_REG ]]
	then
		if [[ "$MODE" == ADD ]]
		then
			(( VAR+=$LINE ))
			continue
		fi
		if [[ "$MODE" == MUL ]]
		then
			(( VAR*=$LINE ))
			continue
		fi
		echo -ne "Unexpected symbol: $LINE\nCurrent mode: $MODE\nExiting errorneously...\n"
	        exit -1
	fi
	if [[ "$LINE" == "QUIT" ]]
	then
		echo -ne "Calculation terminated.\nResult: $VAR\nExiting normally...\n"
		exit 0
	fi
	echo -ne "Unexpected symbol: $LINE\nExiting errorneously...\n"
	exit -1
done
