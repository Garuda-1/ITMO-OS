#!/bin/bash

man bash |
awk 'length($1) >= 4 {print $1}' |
sort |
uniq -c |
sort -nr |
head -3 |
awk '{print $2}'
