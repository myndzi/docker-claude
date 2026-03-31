FROM ubuntu:latest

ARG USER=ubuntu

RUN apt-get update \
    && apt-get install -y curl nano less \
    && rm -rf /var/lib/apt/lists/*

USER $USER

ENV PATH=~/.local/bin:$PATH
ENV CLAUDE_CONFIG_DIR=/home/$USER/.claude
RUN curl -fsSL https://claude.ai/install.sh | bash

WORKDIR /home/$USER

CMD ["/bin/bash", "-c", "claude"]
