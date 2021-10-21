#!/usr/bin/env bash
path=$HOME/bin
if [ -d "$path" ]; then
    echo $path exists!
else
    echo $path does not exist!
fi
