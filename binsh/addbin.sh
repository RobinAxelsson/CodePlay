#!/bin/sh

if [[ $# -ne 2 ]]; then
    echo "parameters needed: <source-name> <target-bin-name>"
    exit 1
fi

if [ ! -d "$HOME/bin" ]; then
    mkdir "$HOME/bin"
fi
source=$1
target=$HOME/bin/$2
[[ -s $target ]] && rm "$target"
ln $source $target
chmod +x $target
