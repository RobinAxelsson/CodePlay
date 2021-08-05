#!/bin/bash
# art of _ underscores and 1 ones
# a tree with maximum

printLine() {
    local args=("$@")
    local string=""
    for ((i = 0; i < WIDTH; i++)); do
        local oneTrue=false
        for T in "${args[@]}"; do
            {
                if [[ $T == "$i" ]]; then
                    string="${string}1"
                    oneTrue=true
                fi
            }
        done
        if [[ $oneTrue = false ]]; then
            string="${string}_"
        fi
    done
    echo $string
}
splitOnes() { #takes y-height as argument $1
    declare -a new_array
    for VAR in "${ARRAY[@]}"; do
        new_array+=($((VAR - 1)))
        new_array+=($((VAR + 1)))
    done
    ARRAY=("${new_array[@]}")
}
diverge() {
    declare -a new_array
    for ((i = 0; i < ${#ARRAY[@]}; i++)); do
        if [[ $((i % 2)) == 0 ]]; then
            ARRAY[$i]="$((${ARRAY[$i]} - 1))"
        else
            ARRAY[$i]="$((${ARRAY[$i]} + 1))"
        fi
    done
}

WIDTH=100
CENTER=$((WIDTH / 2))
ARRAY=("$CENTER")
HEIGHT=63
STRING=""

DIVERGE=false

for ((y = HEIGHT; y > 0; y--)); do
    if [[ $((y % 16)) == 0 ]]; then
        echo % 16
        if [[ $DIVERGE = false ]]; then
            DIVERGE=true
            splitOnes
        else
            DIVERGE=false
        fi
    fi
    STRING=$(printLine "${ARRAY[@]}")
    ROWS[$y]="$STRING"
    STRING=""
    if [[ $DIVERGE == true ]]; then
        diverge
    fi
done
for i in "${ROWS[@]}"; do
    printf "%s\n" "$i"
done
