# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.236.0/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# ** [Optional] Uncomment this section to install additional packages. **
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends ca-certificates openssl wget tree pandoc gmsl make tidy ruby-sass exif imagemagick remake nginx \
     && cd /tmp && wget --tries=3 --waitretry=30 https://github.com/jgm/pandoc/releases/download/2.18/pandoc-2.18-1-amd64.deb \
     && sudo dpkg -i /tmp/pandoc-2.18-1-amd64.deb

COPY ./dryssg.conf  /etc/nginx/conf.d/

