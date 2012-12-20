#!/bin/bash

FILES='git-prompt.sh'

pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd`
popd > /dev/null

TIMESTAMP=`date +%s`

sudo mkdir -p /opt/lib

for FILE in $FILES; do
	if [ -n /opt/lib/$FILE ]; then
		sudo mkdir -p /opt/.lib_backups
		sudo mv /opt/lib/$FILE /opt/.lib_backups/${FILE}_$TIMESTAMP
	fi
	sudo ln -s $SCRIPT_PATH/$FILE /opt/lib/$FILE
done
