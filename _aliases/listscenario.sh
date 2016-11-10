#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"


for i in "${projects[@]}"
do
	AX_SCENARIOS_DIR="$ArmarX_DIR/$i/scenarios"
	for DIR in $AX_SCENARIOS_DIR/*/ $AX_SCENARIOS_DIR/test/*/ $AX_SCENARIOS_DIR/tests/*/ 
	do
		DIR_BASE_LC=`basename ${DIR,,}`
		if [[ "$DIR_BASE_LC/" = *${1,,}* ]] 
		then
			echo "$DIR"
		fi
	done
done

unset IFS
unset projects
unset DIR
unset DIR_BASE_LC
unset AX_SCENARIOS_DIR
