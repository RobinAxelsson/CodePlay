#!/bin/sh

#### Change History/Remote/Local #####

# git push --force origin {branch}
### git push force change in remote

# git reset --hard <commit-hash>
# git reset --hard ORIG_HEAD # (head origin)
### git reset hard before rebase

# git commit --amend
### join commit with last commit (local)

# git push --force origin <branch>
### forces local changes to remote

##### Merges #####

# git merge --abort
# git rebase --abort

#### Get info #####

# git branch -a
### Shows all branches

# git log --oneline --graph
### git log different formats

#### Basic Branch #####

# git checkout main

# git checkout -b main
### creates a new branch from current!

# git branch -d <local-branch>
### deletes local branch

# git clean -n
### views what it will remove (untracked files) if you run git clean.
# git clean -f
### force cleans all
# git clean -i
### cleans interactivly

### cleaning after git ignore
# git rm -r --cached some-directory
# git commit -m 'Remove the now ignored directory "some-directory"'
# git push origin master

### git diff
https://git-scm.com/docs/git-difftool
# git diff #default displays uncommitted changes
## Diff for file
# git diff <commit-1> <commit-2> <file>
# git diff HEAD~2 HEAD main.c #Diff between current and two commits back for main.c

### changes editor to nano, code, vim
# git config --global core.editor "nano"
# git config --global core.editor "code --wait"
# git config --global core.editor "vim"
git checkout -B master origin/master # reset to master origin
