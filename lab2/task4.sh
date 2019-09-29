#!/bin/bash

grep --directories=recurse --no-filename --binary-files=without-match --only-matching \
	--no-message -E "^#\![[:alnum:][:punct:]]*" /bin/* |
sort |
uniq -c |
sort -nr |
head -1 |
awk '{print substr($2, 3)}'
