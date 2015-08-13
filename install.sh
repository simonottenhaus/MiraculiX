#!/bin/bash -eu

# git-repo does not work with the git credential helper
git clone https://armarx:armarx@i61wiki.itec.uka.de/git/armarx.git  /tmp/armarx


cd $ARMARX_DIR
repo init -u /tmp/armarx

cd $ARMARX_DIR
repo sync

cd $ARMARX_DIR
repo start master --all

cd $ARMARX_DIR/.repo/manifests.git
sed -i 's$/tmp/armarx$https://i61wiki.itec.uka.de/git/armarx.git$g' config .repo_config.json
