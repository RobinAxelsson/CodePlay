#!/bin/sh
# Creates a new project with git init and README.md
# --code flag opens in vs code
mkdir $1
cd $_
git init &>/dev/null

if [[ $2 == "--code" ]]; then
    code .
fi
touch README.md
touch .gitignore
echo .DS_Store >>.gitignore
curl https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore >>.gitignore
curl https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore >>.gitignore
