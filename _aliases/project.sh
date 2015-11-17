#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"

if [ -z $3 ]
then
	cd "$ArmarX_DIR"
else
	COMMAND_TO_EXECUTE="cd $ArmarX_DIR/\$AX_PROJECT;"$2
	RETURN_CMD=""
	if [ ! -z $1 ]
	then
		COMMAND_TO_EXECUTE="pushd $ArmarX_DIR/\$AX_PROJECT > /dev/null;"$2
		RETURN_CMD="popd > /dev/null"
	fi
		
	FOUND=0
	for AX_PROJECT in "${projects[@]}"
	do
		PROJECT_WITH_PREFIX=armarx$3
		if [[ ${AX_PROJECT,,} = ${3,,}* ]] || [[ ${AX_PROJECT,,} = ${PROJECT_WITH_PREFIX,,}* ]]
		then
			COMMAND_TO_EXECUTE=eval echo $COMMAND_TO_EXECUTE > /dev/null
			eval $COMMAND_TO_EXECUTE
			eval $RETURN_CMD
			FOUND=1
			break
		fi
	done
	if [ $FOUND != 1 ]
	then
		for AX_PROJECT in "${projects[@]}"
		do
			if [[ ${AX_PROJECT,,} = *${3,,}* ]]
			then
				COMMAND_TO_EXECUTE=eval echo $COMMAND_TO_EXECUTE > /dev/null
				eval $COMMAND_TO_EXECUTE
				eval $RETURN_CMD
				break
			fi
		done
	fi
fi

unset IFS
unset projects
unset PROJECT_WITH_PREFIX
unset FOUND
unset COMMAND_TO_EXECUTE
