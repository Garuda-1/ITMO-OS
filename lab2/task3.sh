#!/bin/bash

if [ -f emails.lst ]
then
	rm emails.lst
fi

for EMAIL in $(grep --directories=recurse --no-filename --binary-files=without-match \
	--only-matching --no-message -E \
	"[[:alpha:]][[:alnum:]\.\-\_]*@[[:alnum:]]+\.[[:alnum:]]+" /etc/*)
do
	echo -n "$EMAIL, " >> emails.lst
done

truncate -s-2 emails.lst
