#! /bin/sh

BITCORE_URL=git@github.com:bitpay/bitcore

git clone $BITCORE_URL --depth 1

cd bitcore
npm i
npm link
