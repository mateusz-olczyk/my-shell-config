#!/usr/bin/bash

set -o errexit -o pipefail -o nounset
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
OMZ_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
P10K_DIR="$OMZ_CUSTOM_DIR/themes/powerlevel10k"
ZSHRC_PATH="$HOME/.zshrc"
ZSH_SYNTAX_HIGHLIGHTING_DIR="$OMZ_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
TPM_DIR="$HOME/.tmux/plugins/tpm"

APT_PACKAGES=(
    bat:batcat
    eza
    git
    less
    nano
    ripgrep:rg
    tmux
    wget
    zsh
)

GIT_PACKAGES=(
    "https://github.com/romkatv/powerlevel10k.git|$P10K_DIR"
    "https://github.com/zsh-users/zsh-syntax-highlighting.git|$ZSH_SYNTAX_HIGHLIGHTING_DIR"
    "https://github.com/tmux-plugins/tpm|$TPM_DIR"
)

if [ $(whoami) = "root" ]; then
    sudo() { "$@"; }
fi

sudo apt update

for PACKAGE_DEF in ${APT_PACKAGES[@]}; do
    PACKAGE_NAME=${PACKAGE_DEF/:*/}
    APP_NAME=${PACKAGE_DEF/*:/}

    if ! which $APP_NAME >/dev/null; then
        sudo apt install -y $PACKAGE_NAME
    fi
done

if ! [ -d "$OMZ_CUSTOM_DIR" ]; then
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended
fi

for GIT_PACKAGE in ${GIT_PACKAGES[@]}; do
    GIT_URL=${GIT_PACKAGE/|*/}
    GIT_TARGET_DIR=${GIT_PACKAGE/*|/}

    if ! [ -d "$GIT_TARGET_DIR" ]; then
        git clone "$GIT_URL" "$GIT_TARGET_DIR"
    fi
done

cp -rv "$SCRIPT_DIR/home/." "$HOME"

"$TPM_DIR/bin/install_plugins"
