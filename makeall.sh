#!/bin/bash

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

p="-j4"
if [[ $# -gt 0 ]]; then
    p=$*
fi

for PKG_DIR in $PKG_NAMES; do
	echo -e "${BWhi}============================${RCol}"
	echo -e "${BWhi}Building ${PKG_DIR} ${RCol}"
	echo -e "${BWhi}============================${RCol}"
	cd $ARMARX_DIR/$PKG_DIR/build
	
	cmake ..
	if [ $? -ne 0 ]; then
		echo -e "${BRed}============================${RCol}"
		echo -e "${BRed}${PKG_DIR} CMAKE FAILED ${RCol}"
		echo -e "${BRed}============================${RCol}"
		exit 1
	fi
	
	make $p
	if [ $? -ne 0 ]; then
		echo -e "${BRed}============================${RCol}"
		echo -e "${BRed}${PKG_DIR} BUILD FAILED ${RCol}"
		echo -e "${BRed}============================${RCol}"
		exit 1
	fi
	cmake ..
done


