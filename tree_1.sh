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
ROWS=63
STRING=""
#YSIZE=16
DIVERGE=false

createY() {
    for ((y = 1; y < $1 + 1; y++)); do

        STRING=$(printLine "${ARRAY[@]}")
        TEXT[$y]="$STRING""$y"
        STRING=""
        # if [[ $DIVERGE == true ]]; then
        #     diverge
        # fi
        if [[ $((y / 2)) == 0 ]]; then
            if [[ $DIVERGE = false ]]; then
                DIVERGE=true
                #splitOnes
            else
                DIVERGE=false
                #YSIZE=$((YSIZE / 2))
            fi
        fi
    done
}

#reverse text array
createY 16
min=0
#max=$((${#TEXT[@]} - 1))
max=$((${#TEXT[@]}))
while [[ min -lt max ]]; do
    # Swap current first and last elements
    x="${TEXT[$min]}"
    TEXT[$min]="${TEXT[$max]}"
    TEXT[$max]="$x"
    ((min++, max--))
done
#for VAR in "${ARRAY[@]}"; do
for L in "${TEXT[@]}"; do
    printf "%s\n" "$L"
done

# for ((i = 0; i < ${#TEXT[@]}; i++)); do
#     index=$((${#TEXT[@]} - i + 1)) # reverse the array
#     printf "%s\n" "${TEXT[$index]}"
# done
