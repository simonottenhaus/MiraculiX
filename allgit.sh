#!/bin/bash

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

for PKG_DIR in $AX_PACKAGES; do
	echo -e "${BPur}${PKG_DIR}${RCol}"
	cd $ArmarX_DIR/$PKG_DIR/
	eval "git $@"
done

