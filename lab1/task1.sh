#!/bin/bash

if [[ "$#" != "2" ]]
then
	echo "Usage: task1.sh STRING_OPERAND1 STRING_OPERAND2"
	exit 1
fi

if [[ "$1" == "$2" ]]
then
	echo "Operands are equal"
else
	echo "Operands are not equal"
fi

