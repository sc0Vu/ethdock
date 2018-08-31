FROM node:7.10.1-wheezy

MAINTAINER Peter Lai <alk03073135@gmail.com>

# see https://github.com/eromoe/docker/commit/7dccc72bb24c715f176e4980ab59fd7aeb149a5f
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install truffle
RUN npm install -g truffle

# install keyring
RUN apt-get install -y debian-archive-keyring && \
    apt-key update

# Clean up
USER root
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set default work directory
WORKDIR /usr/share/app
