#!/bin/sh
rm ~/.gitignore
curl https://raw.githubusercontent.com/github/gitignore/master/Global/VisualStudioCode.gitignore >>~/.gitignore
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore >>~/.gitignore
curl https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore >>~/.gitignore
git config --global core.excludesFile '~/.gitignore'
cat ~/.gitignore
