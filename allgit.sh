#!/bin/bash

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

for PKG_DIR in $PKG_NAMES; do
	echo -e "${BWhi}${PKG_DIR}${RCol}"
	cd $ARMARX_DIR/$PKG_DIR/
	eval "git $@"
done

