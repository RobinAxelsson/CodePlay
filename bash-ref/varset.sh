#!/usr/bin/env bash
# set global outside script with -> export y=5

y=5
if [[ -z "$y" ]]; then
    echo y is unset
else
    echo y is set to $y
fi

# unset a variable
unset y

if [[ -z "$y" ]]; then
    echo y is unset
else
    echo y is set to $y
fi
