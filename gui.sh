#!/bin/bash

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

source $BASEDIR/config.rc
source $BASEDIR/colors.rc


$ARMARX_DIR/Gui/build/bin/ArmarXGuiRun --ArmarX.GuiConfigFile=_defaultGui.armarxgui
