#!/bin/bash

if [[ "$PWD" == "$HOME" ]]
then
	echo "$PWD"
	exit 0
else
	echo "Error: launched not from home directory" >&2
	exit 1
fi

