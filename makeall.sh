#!/bin/bash

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

p="-j8"
if [[ $# -gt 0 ]]; then
    p=$*
fi

for PKG_DIR in $PKG_NAMES; do
	echo -e "${BWhi}============================${RCol}"
	echo -e "${BWhi}Building ${PKG_DIR} ${RCol}"
	echo -e "${BWhi}============================${RCol}"
	cd $ARMARX_DIR/$PKG_DIR/build
	
        echo -e '\033]2;'cmake $PKG_DIR running...'\007'

	cmake .. 2> >(while read line; do echo -e "\e[01;31m$line\e[0m" >&2; done)
	if [ $? -ne 0 ]; then
		echo -e "${BRed}============================${RCol}"
		echo -e "${BRed}${PKG_DIR} CMAKE FAILED ${RCol}"
		echo -e "${BRed}============================${RCol}"
		exit 1
	fi
	
        echo -e '\033]2;'make $p $PKG_DIR running...'\007'

	nice ionice -c 2 -n 7  make $p
	if [ $? -ne 0 ]; then
		echo -e "${BRed}============================${RCol}"
		echo -e "${BRed}${PKG_DIR} BUILD FAILED ${RCol}"
		echo -e "${BRed}============================${RCol}"
		exit 1
	fi
	cmake ..
done


