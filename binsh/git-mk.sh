#!/bin/sh
# Creates a new project with git init and README.md
# --code flag opens in vs code
if [[ $# == 0 ]]; then
    echo "git-mk creates a new folder and git inits it"
    echo "parameters needed: <repo-directory-name>"
    echo "optional flag: '--code' to open in vs code"
    Exit 1
fi
mkdir -p $1
cd $1
git init &>/dev/null

if [[ "$*" == *--code* ]]; then
    code .
fi
touch README.md
touch .gitignore
echo git repo initialized
echo run git-pp inside repo to push to github
