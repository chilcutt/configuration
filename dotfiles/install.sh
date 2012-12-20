#!/bin/bash

FILES='bash_logout bash_profile bashrc inputrc vimrc.after'

pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd`
popd > /dev/null

TIMESTAMP=`date +%s`

for FILE in $FILES; do
	if [ -n $HOME/.$FILE ]; then
		mkdir -p $HOME/.dotfile_backups
		mv $HOME/.$FILE $HOME/.dotfile_backups/${FILE}_$TIMESTAMP
	fi
	ln -s $SCRIPT_PATH/$FILE $HOME/.$FILE
done
