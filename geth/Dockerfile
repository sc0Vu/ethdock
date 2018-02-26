FROM debian:wheezy

MAINTAINER Peter Lai <alk03073135@gmail.com>

ADD genesis.json /
# ADD geth.sh /etc/init.d/geth.sh

# setup environment variables
ENV GOROOTBASE /usr/local
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin

# see https://github.com/eromoe/docker/commit/7dccc72bb24c715f176e4980ab59fd7aeb149a5f
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install golang
RUN apt-get update && \
    apt-get install -y curl procps && \
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
RUN ln -s $HOME/go-ethereum/build/bin/geth /usr/local/bin/geth
    #chmod +x /etc/init.d/geth.sh && \
    #chown root:root /etc/init.d/geth.sh && \
    #update-rc.d geth.sh default
    #/etc/init.d/geth.sh start

EXPOSE 8545 8546 30303 30303/udp

# running geth
CMD geth --datadir "." --port "30303" --rpcapi "db,personal,eth,net,web3" --rpccorsdomain "*" --networkid 314 --identity "ethdock" --rpc --rpcaddr "0.0.0.0" --rpcport "8545" --rpccorsdomain "*" --etherbase "0x7ee077f7afbc121e7b63d9baff6c8a52c3a9c2f3" --mine init=/genesis.json
