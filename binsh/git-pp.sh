#!/usr/bin/env bash
#https://cli.github.com/manual/gh_repo_create
# publishes a private repo to github and adds as origin

declare -A key_pairs
for ((i = 1; i <= $#; i++)); do
    j=$((i + 1))
    eval key_pairs[${!i}]=${!j}
done

if [[ "$*" == *--help* ]]; then
    echo git-pp publishes a private repo to github and adds it as origin
    echo flags -n name -o open
    exit 1
fi
gh repo create -y --private
if [ "$?" = "0" ]; then
    # may need to commit before pushing
    echo "git push --set-upstream origin master"
    # git push --set-upstream origin main
else
    echo - Repository was not created.
fi
# if [[ "$*" == *-o* ]]; then
#     git-url -o
# else
#     echo git-url: "$(git-url)"
# fi
