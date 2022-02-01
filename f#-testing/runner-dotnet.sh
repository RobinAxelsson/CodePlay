#!/bin/sh
echo ">>>" compiling: $1
echo ------------------------------
dotnet run
echo ">>> stdout"
echo ------------------------------
echo ">>> Time" "$(date +"%T")"
echo
