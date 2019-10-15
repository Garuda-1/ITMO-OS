#!/bin/bash

for USR in $(awk -F ":" '{print $1}' /etc/passwd)
do
	echo "User $USR runs" $(ps -U $USR | wc -l) "proccess(es)"
done
