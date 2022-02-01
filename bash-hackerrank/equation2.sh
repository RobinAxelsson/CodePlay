#!/bin/bash

read -r N
for ((i = 0; i < N; i++)); do
    read -r X
    NUMS[$i]="$X"
done

SUM=0
for i in "${NUMS[@]}"; do
    ((SUM += i))
done
VAR=$(bc -l <<<"$SUM / $N")
printf "%5.3f\n" "$VAR"
