#!/bin/bash

# run RVM installer without dotfiles, they're already checked in
curl -L https://get.rvm.io | bash -s -- --ignore-dotfiles
