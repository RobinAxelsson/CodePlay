#!/usr/bin/env bash
min="$1"

if [[ $# -ne 1 ]]; then
    echo reminds you of logging
    echo "one parameter needed: <minutes>"
    exit 1
fi

function remind() {
    while [[ 1 == 1 ]]; do
        sleep $((min * 60))
        code ~/Code/RAX-LOG
    done
}
remind &
echo Remind has started with interval $1 minutes
echo leaving shell
echo pid $(pidof log-remind $1)
disown
