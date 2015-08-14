#!/bin/bash -u

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

$ARMARX_DIR/Core/build/bin/ice-start.sh
$ARMARX_DIR/MemoryX/build/bin/mongod.sh start
#$ARMARX_DIR/MemoryX/build/bin/mongod.sh repair
