#!/bin/bash

ps x -U $USER | tail -n +2 |
awk '{printf "%s:", $1; for(i=5;i<=NF;i++) printf "%s ", $i; print ""}' > task1.out

wc -l < task1.out
