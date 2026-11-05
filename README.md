# Wallet Core Protobuf for PHP

PHP Protobuf classes generated from [Trust Wallet Core](https://github.com/trustwallet/wallet-core) `.proto` files.

## Install

```sh
composer require rzkhrv/php-wallet-core-protobuf:4.7.0
```

## Generate

Requires **Docker**. To generate classes for a Wallet Core release:

```sh
make generate VERSION=4.7.0
```

Related project: [PHP Wallet Core extension](https://github.com/rzkhrv/php-wallet-core-ext).
