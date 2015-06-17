#!/bin/bash -u
pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

$ARMARX_DIR/Core/build/bin/ice-stop.sh
$ARMARX_DIR/MemoryX/build/bin/mongod.sh stop
