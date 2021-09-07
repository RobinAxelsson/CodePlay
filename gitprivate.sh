#!/bin/sh
#https://cli.github.com/manual/gh_repo_create
if [[ $# -ne 1 ]]; then
    NAME=${PWD##*/}
else
    NAME=$1
fi
gh repo create $NAME -y --private
