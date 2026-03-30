FROM ubuntu:latest

ARG UNAME=dev
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID -o $UNAME \
    && useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME

RUN apt-get update \
    && apt-get install -y curl nano less \
        libatomic1 \
    && rm -rf /var/lib/apt/lists/*

USER $UNAME

ARG NVM_VERSION=v0.40.4

ENV NVM_DIR=/home/$UNAME/.nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash

ENV NODE_VERSION=25
RUN . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

RUN . $NVM_DIR/nvm.sh \
    && npm install -g @anthropic-ai/claude-code

WORKDIR /home/$UNAME
ENV CLAUDE_CONFIG_DIR=/home/$UNAME/.claude

CMD ["bash", "-c", ". $NVM_DIR/nvm.sh && claude"]
