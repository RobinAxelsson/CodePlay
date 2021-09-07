#!/bin/sh
#https://cli.github.com/manual/gh_repo_create
# publishes a private repo to github and adds as origin
if [[ $# -ne 1 ]]; then
    echo "parameters needed: <repo-name>"
fi
gh repo create $NAME -y --private
git push --set-upstream origin master
