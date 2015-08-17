#!/bin/bash -u

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

$ArmarX_DIR/Core/build/bin/ice-start.sh
$ArmarX_DIR/MemoryX/build/bin/mongod.sh start
#$ArmarX_DIR/MemoryX/build/bin/mongod.sh repair
