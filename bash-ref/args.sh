#!/bin/sh
#########
### Check arg
# if [[ "$*" == *match* ]]; then
#     echo "YES"
# else
#     echo "NO"
# fi

### Check count
# echo Script name: $0
# echo $# arguments
# if [[ $# -ne 1 ]]; then
#     echo "illegal number of parameters"
# fi

### List all with for-loop
args=("$@")
for ((i = 0; i < $#; i++)); do
    echo "argument $((i + 1)): ${args[$i]}"
done
