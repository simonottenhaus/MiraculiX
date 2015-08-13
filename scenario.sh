#!/bin/bash

IFS=" " read -a projects <<< "$AX_PROJECTS"

AX_SCENARIO_FOUND=false

for i in "${projects[@]}"
do
	AX_SCENARIOS_DIR="$ArmarX_DIR/$i/scenarios"
	AX_SCENARIO_PATH="$AX_SCENARIOS_DIR/$1"
	for DIR in $AX_SCENARIOS_DIR/*/ 
	do
		DIR_LC=${DIR,,}
		if [ "${DIR_LC:0:${#AX_SCENARIO_PATH}}" = ${AX_SCENARIO_PATH,,} ] 
		then
			cd "$DIR"
			AX_SCENARIO_FOUND=true;
			break
		fi
	done
	if [ "$AX_SCENARIO_FOUND" = true ] 
	then 
		break 
	fi
done

unset IFS
unset projects
unset DIR
unset DIR_LC
unset AX_SCENARIO_FOUND
unset AX_SCENARIOS_DIR
unset AX_SCENARIO_PATH
