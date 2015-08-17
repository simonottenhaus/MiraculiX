#!/bin/bash -eu

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

for PKG_DIR in $AX_PACKAGES; do
	cd $ArmarX_DIR/$PKG_DIR
    TIME=$(date -u +"%F %T")
    GIT_VERSION=$(git describe --always --dirty --long --tags)
    GIT_HEAD=$(git rev-parse HEAD)
	echo -e "${BWhi}${PKG_DIR}${RCol} - ${GIT_VERSION}"
	git pull
    GIT_HEAD_NEW=$(git rev-parse HEAD)
    if [ "$GIT_HEAD" != "$GIT_HEAD_NEW" ]; then
		echo "${TIME} - ${PKG_DIR}: updating from ${GIT_VERSION} ${GIT_HEAD}  -> ${GIT_HEAD_NEW}" >> $LOG_FILE
	else
		echo "${TIME} - ${PKG_DIR}: no remote changes" >> $LOG_FILE
	fi
done

