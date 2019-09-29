#!/bin/bash

PPID_FREQ=$(awk 'BEGIN{FS=" : "} {print $2}' task5.out |
	awk 'BEGIN{FS="="} {print $2}' |
	uniq -c)

PPID_RANGE="0 "
ACC="0"

while read -e LINE
do
	FREQ=$(awk '{print $1}' <<< $LINE)
	F_PPID=$(awk '{print $2}' <<< $LINE)
	(( ACC+=$FREQ ))
	PPID_RANGE+="$ACC $F_PPID"
	PPID_RANGE+=$'\n'
	PPID_RANGE+="$ACC "
done <<< $PPID_FREQ

PPID_RANGE+="$ACC"

while read -e RANGE
do
	L=$(awk '{print $1}' <<< $RANGE)
	R=$(awk '{print $2}' <<< $RANGE)
	if (( $R - $L > 0 ))
	then
		R_PPID=$(awk '{print $3}' <<< $RANGE)
		(( L+=1 ))
		(( R+=1 ))
		SUM_INFO_LAVG="0"
		for ((LINE_NUM=$L; LINE_NUM < $R; LINE_NUM++))
		do
			LINE=$(awk "NR==$LINE_NUM" task5.out)
			INFO_LAVG=$(awk 'BEGIN{FS=" : "} {print $3}' <<< $LINE |
				awk 'BEGIN{FS="="} {print $2}')
			(( SUM_INFO_LAVG+=INFO_LAVG ))
			echo $LINE
		done
		AVG_INFO_LAVG=$(( $SUM_INFO_LAVG / ($R - $L) ))
		echo "Average_Load_Children_of_ParentProcessID=$R_PPID" \
			"is $AVG_INFO_LAVG"
		echo
	fi
done <<< $PPID_RANGE > task6.out
