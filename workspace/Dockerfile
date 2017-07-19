FROM node:7.10.1-wheezy

MAINTAINER Peter Lai <alk03073135@gmail.com>

RUN npm install -g truffle

# Clean up
USER root
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set default work directory
WORKDIR /usr/share/app
