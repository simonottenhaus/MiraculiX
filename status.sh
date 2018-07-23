#!/bin/bash

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

for PKG_DIR in $AX_PACKAGES; do
	cd $ArmarX_DIR/$PKG_DIR/
	echo -e "${Yel}${PKG_DIR}${RCol} `git log -1 --format=%cr`"
	git status -b -s
done

