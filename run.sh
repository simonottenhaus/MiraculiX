#!/bin/bash -u

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

if [ -d "$ArmarX_DIR/ArmarXCore" ]; then
	$ArmarX_DIR/ArmarXCore/build/bin/ice-start.sh
else
	$ArmarX_DIR/Core/build/bin/ice-start.sh
fi

$ArmarX_DIR/MemoryX/build/bin/mongod.sh start
#$ArmarX_DIR/MemoryX/build/bin/mongod.sh repair
