#!/bin/sh
#https://cli.github.com/manual/gh_repo_create
# publishes a private repo to github and adds as origin
if [ $# -gt 1 ]; then
    echo git-pp publishes a private repo to github and adds it as origin
    echo "optional prameter: <repo-name>"
    exit 1
fi
gh repo create $1 -y --private
if [ "$?" = "0" ]; then
    git push --set-upstream origin master
else
    echo - No push upstream was made.
fi
git-url
