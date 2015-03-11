#!/bin/bash -eu
BASEDIR=$(dirname $0)

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

cd $ARMARX_DIR

for PKG_DIR in $PKG_NAMES; do
	echo -e "${BWhi}clean ${PKG_DIR}${RCol}"
    cd $PKG_DIR
	rm -rf build/bin build/lib
    cd - 
done

