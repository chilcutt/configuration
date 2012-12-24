#!/bin/bash

FILES='rvm.sh git.sh'

pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd`
popd > /dev/null

for FILE in $FILES; do
	$SCRIPT_PATH/$FILE
done
