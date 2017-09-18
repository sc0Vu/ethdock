FROM node:7.10.1-wheezy

MAINTAINER Peter Lai <alk03073135@gmail.com>

# see https://github.com/eromoe/docker/commit/7dccc72bb24c715f176e4980ab59fd7aeb149a5f
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install truffle
RUN npm install -g truffle

# upgrade gcc
RUN echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list.d/unstable.list && \
    apt-get -y update && \
    apt-get install -y -t unstable gcc-5 libboost-dev

# install install porosity
RUN cd ~ && \
    git clone https://github.com/comaeio/porosity.git && \
    cd porosity/porosity/porosity && \
    make && \
    ln -s ~/porosity/porosity/porosity/porosity /usr/local/bin/porosity && \
    echo "alias porosity=/usr/local/bin/porosity" > ~/.bashrc && \
    source ~/.bashrc

# Clean up
USER root
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set default work directory
WORKDIR /usr/share/app
