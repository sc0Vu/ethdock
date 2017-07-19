# ethdock

Ethereum smart contract development package in docker.

# Usage

    docker-compose up -d workspace

Place the contract in app directory and enter container

    docker-compose exec workspace bash

Change truffle.js host

    host: 'testrpc'

Run test

    truffle test

# Have Fun