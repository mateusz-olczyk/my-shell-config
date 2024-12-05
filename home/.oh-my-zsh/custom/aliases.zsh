# system management
alias system-update="sudo apt update -y && sudo apt upgrade -y"
alias system-info="uname --all && lsb_release --all"
alias ssh-info="systemctl status ssh.service"

# batcat
alias bat="batcat"
alias batp="bat --paging=never"

# git
alias gshf="git show --name-status --pretty=''"
alias gshw="git show --word-diff"
alias glo10="git log --oneline --decorate --max-count=10"
alias gfom="git fetch origin master:master"
alias glg1="git log -1 --stat"
alias gcpn="git cherry-pick --no-commit"
alias grevn="git revert --no-commit"
alias gstum="git stash push --include-untracked --message"
alias gsha="git rev-parse HEAD"

# rg
alias rgu="rg -u"
alias rg-py="rgu -g '*.py'"
alias rg-cpp="rgu -g '*.cpp' -g '*.c' -g '*.hpp' -g '*.h'"
alias rg-bp="rgu -g '*.bp'"
alias rg-cmake="rgu -g '*.cmake' -g '*CMakeLists.txt'"
alias rg-build="rgu -g '*.build'"

# terminal
alias c="clear"
# alias e="$EDITOR"
# alias p="$PAGER"
alias omzr="omz reload"
alias omzi="omz plugin info"

# filesystem
alias l="eza --long --all --group-directories-first"
alias file-size="du -sh"
alias trash="gio trash"

# interaction with gnome
alias explorer="xdg-open"
alias xclip-paste="xclip -out -selection clipboard -display :1"

# VS Code
alias vscode-kill-servers="ps aux | grep .vscode-server | awk '{print $2}' | xargs kill"

# Force IPython to use python version under "python" command.
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# Midnight commander.
alias mc="command mc --nosubshell"

# Show weather forecast.
alias weather="curl 'wttr.in/Cracow,Poland?lang=pl'"
