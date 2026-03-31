#!/bin/bash

set -euo pipefail

if [[ "$1" = "--" ]]; then
    # when called with args: just do what was asked
    shift
    exec bash -c "$@"
fi

# otherwise: assume $1 is the node version to use, so that
# we match the dependencies installed in the project

# shellcheck disable=SC1091
. "$NVM_DIR/nvm.sh"

NODE_VERSION="$1"
shift

# ensure the desired version of node is installed
nvm use "$NODE_VERSION" || nvm install "$NODE_VERSION"

# ensure claude is installed
# we mount/cache ~/.local so that updates persist, but
# that means we don't install during docker build
if [[ ! -x ~/.local/bin/claude ]]; then
    curl -fsSL https://claude.ai/install.sh | bash
fi

claude

# clean up dirty terminal visuals after exiting claude
tput reset 2>/dev/null || reset