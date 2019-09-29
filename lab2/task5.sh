#!/bin/bash

awk 'BEGIN{FS=":"} {print $1, $3}' /etc/passwd |
sort -k2 -n |
awk '{print $1}'
