#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"

AX_SCENARIO_FOUND=0

for i in "${projects[@]}"
do
	AX_SCENARIOS_DIR="$ArmarX_DIR/$i/scenarios"
	AX_SCENARIO_PATH="$AX_SCENARIOS_DIR/$1"
	for DIR in $AX_SCENARIOS_DIR/*/ $AX_SCENARIOS_DIR/test/*/ $AX_SCENARIOS_DIR/tests/*/ 
	do
		DIR_BASE_LC=`basename ${DIR,,}`
		if [[ "$DIR_BASE_LC" = ${1,,}* ]] 
		then
			cd "$DIR"
			AX_SCENARIO_FOUND=1;
			break
		fi
	done
	if [ $AX_SCENARIO_FOUND = 1 ] 
	then 
		break 
	fi
done

if [ $AX_SCENARIO_FOUND = 0 ]
then
	for DIR in $AX_SCENARIOS_DIR/*/ $AX_SCENARIOS_DIR/test/*/ $AX_SCENARIOS_DIR/tests/*/ 
	do
		DIR_BASE_LC=`basename ${DIR,,}`
		if [[ "$DIR_BASE_LC" = *${1,,}* ]] 
		then
			cd "$DIR"
			break
		fi
	done
fi

unset IFS
unset projects
unset DIR
unset DIR_BASE_LC
unset AX_SCENARIO_FOUND
unset AX_SCENARIOS_DIR
unset AX_SCENARIO_PATH
