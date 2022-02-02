#!/usr/bin/env bash

READ=$(cat)

for VAR in $READ; do
    echo read: "$VAR"
done

for VAR in "$@"; do
    echo param: $VAR
done
