#!/usr/bin/env bash

READ=$(cat)

for VAR in $READ; do
    echo read: "$VAR"
done
