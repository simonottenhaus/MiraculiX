#!/bin/bash

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

p="-j4"
if [[ $# -gt 0 ]]; then
    p=$*
fi

for PKG_DIR in $AX_PACKAGES; do
	echo -e "${BPur}============================${RCol}"
	echo -e "${Yel}Building ${PKG_DIR} ${RCol}"
	echo -e "${BPur}============================${RCol}"
	cd $ArmarX_DIR/$PKG_DIR/build
	
	make $p
	if [ $? -ne 0 ]; then
		echo -e "${BRed}============================${RCol}"
		echo -e "${BRed}${PKG_DIR} BUILD FAILED ${RCol}"
		echo -e "${BRed}============================${RCol}"
		exit 1
	fi
done


