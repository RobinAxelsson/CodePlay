#!/bin/bash
# art of _ underscores and 1 ones
# a tree with maximum

# WIDTH=10
# ROWS=5
# Index=0

INDEX=0
N_MAX=5
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
        echo n_val "$N_VAL"
        echo makeY "${Xs[$iRev]}" "$endY" "$relativeSplit" "$N_VAL"
        makeY "${Xs[$iRev]}" "$endY" "$relativeSplit" "$N_VAL"
        #echo irev "$iRev"
        #echo X "${Xs[$iRev]}"
        #echo Y "$endY"
        ((iRev--))
    done
}
makeY 32 0 32 0

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

#reverse the array
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
