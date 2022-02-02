#!/bin/sh
# https://linuxize.com/post/bash-check-if-file-exists/

test -f "$1"
if [[ $? == 1 ]]; then
    echo false
else
    echo true
fi
