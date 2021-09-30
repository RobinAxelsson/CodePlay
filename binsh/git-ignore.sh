#!/usr/bin/env bash

if [[ "$1" == "-a" ]]; then
    cat ~/.gitignore >>.gitignore
elif [[ "$1" == "-w" ]]; then
    cat ~/.gitignore >.gitignore
else
    echo Need a flag -a append or -w overwrite
fi
