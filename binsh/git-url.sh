#!/bin/sh

if [[ "$*" == *-o* ]]; then
    open $(git config --get remote.origin.url)
    exit 0
fi
git config --get remote.origin.url
