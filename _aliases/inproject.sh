#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"

echo $@
for i in "${projects[@]}"
do
	PROJECT_DIR=`realpath "$ArmarX_DIR/$i"`
	echo $PROJECT_DIR
    if [ "${PWD:0:${#PROJECT_DIR}}" = $PROJECT_DIR ] 
    then
		pushd $PROJECT_DIR > /dev/null
		eval "$@"
		popd > /dev/null
		break
    fi
done
