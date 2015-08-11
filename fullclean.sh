#!/bin/bash 

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

for PKG_DIR in $PKG_NAMES; do
	echo -e "${BWhi}clean ${PKG_DIR}${RCol}"
	rm -rf $ARMARX_DIR/$PKG_DIR/build/bin
	rm -rf $ARMARX_DIR/$PKG_DIR/build/lib
	rm -rf $ARMARX_DIR/$PKG_DIR/build/source
done

