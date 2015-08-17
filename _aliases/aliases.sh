echo "You're using Valerij-enabled extensions of MiraculiX"

#export ArmarX_DIR="/home/SMBAD/wittenbe/home/repos/armarx"
#export AX_PROJECTS="ArmarXCore ArmarXGui RobotAPI MemoryX VisionX ArmarXSimulation Spoac SpeechX RobotComponents RobotSkillTemplates Armar3 YouBotTutorial"

alias rl="source ~/.bashrc"
alias geanyclear="rm ~/.config/geany/geany_socket_*"
alias sa="./startScenario.sh -w"
alias so="./stopScenario.sh && sleep 2 && ./stopScenario.sh 9"
alias re="so;sa"
alias start="$MIRACULIX_DIR/run.sh"
alias stop="$MIRACULIX_DIR/halt.sh"
alias run="start"
alias halt="stop"
alias gui="$ArmarX_DIR/ArmarXGui/build/bin/ArmarXGuiRun --ArmarX.GuiConfigFile=_defaultGui.armarxgui"
alias guikill="killall -9 ArmarXGuiRun"
alias cmdall="$MIRACULIX_ALIASES_DIR//cmdall.sh"
alias gitall="cmdall git"
#alias makeall="cmdall \"cd build;make\""
alias delete_and_remake_all="cmdall \"rm -rf build;mkdir build;cd build;cmake ..\";makeall;makeall"
alias memimport="$ArmarX_DIR/MemoryX/build/bin/mongoimport.sh $ArmarX_DIR/Armar3/data/Armar3/dbexport/memdb"
alias memexport="$ArmarX_DIR/MemoryX/build/bin/mongoexport.sh memdb $ArmarX_DIR/Armar3/data/Armar3/dbexport/memdb"

#miraculix integration
alias status="gitall status -b -s"
alias clean="cmdall \"cd build;rm -rf bin;rm -rf lib\""
alias fullclean="cmdall \"cd build;rm -rf bin;rm -rf lib;rm -rf source\""
alias install="$MIRACULIX_DIR/install.sh"
alias makeall="$MIRACULIX_DIR/makeall.sh"
alias fastmakeall="$MIRACULIX_DIR/fastmakeall.sh"

alias qtcreator="qtcreator &"

#remove all local changes to fix "Your local changes to the following files would be overwritten by merge"
alias git_stash_and_drop="git stash save --keep-index;git stash drop"
#remove all local changes and reset to head
alias git_reset_clean="git reset --hard; git clean -fd"

alias inp="$MIRACULIX_ALIASES_DIR//inproject.sh"
alias mk="inp \"cd build;make\""
alias cmk="inp \"cd build;cmake ..\""
alias sc=". $MIRACULIX_ALIASES_DIR/scenario.sh"
alias p=". $MIRACULIX_ALIASES_DIR/project.sh"

alias untargz="tar -zxvf"

alias armarx_tests_disable="cmdall \"cd build;cmake -DARMARX_BUILD_TESTS=OFF ..\""
alias armarx_tests_enable="cmdall \"cd build;cmake -DARMARX_BUILD_TESTS=ON ..\""

alias armarx_versioncheck_disable="cmdall \"cd build; cmake -DARMARX_ENABLE_DEPENDENCY_VERSION_CHECK=OFF ..\""
alias armarx_versioncheck_enable="cmdall \"cd build; cmake -DARMARX_ENABLE_DEPENDENCY_VERSION_CHECK=ON ..\""

source $MIRACULIX_ALIASES_DIR/addAutoCompletion.sh

