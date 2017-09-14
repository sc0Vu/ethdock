# ethdock

Ethereum smart contract development package in moby.

# Usage

```
docker-compose up -d workspace
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

## geth

```
docker-compose up -d geth
```

## /bin/sh issue

Right now, moby use /bin/sh as default command.

Sometimes the geth will build error.

See https://github.com/moby/moby/issues/7281 and https://github.com/eromoe/docker/commit/7dccc72bb24c715f176e4980ab59fd7aeb149a5f

# Have Fun