FROM ubuntu:latest

ARG USER=ubuntu

# entrypoint for node version-switching
COPY entrypoint.sh /entrypoint.sh

# install: deps, useful utilities
RUN apt-get update \
    && apt-get install -y curl \
        nano less ripgrep \
    && rm -rf /var/lib/apt/lists/*

USER $USER

# prep for claude install
ENV PATH=~/.local/bin:$PATH
ENV CLAUDE_CONFIG_DIR=/home/$USER/.claude

# install nvm so we can match the caller's node version
ARG NVM_VERSION=v0.40.4
ENV NVM_DIR=/home/$USER/.nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash

WORKDIR /home/$USER

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["/bin/bash", "-c", "claude"]
