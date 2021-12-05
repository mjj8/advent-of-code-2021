ARG VARIANT="hirsute"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

COPY .devcontainer/linux-packages.txt /tmp/tmp-pkgs/
RUN apt update && export DEBIAN_FRONTEND=noninteractive \
    && apt -y --no-install-recommends install $(cat /tmp/tmp-pkgs/linux-packages.txt | tr '\n' ' ') \
    && rm -rf /tmp/tmp-pkgs

# RUN sudo curl -sSL https://get.haskellstack.org/ | sh

# INSTALL oh-my-zsh
# RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"