#!/bin/bash

# kill everything related to armarx and log out
echo -e "${Yel}Killing all ArmarX components${RCol}"
for PROCESS_ID_PATH in /proc/*
do
	PROCESS_ID=`basename $PROCESS_ID_PATH`
	PROCESS_PATH=`readlink /proc/$PROCESS_ID/exe`
	if [[ -e "/proc/$PROCESS_ID/exe" ]] && [[ "${PROCESS_PATH:0:${#ArmarX_DIR}}" = $ArmarX_DIR ]]
	then
		echo -e "Killing '"`basename $PROCESS_PATH`"'"
		kill -9 $PROCESS_ID 2>/dev/null
	fi
done

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
