# Custom segments for powerlevel10k
#
# Icon names:
# ~/.oh-my-zsh/custom/themes/powerlevel10k/internal/icons.zsh

prompt_my_git_message() {
    local IS_GIT_DIR=$(git rev-parse --is-inside-work-tree 2>/dev/null)
    local GIT_MSG=$(git log -1 --format=%s 2>/dev/null)
    p10k segment -i VCS_GIT_ICON -r -f 220 -c "$IS_GIT_DIR" -t "$GIT_MSG"
}
