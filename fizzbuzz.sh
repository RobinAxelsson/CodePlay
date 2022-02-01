#!/bin/sh
# for i in {1..100}
# do
#     STR=""
#     if [[ $i%3 -eq 0 ]]; then
#         STR+='Fizz'
#     fi
#     if [[ $i%5 -eq 0 ]]; then
#         STR+='Buzz'
#     fi
#     if [[ ! -n $STR ]]; then
#         STR=$i
#     fi
#     echo $STR
# done

seq 100 | sed 'n;n;s/[0-9]*$/Fizz/' | sed 'n;n;n;n;s/[0-9]*$/Buzz/'