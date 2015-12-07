#!/bin/bash
#this script will automatically switch the gurobi license depending on which PC you are on (useful for lab PCs)

pushd $KIT_LU_DIR/gurobi >/dev/null

GRB_DESIRED_NAME=`hostname`_gurobi.lic
if [ -e "$GRB_DESIRED_NAME" ]
then
	GRB_EXISTING_NAME=`readlink gurobi.lic`
	if [ "$GRB_DESIRED_NAME" != "$GRB_EXISTING_NAME" ]
	then
		echo -e "Switching gurobi license from '$GRB_EXISTING_NAME' to '$GRB_DESIRED_NAME'"
		rm gurobi.lic 2>/dev/null
		ln -s $GRB_DESIRED_NAME gurobi.lic
	fi
	#echo "Using '$GRB_DESIRED_NAME' gurobi license"
else
	echo -e "\e[31mWarning\e[39m: No gurobi licence file for host '\e[39m"`hostname`"' available, get it at\n    http://user.gurobi.com/download/licenses/free-academic\nand move it similar to the following:\n    mv $HOME/gurobi.lic $KIT_LU_DIR/gurobi/$GRB_DESIRED_NAME"
fi
popd >/dev/null

unset GRB_DESIRED_NAME
unset GRB_EXISTING_NAME
