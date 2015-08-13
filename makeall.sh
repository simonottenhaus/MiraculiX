#!/bin/bash

for PKG_DIR in $PKG_NAMES; do
	echo -e "${BWhi}============================${RCol}"
	echo -e "${BWhi}Building ${PKG_DIR} ${RCol}"
	echo -e "${BWhi}============================${RCol}"
	cd $ARMARX_DIR/$PKG_DIR/build
	
	cmake .. 2> >(while read line; do echo -e "\e[01;31m$line\e[0m" >&2; done)
	if [ $? -ne 0 ]; then
		echo -e "${BRed}============================${RCol}"
		echo -e "${BRed}${PKG_DIR} CMAKE FAILED ${RCol}"
		echo -e "${BRed}============================${RCol}"
		exit 1
	fi
	
	nice make $p
	if [ $? -ne 0 ]; then
		echo -e "${BRed}============================${RCol}"
		echo -e "${BRed}${PKG_DIR} BUILD FAILED ${RCol}"
		echo -e "${BRed}============================${RCol}"
		exit 1
	fi
	cmake ..
done


