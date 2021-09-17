#!/usr/bin/env bash
echo
declare -A key_pairs
for ((i = 1; i <= $#; i++)); do
    j=$((i + 1))
    # echo "${!i} ${!j}"
    eval key_pairs[${!i}]=${!j}
done

# echo "${!key_pairs[@]}"
# echo "${key_pairs[@]}"

if [[ "$*" == *-a* ]]; then
    echo input to -a is "${key_pairs[-a]}"
fi
if [[ "$*" == *-b* ]]; then
    echo input to -b is "${key_pairs[-b]}"
fi
if [[ "$*" == *-c* ]]; then
    echo input to -a is "${key_pairs[-c]}"
fi
