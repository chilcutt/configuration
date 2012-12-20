#!/bin/bash

DIRS='dotfiles configs lib'

pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd`
popd > /dev/null

for DIR in $DIRS; do
	$SCRIPT_PATH/$DIR/install.sh
done
