#!/bin/bash

#read -r N_MAX
N_MAX=$1
declare -a Xs
makeY() {
    local startX=$1 # Staring point X,Y for the 'Y'
    local startY=$2
    local relativeHeight=$3                     # The height of the local 'Y'
    local N_VAL=$4                              # The incoming variable to know which level of recursion
    local relativeSplit=$((relativeHeight / 2)) # the distance half-way up the 'Y'
    local split=$((startY + relativeSplit))     # absolute y-value for split
    local yMAX=$((startY + relativeHeight))     # the end y-value of the 'Y'
    local varL=$1                               # variables that will hold the splitting half x-values
    local varR=$1

    for ((y = startY; y <= yMAX; y++)); do
        if [[ $y -gt $split ]]; then
            ((varL--))
            ((varR++))
            Xs[$y]="${Xs[$y]} $varL"
            Xs[$y]="${Xs[$y]} $varR"
        else
            Xs[$y]="${Xs[$y]} $startX"
        fi
    done

    ((N_VAL++))
    if [[ $N_VAL == "$N_MAX" ]]; then
        return
    fi

    makeY "$varL" "$((yMAX + 1))" "$relativeSplit" "$N_VAL"
    makeY "$varR" "$((yMAX + 1))" "$relativeSplit" "$N_VAL"
}

writeRow() {
    local row=""
    local hit=0
    for ((x = 0; x < 100; x++)); do
        for VAR in "$@"; do
            if [[ $x == "$VAR" ]]; then
                row="${row}1"
                hit=1
                break
            fi
        done
        if [[ $hit == 0 ]]; then
            row="${row}_"
        else
            hit=0
        fi
    done
    echo $row
}

makeY 50 0 31 0

for ((y = 62; y >= 0; y--)); do
    echo $(writeRow ${Xs[$y]})$((y + 1))
done
