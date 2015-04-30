#!/bin/bash -eux

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

cd $ARMARX_DIR
repo init -u /tmp/armarx

cd $ARMARX_DIR
repo sync

cd $ARMARX_DIR
repo start master --all
