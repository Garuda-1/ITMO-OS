#!/bin/bash

ps aux | tail -n +2 | awk '{print $11 " " $2}' | grep "^/sbin/" |
awk '{print $2}' > task3.out
