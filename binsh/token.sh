#!/usr/bin/env bash

declare -A key_pairs
for ((i = 1; i <= $#; i++)); do
    j=$((i + 1))
    eval key_pairs[${!i}]=${!j}
done

if [[ "$*" == "--help" ]]; then
    echo "-s <service-name> req"
    echo "-a <associated-account>"
    echo commands:
    echo token new -s name -a acc
    echo token delete -s name -a acc
    echo token ls to list tokens from osx keychain
    echo token getacc find associated account
    exit 0
fi
if [[ "$*" == "ls" ]]; then
    security dump-keychain | grep 0x00000007 | awk -F= '{print $2}'
    # security dump-keychain | grep 'acct\|svce'
    exit 0
fi

if [[ "$*" == *-s* ]]; then
    service_name="${key_pairs[-s]}"
else
    echo service_name -s arg is missing
    echo run --help to learn more
    exit 1
fi
# gets associated account
if [[ $1 == "getacc" ]]; then
    security find-generic-password -s $service_name | grep acct | awk -F '"' '{ print $4 }'
    exit 0
fi
if [[ "$*" == *-a* ]]; then
    associated_account="${key_pairs[-a]}"
else
    echo no associated account given...
    echo looking for associated account...
    security find-generic-password -s $service_name | grep acct | awk -F '"' '{ print $4 }'
    exit 0
fi
if [[ "$1" == "delete" ]]; then
    security delete-generic-password -a "$associated_account" -s "$service_name" | grep password
    exit 0
fi

if [[ "$1" == "new" ]]; then
    echo associated-account $associated_account
    echo service-name $service_name
    security add-generic-password -T "" -a "$associated_account" -s "$service_name" -w
    echo token created
    exit 0
fi
if [[ $# == 4 ]]; then
    security find-generic-password -w -a "$associated_account" -s "$service_name"
else
    echo invalid args
    exit 1
fi
