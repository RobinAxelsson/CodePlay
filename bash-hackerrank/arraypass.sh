#!/bin/bash

countArgs() {
    local sum=0
    for VAR in "$@"; do
        echo "$VAR"
        sum=$((sum + VAR))
    done
    echo sum:$sum
}

#string var
# a="1 2 3"
# b="4 5 6"
# c="$a $b"
# echo
# echo a-string:
# countArgs $a
# echo b-string:
# countArgs $b
# echo c-string:
# countArgs $c
# echo
#b=(4 5 6)

a=(1 2 3)
countArgs ${a[@]}
a[0]="${a[0]} 5"
countArgs ${a[@]}

#c="${a[@]} ${b[@]}"
