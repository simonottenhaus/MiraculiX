#!/bin/bash

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

p=$MAKEFLAGS
if [[ $# -gt 0 ]]; then
    p=$*
fi

START_TIME=$(date +%s.%N)

for PKG_DIR in $AX_PACKAGES; do
	echo -e "${BPur}============================${RCol}"
	echo -e "${Yel}Building ${PKG_DIR} ${RCol}"
	echo -e "${BPur}============================${RCol}"
	cd $ArmarX_DIR/$PKG_DIR/build
	
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

END_TIME=$(date +%s.%N)
DIFF=$(echo "scale=1; ($END_TIME - $START_TIME) / 1" | bc)
echo -e "${BGre}Build completed in ${DIFF}s ${RCol}"


