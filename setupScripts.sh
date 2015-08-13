export PKG_NAMES="ArmarXCore ArmarXGui RobotAPI MemoryX VisionX ArmarXSimulation RobotComponents Spoac SpeechX RobotSkillTemplates Armar3 Armar4"
export ArmarX_DIR=/home/SMBAD/wittenbe/home/repos/armarx
export AX_PROJECTS=${PKG_NAMES}
export ARMARX_DIR=${ArmarX_DIR}
export BASEDIR=${ArmarX_DIR}/MiraculiX
export LOG_FILE=${ArmarX_DIR}/MiraculiX/.miraculix.log

#uses all cores (incl virtual), but can make the system inresponsive
#export MAKEFLAGS='-j$(nproc)'

#uses all cores - 1, almost as fast as the above, but system stays responsive
#NOTE: the below doesn't work as expected; forgot why
#export MAKEFLAGS='-j$(expr $(nproc) - 1)'
export MAKEFLAGS='-j7'

source ${ArmarX_DIR}/MiraculiX/aliases.sh
