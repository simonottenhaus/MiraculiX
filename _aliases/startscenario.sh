#!/bin/bash

pushd `dirname $0` > /dev/null
MIRACULIX_DIR="$(dirname "$(pwd)")"
popd > /dev/null

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

if [ ! -e *.scx ]; then
	echo -e "${BRed}==================================${RCol}"
	echo -e "${BRed}Folder does not contain .scx file ${RCol}"
	echo -e "${BRed}==================================${RCol}"
	exit 1
fi

pattern="*.scx"
files=( $pattern )
scxfile="${files[0]}"
scxescaped=`printf '%q' "$scxfile"`

echo -e "${BGre}==================================${RCol}"
echo -e "${BGre}Starting $scxfile ${RCol}"
echo -e "${BGre}==================================${RCol}"

armarx scenario start $scxescaped

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
	echo -e "${BYel}==================================${RCol}"
	echo -e "${BYel}Stopping $scxfile ${RCol}"
	echo -e "${BYel}==================================${RCol}"
	armarx scenario stop $scxescaped
}
cat #wait forever, until ctrl+c
