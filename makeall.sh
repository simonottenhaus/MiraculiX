#!/bin/bash -eu
BASEDIR=$(dirname $0)

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

cd $ARMARX_DIR

for PKG_DIR in $PKG_NAMES; do
	echo -e "${BWhi}============================${RCol}"
	echo -e "${BWhi}Building ${PKG_DIR} ${RCol}"
	echo -e "${BWhi}============================${RCol}"
	cd $PKG_DIR/build
	
	cmake ..
	if [ $? -ne 0 ]; then
		echo -e "${BRed}============================${RCol}"
		echo -e "${BRed}${PKG_DIR} CMAKE FAILED ${RCol}"
		echo -e "${BRed}============================${RCol}"
		exit 1
	fi
	
	make -j4
	if [ $? -ne 0 ]; then
		echo -e "${BRed}============================${RCol}"
		echo -e "${BRed}${PKG_DIR} BUILD FAILED ${RCol}"
		echo -e "${BRed}============================${RCol}"
		exit 1
	fi
    cd -
done


