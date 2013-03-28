#!/bin/bash

# update the system first
sudo softwareupdate -ia

# install XCode

# install XCode CLI tools

xcodebuild -license
sudo xcodebuild -license

# install MacPorts
curl https://distfiles.macports.org/MacPorts/MacPorts-2.1.2-10.8-MountainLion.pkg -o $HOME/Downloads/MacPorts.pkg
sudo installer -pkg $HOME/Downloads/MacPorts.pkg -target /

# install git
sudo port selfupdate
sudo port upgrade outdated
sudo port install git-core

# set hostname
sudo scutil --set HostName apollo
sudo scutil --set LocalHostName apollo
sudo scutil --set ComputerName apollo

# install rvm and global ruby
curl -#L https://get.rvm.io | sudo bash -s stable --autolibs=3 --ignore-dotfiles --path /opt/rvm --ruby
sudo dseditgroup -o edit -a kyle -t user rvm
source /etc/profile.d/rvm.sh

# for ruby 1.9.3
sudo port install apple-gcc42
rvm install ruby-1.9.3-p392


#university now
sudo port install git-core ImageMagick postgresql91-server mongodb gnupg git-flow

# in unow-web
bundle config build.nokogiri --with-xml2-dir=/usr --with-xslt-dir=/opt/local --with-iconv-dir=/opt/local


# remove all gems
# gem list | cut -d" " -f1 | xargs gem uninstall -aIx


