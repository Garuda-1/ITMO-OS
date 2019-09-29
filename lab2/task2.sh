#!/bin/bash

while read -e LINE
do
	echo "${LINE/(WW)/Warning:}"
done <<< $(grep --no-filename --no-message --only-matching -E \
	   "^\[[[:space:][:punct:][:digit:]]*\] \(WW\) [[:punct:][:alnum:][:space:]]*$" \
	    /var/log/Xorg.0.log) \
     > full.log

while read -e LINE
do
        echo "${LINE/(EE)/Error:}"
done <<< $(grep --no-filename --no-message --only-matching -E \
           "^\[[[:space:][:punct:][:digit:]]*\] \(EE\) [[:punct:][:alnum:][:space:]]*$" \
	    /var/log/Xorg.0.log) \
     >> full.log

cat full.log

