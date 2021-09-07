#!/bin/sh
# Creates a new project with git init and README.md
# --code flag opens in vs code
if [[ $# -e 0 ]]; then
    echo "git-mk creates a new folder and git inits it"
    echo "parameters needed: <repo-directory-name>"
    echo "optional flag: '--code' to open in vs code"
    Exit 1
fi
mkdir $1
cd $_
git init &>/dev/null

if [[ "$*" == *--code* ]]; then
    code .
fi
touch README.md
touch .gitignore