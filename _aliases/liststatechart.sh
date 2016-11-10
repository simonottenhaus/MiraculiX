#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"


for i in "${projects[@]}"
do
	AX_STATECHARTS_DIR="$ArmarX_DIR/$i/source/$i/statecharts"
	if [ -d $AX_STATECHARTS_DIR ]
	then
		for DIR in $AX_STATECHARTS_DIR/*/
		do
			DIR_BASE_LC=`basename ${DIR,,}`
			if [[ "$DIR_BASE_LC/" = *${1,,}* ]] 
			then
				echo "$i/statecharts/`basename ${DIR}`"
			fi
		done
	fi
done

unset IFS
unset projects
unset DIR
unset DIR_BASE_LC
unset AX_STATECHARTS_DIR
