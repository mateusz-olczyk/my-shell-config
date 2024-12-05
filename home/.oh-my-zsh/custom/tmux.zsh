# Install new tmux plugins.
tpm-install() {
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"
}

# Update currently installed tmux plugins.
tpm-update() {
    "$HOME/.tmux/plugins/tpm/bin/update_plugins" all
}

# Dump current pane content to a file.
tmux-dump() (
    DEFAULT_OUTPUT_PATH="Documents/tmux-dump.txt"
    PROMPT="Dump current pane content to the file:"
    LINES_COUNT=2000
    COMMAND="capture-pane -S -$LINES_COUNT; save-buffer '%1'; display-message 'Content saved to %1'"
    tmux command-prompt -I "$DEFAULT_OUTPUT_PATH" -p "$PROMPT" "$COMMAND"
)
