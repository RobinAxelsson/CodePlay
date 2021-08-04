#!/bin/bash
# art of _ underscores and 1 ones
# a tree with maximum
printLine() {
    local length=$1
    shift
    local args=("$@")
    local string=""
    for ((i = 0; i < length; i++)); do
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
WIDTH=15
#CENTER=$((WIDTH / 2))
ARRAY=(2 3)
#HEIGHT=5
HEIGHT=1
STRING=""
for ((y = 0; y < HEIGHT; y++)); do
    #STRING=$(printLine $WIDTH $CENTER)
    STRING=$(printLine $WIDTH "${ARRAY[@]}")
    ROWS[$y]="$STRING"
    STRING=""
done
for i in "${ROWS[@]}"; do
    printf "%s\n" "$i"
done

# VAR=$(printLine 5 1 2)
# echo $VAR

### STRAIGHT LINE PRINT! ###
# WIDTH=15
# CENTER=$((WIDTH / 2))
# echo $CENTER
# HEIGHT=5
# STRING=""
# for ((y = 0; y < HEIGHT; y++)); do
#     for ((x = 0; x < WIDTH; x++)); do
#         if [[ $x == $CENTER ]]; then
#             STRING="${STRING}1"
#         else
#             STRING="${STRING}_"
#         fi
#     done
#     ROWS[$y]="$STRING"
#     STRING=""
# done
# for i in "${ROWS[@]}"; do
#     printf "%s\n" $i
# done
