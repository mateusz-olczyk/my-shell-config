# Append directory to PATH variable if not included yet.
path-append() {
    local NEW_ELEMENT=$(realpath "$1")
    if [ -d "$NEW_ELEMENT" ] && [[ ! "$PATH" =~ (^|:)"$NEW_ELEMENT"(:|$) ]]; then
        export PATH="$NEW_ELEMENT:$PATH"
    fi
}
