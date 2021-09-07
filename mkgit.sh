#!/bin/sh
# Creates a new project with git init and README.md
# --code flag opens in vs code
mkdir $1
cd $_
git init &>/dev/null

if [[ "$*" == *--code* ]]; then
    code .
fi
touch README.md
touch .gitignore
