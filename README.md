# ethdock

[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

Ethereum smart contract development package in moby(docker).

# Usage

### testrpc
```
docker-compose up -d workspace testrpc
```

Place the contract in app directory and enter container

```
docker-compose exec workspace bash
```

Change truffle.js host

```
host: 'testrpc'
```

Run test

```
truffle test
```

### geth

```
docker-compose up -d workspace geth
```

Place the contract in app directory and enter container

```
docker-compose exec workspace bash
```

Change truffle.js development

```
development: {
  from: 'your-address-on-geth-blockchain',
  host: 'geth',
  port: 8545,
  network_id: '*'
}
```

Or use provider


```
development: {
  from: 'your-address-on-geth-blockchain',
  provider: web3.currentProvider
  network_id: '*'
}
```

Unlock account

```
web3.personal.unlockAccount('your-address-on-geth-blockchain', 'your-address-password-on-geth-blockchain')
```

Run test

```
truffle test
```

### porosity

Porosity has installed in workspace container.

Usage

1. Set up params
```
abi = "Contract abi can get from truffle compile or solc compile"
code = "Contract bin code can get from truffle compile or solc compile"
```

2. Run command
```
porosity --code $code --abi $abi --list --verbose 0
porosity --code $code --abi $abi --disassm --verbose 0
porosity --code $code --abi $abi --decompile --verbose 0
```

> See the [repo](https://github.com/comaeio/porosity) for more information.

Have Fun!

# License

GPL3.0
