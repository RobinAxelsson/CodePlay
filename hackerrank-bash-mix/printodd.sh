#!/bin/bash

# for ((i = 0; i < 10; i++)); do
#     echo "$i"
# done

for VAR in {1..99}; do
    if [[ $((VAR % 2)) != 0 ]]; then
        echo "$VAR"
    fi
done
