#!/usr/bin/bash

set -o errexit -o pipefail -o nounset
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
OMZ_CUSTOM_DIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
P10K_DIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ZSHRC_PATH=$HOME/.zshrc

if [ $(whoami) = "root" ]; then
    sudo() { "$@"; }
fi

sudo apt update

APT_PACKAGES=(
    bat:batcat
    git
    sed
    tmux
    wget
    zsh
)

for PACKAGE_DEF in ${APT_PACKAGES[@]}; do
    PACKAGE_NAME=${PACKAGE_DEF/:*/}
    APP_NAME=${PACKAGE_DEF/*:/}

    if ! which $APP_NAME >/dev/null; then
        apt install -y $PACKAGE_NAME
    fi
done

if ! [ -d $OMZ_CUSTOM_DIR ]; then
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended
fi

if ! [ -d $P10K_DIR ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $P10K_DIR
fi

sed -i 's|^ZSH_THEME=".*"$|ZSH_THEME="powerlevel10k/powerlevel10k"|' $ZSHRC_PATH
