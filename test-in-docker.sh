#!/usr/bin/bash

set -o errexit -o pipefail -o nounset
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

docker run \
    --interactive \
    --tty \
    --rm \
     --env TERM=xterm-256color \
    --mount type=bind,source="$SCRIPT_DIR",destination=/home/ubuntu,readonly \
    ubuntu:latest \
    /home/ubuntu/install.sh
