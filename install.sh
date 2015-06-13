#!/bin/bash -eu

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

cd $ARMARX_DIR
repo init -u https://i61wiki.itec.uka.de/git/armarx.git

cd $ARMARX_DIR
repo sync

cd $ARMARX_DIR
repo start master --all
