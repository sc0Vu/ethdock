FROM debian:wheezy

MAINTAINER Peter Lai <alk03073135@gmail.com>

# install golang
RUN apt-get update && \
    apt-get install -y curl && \
    curl -O https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.7.3.linux-amd64.tar.gz && \
    mkdir -p ~/go && \
    echo "export GOROOT=$HOME/go" >> ~/.bashrc && \
    echo "export GOPATH=$HOME/go" >> ~/.bashrc && \
    echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.bashrc && \
    source ~/.bashrc

# install geth
RUN apt-get install -y build-essential git && \
    cd $HOME && \
    git clone https://github.com/ethereum/go-ethereum && \
    cd go-ethereum && \
    make geth

CMD geth --datadir "." --networkid 999 --identity "ethdock" --rpc --rpcapi="db,eth,net,web3,personal" --rpcport "8545" --rpccorsdomain "*" --rpcaddr "0.0.0.0" --dev console
