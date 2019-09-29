#/bin/bash

SUM="0"

for FILE in $(find /var/log -type f -name "*.log" 2>/dev/null)
do
	if [ -r $FILE ]
	then
		(( SUM+=$(wc -l $FILE | awk '{print $1}') ))
	fi
done

echo $SUM
