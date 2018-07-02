#!/bin/bash

IFS=" " read -a projects <<< "$AX_PACKAGES"

pushd $ArmarX_DIR > /dev/null

for i in "${projects[@]}"
do
    echo -e "\e[35m### \e[33m$i \e[35m###\e[0m"
    pushd $i > /dev/null
	
    cd build
    cmake -N -L .. | grep -i simox_dir
   
    popd > /dev/null
done

popd > /dev/null
