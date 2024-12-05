# git
alias config-git="$EDITOR $HOME/.gitconfig"

# bash
alias config-bash-aliases="$EDITOR $HOME/.bash_aliases"
alias config-bashrc="$EDITOR $HOME/.bashrc"

# nano
alias config-nano="$EDITOR $HOME/.nanorc"

# tmux
alias config-tmuxrc="$EDITOR $HOME/.tmux.conf"
alias config-cd-tmux="cd $HOME/.tmux/config"
for FILE in $(ls $HOME/.tmux/config | grep "\\.conf$" ); do
    alias config-tmux-${FILE%.conf}="$EDITOR $HOME/.tmux/config/$FILE"
done

# zsh
alias config-zshrc="$EDITOR $HOME/.zshrc"
alias config-p10k="$EDITOR $HOME/.p10k.zsh"
alias config-cd-zsh="cd $ZSH_CUSTOM"
for FILE in $(ls $ZSH_CUSTOM | grep "\\.zsh$" ); do
    alias config-zsh-${FILE%.zsh}="$EDITOR $ZSH_CUSTOM/$FILE"
done

unset FILE
