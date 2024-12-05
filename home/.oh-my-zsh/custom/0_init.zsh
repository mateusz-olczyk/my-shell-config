### CONFIG VARIABLES ###########################################################
GLOBALIAS_FILTER_VALUES=( mc grep ls l )
export PAGER="less"
export LESS="-FXRI --mouse --wheel-lines=5"
# export RIPGREP_CONFIG_PATH="$HOME/.rgrc"
if [[ "$TERM_PROGRAM" == "vscode" ]]; then export EDITOR="code --wait"; else export EDITOR="nano"; fi
export VISUAL="$EDITOR"
GPG_TTY="$TTY"
export USE_CCACHE=1



### UTULITY FUNCTIONS ##########################################################

# Force early exit on failure, useful for defining functions.
alias __zsh_custom_set_early_failure='set -o errexit -o pipefail -o nounset'
