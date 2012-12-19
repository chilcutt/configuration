#!/bin/bash

# set default global settings
git config --global user.name 'Kyle Chilcutt'
git config --global user.email 'kyle@chilcutt.com'
git config --global color.ui true
git config --global push.default tracking
git config --global core.whitespace space-before-tab,trailing-space
git config --global core.editor `which vim`
git config --global grep.lineNumber true
git config --global core.pager 'less -r'

# aliases
git config --global alias.cp 'cherry-pick'
git config --global alias.st 'status -s'
git config --global alias.co 'checkout'
git config --global alias.br 'branch'
git config --global alias.cdiff 'diff --word-diff=color'
git config --global alias.graph 'log --oneline --graph --decorate'
git config --global alias.ls "log --graph --date=short --format='%C(yellow)%h %C(cyan)%ad %C(reset)%s %C(blue)[%aN]%C(reset)'"
git config --global alias.ll "log --graph --date=short --format='%C(yellow)%h %C(cyan)%ad %C(reset)%s %C(blue)[%aN]%C(reset)' --numstat"
git config --global alias.la "log --graph --all --date=short --format='%C(yellow)%h %C(cyan)%ad%C(green bold)%d %C(reset)%s %C(blue)[%aN]%C(reset)'"
git config --global alias.find '!git ls-files | grep -i'
git config --global alias.fgrep 'grep --heading --break --ignore-case'
