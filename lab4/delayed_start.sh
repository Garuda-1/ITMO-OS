#!/bin/bash

TARGET_SCRIPT=$PWD/run.sh
DELAY=10
COUNTDOWN=5

echo "Launching $TARGET_SCRIPT in $DELAY seconds"
sleep $(( $DELAY - $COUNTDOWN ))

for (( i = $COUNTDOWN + 1 ; i-- > 1 ; ))
do
	echo $i
	sleep 1
done

$TARGET_SCRIPT

