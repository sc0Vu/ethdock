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

Default coinbase address: `0x7ee077f7afbc121e7b63d9baff6c8a52c3a9c2f3`
Default coinbase private key: `0x88e524dee8bfb0dfb52ed4668ab88db605fe30b476e497d0fa1205e717fb9cb6`

> Do not use this private key on mainnet.

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

### ganache
```
docker-compose up -d workspace ganache
```

Place the contract in app directory and enter container

```
docker-compose exec workspace bash
```

Change truffle.js host

```
host: 'ganache'
```

Run test

```
truffle test
```

### Test account for geth

We've created an test account for geth.

There is a `UTC--2017-10-25T06-00-32.515667900Z--7c33ce8d9edd822f4ebba8823f4b73c2804baa00` file in `/geth`.

If you cannot create account, you can simply move the file to `/data/keystore`, and you'll see an account `7c33ce8d9edd822f4ebba8823f4b73c2804baa00` with password `123456` on the chain.

> Please remember that never use this account in production environment!

If you want to use your account, remamber to edit the `/geth/genesis.json` befor you start the geth service.

Have Fun!

# FAQ

* When I try to build geth container, I got this error: no space left on device
  It might be the disk space is not enough to build container.
  
  Please try to clean the docker images or docker volumes that not in use.
  
  You can run this command to find volumes.
  ```
  $ docker volume ls
  ```
  You can run this command to find images.
  ```
  $ docker images
  ```
  Remove volume.
  ```
  $ docker volume rm ...
  ```
  Remove all images with name none.
  ```
  $ docker rmi -f $(docker images | grep '^<none>' | awk '{print $3}')
  ```

# License

GPL3.0
