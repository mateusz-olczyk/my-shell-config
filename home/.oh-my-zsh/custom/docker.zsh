# Prune everything.
alias docker-prune="docker system prune --all --volumes"

# List docker containers.
alias dockers="docker ps -a"

# Attach terminal to an already running docker container.
docker-attach() (
    __zsh_custom_set_early_failure
    docker exec -it -e TERM=xterm-256color "$1" /bin/bash
)
