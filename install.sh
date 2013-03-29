#!/bin/bash

set -e

OS=`uname`
if [ "$OS" == "Darwinx" ]; then
  darwin_installer
else
  echo 'unsupported operating system'
  exit 1
fi

darwin_installer() {
  # load all required commands

  # configure the system

  # update core system software
  sudo softwareupdate -ia

  # install xcode and xcode cli tools

  # install macports

  # install all generic ports
  sudo port selfupdate
  sudo port upgrade outdated
  sudo port install bash bash_completion git-core +bash_completion

  # set default shell to use port installed bash
  if [ -n "`grep '^/opt/local/bin/bash$' /etc/shells`" ]; then
    echo "/opt/local/bin/bash" | sudo tee -a /etc/shells
  fi
  chsh -s /opt/local/bin/bash

  # change the root shell too
  sudo chsh -s /opt/local/bin/bash

  # install vim, janus, and vim tools
  curl -Lo- https://bit.ly/janus-bootstrap | bash
  sudo port install p5-app-ack ctags
  sudo ln -s /opt/local/bin/ack-5.12 /opt/local/bin/ack

  # install rvm and ruby
  curl -#L https://get.rvm.io | sudo bash -s stable --autolibs=3 --ignore-dotfiles --path /opt/rvm --ruby
  sudo dseditgroup -o edit -a kyle -t user rvm
  source /etc/profile.d/rvm.sh

  # install the heroku toolbelt
  curl -L https://toolbelt.heroku.com/download/osx -o heroku-toolbelt.pkg
  #run installer

  # install dotfiles
  git clone git@github.com:chilcutt/dotfiles.git $HOME/.dotfiles
  $HOME/.dotfiles/install.sh
}
