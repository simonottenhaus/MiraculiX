MIRACULIX_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $MIRACULIX_DIR/config.rc
source $MIRACULIX_DIR/colors.rc

export AX_PACKAGES=$AX_PACKAGES
export ArmarX_DIR=$ArmarX_DIR
export MAKEFLAGS=$MAKEFLAGS
export MIRACULIX_ALIASES_DIR=${MIRACULIX_DIR}/_aliases

source $MIRACULIX_ALIASES_DIR/aliases.sh

