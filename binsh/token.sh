#!/bin/bash

if [[ $1 == "ls" ]]; then
    security dump-keychain | grep 0x00000007 | awk -F= '{print $2}'
    # security dump-keychain | grep 'acct\|svce'
    exit 0
fi

if [[ $1 == "-n" ]]; then
    security add-generic-password -T "" -a $2 -s $3 -w
    exit 0
fi

if [[ $1 == "-d" ]]; then
    security delete-generic-password -a $2 -s $3 | grep password
    exit 0
fi

if [[ $1 == "-ga" ]]; then
    security find-generic-password -s $2 | grep acct | awk -F '"' '{ print $4 }'
    exit 0
fi

if [[ $# -ne 2 ]]; then
    echo "Use ls to list, -n to add new, -d to delete, -ga to get account"
    echo "no flags and 2 params do get: <associated-account> key/service-name>"
    exit 1
fi
security find-generic-password -w -a $1 -s $2
