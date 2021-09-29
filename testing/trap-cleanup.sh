#!/usr/bin/env bash

# function cleanup() {
#     echo
#     echo cleaning up
#     exit 0
# }

# trap cleanup SIGINT

ctrlc_count=0

function no_ctrlc() {
    let ctrlc_count++
    echo
    if [[ $ctrlc_count == 1 ]]; then
        echo "Stop that."
    elif [[ $ctrlc_count == 2 ]]; then
        echo "Once more and I quit."
    else
        echo "That's it.  I quit."
        exit
    fi
}

trap no_ctrlc SIGINT

while true; do
    echo Sleeping
    sleep 4
done
