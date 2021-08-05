#!/bin/bash

INDEX=0
N_MAX=$1
makeY() {
    #args
    # X - center;
    # coord Y - start;
    # coord H - relative height
    # N - current level
    local startX=$1
    local startY=$2
    local relativeHeight=$3
    local N_VAL=$4
    local relativeSplit=$((relativeHeight / 2))
    local split=$((startY + relativeSplit))
    local yMAX=$((startY + relativeHeight))
    local varL=$1
    local varR=$1
    for ((y = startY; y <= yMAX; y++)); do
        if [[ $y -gt $split ]]; then
            ((varL--))
            ((varR++))
            Xs[$INDEX]="$varL"
            Ys[$INDEX]="$y"
            ((INDEX++))

            Xs[$INDEX]="$varR"
            Ys[$INDEX]="$y"
            ((INDEX++))
        else
            Xs[$INDEX]="$startX"
            Ys[$INDEX]="$y"
            ((INDEX++))
        fi
    done
    local iRev=$(($INDEX - 1))
    local endY="${Ys[$iRev]}"
    ((N_VAL++))
    while [[ $endY == "${Ys[$iRev]}" ]]; do
        if [[ $N_VAL == "$N_MAX" ]]; then
            break
        fi
        makeY "${Xs[$iRev]}" "$endY" "$relativeSplit" "$N_VAL"
        ((iRev--))
    done
}
makeY 50 0 32 0

TI=0
for ((y = 1; y <= 63; y++)); do
    for ((x = 0; x <= 100; x++)); do
        for ((i = 0; i < INDEX; i++)); do
            if [[ $x == "${Xs[$i]}" && $y == "${Ys[$i]}" ]]; then
                ONE=true
            fi
        done
        if [[ $ONE = true ]]; then
            string="${string}1"
            ONE=false
        else
            string="${string}_"
        fi
    done
    TEXT[$TI]="$string""$y"
    ((TI++))
    string=""
done

for ((i = 62; i >= 0; i--)); do
    printf "%s\n" "${TEXT[$i]}"
done
