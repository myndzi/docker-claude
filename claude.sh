#!/bin/bash

set -euo pipefail

HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DEV_HOME="/home/ubuntu"

PROJECT_NAME="$( basename "$PWD" )"

docker run --rm \
    -v "$HERE/.claude:$DEV_HOME/.claude" \
    -v "$PWD:$DEV_HOME/$PROJECT_NAME" \
    -w "$DEV_HOME/$PROJECT_NAME" \
    -it docker-claude "$@"

tput reset 2>/dev/null || reset