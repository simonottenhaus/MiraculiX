#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"

for i in "${projects[@]}"
do
	PROJECT_DIR="$ArmarX_DIR/$i"
    if [ "${PWD:0:${#PROJECT_DIR}}" = $PROJECT_DIR ] 
    then
		pushd $PROJECT_DIR > /dev/null
		eval "$@"
		popd > /dev/null
		break
    fi
done
