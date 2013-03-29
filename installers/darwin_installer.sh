#!/bin/bash

set -e

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
  echo 'port'
}

darwin_update_macports() {
  sudo port selfupdate
  sudo port upgrade outdated
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
  darwin_update_system
  darwin_install_xcode
  darwin_install_macports
  darwin_update_macports
  darwin_install_bash
  darwin_install_git
  darwin_install_janus_vim
  darwin_install_dotfiles
  darwin_install_rvm_ruby
  darwin_install_heroku_toolbelt
}
