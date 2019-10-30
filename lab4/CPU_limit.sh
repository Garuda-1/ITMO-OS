#!/bin/bash

BURNER=./CPU_burn.sh
SLEEP=10

echo "Starting burners..."
$BURNER &
BURNER1_PID=$!
echo "Burner 1 PID = $BURNER1_PID"
$BURNER &
BURNER2_PID=$!
echo "Burner 2 PID = $BURNER2_PID"

echo "Delay for $SLEEP seconds..."
sleep $SLEEP

echo "Limit Burner 1..."
cpulimit --pid=$BURNER1_PID --limit=15 &
CPULIMIT_PID=$!

echo "Limiting Burner 1 to 15%. Delay for $SLEEP seconds..."
sleep $SLEEP

echo "Cleaning up..."
kill -s 9 $CPULIMIT_PID
kill -s 9 $BURNER2_PID
kill -s 9 $BURNER1_PID

