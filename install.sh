#!/usr/bin/bash

set -o errexit -o pipefail -o nounset
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )



### APT PACKAGES ###

if [[ $(whoami) == "root" ]]; then
    sudo() { "$@"; }
fi

sudo apt update

PACKAGES=(
    bat:batcat
    tmux
    zsh
)

for PACKAGE_DEF in ${PACKAGES[@]}; do
    PACKAGE_NAME=${PACKAGE_DEF/:*/}
    APP_NAME=${PACKAGE_DEF/*:/}

    if ! which $APP_NAME >/dev/null; then
        apt install -y $PACKAGE_NAME
    fi
done
