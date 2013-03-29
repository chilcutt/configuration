#!/bin/bash

set -e

OS=`uname`
if [ "$OS" == "Darwinx" ]; then
  darwin_installer
else
  echo 'unsupported operating system'
  exit 1
fi
