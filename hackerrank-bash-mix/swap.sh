#!/bin/bash
array=(1 2 3)
min=0
max=$((${#array[@]} - 1))

while [[ min -lt max ]]; do
    # Swap current first and last elements
    x="${array[$min]}"
    array[$min]="${array[$max]}"
    array[$max]="$x"

    # Move closer
    ((min++, max--))
done

echo "${array[@]}"
