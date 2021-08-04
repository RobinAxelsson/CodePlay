#!/bin/bash
# art of _ underscores and 1 ones
# a tree with maximum

WIDTH=15
CENTER=$((WIDTH / 2))
echo $CENTER
HEIGHT=5
STRING=""
for ((y = 0; y < HEIGHT; y++)); do
    for ((x = 0; x < WIDTH; x++)); do
        if [[ $x == $CENTER ]]; then
            STRING="${STRING}1"
        else
            STRING="${STRING}_"
        fi
    done
    ROWS[$y]="$STRING"
    STRING=""
done
for i in "${ROWS[@]}"; do
    printf "%s\n" $i
done
