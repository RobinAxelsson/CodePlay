#!/bin/sh

if [[ $# -ne 2 ]]; then
    echo "parameters needed: <source-name> <target-bin-name>"
    exit 1
fi
source=$1
target=/Users/RAX/bin/$2
[[ -s $target ]] && rm "$target"
ln $source $target
chmod +x $target
