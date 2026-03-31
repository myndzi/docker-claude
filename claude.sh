#!/bin/bash

set -euo pipefail

HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DEV_HOME="/home/ubuntu"

PROJECT_NAME="$( basename "$PWD" )"

if [[ "$#" -eq 0 ]]; then
    # capture node version so we use the same version inside the container
    ARGS=("$(node --version)")
else
    ARGS=("--" "$@")
fi

docker run --rm \
    -v "$HERE/.local:$DEV_HOME/.local" \
    -v "$HERE/.claude:$DEV_HOME/.claude" \
    -v "$HERE/.nvm-versions:$DEV_HOME/.nvm/versions" \
    -v "$PWD:$DEV_HOME/$PROJECT_NAME" \
    -w "$DEV_HOME/$PROJECT_NAME" \
    -it docker-claude "${ARGS[@]}"
