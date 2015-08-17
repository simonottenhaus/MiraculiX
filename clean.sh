#!/bin/bash -eu

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

for PKG_DIR in $AX_PACKAGES; do
	echo -e "${BWhi}clean ${PKG_DIR}${RCol}"
	rm -rf $ArmarX_DIR/$PKG_DIR/build/bin $ArmarX_DIR/$PKG_DIR/build/lib
done

