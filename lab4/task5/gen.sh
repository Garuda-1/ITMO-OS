#!/bin/bash

while read LINE
do
	echo "$LINE" >> pipe.txt
done
