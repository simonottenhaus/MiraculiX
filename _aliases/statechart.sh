#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"

AX_STATECHART_FOUND=0
AX_INFIX_MATCH=0

for i in "${projects[@]}"
do
	AX_STATECHARTS_DIR="$ArmarX_DIR/$i/source/$i/statecharts"
	AX_STATECHART_PATH="$AX_STATECHARTS_DIR/$1"
	for DIR in $AX_STATECHARTS_DIR/*/
	do
		DIR_BASE_LC=`basename ${DIR,,}`
		if [[ "$DIR_BASE_LC" = ${1,,}* ]] 
		then
			cd "$DIR"
			AX_STATECHART_FOUND=1;
			break
		fi
		if [ $AX_INFIX_MATCH = 0 ] && [[ "$DIR_BASE_LC/" = *${1,,}* ]] 
		then
			AX_INFIX_MATCH="$DIR"
			#echo "$AX_INFIX_MATCH"
		fi
	done
	if [ $AX_STATECHART_FOUND = 1 ] 
	then 
		break 
	fi
done

if [ $AX_INFIX_MATCH != 0 ] && [ $AX_STATECHART_FOUND = 0 ]
then
	cd "$AX_INFIX_MATCH"
fi

unset IFS
unset projects
unset DIR
unset DIR_BASE_LC
unset AX_STATECHART_FOUND
unset AX_STATECHARTS_DIR
unset AX_STATECHART_PATH
unset AX_INFIX_MATCH
