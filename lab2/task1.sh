#!/bin/bash

grep --directories=skip --no-filename --binary-files=without-match \
	--only-matching --no-message -E "ACPI[[:alnum:][:space:][:punct:]]*$" \
	/var/log/* > errors.log

while read -r LINE
do
	TOKENS=$(grep --no-filename --only-matching --no-message -E \
		"[[:alnum:][:punct:]]+" <<< "$LINE")

	for TOKEN in $TOKENS
	do
		if [ -f $TOKEN ]
		then
			echo "File detected: $TOKEN"
			echo -e "In line:\n $LINE$\n"
		fi
	done
done < errors.log
