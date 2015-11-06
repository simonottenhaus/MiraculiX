#!/bin/bash

# kill everything related to armarx and log out
pushd /proc >/dev/null

echo -e "${Yel}Killing all ArmarX components${RCol}"
for PROCESS_ID in `find * -maxdepth 0 | grep '[0-9]'`
do
	PROCESS_PATH=`readlink /proc/$PROCESS_ID/exe`
	if [[ "${PROCESS_PATH:0:${#ArmarX_DIR}}" = $ArmarX_DIR ]] && [[ $PROCESS_PATH != `realpath $0` ]]
	then
		echo -e "Killing '"`basename $PROCESS_PATH`"'"
		kill -9 $PROCESS_ID 2>/dev/null
	fi
done

popd >/dev/null

unset PROCESS_ID
unset PROCESS_PATH

echo -e "${Yel}Stopping ice/mongodb${RCol}"
`. $MIRACULIX_DIR/halt.sh 2>/dev/null` 2>/dev/null
echo -e "${Yel}Logging out${RCol}"
echo -e "${BPur}#########################################${RCol}"
echo -e "${BPur}#${RCol}                                       ${BPur}#${RCol}"
echo -e "${BPur}#${RCol}  ▄█▀▀║░▄█▀▄░▄█▀▄░██▀▄░░██▀▄░██║█░██▀  ${BPur}#${RCol}"
echo -e "${BPur}#${RCol}  ██║▀█░██║█░██║█░██║█░░██▀▄░▀██▀░██▀  ${BPur}#${RCol}"
echo -e "${BPur}#${RCol}  ▀███▀░▀██▀░▀██▀░███▀░░███▀░░██░░███  ${BPur}#${RCol}"
echo -e "${BPur}#${RCol}                                       ${BPur}#${RCol}"
echo -e "${BPur}#########################################${RCol}"
sleep 1
gnome-session-quit --no-prompt
