#!/bin/bash

# update the system first
sudo softwareupdate -i -a

# install MacPorts
curl https://distfiles.macports.org/MacPorts/MacPorts-2.1.2-10.8-MountainLion.pkg -o $HOME/Downloads/MacPorts.pkg
sudo installer -pkg $HOME/Downloads/MacPorts.pkg -target /

# install XCode

# install XCode CLI tools

# install git
sudo port selfupdate
sudo port install git-core

# set hostname
sudo scutil --set HostName apollo
sudo scutil --set LocalHostName apollo
sudo scutil --set ComputerName apollo
