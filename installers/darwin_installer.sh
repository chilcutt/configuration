#!/bin/bash

set -e

darwin_configure_system() {
  SYSTEM_NAME='athena'

  sudo scutil --set HostName $SYSTEM_NAME
  sudo scutil --set LocalHostName $SYSTEM_NAME
  sudo scutil --set ComputerName $SYSTEM_NAME
}

darwin_update_system() {
  sudo softwareupdate -ia
}

darwin_install_xcode() {
  # install xcode and cli tools

  # have the user accept the xcode licenses
  xcodebuild -license
  sudo xcodebuild -license
}

darwin_install_macports() {
  curl https://distfiles.macports.org/MacPorts/MacPorts-2.1.2-10.8-MountainLion.pkg -o $HOME/Downloads/MacPorts.pkg
  sudo installer -pkg $HOME/Downloads/MacPorts.pkg -target /
}

darwin_update_macports() {
  sudo port selfupdate
  sudo port upgrade outdated
}

darwin_install_gcc() {
  sudo port install apple-gcc42
}

darwin_install_bash() {
  sudo port install bash bash_completion

  # set default shell to use port installed bash
  if [ -n "`grep '^/opt/local/bin/bash$' /etc/shells`" ]; then
    echo "/opt/local/bin/bash" | sudo tee -a /etc/shells
  fi
  chsh -s /opt/local/bin/bash

  # change the root shell too
  sudo chsh -s /opt/local/bin/bash
}

darwin_install_git() {
  sudo port install git-core +bash_completion
}

darwin_configure_git() {
  USER='Kyle Chilcutt'
  EMAIL='kyle@chilcutt.com'

  # set default global settings
  git config --global user.name $USER
  git config --global user.email $EMAIL
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
}

darwin_install_janus_vim() {
  sudo port install vim macvim p5-app-ack ctags
  curl -Lo- https://bit.ly/janus-bootstrap | bash
  sudo ln -s /opt/local/bin/ack-5.12 /opt/local/bin/ack
}

darwin_install_dotfiles() {
  git clone git@github.com:chilcutt/dotfiles.git $HOME/.dotfiles
  $HOME/.dotfiles/install.sh
}

darwin_install_rvm_ruby() {
  curl -#L https://get.rvm.io | sudo bash -s stable --autolibs=3 --ignore-dotfiles --path /opt/rvm --ruby
  sudo dseditgroup -o edit -a kyle -t user rvm
  source /etc/profile.d/rvm.sh
}

darwin_install_heroku_toolbelt() {
  curl -L https://toolbelt.heroku.com/download/osx -o heroku-toolbelt.pkg
}

darwin_installer() {
  darwin_configure_system
  darwin_update_system
  darwin_install_xcode
  darwin_install_macports
  darwin_update_macports
  darwin_install_gcc
  darwin_install_bash
  darwin_install_git
  darwin_configure_git
  darwin_install_janus_vim
  darwin_install_dotfiles
  darwin_install_rvm_ruby
  darwin_install_heroku_toolbelt
}
