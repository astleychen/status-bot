# status-bot for Mac OS X

An IRC bot to listen standups activities in a selected IRC channel(s) and do status reporting in a media-wiki friendly format.

## How to build
```bash
$ export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include
$ export OPENSSL_LIB_DIR=/usr/local/opt/openssl/lib
$ cargo build
```

## How to install
Install the daemon. This will create a launchd plist which will be run on startup.

```bash
$ sudo ./install.sh
```

## How to generate the report with specified period
`
RSbot: \d{4}-\d{2}-\d{2})\s+to\s+(?P<end>\d{4}-\d{2}-\d{2}
`
> e.g.: RSbot: 2017-05-01 to 2017-05-08

## License

[MPL v2](./LICENSE)
