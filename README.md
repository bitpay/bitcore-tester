bitcore-tester
==============

A tool to test projects that depend on `bitcore`.

Usage
-----

```sh
./all.sh
```

The tool will output a report of which projects on the `repositories` file failed to execute `npm test` when running against the HEAD of the master branch on bitcore (`git@github.com:bitpay/bitcore`).
