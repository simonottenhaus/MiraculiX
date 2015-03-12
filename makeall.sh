#!/bin/bash -eu
BASEDIR=$(dirname $0)

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

cd $ARMARX_DIR

p="-j4"
if [[ $# -gt 0 ]]; then
    p=$*
fi

for PKG_DIR in $PKG_NAMES; do
	echo -e "${BWhi}============================${RCol}"
	echo -e "${BWhi}Building ${PKG_DIR} ${RCol}"
	echo -e "${BWhi}============================${RCol}"

	cd $PKG_DIR/build
	cmake ..
	make $p
    cd -
done


