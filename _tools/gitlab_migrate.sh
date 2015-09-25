#!/bin/bash -eu

pushd `dirname $0` > /dev/null
BASEDIR=`pwd ..`
popd > /dev/null

MIRACULIX_DIR=$BASEDIR/..

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

GITLAB_PKGS="ArmarXCore ArmarXGui RobotAPI MemoryX VisionX RobotComponents RobotSkillTemplates"

for PKG_DIR in ${GITLAB_PKGS}; do
    echo "Updating git remote url for ${PKG_DIR}"
    cd $ArmarX_DIR/$PKG_DIR
    PUSH_URL=git@gitlab.com:ArmarX/${PKG_DIR}.git
    echo "New url: ${PUSH_URL}"
    git remote set-url origin ${PUSH_URL}
done

