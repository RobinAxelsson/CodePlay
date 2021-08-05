#!/bin/bash
# art of _ underscores and 1 ones
# a tree with maximum

# WIDTH=10
# ROWS=5
# Index=0

INDEX=0

makeY() { #args X Y H
    local startX=$1
    local startY=$2
    local relativeHeight=$3
    local relativeSplit=$((relativeHeight / 2))
    local split=$((startY + relativeSplit))
    local height=$((startY + relativeHeight))
    local varL=$1
    local varR=$1
    for ((y = startY; y <= height; y++)); do
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
}
makeY 50 5 10
makeY 55 16 10
# for ((i = 0; i < INDEX; i++)); do
#     echo "${Xs[$i]}" "${Ys[$i]}"
# done

TI=0
for ((y = 1; y <= 30; y++)); do
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

# for ((y = 1; y <= ROWS; y++)); do
#     for ((x = 1; x <= WIDTH; x++)); do
#         if [[ $x == 5 ]]; then
#             char=1
#         else
#             char=_
#         fi
#         array[$Index]="$x $y $char"
#         ((Index++))
#     done
# done

# reverse the array
min=0
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
