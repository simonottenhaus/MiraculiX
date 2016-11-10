echo "You're using Valerij-enabled extensions of MiraculiX"

#export ArmarX_DIR="/home/SMBAD/wittenbe/home/repos/armarx"
#export AX_PROJECTS="ArmarXCore ArmarXGui RobotAPI MemoryX VisionX ArmarXSimulation Spoac SpeechX RobotComponents RobotSkillTemplates Armar3 YouBotTutorial"

alias gg="git gui"
alias rl="source ~/.bashrc"
alias geanyclear="rm ~/.config/geany/geany_socket_*"
alias sa="$MIRACULIX_ALIASES_DIR/startscenario.sh"
#alias so="./stopScenario.sh && sleep 2 && ./stopScenario.sh 9"
alias so="$MIRACULIX_ALIASES_DIR/stopscenario.sh"
alias re="so;sa"
alias start="$MIRACULIX_DIR/run.sh"
alias stop="$MIRACULIX_DIR/halt.sh"
alias run="start"
alias halt="stop"
alias gui="$ArmarX_DIR/ArmarXGui/build/bin/ArmarXGuiRun"
alias guikill="killall -9 ArmarXGuiRun"
alias cmdall="$MIRACULIX_ALIASES_DIR/cmdall.sh"
alias gitall="cmdall git"
alias allgit="gitall"
#alias makeall="cmdall \"cd build;make\""
alias delete_and_remake_all="cmdall \"rm -rf build;mkdir build;cd build;cmake ..\";makeall;makeall"
alias memimport="$ArmarX_DIR/MemoryX/build/bin/mongoimport.sh $ArmarX_DIR/ArmarXDB/data/ArmarXDB/dbexport/memdb"
alias memexport="$ArmarX_DIR/MemoryX/build/bin/mongoexport.sh memdb $ArmarX_DIR/ArmarXDB/data/ArmarXDB/dbexport/memdb"
alias memrepair="$ArmarX_DIR/MemoryX/build/bin/mongod.sh repair"

#miraculix integration
alias status="$MIRACULIX_DIR/status.sh"
alias clean="$MIRACULIX_DIR/clean.sh"
alias fullclean="$MIRACULIX_DIR/fullclean.sh"
alias makeall="$MIRACULIX_DIR/makeall.sh"
alias fastmakeall="$MIRACULIX_DIR/fastmakeall.sh"


#remove all local changes to fix "Your local changes to the following files would be overwritten by merge"
alias git_stash_and_drop="git stash save --keep-index;git stash drop"
#remove all local changes and reset to head
alias git_reset_clean="git reset --hard HEAD^; git clean -fd"

alias inp="$MIRACULIX_ALIASES_DIR/inproject.sh"
alias mk="inp \"cd build;make\""
alias cmk="inp \"cd build;$MIRACULIX_ALIASES_DIR/prettycmake.sh\""
alias sc=". $MIRACULIX_ALIASES_DIR/scenario.sh"
alias lsc=". $MIRACULIX_ALIASES_DIR/listscenario.sh"
alias st=". $MIRACULIX_ALIASES_DIR/statechart.sh"
alias lst=". $MIRACULIX_ALIASES_DIR/liststatechart.sh"
alias p=". $MIRACULIX_ALIASES_DIR/project.sh '' ''"
alias pb=". $MIRACULIX_ALIASES_DIR/project.sh '' 'cd build'"
alias pm=". $MIRACULIX_ALIASES_DIR/project.sh 1 'mk'"

alias untargz="tar -zxvf"

alias armarx_tests_disable="cmdall \"cd build;cmake -DARMARX_BUILD_TESTS=OFF ..\""
alias armarx_tests_enable="cmdall \"cd build;cmake -DARMARX_BUILD_TESTS=ON ..\""

alias armarx_versioncheck_disable="cmdall \"cd build; cmake -DARMARX_ENABLE_DEPENDENCY_VERSION_CHECK=OFF ..\""
alias armarx_versioncheck_enable="cmdall \"cd build; cmake -DARMARX_ENABLE_DEPENDENCY_VERSION_CHECK=ON ..\""

alias newclass="$MIRACULIX_DIR/_templates/newclass.pl"
alias feierabend=". $MIRACULIX_DIR/_tools/feierabend.sh"

if [ ! -f "$MIRACULIX_DIR/_aliases.user.sh" ]; then
    echo -e "${BGre}Miraculix: Creating default user config in $MIRACULIX_DIR/_aliases.user.sh${RCol}"
    printf "# here, you can (re)define aliases as you see fit" > $MIRACULIX_DIR/_aliases.user.sh
fi
source $MIRACULIX_DIR/_aliases.user.sh

source $MIRACULIX_ALIASES_DIR/addAutoCompletion.sh

