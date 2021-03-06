#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"

AX_SCENARIO_FOUND=0
AX_INFIX_MATCH=0

for i in "${projects[@]}"
do
	AX_SCENARIOS_DIR="$ArmarX_DIR/$i/scenarios"
	for DIR in $AX_SCENARIOS_DIR/*/ $AX_SCENARIOS_DIR/test/*/ $AX_SCENARIOS_DIR/tests/*/ 
	do
		DIR_BASE_LC=`basename ${DIR,,}`
		if [[ "$DIR_BASE_LC" = ${1,,}* ]] 
		then
			cd "$DIR"
			AX_SCENARIO_FOUND=1;
			break
		fi
		if [ $AX_INFIX_MATCH = 0 ] && [[ "$DIR_BASE_LC/" = *${1,,}* ]] 
		then
			AX_INFIX_MATCH="$DIR"
			#echo "$AX_INFIX_MATCH"
		fi
	done
	if [ $AX_SCENARIO_FOUND = 1 ] 
	then 
		break 
	fi
done

if [ $AX_INFIX_MATCH != 0 ] && [ $AX_SCENARIO_FOUND = 0 ]
then
	cd "$AX_INFIX_MATCH"
fi

unset IFS
unset projects
unset DIR
unset DIR_BASE_LC
unset AX_SCENARIO_FOUND
unset AX_SCENARIOS_DIR
unset AX_INFIX_MATCH
