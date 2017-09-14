FROM debian:wheezy

MAINTAINER Peter Lai <alk03073135@gmail.com>

ADD genesis.json /

# setup environment variables
ENV GOROOTBASE /usr/local
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin

# see https://github.com/eromoe/docker/commit/7dccc72bb24c715f176e4980ab59fd7aeb149a5f
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install golang
RUN apt-get update && \
    apt-get install -y curl && \
    curl -O https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz && \
    tar -C $GOROOTBASE -xzf go1.7.3.linux-amd64.tar.gz && \
    mkdir -p $GOPATH

# build geth
RUN apt-get install -y build-essential git && \
    cd $HOME && \
    git clone https://github.com/ethereum/go-ethereum && \
    cd $HOME/go-ethereum && \
    make geth

# copy geth bin
RUN cp $HOME/go-ethereum/build/bin/geth /usr/local/bin/ 

# running geth
# CMD geth --datadir "." --networkid 999 --identity "ethdock" --rpc --rpcapi="db,eth,net,web3,personal" --rpcport "8545" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --dev console
CMD geth init /genesis.json
