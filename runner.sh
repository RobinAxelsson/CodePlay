#!/bin/sh
echo ">>>" compiling: $1
echo ------------------------------
fsharpi $1
echo ">>> stdout"
echo ------------------------------
echo ">>> Time" "$(date +"%T")"
echo
