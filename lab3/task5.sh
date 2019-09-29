#!/bin/bash

LIST=""

for PID in $(ls /proc -1 | grep "^[[:digit:]]*$" )
do
	if [ -d "/proc/$PID" ]
	then
		INFO_PID=$(awk '{if ($1 == "Pid:") print $2}' \
			< "/proc/$PID/status")	
		INFO_PPID=$(awk '{if ($1 == "PPid:") print $2}' \
			< "/proc/$PID/status")
		INFO_LAVG=$(awk '{if ($1 == "se.avg.load_avg") print $3}' \
			< "/proc/$PID/sched")	
		LIST+="$INFO_PPID\$"
		LIST+="ProcessID=$INFO_PID : "
		LIST+="Parent_ProcessID=$INFO_PPID : "
		LIST+="Average_Load=$INFO_LAVG"
		LIST+=$'\n'
	fi
done

sort -n --field-separator='$' <<<$LIST |
awk 'BEGIN{FS="$"} {print $2}' |
tail -n +2 > task5.out
