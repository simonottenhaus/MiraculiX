#!/bin/bash

pushd `dirname $0` > /dev/null
MIRACULIX_DIR=`pwd`
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

echo -e "${BPur}============================${RCol}"
echo -e "${Yel}Running makeall in screen session${RCol}"
echo -e "${BPur}============================${RCol}"

screen -d -m $MIRACULIX_DIR/teemake.sh
