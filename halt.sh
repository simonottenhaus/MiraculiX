#!/bin/bash -u
pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

if type armarx > /dev/null; then
	armarx stop
	armarx killIce
elif [ -d "$ArmarX_DIR/ArmarXCore" ]; then
	$ArmarX_DIR/ArmarXCore/build/bin/ice-stop.sh
else
	$ArmarX_DIR/Core/build/bin/ice-stop.sh
fi

$ArmarX_DIR/MemoryX/build/bin/mongod.sh stop
