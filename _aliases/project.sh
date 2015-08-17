#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"

if [ -z $1 ]
then
	cd "$ArmarX_DIR"
else
	FOUND=0
	for i in "${projects[@]}"
	do
		PROJECT_WITH_PREFIX=armarx$1
		if [[ ${i,,} = $1* ]] || [[ ${i,,} = $PROJECT_WITH_PREFIX* ]]
		then
			cd $ArmarX_DIR/$i
			FOUND=1
			break
		fi
	done
	if [ $FOUND != 1 ]
	then
		for i in "${projects[@]}"
		do
			if [[ ${i,,} = *$1* ]]
			then
				cd $ArmarX_DIR/$i
				break
			fi
		done
	fi
fi

unset IFS
unset projects
unset PROJECT_WITH_PREFIX
unset FOUND
