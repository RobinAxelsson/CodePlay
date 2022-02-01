#!/bin/bash
#read text
cat $1 | while read -r line; do
    # do something with $line here
    echo "${line:1:1}${line:6:1}"
done
