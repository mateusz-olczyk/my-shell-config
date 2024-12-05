#!/usr/bin/bash

set -o errexit -o pipefail -o nounset
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
OMZ_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
P10K_DIR="$OMZ_CUSTOM_DIR/themes/powerlevel10k"
ZSHRC_PATH="$HOME/.zshrc"
ZSH_SYNTAX_HIGHLIGHTING_DIR="$OMZ_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ $(whoami) = "root" ]; then
    sudo() { "$@"; }
fi

sudo apt update

APT_PACKAGES=(
    bat:batcat
    git
    less
    nano
    ripgrep:rg
    tmux
    wget
    zsh
)

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

if ! [ -d "$P10K_DIR" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

if ! [ -d "$ZSH_SYNTAX_HIGHLIGHTING_DIR" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_SYNTAX_HIGHLIGHTING_DIR"
fi

if ! [ -d "$TPM_DIR" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

cp -rv "$SCRIPT_DIR/home/." "$HOME"

"$TPM_DIR/bin/install_plugins"
