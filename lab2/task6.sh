#!/bin/bash

wc -l /var/log/*.log |
tail -1 |
awk '{print $1}'
