# Location of key-value store
ZSH_CUSTOM_SETTINGS_FILE="$ZSH_CUSTOM/settings.txt"

settings-get() (
    __zsh_custom_set_early_failure

    KEY="$1"

    grep -oP --color=never "^$KEY=\K.*$" "$ZSH_CUSTOM_SETTINGS_FILE" 2> /dev/null
)

settings-set() (
    __zsh_custom_set_early_failure

    KEY="$1"
    VALUE="$2"

    if settings-get "$KEY" > /dev/null; then
        sed -i -e "s/^$KEY=.*$/$KEY=$VALUE/" "$ZSH_CUSTOM_SETTINGS_FILE"
    else
        echo "$KEY=$VALUE" >> "$ZSH_CUSTOM_SETTINGS_FILE"
    fi
)

settings-set-interactive() (
    __zsh_custom_set_early_failure

    KEY="$1"
    OLD_VALUE=$(settings-get "$KEY" || echo)
    NEW_VALUE="${2:-}"
    COLOR=cyan

    success() {
        print -P "✅ Setting %F{$COLOR}$KEY%f successfully set to %F{$COLOR}\"$NEW_VALUE\"%f."
    }

    prompt() {
        print -Pn "Set new value of %F{$COLOR}$KEY%f (current is %F{$COLOR}\"$OLD_VALUE\"%f): "
    }

    on-cancel() {
        print -P "❌ Cancelled setting %F{$COLOR}$KEY%f. Current value unchanged: %F{$COLOR}\"$OLD_VALUE\"%f."
        exit 1
    }

    trap "echo; on-cancel" SIGINT

    if [ -z "$NEW_VALUE" ]; then
        prompt
        read NEW_VALUE
    fi

    if [ -z "$NEW_VALUE" ]; then
        on-cancel
    fi

    settings-set "$KEY" "$NEW_VALUE"
    success
)
