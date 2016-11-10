#!/bin/bash

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

$MIRACULIX_DIR/makeall.sh | tee $MIRACULIX_DIR/.buildlog.txt
