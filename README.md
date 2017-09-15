# ethdock

Ethereum smart contract development package in moby(docker).

# Usage

### testrpc

```
docker-compose up -d workspace testrpc
```

### geth

```
docker-compose up -d workspace geth
```

Place the contract in app directory and enter container

```
docker-compose exec workspace bash
```

Change truffle.js host

```
host: 'testrpc' or host: 'geth'
```

Run test

```
truffle test
```

> Remember to set from when using geth as testnet!

Have Fun!
