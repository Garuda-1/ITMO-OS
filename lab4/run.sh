#!/bin/bash

LAUNCH_TIME=$(date +"%d-%m-%y_%T")
PING_TARGET=www.net_nikogo.net
DIR=/home/oktet/OS_Practice/lab4/

mkdir $DIR/test 2> /dev/null &&
{
    echo "Catalog test was created successfully" > $DIR/report
    touch $DIR/test/$LAUNCH_TIME
}

ping $PING_TARGET 2> /dev/null || echo "Ping of target $PING_TARGET Failed" >> $DIR/report
