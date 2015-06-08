#!/bin/bash -eu

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc

for PKG_DIR in $PKG_NAMES; do
	cd $ARMARX_DIR/$PKG_DIR
    TIME=$(date -u +%FT%TZ)
    GIT_VERSION=$(git describe --always --dirty --long --tags)
    GIT_HEAD=$(git rev-parse HEAD)
	echo -e "${BWhi}${PKG_DIR}${RCol} - ${GIT_VERSION}"
    echo -n "${TIME} - updating ${PKG_DIR} ${GIT_VERSION} from ${GIT_HEAD} " >> $LOG_FILE
	git pull
    GIT_HEAD_NEW=$(git rev-parse HEAD)
    echo " -> ${GIT_HEAD_NEW} " >> $LOG_FILE
done

