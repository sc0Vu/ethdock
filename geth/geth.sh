#! /bin/sh
### BEGIN INIT INFO
# Provides:          geth
# Required-Start:    mountdevsubfs hostname
# Required-Stop:
# Should-Start:      keymap hwclockfirst hdparm bootlogd
# Should-stop:
# Default-Start:     S
# Default-Stop:
# X-Interactive:     true
# Short-Description: Run ethereum private chain
### END INIT INFO

CMD geth --datadir "." --rpcapi "db,personal,eth,net,web3" --rpccorsdomain "*" --networkid 999 --identity "ethdock" --rpc --rpcaddr "0.0.0.0"  --rpcport "8545" init="/genesis.json" --mine --etherbase 0