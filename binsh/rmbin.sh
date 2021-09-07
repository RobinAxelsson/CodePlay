#!/bin/sh
if [[ $# -ne 1 ]]; then
    echo "parameters needed: <bin-to-remove>"
    exit 1
fi
rm /Users/RAX/bin/$1
