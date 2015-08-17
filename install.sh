#!/bin/bash -eu

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

# git-repo does not work with the git credential helper
git clone https://armarx:armarx@i61wiki.itec.uka.de/git/armarx.git  /tmp/armarx


cd $ArmarX_DIR
repo init -u /tmp/armarx

cd $ArmarX_DIR
repo sync

cd $ArmarX_DIR
repo start master --all

cd $ArmarX_DIR/.repo/manifests.git
sed -i 's$/tmp/armarx$https://i61wiki.itec.uka.de/git/armarx.git$g' config .repo_config.json
